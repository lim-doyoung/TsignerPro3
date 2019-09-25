package com.bit.tsigner.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.InqReplyVo;
import com.bit.tsigner.model.entity.ReplyVo;

public interface ReplyService {

	void eventAdd(ReplyVo bean) throws SQLException;

	List<ReplyVo> list(int event_seq) throws SQLException;

	

	void delete(Integer reply_seq) throws SQLException;


	
		
		
	

}
