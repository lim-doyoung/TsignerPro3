package com.bit.tsigner.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.FaqVo;
import com.bit.tsigner.model.entity.SupportVo;

public interface SupportService {
	
	//고객센터 - 문의하기
	List<SupportVo> supportSelectAll(int start, int end, String searchOption, String keyword, String userId) throws SQLException;
	void supportAdd(SupportVo bean) throws SQLException;
	void supportDetail(Model model, int idx) throws SQLException;
	void supportUpdate(int idx, String sub, String content) throws SQLException;
	void supportDelete(int idx) throws SQLException;
	void replyDelete(int idx) throws SQLException;
	List<SupportVo> selectAll(int start, int end, String searchOption, String keyword)throws SQLException;
	int supportCountArticle(String searchOption, String keyword, String id) throws SQLException;
	String getReplyWriter(String id);
	void getUserlist(String id, Model model);
	String getInqReplyWriter(String id);
	
	// 답변 상태
	List<SupportVo> replyDone(int start, int end, String searchOption, String keyword, String userId) throws SQLException;
	List<SupportVo> replyUndone(int start, int end, String searchOption, String keyword, String userId) throws SQLException;
	int replyDoneCountArticle(String searchOption, String keyword, String id) throws SQLException;
	int replyUndoneCountArticle(String searchOption, String keyword, String id) throws SQLException;
	
	//고객센터 - 자주 묻는 질문
	List<FaqVo> list() throws SQLException;
	void faqAdd(FaqVo bean) throws SQLException;
	void faqDetail(Model model, int idx) throws SQLException;
	void faqUpdateOne(int idxs, String sub, String content) throws SQLException;
	void faqDeleteOne(int idx) throws SQLException;
	FaqVo repUpdate(String num);

}
