package com.bit.tsigner.controller;


import java.io.File;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bit.tsigner.BoardPager;
import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.Criteria;
import com.bit.tsigner.model.entity.PagingTest;
import com.bit.tsigner.model.entity.SearchVo;
import com.bit.tsigner.service.CommunityService;
import com.mysql.fabric.xmlrpc.base.Array;
import com.mysql.jdbc.StringUtils;

@Controller
public class CommunityController {
   
   
   @Inject
   CommunityService communityService;
   
   @RequestMapping(value = "/community", method = RequestMethod.GET)
   public String community(Model model,HttpServletRequest res,@RequestParam(defaultValue = "modi_date") String option,
            @RequestParam(defaultValue="") String keyword,
            @RequestParam(defaultValue = "1") int curPage) throws SQLException {
      
         int count=communityService.reviewCount();
         BoardPager boardPager = new BoardPager(count, curPage);
         int start = boardPager.getPageBegin();
         model.addAttribute("test", boardPager);
         communityService.notice(model);
         communityService.bestList(model);
         communityService.reviewList(model,start,option,keyword);
         return "community/community";
   }
      
   @RequestMapping(value = "/community_review/add",  method = RequestMethod.POST)
   public String communityReviewAdd(@ModelAttribute CommunityVo bean,@RequestParam("file2")MultipartFile CMNT_FILENAME
		   ,HttpServletRequest res,HttpServletResponse resp,Model model) throws SQLException {
      long size=CMNT_FILENAME.getSize();
      String root = "c:\\tsigner\\";
      if(size!=0) {
         String uploadDir4="community/review/";
         long time=System.currentTimeMillis();
         String origin=CMNT_FILENAME.getOriginalFilename();
         String newName=time+origin;
         System.out.println(newName);
         bean.setCmnt_filename(newName);
         bean.setCmnt_file_path4(uploadDir4);
         
         File file=new File(root+uploadDir4+newName);
         
         try {
            CMNT_FILENAME.transferTo(file);
         } catch (IllegalStateException e) {
            e.printStackTrace();
         } catch (IOException e) {
            e.printStackTrace();
         }
      }else {
         bean.setCmnt_filename("default.jpg");
      }
      communityService.reviewAdd(bean);
      
      String userid=res.getParameter("cmnt_writer_id");
      communityService.addPoint(userid);
      System.out.println(userid);
      int totalP=communityService.totalPoint(userid);
      int memL=communityService.memL(userid);
      
      System.out.println("memL:"+memL);
	  System.out.println("point:"+totalP);
      
	  if(totalP>=50&&memL==0) {
    	  communityService.LevUP(userid);
    	  System.out.println("1");
    	  model.addAttribute("hello","T beignner LevUp!");
      }else if(totalP>=200&&memL==1) {
    	  System.out.println("2");
    	  communityService.LevUP(userid);
    	  model.addAttribute("hello","T Expert LevUp!");
      }else if(totalP>=300&&memL==2) {
    	  System.out.println("3");
    	  communityService.LevUP(userid);
    	  model.addAttribute("hello","T Guide LevUp!");
      }else if(totalP>=700&&memL==3) {
    	  System.out.println("4");
    	  communityService.LevUP(userid);
    	  model.addAttribute("hello","T Signer LevUp!");
      }else if(totalP>=1500&&memL==4) {
    	  System.out.println("5");
    	  communityService.LevUP(userid);
    	  model.addAttribute("hello","T Master LevUp!");
      }
      return "redirect:/community";
   }
   
   @RequestMapping(value = "/community_reviewDetail",method = RequestMethod.GET)
   public String communityReviewDetail(@RequestParam("num") int cmnt_seq,Model model,
         HttpServletRequest req,HttpServletResponse resp) throws SQLException {
      
      int countCheck = 0;
      Cookie[] cookies = req.getCookies();
         communityService.ReviewDetailCnt(cmnt_seq);
         communityService.ReviewDetail(model,cmnt_seq);
         communityService.ReviewReplyList(model,cmnt_seq);
      return "community/reviewDetail";
   }
   
   
   @RequestMapping(value = "/reviewReply",method = RequestMethod.POST)
   public String communityReviewReply(@ModelAttribute CommunityVo bean,HttpServletRequest res
		   ,HttpServletResponse resp,Model model) throws SQLException, IOException{
      communityService.ReviewReplyAdd(bean);
      String num=res.getParameter("cmnt_seq");
      
      String userid=res.getParameter("reply_id");
      communityService.addRePoint(userid);
      int totalP=communityService.totalPoint(userid);
      int memL=communityService.memL(userid);
      
      System.out.println("memL:"+memL);
	  System.out.println("point:"+totalP);
      
	  if(totalP>=50&&memL==0) {
    	  communityService.LevUP(userid);
    	  System.out.println("1");
    	  model.addAttribute("hello","T beignner LevUp!");
      }else if(totalP>=200&&memL==1) {
    	  System.out.println("2");
    	  communityService.LevUP(userid);
    	  model.addAttribute("hello","T Expert LevUp!");
      }else if(totalP>=300&&memL==2) {
    	  System.out.println("3");
    	  communityService.LevUP(userid);
    	  model.addAttribute("hello","T Guide LevUp!");
      }else if(totalP>=700&&memL==3) {
    	  System.out.println("4");
    	  communityService.LevUP(userid);
    	  model.addAttribute("hello","T Signer LevUp!");
      }else if(totalP>=1500&&memL==4) {
    	  System.out.println("5");
    	  communityService.LevUP(userid);
    	  model.addAttribute("hello","T Master LevUp!");
      }
      
      return "redirect:/community_reviewDetail?num="+num+"";
   }
   
   @RequestMapping(value = "/reviewDelete",method = RequestMethod.GET)
   public String communityReviewDelete(@RequestParam("num") int cmnt_seq) throws SQLException {
      communityService.ReviewDelete(cmnt_seq);
      return "redirect:/community";
   }
   
   
   @RequestMapping(value = "/community_review/update",method = RequestMethod.POST)
   public String communityReviewUpdate(@ModelAttribute CommunityVo bean,@RequestParam("file2")MultipartFile CMNT_FILENAME
		   ,HttpServletRequest res,HttpServletResponse resp,Model model
		   ) throws SQLException {
	   long size=CMNT_FILENAME.getSize();
	   String root = "c:\\tsigner\\";
	   if(size!=0) {
		   String uploadDir4="community/review/";
		   long time=System.currentTimeMillis();
		   String origin=CMNT_FILENAME.getOriginalFilename();
		   String newName=time+origin;
		   System.out.println(newName);
		   bean.setCmnt_filename(newName);
		   bean.setCmnt_file_path4(uploadDir4);
		   
		   File file=new File(root+uploadDir4+newName);
		   
		   try {
			   CMNT_FILENAME.transferTo(file);
		   } catch (IllegalStateException e) {
			   e.printStackTrace();
		   } catch (IOException e) {
			   e.printStackTrace();
		   }
	   }else {
		   bean.setCmnt_filename("default.jpg");
	   } 
	   
      communityService.ReviewUpdate(bean);
      return "redirect:/community";
   }
   
   @RequestMapping(value = "/replyDelete")
   public String communityReviewReplyDelete(@RequestParam("cmnt_seq") int cmnt_seq,@RequestParam("reply_seq") int reply_seq) throws SQLException {
      communityService.TogetherReplyDelete(reply_seq);
      return "redirect:/community_reviewDetail?num="+cmnt_seq+"";
   }
   
   @RequestMapping(value = "/togetherCancle")
   public String communitytogetherCancle(@RequestParam("idx") int assign_seq) throws SQLException {
//	   int assign_seq1=Integer.parseInt(assign_seq);
	   System.out.println(assign_seq);
	   return "redirect:/community_reviewDetail?num="+assign_seq+"";
   }
   
   @RequestMapping(value = {"/reviewLike","/community_togetherDetail/reviewLike"})
   public void communityReviewLike(@RequestParam("cmnt_recom") int cmnt_recom,@RequestParam("cmnt_seq") int cmnt_seq
         ,HttpServletRequest req,HttpServletResponse resp,Model model) throws SQLException, IOException {
      String userId=req.getParameter("userID");
      String recod_id=communityService.searchId(cmnt_seq,userId);
      int like_id=communityService.likeId(cmnt_seq,userId);
      System.out.println("1:"+like_id);
      System.out.println("2:"+recod_id);
      if(like_id>=1){
    	  resp.getWriter().write("msg2");
    	  communityService.likeCancle(cmnt_seq,userId);
      }else {
         recod_id=communityService.searchId(cmnt_seq);
         recod_id+=userId+",";
         communityService.reviewLike(cmnt_seq,recod_id);
         resp.getWriter().write("msg1");
         communityService.like(cmnt_seq, userId);
      }
//      return "redirect:/community_reviewDetail?num="+cmnt_seq+"";
   }
   
   @RequestMapping(value = "/community_bbs")
   public String communityBbs(Model model,HttpServletRequest res,@RequestParam(defaultValue="") String keyword
		   ,@RequestParam(defaultValue = "modi_date") String option) throws SQLException {
      int curPage;
      if(res.getParameter("num")==null) {
         curPage=1;
      }else {
         curPage=Integer.parseInt(res.getParameter("num"));
      }
      int count=communityService.bbsCount();
      BoardPager boardPager=new BoardPager(count, curPage);
      int start=boardPager.getPageBegin();
      model.addAttribute("page",boardPager);
      communityService.list(model,start,keyword,option);
      System.out.println("BbsController:"+model);
      return "community/bbs";
   }
   
   
   @RequestMapping(value = "/community_bbs/add",method = RequestMethod.POST)
   public String communityBbsAdd(@ModelAttribute CommunityVo bean,@RequestParam("file2")MultipartFile CMNT_FILENAME) throws SQLException {
	   long size=CMNT_FILENAME.getSize();
	   String root = "c:\\tsigner\\";
	   if(size!=0) {
	      String uploadDir2="community/bbs/";
	      
	      long time=System.currentTimeMillis();
	      String origin=CMNT_FILENAME.getOriginalFilename();
	      String newName=time+origin;
	      System.out.println(newName);
	      System.out.println(origin);
	      bean.setCmnt_filename(origin);
	      bean.setCmnt_file_path2(uploadDir2);
	     
	      File file=new File(uploadDir2+newName);
	
	      try {
	         CMNT_FILENAME.transferTo(file);
	      } catch (IllegalStateException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	   }else {
	         bean.setCmnt_filename("default.jpg");
	   }
	   communityService.add(bean);
      return "redirect:/community_bbs";
   }
   
   
   @RequestMapping(value = "/communityBbsUpdate",method = RequestMethod.GET)
   public String communityBbsUpdate(@RequestParam("cmnt_seq") int cmnt_seq,@ModelAttribute CommunityVo bean) throws SQLException {
      communityService.update(bean,cmnt_seq);
      return "redirect:/community_bbs";
   }
   @RequestMapping(value = "/communityBbsDelete",method = RequestMethod.GET)
   public String communityBbsDelete(@RequestParam("cmnt_seq") int cmnt_seq) throws SQLException {
      communityService.delete(cmnt_seq);
      return "redirect:/community_bbs";
   }
   @RequestMapping(value = "/community_bbs/download/{cmnt_filtname:.+}",method = RequestMethod.GET)
   public String communityBbsDownload(HttpServletResponse resp,@PathVariable String cmnt_filtname) throws SQLException {
      String uploadDir2="upload/";
      
      resp.setContentType("application/octet-stream;charset=\"utf-8\"");
      
      File file=new File(uploadDir2+cmnt_filtname);
      OutputStream os=null;
      InputStream is=null;
      
      try {
         os=resp.getOutputStream();
         is=new FileInputStream(file);
         int temp=0;
         while((temp=is.read())!=-1) {
            os.write(temp);
         }
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      } 
      return uploadDir2;
   }
   
   @GetMapping("/json/obj")
   public ResponseEntity detail(Model model,@RequestParam("idx") int cmnt_seq) throws SQLException {
      ResponseEntity entity=null;
      if(cmnt_seq>0) {
         entity=ResponseEntity
               .status(HttpStatus.OK)
               .body(communityService.detail(cmnt_seq));
      }else {
         entity=ResponseEntity
               .status(HttpStatus.BAD_REQUEST)
               .body(communityService.detail(cmnt_seq));
      }
      communityService.detailCnt(cmnt_seq);
      return entity;   
   }
   
   @RequestMapping(value = "/bbsReplyList",method = RequestMethod.GET)
   public @ResponseBody List BbsReply(@RequestParam("idx") int cmnt_seq) throws SQLException{
	   System.out.println("list:"+cmnt_seq);
      return communityService.BbsReplyList(cmnt_seq);
   }
   
   @RequestMapping(value = "/bbsReply",method = RequestMethod.POST)
   public String communityBbsReply(@ModelAttribute CommunityVo bean,@RequestParam("cmnt_seq") int cmnt_seq) throws SQLException{
	   System.out.println("add:"+cmnt_seq);
      communityService.TogetherReplyAdd(bean);
      return "redirect:/community_bbs";
   }
   
   @RequestMapping(value = "/bbsReplyDelete")
   public String bbsReplyDelete(@RequestParam("cmnt_seq") int cmnt_seq,@RequestParam("reply_seq") int reply_seq) throws SQLException {
      communityService.TogetherReplyDelete(reply_seq);
      return "redirect:/community_bbs";
   }
   
   
   
   @GetMapping(value = "/community_together")
   public String communityTogether(Model model,HttpServletRequest res,HttpServletResponse resp,@RequestParam(defaultValue = "1") int curPage,
		   @RequestParam(defaultValue = "1900-00-00") String startD,@RequestParam(defaultValue = "2100-00-00") String endD
		   ) throws SQLException, IOException, ParseException {
      String keyword=res.getParameter("keyword");
      String option=res.getParameter("option");
      String tag=res.getParameter("hash_tag");
      
     
	      System.out.println("start D:"+startD);
	      System.out.println("end D:"+endD);
     
      
      if(curPage==0) {curPage=Integer.parseInt(res.getParameter("curPage"))+1;}
      
      if(tag!=null) {keyword=tag.replace("# ", "");}
      if(option==null||option=="") {option="modi_date";}
      
      CommunityVo bean=new CommunityVo();
      bean.setOption(option);
      int count=communityService.togetherCount();
      BoardPager boardPager = new BoardPager(count, curPage);
      model.addAttribute("test", boardPager);
      int curpage;
      int start = boardPager.getPageBegin();
      
      communityService.TogetherListUp(model);
      communityService.TogetherList(model,start,option,startD,endD);
      communityService.OutOfDateTogether();
      communityService.OutofKeyword();
      communityService.TagList(model);
      if(keyword==null||keyword=="") {
         System.out.println("keyword null");
      }else{
         System.out.println("keyword in");
         communityService.TogetherListUp(model);//best
         communityService.TogetherListSearch(model,keyword);
      }
      
      SearchVo svo=new SearchVo();
      if(keyword!=null&&keyword!="") {
    	  if(keyword!=null) {keyword=keyword.trim();}
    	  svo.setKeyword(keyword);
    	  svo.setSearch_date(new Timestamp(System.currentTimeMillis()));
          svo.setCmnt_type(3);
    	  communityService.searchTest(svo);
      }
      
      return "community/together";
   }
   
   @RequestMapping(value = "/community_togetherDetail/togetherUpdate",method = RequestMethod.POST)
   public String togetherUpdate(@ModelAttribute CommunityVo bean,@RequestParam("file2")MultipartFile CMNT_FILENAME
		   ,HttpServletRequest res,HttpServletResponse resp,Model model
		   ) throws SQLException {
	   long size=CMNT_FILENAME.getSize();
	     
	      if(size!=0) {
	    	 String root = "c:\\tsigner\\";
	         String uploadDir2="community/together/";
//	         String root = multi.getSession().getServletContext().getRealPath("/");
//	         System.out.println("root:"+root);
//	         String uploadDir2=root+"\\resources\\image\\";
	         System.out.println("file is not null");
	         long time=System.currentTimeMillis();
	         String origin=CMNT_FILENAME.getOriginalFilename();
	         String newName=time+origin;
	         
	         bean.setCmnt_filename(newName);
	         bean.setCmnt_file_path3(uploadDir2);
	         File file=new File(root+uploadDir2+newName);
	         try {
	            CMNT_FILENAME.transferTo(file);
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	        
	         
	      } else {
	          bean.setCmnt_filename("default.jpg");
	      }
	      
	      SearchVo svo=new SearchVo();
	      String[] tag=bean.getHash_tag().split(",");
	      for (int i = 0; i < tag.length; i++) {
	    	  svo.setKeyword(tag[i]);
	    	  svo.setSearch_date(new Timestamp(System.currentTimeMillis()));
	          svo.setCmnt_type(3);
	    	  communityService.searchTest(svo);
	    	  
	      }
	      System.out.println(bean);
	   
      communityService.togetherUpdate(bean);
      return "redirect:/community_together";
   }
   
   @RequestMapping(value = "/community_togetherDetail/communityList")
   public String communityList() {
	return "redirect:/community_together";
   }
   
   
   @RequestMapping(value = "/community_together/add",method = RequestMethod.POST)
   public String communityTogetherAdd(@ModelAttribute CommunityVo bean,@RequestParam("file2")MultipartFile CMNT_FILENAME,
		   MultipartHttpServletRequest multi,HttpServletRequest res,HttpServletResponse resp,
		   Model model) throws SQLException, IOException {
	  
      long size=CMNT_FILENAME.getSize();
     
      if(size!=0) {
    	 String root = "c:\\tsigner\\";
         String uploadDir2="community/together/";
//         String root = multi.getSession().getServletContext().getRealPath("/");
//         System.out.println("root:"+root);
//         String uploadDir2=root+"\\resources\\image\\";
         System.out.println("file is not null");
         long time=System.currentTimeMillis();
         String origin=CMNT_FILENAME.getOriginalFilename();
         String newName=time+origin;
         
         bean.setCmnt_filename(newName);
         bean.setCmnt_file_path3(uploadDir2);
         File file=new File(root+uploadDir2+newName);
         try {
            CMNT_FILENAME.transferTo(file);
         } catch (IllegalStateException e) {
            e.printStackTrace();
         } catch (IOException e) {
            e.printStackTrace();
         }
        
         
      } else {
          bean.setCmnt_filename("default.jpg");
      }
      
      SearchVo svo=new SearchVo();
      String[] tag=bean.getHash_tag().split(",");
      for (int i = 0; i < tag.length; i++) {
    	  svo.setKeyword(tag[i]);
    	  svo.setSearch_date(new Timestamp(System.currentTimeMillis()));
          svo.setCmnt_type(3);
    	  communityService.searchTest(svo);
    	  
      }
      communityService.TogetherAdd(bean);
      String userid=res.getParameter("cmnt_writer_id");
      communityService.addPoint(userid);
      int totalP=communityService.totalPoint(userid);
      int memL=communityService.memL(userid);
      System.out.println("memL:"+memL);
	  System.out.println("point:"+totalP);
      if(totalP>=50&&memL==0) {
    	  communityService.LevUP(userid);
    	  System.out.println("1");
    	  model.addAttribute("hello","T beignner LevUp!");
      }else if(totalP>=200&&memL==1) {
    	  System.out.println("2");
    	  communityService.LevUP(userid);
    	  model.addAttribute("hello","T Expert LevUp!");
      }else if(totalP>=300&&memL==2) {
    	  System.out.println("3");
    	  communityService.LevUP(userid);
    	  model.addAttribute("hello","T Guide LevUp!");
      }else if(totalP>=700&&memL==3) {
    	  System.out.println("4");
    	  communityService.LevUP(userid);
    	  model.addAttribute("hello","T Signer LevUp!");
      }else if(totalP>=1500&&memL==4) {
    	  System.out.println("5");
    	  communityService.LevUP(userid);
    	  model.addAttribute("hello","T Master LevUp!");
      }
      
      return "redirect:/community_together";
   }
   
   @RequestMapping(value = "/community_togetherDetail/{idx}",method = RequestMethod.GET)
   public String communityTogetherDetail(@PathVariable("idx") int cmnt_seq,Model model) throws SQLException {
      communityService.TogetherDetail(model,cmnt_seq);
      communityService.TogetherDetailCnt(cmnt_seq);
      communityService.TogetherCandidate(model,cmnt_seq);
      communityService.TogetherReplyList(model,cmnt_seq);
      communityService.TogetherapprovalList(model,cmnt_seq);
//      communityService.TogetherapprovalList(model,cmnt_seq);
      System.out.println("togetherDetailController:"+model);
      return "community/togetherDetail";
   }

   
   
   @RequestMapping(value = "/community_togetherDetail/delete/{idx}",method = RequestMethod.GET)
   public String communityTogetherDelete(@PathVariable("idx") int cmnt_seq) throws SQLException {
      communityService.TogetherDelete(cmnt_seq);
      return "redirect:/community_together";
   }
   
   @RequestMapping(value = "/community_togetherDetail/reply",method = RequestMethod.POST)
   public void communityTogetherReply(@ModelAttribute CommunityVo bean,HttpServletRequest res
		   ,Model model,HttpServletResponse resp) throws SQLException, IOException{
	  
     
      String num=res.getParameter("cmnt_seq");
      communityService.TogetherReplyAdd(bean);
      
      String userid=res.getParameter("reply_id");
      communityService.addRePoint(userid);
      int totalP=communityService.totalPoint(userid);
      int memL=communityService.memL(userid);
      
      System.out.println("memL:"+memL);
	  System.out.println("point:"+totalP);
      
      if(totalP>=50&&memL==0) {
    	  communityService.LevUP(userid);
    	  System.out.println("1");
    	  resp.getWriter().write("T beignner LevUp!");
      }else if(totalP>=200&&memL==1) {
    	  System.out.println("2");
    	  communityService.LevUP(userid);
    	  resp.getWriter().write("T Expert LevUp!");
      }else if(totalP>=300&&memL==2) {
    	  System.out.println("3");
    	  communityService.LevUP(userid);
    	  resp.getWriter().write("T Guide LevUp!");
      }else if(totalP>=700&&memL==3) {
    	  System.out.println("4");
    	  communityService.LevUP(userid);
    	  resp.getWriter().write("T Signer LevUp!");
      }else if(totalP>=1500&&memL==4) {
    	  System.out.println("5");
    	  communityService.LevUP(userid);
    	  resp.getWriter().write("T Master LevUp!");
      }
     
//      return "redirect:/community_togetherDetail/"+num+"";
   }
   
   @RequestMapping(value = "/community_togetherDetail/replyDelete")
   public String communityTogetherReplyDelete(@RequestParam("cmnt_seq") int cmnt_seq,@RequestParam("reply_seq") int reply_seq) throws SQLException {
      communityService.TogetherReplyDelete(reply_seq);
      return "redirect:/community_togetherDetail/"+cmnt_seq+"";
   }
   
   
   @RequestMapping(value = {"/community_togetherDetail/assignment","/assignment"},method = RequestMethod.GET)
   public void communityTogetherAssignment(@ModelAttribute() CommunityVo bean, HttpServletRequest res,HttpServletResponse resp) throws SQLException, IOException{
      String assign_id=res.getParameter("assign_id");
      int cmnt_seq=Integer.parseInt(res.getParameter("cmnt_seq"));
      System.out.println(cmnt_seq);
      assign_id="'"+assign_id+"'";
      System.out.println(bean);
      if(communityService.idCheck(bean)==null){
         communityService.TogetherAssignmentAdd(bean);
      }else {
         resp.getWriter().write("assignFail");
      }
   }
   
   @RequestMapping(value = "/community_togetherDetail/approval")
   public String communityTogetherApproval(@ModelAttribute() CommunityVo bean,HttpServletRequest res) throws SQLException, IOException {
      int cmnt_seq=Integer.parseInt(res.getParameter("num"));
      int assign_seq=Integer.parseInt(res.getParameter("appV"));
      bean.setCmnt_seq(cmnt_seq);
      bean.setAssign_seq(assign_seq);
      communityService.approvalUpdate(bean);
      communityService.togetherDetailUpdate(bean);
      return "redirect:/community_togetherDetail/"+cmnt_seq+"";
   }
   
   @RequestMapping(value = "/community_togetherDetail/defusal")
   public String communityTogetherDefasul(@ModelAttribute() CommunityVo bean,HttpServletRequest res) throws SQLException, IOException {
      int cmnt_seq=Integer.parseInt(res.getParameter("num"));
      int assign_seq=Integer.parseInt(res.getParameter("appV"));
      bean.setCmnt_seq(cmnt_seq);
      bean.setAssign_seq(assign_seq);
      communityService.defusalUpdate(bean);
      return "redirect:/community_togetherDetail/"+cmnt_seq+"";
   }
   
   @RequestMapping(value = "/community_togetherDetail/defusal1")
   public String communityTogetherDefasul1(@ModelAttribute() CommunityVo bean,HttpServletRequest res) throws SQLException, IOException {
	   int cmnt_seq=Integer.parseInt(res.getParameter("num"));
	   int assign_seq=Integer.parseInt(res.getParameter("appV"));
	   bean.setCmnt_seq(cmnt_seq);
	   bean.setAssign_seq(assign_seq);
	   communityService.defusaldelete(bean);
	   return "redirect:/community_togetherDetail/"+cmnt_seq+"";
   }
   
   @GetMapping(value = "/community_question")
   public String communityQna(Model model,HttpServletRequest res,@RequestParam(defaultValue="") String keyword
		   ,@RequestParam(defaultValue = "modi_date") String option) throws SQLException {
	      int curPage;
	      if(res.getParameter("num")==null) {
	         curPage=1;
	      }else {
	         curPage=Integer.parseInt(res.getParameter("num"));
	      }
	      System.out.println(keyword);
	      
	      int count=communityService.QnaCount();
	      BoardPager boardPager=new BoardPager(count, curPage);
	      int start=boardPager.getPageBegin();
	      model.addAttribute("page",boardPager);
	      communityService.qnaList(model,start,keyword,option);
	      
	      System.out.println("BbsController:"+model);
	      
	      return "community/question";
	   }

   @RequestMapping(value = "/community_Qna/add",method = RequestMethod.POST)
   public String communityQnaAdd(@ModelAttribute CommunityVo bean,@RequestParam("file2")MultipartFile CMNT_FILENAME) throws SQLException {
	   long size=CMNT_FILENAME.getSize();
	   if(size!=0) {
		   String root = "c:\\tsigner\\";
	      String uploadDir5="community/qna/";
	      
	      long time=System.currentTimeMillis();
	      String origin=CMNT_FILENAME.getOriginalFilename();
	      String newName=time+origin;
	      System.out.println(newName);
	      bean.setCmnt_filename(newName);
	      bean.setCmnt_file_path5(uploadDir5);
	     
	      File file=new File(root+uploadDir5+newName);
	
	      try {
	         CMNT_FILENAME.transferTo(file);
	      } catch (IllegalStateException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	   }else {
	         bean.setCmnt_filename("default.jpg");
	   }
	   communityService.qnaAdd(bean);
	   
	   
      return "redirect:/community_question";
   }
   
   
   @GetMapping("/json/Qobj")
   public ResponseEntity qnaDetail(Model model,@RequestParam("idx") int cmnt_seq) throws SQLException {
      ResponseEntity entity=null;
      if(cmnt_seq>0) {
         entity=ResponseEntity
               .status(HttpStatus.OK)
               .body(communityService.qnaDetail(cmnt_seq));
      }else {
         entity=ResponseEntity
               .status(HttpStatus.BAD_REQUEST)
               .body(communityService.qnaDetail(cmnt_seq));
      }
      communityService.qnaDetailCnt(cmnt_seq);
      return entity;   
   }
   
   @RequestMapping(value = "/qnaReply",method = RequestMethod.POST)
   public String communityQnaReply(@ModelAttribute CommunityVo bean,@RequestParam("cmnt_seq") int cmnt_seq) throws SQLException{
	   System.out.println("add:"+cmnt_seq);
      communityService.TogetherReplyAdd(bean);
      return "redirect:/community_question";
   }
   @RequestMapping(value = "/qnaReplyList",method = RequestMethod.GET)
   public @ResponseBody List QnaReply(@RequestParam("idx") int cmnt_seq) throws SQLException{
      return communityService.qnaReplyList(cmnt_seq);
   }
   @RequestMapping(value = "/qnaReplyDelete")
   public String qnaReplyDelete(@RequestParam("cmnt_seq") int cmnt_seq,@RequestParam("reply_seq") int reply_seq) throws SQLException {
      communityService.TogetherReplyDelete(reply_seq);
      return "redirect:/community_question";
   }
   
   @RequestMapping(value = "/communityQnaDelete",method = RequestMethod.GET)
   public String communityQnaDelete(@RequestParam("cmnt_seq") int cmnt_seq) throws SQLException {
      communityService.qnaDelete(cmnt_seq);
      return "redirect:/community_question";
   }
   
   @RequestMapping(value = "/communityQnaUpdate",method = RequestMethod.GET)
   public String communityQnaUpdate(@RequestParam("cmnt_seq") int cmnt_seq,@ModelAttribute CommunityVo bean) throws SQLException {
      communityService.updateQna(bean,cmnt_seq);
      return "redirect:/community_question";
   }
   
   @RequestMapping(value = "/qanRe_reply",method = RequestMethod.POST)
   public String communityReQnaReply(@ModelAttribute CommunityVo bean,
		   @RequestParam("reply_seq") int reply_seq,HttpServletRequest res) throws SQLException{
	   String re_reply_id=res.getParameter("re_reply_id");
	   String re_reply_content=res.getParameter("re_reply_content");
	   bean.setReply_seq(reply_seq);
      communityService.ReReplyAdd(bean);
      return "redirect:/community_question";
   }
   
   @RequestMapping(value = "/qanRe_replyList",method = RequestMethod.GET)
   public @ResponseBody List<CommunityVo> QnaReReplyList(Model model, @RequestParam("reply_seq") int reply_seq) throws SQLException{
	   List<CommunityVo> responseList=communityService.ReReplyList(model,reply_seq);
	   return responseList;
   }
   
   @RequestMapping(value = "/qanReListCnt",method = RequestMethod.GET)
   public int ReplyListCnt(@RequestParam("replyListCnt") int reply_seq) throws SQLException{
	   int result=communityService.ReReplyListCnt(reply_seq);
	   System.out.println("cnt result:"+result);
	   return result;
   }
   
   @RequestMapping(value = "/ReReplyDelete",method = RequestMethod.GET)
   public String ReReplyDelete(@RequestParam("reply_seq") int re_reply_seq) throws SQLException{
	   communityService.ReReplyDelete(re_reply_seq);
	return "redirect:/community_question";
   }

   @RequestMapping(value = "/search_test")
   public String search_test(@RequestParam("keyword") String keyword) throws SQLException {
	   System.out.println(keyword);
	   SearchVo bean=new SearchVo();
	   bean.setKeyword(keyword);
	   bean.setSearch_date(new Timestamp(System.currentTimeMillis()));
	   communityService.searchTest(bean);
	return "redirect:/community_question";
	   
   }
   
   @GetMapping(value = "/community_planner")
   public String communityPlanner(Model model,HttpServletRequest res,@RequestParam(defaultValue = "modi_date") String option,
           @RequestParam(defaultValue="") String keyword,
           @RequestParam(defaultValue = "1") int curPage) throws SQLException {

       int count=communityService.plannerCount();

       BoardPager boardPager = new BoardPager(count, curPage);
       int start = boardPager.getPageBegin();
       model.addAttribute("test", boardPager); 
      
       communityService.plannerBestList(model);
       communityService.plannerList(model,keyword,option,start);
       
      return "community/planner";
   }
   
   @RequestMapping(value = "/community_plannerDetail",method = RequestMethod.GET)
   public String plannerDetail(@RequestParam("num") int cmnt_seq,Model model,HttpServletRequest req,HttpServletResponse resp) throws SQLException {
//         communityService.plannerDetailCnt(cmnt_seq);
//         communityService.plannerDetail(model,cmnt_seq);
//         communityService.plannerReplyList(model,cmnt_seq);
	  req.setAttribute("bean",communityService.commContent(cmnt_seq));
	  communityService.plannerCnt(cmnt_seq);
	  communityService.TogetherReplyList(model,cmnt_seq);
      return "community/plannerDetail";
   }
   
   @RequestMapping(value = "/plannerReplyDelete",method=RequestMethod.GET)
   public String plannerReviewReplyDelete(@RequestParam("cmnt_seq") int cmnt_seq,@RequestParam("reply_seq") int reply_seq) throws SQLException {
      communityService.TogetherReplyDelete(reply_seq);
      return "redirect:/community_plannerDetail?num="+cmnt_seq+"";
   }
   
}