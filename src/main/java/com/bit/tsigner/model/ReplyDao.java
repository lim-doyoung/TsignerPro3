package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.ReplyVo;

public interface ReplyDao {
	

	void insertReply(ReplyVo bean) throws SQLException;

	List<ReplyVo> selectReply(int event_seq) throws SQLException;

	

	void delete(Integer reply_seq) throws SQLException;

	void replyDeleteOne(int idx) throws SQLException;

	
	
}
