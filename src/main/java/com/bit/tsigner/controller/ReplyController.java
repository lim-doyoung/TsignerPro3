package com.bit.tsigner.controller;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bit.tsigner.model.entity.ReplyVo;
import com.bit.tsigner.service.ReplyService;

// REST : Representational State Tranfer
// 하나의 URI가 하나의 고유한 리소스를 대표하도록 설계된 개념

// http://localhost:8080/tsigner/event/list?bno=1 --> url + 파라미터
// http://localhost:8080/tsigner/event/list/1 --> url 
// RestController은 스프링 4.0부터 지원
// @Controller, @RestController 차이점은 메서드가 종료되면 화면전환의 유무

@RestController
@RequestMapping("*/reply/*")
public class ReplyController {
   
   @Inject
   ReplyService replyService;
   
   // 댓글 입력
   @RequestMapping(value="add")
   public void eventAdd(@ModelAttribute ReplyVo bean, HttpSession session) throws SQLException{
      String reply_id = (String) session.getAttribute("id");
	   bean.setReply_id(reply_id);
	   System.out.println("이게 찍혀야 실행된거임");
	   replyService.eventAdd(bean);
	      
   }
   
   //댓글 리스트(@RestController Json방식으로 처리 : 데이터를 리턴)
   @RequestMapping(value="list")
   @ResponseBody	// 리턴데이터를 json으로 변환(생략가능)
   public List<ReplyVo> list(@RequestParam int event_seq) throws SQLException{
	   List<ReplyVo> list = replyService.list(event_seq);
	   
	   System.out.println("리스트 목록 컨트롤러");
	   return list;
	   
   }
   
   //댓글 삭제
   // @PathVariable :  url에 입력될 변수 값 지정
   @RequestMapping(value="/delete/{reply_seq}")
   @ResponseBody
   public String replyDelete(@PathVariable("reply_seq") Integer reply_seq){
	  try {
		System.out.println(reply_seq);
		replyService.delete(reply_seq);
	} catch (SQLException e) {
		return "fail";
	}
//	  System.out.println("리스트 삭제 컨트롤러");
	  return "success";
   }
}


