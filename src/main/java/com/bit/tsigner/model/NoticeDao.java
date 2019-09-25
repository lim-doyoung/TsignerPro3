package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.tsigner.model.entity.EventVo;
import com.bit.tsigner.model.entity.LoginVo;
import com.bit.tsigner.model.entity.NoticeVo;
import com.bit.tsigner.model.entity.UpdateVo;

public interface NoticeDao {
//	List<NoticeVo> selectAll() throws SQLException;
//	List<NoticeVo> selectAll(Map<String, Integer>map) throws SQLException;
	
	//public List<NoticeVo> selectAll(int start, int end, String searchOption, String keyword)throws SQLException;
	void insertOne(NoticeVo bean) throws SQLException;
	NoticeVo selectOne(int idx) throws SQLException;
	void updateOne(Map<String, Object> map) throws SQLException;
	int deleteOne(int idx) throws SQLException;

	void increaseCnt(int idx) throws SQLException;
//	void insertOne(String upload_files)throws SQLException
	 List<NoticeVo> selectAll(Map<String, Object> map) throws SQLException ;
	int countArticle(Map<String, String> map) throws SQLException;
	
	/////////// event 
	
	List<EventVo> eventSelectAll(Map<String, Object> map) throws SQLException;
	int eventCountArticle(Map<String, String> map) throws SQLException;
	void eventInsertOne(EventVo bean) throws SQLException;
	EventVo eventSelectOne(int idx) throws SQLException;
	void eventIncreaseCnt(int idx) throws SQLException;
	void eventUpdateOne(Map<String, Object> map) throws SQLException;
	void eventDeleteOne(int idx) throws SQLException;
	void eventReplyInsertOne(EventVo bean) throws SQLException;
	
	void eventUpdateGroupOrd(EventVo bean) throws SQLException;
	//void eventUpdateGroupLayer(EventVo bean) throws SQLException;
	//void eventDeleteUpdate(int idx) throws SQLException;
	//void replyDeleteUpdate(int idx) throws SQLException;
	String getWriter(int idx);
	LoginVo getImg(String id) throws Exception;
	String getEventWriter(int idx);
	LoginVo getReplyWriter(String id) throws Exception;
//	void insertFile(NoticeVo bean) throws SQLException;
	
	void fileDelete(int idx) throws SQLException;
	void eventFileDelete(int idx) throws SQLException;
	
	///////////// update
	
	int updateCountArticle(Map<String, String> map)throws SQLException;
	List<UpdateVo> updateSelectAll(Map<String, Object> map)throws SQLException;
	void updateInsertOne(UpdateVo bean)throws SQLException;
	void updateFileDelete(int idx) throws SQLException;
	Object updateSelectOne(int idx) throws SQLException;
	void updateIncreaseCnt(int idx) throws SQLException;
	String getUpdateWriter(int idx)throws SQLException;
	void updateEditOne(Map<String, Object> map)throws SQLException;
	void updateDeleteOne(int idx)throws SQLException;
	
	
	
		
		
	

	
	
	
	
}
