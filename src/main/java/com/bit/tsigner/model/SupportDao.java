package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.EventVo;
import com.bit.tsigner.model.entity.FaqVo;
import com.bit.tsigner.model.entity.LoginVo;
import com.bit.tsigner.model.entity.NoticeVo;
import com.bit.tsigner.model.entity.SupportVo;

public interface SupportDao {

	////////////////////// INQUIRY //////////////////////
	
	List<SupportVo> supportSelectAll(Map<String, Object> map) throws SQLException;
	int supportCountArticle(Map<String, String> map) throws SQLException;
	void supportInsertOne(SupportVo bean) throws SQLException;
	SupportVo supportSelectOne(int idx) throws SQLException;
	void supportUpdateOne(Map<String, Object> map) throws SQLException;
	void supportDeleteOne(int idx) throws SQLException;
	void supportReplyInsertOne(SupportVo bean) throws SQLException;
	List<SupportVo> selectAll(Map<String, Object> map);
	LoginVo getReplyWriter(String id);
	List<SupportVo> userList(String id);
	
	List<SupportVo> replyDone(Map<String, Object> map) throws SQLException; // 답변 상태
	List<SupportVo> replyUndone(Map<String, Object> map) throws SQLException;
	int replyDoneCountArticle(Map<String, String> map) throws SQLException;
	int replyUndoneCountArticle(Map<String, String> map) throws SQLException;
	
	////////////////////// FAQ //////////////////////
	
	List<FaqVo> faqSelectAll() throws SQLException;
	void faqInsertOne(FaqVo bean) throws SQLException;
	void faqUpdateOne(Map<String, Object> map) throws SQLException;
	void faqDeleteOne(int idx) throws SQLException;
	FaqVo faqSelectOne(int idx) throws SQLException;
	FaqVo repUpdate(String num);
}
