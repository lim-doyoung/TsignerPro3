package com.bit.tsigner.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.EventVo;
import com.bit.tsigner.model.entity.NoticeVo;
import com.bit.tsigner.model.entity.UpdateVo;

public interface NoticeService {

	//void getList(Model model) throws SQLException;
	//게시글 전체 목록
	List<NoticeVo> selectAll(int start, int end, String searchOption, String keyword)throws SQLException;
	
	void add(NoticeVo bean) throws SQLException;

	void detail(Model model, int idx) throws SQLException;
	
	void update(int idx, String sub, String content, String writer, int noti_fix, NoticeVo bean) throws SQLException;
	
	void delete(int idx) throws SQLException;

	void viewcnt(int idx) throws SQLException;

	int countArticle(String searchOption, String keyword) throws SQLException;
	
	///////////////// event /////////////////

	List<EventVo> eventSelectAll(int start, int end, String searchOption, String keyword) throws SQLException;

	int eventCountArticle(String searchOption, String keyword) throws SQLException;

	void eventAdd(EventVo bean) throws SQLException;

	void eventDetail(Model model, int idx) throws SQLException;

	void eventViewcnt(int idx) throws SQLException;

	void eventUpdate(int idx, String sub, String content, int event_fix, EventVo bean) throws SQLException;

	void eventDelete(int idx) throws SQLException;

	void eventReplyAdd(EventVo bean) throws SQLException;

	void eventUpdateGroupOrd(EventVo bean) throws SQLException;

	void replyDelete(int idx) throws SQLException;

	String getWriter(int idx) throws SQLException;

	void getImg(Model model, String id) throws Exception;

	void eventWriter(Model model, String id) throws Exception;
	
	String getEventWriter(int idx);

	String getReplyWriter(String id) throws Exception;

	void deleteFile(String fileName) throws Exception;

	void fileDelete(int idx) throws Exception;

	void eventFileDelete(int idx) throws SQLException;
	
	/////////////////////////////////////update///////////////////////////////////////////////

	int updateCountArticle(String searchOption, String keyword)throws SQLException;

	List<UpdateVo> updateSelectAll(int start, int end, String searchOption, String keyword)throws SQLException;

	void updateAdd(UpdateVo bean) throws SQLException;

	void updateFileDelete(int idx) throws SQLException;

	void updateDetail(Model model, int idx)throws SQLException;

	void updateViewcnt(int idx)throws SQLException;

	String getUpdateWriter(int idx)throws SQLException;

	void updateEdit(int idx, String sub, String content, String writer, UpdateVo bean)throws SQLException;

	void updateDelete(int idx) throws SQLException;

	



//	void addFile(NoticeVo bean) throws SQLException;



//	void eventUpdateGroupLayer(EventVo bean) throws SQLException;
//
//	void eventDeleteUpdate(int idx) throws SQLException;
//
//	void replyDeleteUpdate(int idx) throws SQLException;



	


	

	

	



	

}
