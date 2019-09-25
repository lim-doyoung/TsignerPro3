package com.bit.pdf;

import java.io.ByteArrayOutputStream;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.web.servlet.view.AbstractView;
 
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
 
public abstract class AbstractITextPdfView extends AbstractView {
 
	public AbstractITextPdfView() {
	    setContentType("application/pdf");
	}
	 
	@Override
	protected boolean generatesDownloadContent() {
	    return true;
	}
	 
	@Override
	protected final void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception  {
		System.out.println("textPdfView");
	    // IE workaround: write into byte array first.
	    ByteArrayOutputStream baos = createTemporaryOutputStream();
	 
	    // Apply preferences and build metadata.
	    Document document = new Document(PageSize.A4.rotate(), 36, 36, 54, 36);
	    PdfWriter writer = PdfWriter.getInstance(document, baos);
	    prepareWriter(model, writer, request);
	    buildPdfMetadata(model, document, request);
	 
	    // Build PDF document.
	    document.open();
	    buildPdfDocument(model, document, writer, request, response);
	    document.close();
	 
	    // Flush to HTTP response.
	    response.setHeader("Content-Disposition", "attachment");    // make browser to ask for download/display
	    writeToResponse(response, baos);
	}
	 
	protected void prepareWriter(Map<String, Object> model, PdfWriter writer, HttpServletRequest request) throws DocumentException {
	    writer.setViewerPreferences(getViewerPreferences());
	}
	 
	protected int getViewerPreferences() {
	    return PdfWriter.ALLOW_PRINTING | PdfWriter.PageLayoutSinglePage;
	}
	 
	 
	protected void buildPdfMetadata(Map<String, Object> model, Document document, HttpServletRequest request) {
	}
	 
	 
	protected abstract void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
	                                         HttpServletRequest request, HttpServletResponse response) throws Exception;
	}
