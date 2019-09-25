package com.bit.tsigner.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.InqReplyVo;
import com.bit.tsigner.model.entity.SupportVo;

public interface InqReplyService {

	void inquiryAdd(InqReplyVo bean) throws SQLException;

	List<InqReplyVo> list(int inq_seq) throws SQLException;

	void delete(Integer reply_seq) throws SQLException;

	void inqRepUpdate(String idx, String content) throws SQLException;


	
		
		
	

}
