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
// �ϳ��� URI�� �ϳ��� ������ ���ҽ��� ��ǥ�ϵ��� ����� ����

// http://localhost:8080/tsigner/event/list?bno=1 --> url + �Ķ����
// http://localhost:8080/tsigner/event/list/1 --> url 
// RestController�� ������ 4.0���� ����
// @Controller, @RestController �������� �޼��尡 ����Ǹ� ȭ����ȯ�� ����

@RestController
@RequestMapping("*/reply/*")
public class ReplyController {
   
   @Inject
   ReplyService replyService;
   
   // ��� �Է�
   @RequestMapping(value="add")
   public void eventAdd(@ModelAttribute ReplyVo bean, HttpSession session) throws SQLException{
      String reply_id = (String) session.getAttribute("id");
	   bean.setReply_id(reply_id);
	   System.out.println("�̰� ������ ����Ȱ���");
	   replyService.eventAdd(bean);
	      
   }
   
   //��� ����Ʈ(@RestController Json������� ó�� : �����͸� ����)
   @RequestMapping(value="list")
   @ResponseBody	// ���ϵ����͸� json���� ��ȯ(��������)
   public List<ReplyVo> list(@RequestParam int event_seq) throws SQLException{
	   List<ReplyVo> list = replyService.list(event_seq);
	   
	   System.out.println("����Ʈ ��� ��Ʈ�ѷ�");
	   return list;
	   
   }
   
   //��� ����
   // @PathVariable :  url�� �Էµ� ���� �� ����
   @RequestMapping(value="/delete/{reply_seq}")
   @ResponseBody
   public String replyDelete(@PathVariable("reply_seq") Integer reply_seq){
	  try {
		System.out.println(reply_seq);
		replyService.delete(reply_seq);
	} catch (SQLException e) {
		return "fail";
	}
//	  System.out.println("����Ʈ ���� ��Ʈ�ѷ�");
	  return "success";
   }
}


