package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.tsigner.model.entity.FaqVo;
import com.bit.tsigner.model.entity.InqReplyVo;

public interface InqReplyDao {
	

	void insertReply(InqReplyVo bean) throws SQLException;

	List<InqReplyVo> selectReply(int event_seq) throws SQLException;

	void delete(Integer reply_seq) throws SQLException;

	void replyDeleteOne(int idx) throws SQLException;

	void inqRepUpdate(Map<String, Object> map) throws SQLException;

	
}
