package com.bit.pdf;

import java.io.File;
import java.io.FileInputStream;
import java.io.StringReader;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.stereotype.Component;

import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.html.HtmlTags;
import com.itextpdf.text.html.simpleparser.HTMLWorker;
import com.itextpdf.text.html.simpleparser.StyleSheet;
import com.itextpdf.text.log.SysoCounter;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.ElementList;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.ElementHandlerPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;
 
@Component
public class PDFView extends AbstractITextPdfView {
 
    @SuppressWarnings({ "static-access", "deprecation", "unchecked" })
    protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	String classpath=getServletContext().getRealPath("/");
    	
    	List<List<Map<String, Object>>> loadList=new ArrayList<List<Map<String, Object>>>();
    	loadList=(List<List<Map<String, Object>>>) model.get("loadList");
    	
    	List<Map<String, Object>> mgtList=loadList.get(0);
		List<Map<String, Object>> mstList=loadList.get(1);
		List<Map<String, Object>> dtlList=loadList.get(2);
    	
     // Document 생성
        document = new Document(PageSize.A4, 130, 60, 15, 15); // 용지 및 여백 설정
             
        // PdfWriter 생성
        //PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("d:/test.pdf")); // 바로 다운로드.
        writer = PdfWriter.getInstance(document, response.getOutputStream());
        writer.setInitialLeading(12.5f);
         
        // 파일 다운로드 설정
        response.setContentType("application/pdf");
        String fileName = URLEncoder.encode(String.valueOf(mgtList.get(0).get("PLAN_TITLE")), "UTF-8"); // 파일명이 한글일 땐 인코딩 필요
        response.setHeader("Content-Transper-Encoding", "binary");
        response.setHeader("Content-Disposition", "inline; filename=" + fileName + ".pdf");
         
        // Document 오픈
        document.open();
        XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
             
        // CSS
        CSSResolver cssResolver = new StyleAttrCSSResolver();
        CssFile cssFile = helper.getCSS(new FileInputStream(classpath+"\\css\\pdf.css"));
        cssResolver.addCss(cssFile);
             
        // HTML, 폰트 설정
        XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
        fontProvider.register(classpath+"\\fonts\\malgun.ttf", "MalgunGothic"); // MalgunGothic은 alias,
        CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
         
        HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
        htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
         
        // Pipelines
        PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
        HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
        CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
         
        XMLWorker worker = new XMLWorker(css, true);
        XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
         
        double distance=0.0;
        // 폰트 설정에서 별칭으로 줬던 "MalgunGothic"을 html 안에 폰트로 지정한다.
        String htmlStr = "<html><head><body style='font-family: MalgunGothic;'>"
        			+ "<br/><h1>T-Signer</h1>"
                    + "<br/><h2>"+mgtList.get(0).get("PLAN_TITLE")+"</h2>"
                    + "<h4>"+mgtList.get(0).get("TRV_FROM_DATE")+" ~ "+mgtList.get(0).get("TRV_TO_DATE")+"</h4>"
                    +"<br/><br/><br/>";
			        double totDistance=0.0;
                    for(int i=0;i<mstList.size();i++) {
                    	totDistance+=Double.parseDouble((String) mstList.get(i).get("DAY_DIST"));
                    	htmlStr+="<h3>DAY"+(i+1)+"  "+mstList.get(i).get("TRV_DATE")+"</h3>";
                    	for(int j=0;j<dtlList.size();j++) {
                    		if(j!=dtlList.size()-1) {
                    			distance=Math.round((Double.parseDouble((String) dtlList.get(j+1).get("LOC_DISTANCE"))/1000)*100)/100.0;
                    		}
                    		htmlStr+="<div class=\"locList\"><h5>"+dtlList.get(j).get("LOC_NAME")+"</h5>"
                    				+ "<h6>"+dtlList.get(j).get("LOC_ADDR")+"</h6></div><img src=\""+String.valueOf(dtlList.get(j).get("LOC_IMG_URL"))+"\"/>";
                    		if(j!=dtlList.size()-1) {
                    			htmlStr+="<br/><br/>▼이동거리 : "+distance+"km";
                    		}
                    	}
                    	htmlStr+="<br/><br/>";
	                    	if(i==mstList.size()-1) {
	                    		double totDistance1=Math.round(totDistance*100)/100.0;
	                    		htmlStr+="<br/>※총 이동거리 : "+totDistance1+"km";
	                    	}
                    }
                htmlStr+= "</body></head></html>";
         
        StringReader strReader = new StringReader(htmlStr);
        xmlParser.parse(strReader);
         
        document.close();
        writer.close();
    }
}

