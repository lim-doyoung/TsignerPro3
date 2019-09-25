package com.bit.tsigner.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bit.tsigner.BoardPager;
import com.bit.tsigner.model.entity.FaqVo;
import com.bit.tsigner.model.entity.InqReplyVo;
import com.bit.tsigner.model.entity.SupportVo;
import com.bit.tsigner.service.InqReplyService;
import com.bit.tsigner.service.SupportService;

@Controller
public class SupportController {
   
   @Inject
   SupportService supportService;
   
   Logger logger = LoggerFactory.getLogger(getClass());
   
   @RequestMapping(value = "/support", method = RequestMethod.GET)
   public String support() throws SQLException {
      return "support/support";
   }
   
   ////////////////////// 1:1 문의하기 ////////////////////// 
     
      @RequestMapping(value="inquiry")
      
      public ModelAndView inquiry(@RequestParam(defaultValue = "all") String searchOption,
                        @RequestParam(defaultValue="") String keyword,
                        @RequestParam(defaultValue = "1") int curPage, HttpSession session, Model model) throws SQLException{
        
        String id = (String) session.getAttribute("id");
        
        //레코드의 갯수 계산
         int count = supportService.supportCountArticle(searchOption, keyword, id);
         supportService.getUserlist(id, model);
         
          //페이지 나누기
         BoardPager boardPager = new BoardPager(count, curPage);
         int start = boardPager.getPageBegin();
         System.out.println(start);
         int end = boardPager.getPageEnd();
         
         List<SupportVo> list= supportService.supportSelectAll(start, end, searchOption,keyword, id);
         
         //데이터를 맵에 저장
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("list", list);   //list
         map.put("count", count);   //레코드의 갯수
         map.put("searchOption", searchOption);   //검색 옵션
         map.put("keyword", keyword);   //검색 키워드
         map.put("boardPager", boardPager);
         
         ModelAndView mav = new ModelAndView();
         mav.addObject("map", map);
         mav.setViewName("support/inquiry");
         
         return mav;
         
      }
      
      @RequestMapping(value="/inquiry/add", method=RequestMethod.POST)
      public String supportAdd(@ModelAttribute SupportVo bean, HttpSession session) throws SQLException{
         
         String user_id = (String) session.getAttribute("id");

         bean.setUser_id(user_id);
         supportService.supportAdd(bean);
         return "redirect:/inquiry";
         
      }
      
    //게시글 상세보기
      @RequestMapping(value="/inquiry/detail")
      public String supportDetail(Model model,@RequestParam("idx") int idx) throws SQLException{
         
         supportService.supportDetail(model,idx);
         
         return "support/inquiryDetail";
      }
      
      @RequestMapping(value="/inquiry/update", method=RequestMethod.POST)
      public String supportUpdate(@ModelAttribute SupportVo bean, @RequestParam("idx") int idx, @RequestParam("sub") String sub, @RequestParam("content") String content) throws SQLException{
         supportService.supportUpdate(idx, sub, content);
         
         return "redirect:/inquiry";
      }
      
      @RequestMapping(value="/inquiry/delete", method=RequestMethod.POST)
      public String supportDelete(@RequestParam("idx") int idx) throws SQLException{
         
        //글 삭제 할 때 댓글 먼저 삭제 하기
        supportService.replyDelete(idx);
        supportService.supportDelete(idx);
         
         return "redirect:/inquiry";
      }
      
      ////////////////////// 문의하기 댓글 //////////////////////
      
      // 글쓴이 프로필 사진 가져오기
      @RequestMapping(value = "/inquiry/getReplyWriter")
      @ResponseBody
      public String getReplyWriter(@RequestParam("id") String id) {
         String result = "res";
         try {
            result = supportService.getReplyWriter(id);
            result = URLEncoder.encode(result, "utf-8");
            System.out.println("결과 " + result);
         } catch (Exception e) {
            
         }
         return result;
      }
      
      
      @RestController
      @RequestMapping("*/inq_reply/*")
      public class InqReplyController {
         
         @Inject
         InqReplyService inqReplyService;
         
         // 댓글 입력
         @RequestMapping(value="add")
         public void inquiryAdd(@ModelAttribute InqReplyVo bean, HttpSession session) throws SQLException{
            String reply_id = (String) session.getAttribute("id");
            bean.setReply_id(reply_id);
            System.out.println("실행실행");
            inqReplyService.inquiryAdd(bean);
               
         }
         
         //댓글 리스트(@RestController Json방식으로 처리 : 데이터를 리턴)
         @RequestMapping(value="list")
         @ResponseBody   // 리턴데이터를 json으로 변환(생략가능)
         public List<InqReplyVo> list(@RequestParam int inq_seq) throws SQLException{
            List<InqReplyVo> list = inqReplyService.list(inq_seq);
            
            System.out.println("리스트 목록 컨트롤러");
            return list;
            
         }
         
         // 댓글 삭제
         @RequestMapping(value="/delete/{reply_seq}")
         @ResponseBody
         public String replyDelete(@PathVariable("reply_seq") Integer reply_seq){
           try {
            inqReplyService.delete(reply_seq);
         } catch (SQLException e) {
            return "fail";
         }
           return "success";
         }
         
         /* 댓글 수정 */
         @RequestMapping(value = "/inqRepUpdate", method=RequestMethod.POST)
         @ResponseBody
         public String inqRepUpdate(@RequestParam("idx") String idx, @RequestParam("content") String content ) throws SQLException {
            System.out.println("일로옴?");
            System.out.println("일로옴? "+idx);
            System.out.println("일로옴? "+content);
            inqReplyService.inqRepUpdate(idx, content);
            return "redirect:/faq";
         }
      }
      
      
      
      //// 답변 상태 /////
      
 @RequestMapping(value="/replyDone")
      
      public ModelAndView replyDone(@RequestParam(defaultValue = "all") String searchOption,
                        @RequestParam(defaultValue="") String keyword,
                        @RequestParam(defaultValue = "1") int curPage, HttpSession session, Model model) throws SQLException{
        
        String id = (String) session.getAttribute("id");
        
        //레코드의 갯수 계산
         int count = supportService.replyDoneCountArticle(searchOption, keyword, id);
         supportService.getUserlist(id, model);
        
         
          //페이지 나누기
         BoardPager boardPager = new BoardPager(count, curPage);
         int start = boardPager.getPageBegin();
         System.out.println(start);
         int end = boardPager.getPageEnd();
         
         List<SupportVo> list= supportService.replyDone(start, end, searchOption,keyword, id);
         
         //데이터를 맵에 저장
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("list", list);   //list
         map.put("count", count);   //레코드의 갯수
         map.put("searchOption", searchOption);   //검색 옵션
         map.put("keyword", keyword);   //검색 키워드
         map.put("boardPager", boardPager);
         
         ModelAndView mav = new ModelAndView();
         mav.addObject("map", map);
         mav.setViewName("support/replyDone");
         
         return mav;
         
      }
 
 
 @RequestMapping(value="/replyUndone")
 
 public ModelAndView replyUndone(@RequestParam(defaultValue = "all") String searchOption,
                   @RequestParam(defaultValue="") String keyword,
                   @RequestParam(defaultValue = "1") int curPage, HttpSession session, Model model) throws SQLException{
   
   String id = (String) session.getAttribute("id");
   
   //레코드의 갯수 계산
    int count = supportService.replyUndoneCountArticle(searchOption, keyword, id);
    supportService.getUserlist(id, model);
   
    
     //페이지 나누기
    BoardPager boardPager = new BoardPager(count, curPage);
    int start = boardPager.getPageBegin();
    System.out.println(start);
    int end = boardPager.getPageEnd();
    
    List<SupportVo> list= supportService.replyUndone(start, end, searchOption,keyword, id);
    
    //데이터를 맵에 저장
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("list", list);   //list
    map.put("count", count);   //레코드의 갯수
    map.put("searchOption", searchOption);   //검색 옵션
    map.put("keyword", keyword);   //검색 키워드
    map.put("boardPager", boardPager);
    
    ModelAndView mav = new ModelAndView();
    mav.addObject("map", map);
    mav.setViewName("support/replyUndone");
    
    return mav;
    
 }
      
      
      
      
      
      ////////////////////// FAQ //////////////////////
      
      
      @GetMapping(value = "faq")
      public String faq(Model model) throws SQLException {
         model.addAttribute("list", supportService.list());
         return "support/faq";
      }
      
      @RequestMapping(value = "/faq/add", method=RequestMethod.POST)
      public String faqAdd(@ModelAttribute FaqVo bean) throws SQLException {
         supportService.faqAdd(bean);
         return "redirect:/faq";
      }
      
      @RequestMapping(value = "/faq/update", method=RequestMethod.POST)
      public String faqUpdate(@ModelAttribute FaqVo bean, @RequestParam("idx") int idx, @RequestParam("sub") String sub, @RequestParam("content") String content) throws SQLException {
         System.out.println(content);
         supportService.faqUpdateOne(idx, sub, content);
         return "redirect:/faq";
      }
      
      @RequestMapping(value="/faq/detail")
      public String faqDetail(Model model,@RequestParam("idx") int idx) throws SQLException{
         
         supportService.faqDetail(model,idx);
         
         return "support/faqDetail";
      }
      
      @RequestMapping(value="/faq/delete", method=RequestMethod.POST)
      public String faqDelete(@RequestParam("idx") int idx) throws SQLException{
         supportService.faqDeleteOne(idx);
         return "redirect:/faq";
      }
      
      @GetMapping(value = "/terms")
      public String terms() throws SQLException {
         return "support/terms";
      }
      
      @GetMapping(value = "/privacy")
      public String privacy() throws SQLException {
         return "support/privacy";
      }
      
      @RequestMapping(value = "/faq/repUpdate")
      @ResponseBody
      public FaqVo repUpdate(@RequestParam("num") String num) {
         return supportService.repUpdate(num);
      }
   
}