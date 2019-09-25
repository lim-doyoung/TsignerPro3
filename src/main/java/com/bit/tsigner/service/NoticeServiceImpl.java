package com.bit.tsigner.service;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.tsigner.model.NoticeDao;
import com.bit.tsigner.model.ReplyDao;
import com.bit.tsigner.model.entity.EventVo;
import com.bit.tsigner.model.entity.LoginVo;
import com.bit.tsigner.model.entity.NoticeVo;
import com.bit.tsigner.model.entity.UpdateVo;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Inject
	SqlSession sqlSession;

//	@Override
//	public void getList(Model model) throws SQLException {
//		model.addAttribute("noticelist", sqlSession.getMapper(NoticeDao.class).selectAll());
//		
//	}
	
	@Override
	public List<NoticeVo> selectAll(int start, int end, String searchOption, String keyword) throws SQLException {
		// 검색옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		// BETWEEN #{start}, #{end}에 입력 될 값을 맵에
		map.put("start", start-1);		//limit 0, 10 이렇게 하려면 start-1해줘야함 
		map.put("end", end);	
		//System.out.println("service"+(start-1));
 		
		//return sqlSession.getMapper(NoticeDao.class).selectAll(start, end, searchOption, keyword);
		//return sqlSession.getMapper(NoticeDao.class).selectAll("notice.getList", map);
		//return sqlSession.selectList("notice.getList", map);
		return sqlSession.getMapper(NoticeDao.class).selectAll(map);
	}

	@Override
	public void add(NoticeVo bean) throws SQLException {
		
		bean.setNoti_title(bean.getNoti_title());
		bean.setNoti_writer_id(bean.getNoti_writer_id());
		bean.setRegi_date(bean.getRegi_date());
		bean.setNoti_hits(bean.getNoti_hits());
		bean.setNoti_file_path1(bean.getNoti_file_path1());
		bean.setNoti_file_path2(bean.getNoti_file_path2());
		bean.setNoti_fix(bean.getNoti_fix());
		
		sqlSession.getMapper(NoticeDao.class).insertOne(bean);
			
	}

	@Override
	public void detail(Model model, int idx) throws SQLException {
		model.addAttribute("noticedetail",sqlSession.getMapper(NoticeDao.class).selectOne(idx));
	//	model.addAttribute("loginId", sqlSession.getMapper(LoginDao.class).getUser(id));
	}

	@Override
	public String getWriter(int idx) throws SQLException {
		return sqlSession.getMapper(NoticeDao.class).getWriter(idx);
		
	}

	@Override
	public void update(int idx, String sub, String content, String writer,int noti_fix,NoticeVo bean) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();	//Map에 파라미터 넣기
		map.put("idx", idx);
		map.put("sub", sub);
		map.put("content", content);
		map.put("writer", writer);
		map.put("noti_fix", noti_fix);
		map.put("noti_file_path1", bean.getNoti_file_path1());
		map.put("noti_file_path2", bean.getNoti_file_path2());
		
		sqlSession.getMapper(NoticeDao.class).updateOne(map);
	
	}
	
	
	
	@Override
	public void delete(int idx) throws SQLException {
		sqlSession.getMapper(NoticeDao.class).deleteOne(idx);
			
	}
	
	@Override
	public void viewcnt(int idx) throws SQLException {
//		long update_time = 0;
//		//세션에 저장된 조회시간 검색
//		//최초로 조회할 경우 세선에 저장된 값이 없기 때문에 if문은 실행 안한다.
//		if(session.getAttribute("update_time"+idx) != null) {
//			
//			update_time = (long)session.getAttribute("updaet_time"+idx);
//		}
//		//시스템의 현재시간을 current_time에 저장
//		long current_time = System.currentTimeMillis();
//		//일정시간이 경과 후 조회수 증가 처리 
		
		sqlSession.getMapper(NoticeDao.class).increaseCnt(idx);
		
		
	}


	// 07. 게시글 레코드 갯수
		@Override
		public int countArticle(String searchOption, String keyword) throws SQLException {
			// 검색옵션, 키워드 맵에 저장
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			
			
			return sqlSession.getMapper(NoticeDao.class).countArticle(map);
			
			
		}
		
		
		@Override
		public void fileDelete(int idx) throws Exception {		//파일 삭제
			sqlSession.getMapper(NoticeDao.class).fileDelete(idx);
			
		}
		
		//////////////////////// event 

		@Override
		public List<EventVo> eventSelectAll(int start, int end, String searchOption, String keyword) throws SQLException{
				// 검색옵션, 키워드 맵에 저장
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("searchOption", searchOption);
				map.put("keyword", keyword);
				
				map.put("start", start-1);		//limit 0, 10 이렇게 하려면 start-1해줘야함 
				map.put("end", end);	
				
				return sqlSession.getMapper(NoticeDao.class).eventSelectAll(map);
		}

		@Override
		public int eventCountArticle(String searchOption, String keyword) throws SQLException {
			// 검색옵션, 키워드 맵에 저장
						Map<String, String> map = new HashMap<String, String>();
						map.put("searchOption", searchOption);
						map.put("keyword", keyword);
						
						
						return sqlSession.getMapper(NoticeDao.class).eventCountArticle(map);
		}

		@Override
		public void eventAdd(EventVo bean) throws SQLException {
			bean.setEvent_title(bean.getEvent_title());
			bean.setEvent_writer_id(bean.getEvent_writer_id());
			bean.setRegi_date(bean.getRegi_date());
			bean.setEvent_hits(bean.getEvent_hits());
			bean.setEvent_file_path1(bean.getEvent_file_path1());
			bean.setEvent_file_path2(bean.getEvent_file_path2());
			bean.setEvent_origin_no(bean.getEvent_origin_no());
			bean.setEvent_group_ord(bean.getEvent_group_ord());
			bean.setEvent_group_layer(bean.getEvent_group_layer());
			bean.setEvent_fix(bean.getEvent_fix());
			
			sqlSession.getMapper(NoticeDao.class).eventInsertOne(bean);
			
		}

		@Override
		public void eventDetail(Model model, int idx) throws SQLException {
			model.addAttribute("eventdetail",sqlSession.getMapper(NoticeDao.class).eventSelectOne(idx));
			
		}

		@Override
		public void eventViewcnt(int idx) throws SQLException {
			sqlSession.getMapper(NoticeDao.class).eventIncreaseCnt(idx);
			
		}

		@Override
		public void eventUpdate(int idx, String sub, String content,int event_fix, EventVo bean) throws SQLException {
			Map<String, Object> map = new HashMap<String, Object>();	//Map에 파라미터 넣기
			
			map.put("idx", idx);
			map.put("sub", sub);
			map.put("content", content);
			map.put("event_fix", event_fix);
			
			map.put("path1", bean.getEvent_file_path1());
			map.put("path2", bean.getEvent_file_path2());
			
			sqlSession.getMapper(NoticeDao.class).eventUpdateOne(map);
			
		}

		@Override
		public void eventDelete(int idx) throws SQLException {
			sqlSession.getMapper(NoticeDao.class).eventDeleteOne(idx);
			
		}

		@Override
		public void eventReplyAdd(EventVo bean) throws SQLException {
			bean.setEvent_title(bean.getEvent_title());
			bean.setEvent_writer_id(bean.getEvent_writer_id());
			bean.setRegi_date(bean.getRegi_date());
			bean.setEvent_hits(bean.getEvent_hits());
			bean.setEvent_file_path1(bean.getEvent_file_path1());
			bean.setEvent_origin_no(bean.getEvent_origin_no());
			bean.setEvent_group_ord(bean.getEvent_group_ord());
			bean.setEvent_group_layer(bean.getEvent_group_layer());
			bean.setEvent_reply_cnt(bean.getEvent_reply_cnt());
			bean.setEvent_fix(bean.getEvent_fix());
			
			sqlSession.getMapper(NoticeDao.class).eventReplyInsertOne(bean);
			
		}

		@Override
		public void eventUpdateGroupOrd(EventVo bean) throws SQLException {
			
			bean.setEvent_origin_no(bean.getEvent_origin_no());
			bean.setEvent_group_ord(bean.getEvent_group_ord());
			bean.setEvent_group_layer(bean.getEvent_group_layer());
			
			
			sqlSession.getMapper(NoticeDao.class).eventUpdateGroupOrd(bean);
			
		}

		@Override
		public void replyDelete(int idx) throws SQLException {
			
			sqlSession.getMapper(ReplyDao.class).replyDeleteOne(idx);
		}

		@Override
		public void getImg(Model model, String id) throws Exception{
			
			LoginVo bean = sqlSession.getMapper(NoticeDao.class).getImg(id);
			model.addAttribute("writer",bean.getProfile_root()+bean.getProfile_file());
		}

		
		@Override
		public String getEventWriter(int idx) {
			 return sqlSession.getMapper(NoticeDao.class).getEventWriter(idx); 
		}

		@Override
		public void eventWriter(Model model, String id) throws Exception {
			LoginVo bean = sqlSession.getMapper(NoticeDao.class).getImg(id);
			model.addAttribute("writer",bean.getProfile_root()+bean.getProfile_file());
		}

		@Override
		public String getReplyWriter(String id) throws Exception {
			LoginVo bean =sqlSession.getMapper(NoticeDao.class).getReplyWriter(id);
			String result = bean.getProfile_root();
			result += bean.getProfile_file();
			return result;
		}


		@Override
		public void deleteFile(String fileName) throws Exception {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void eventFileDelete(int idx) throws SQLException {	//이벤트 파일 삭제
			sqlSession.getMapper(NoticeDao.class).eventFileDelete(idx);
			
		}
		
////////////////////////////////update /////////////////////////////////////////////////////////////////////////////////////////////////////
		
		@Override
		public int updateCountArticle(String searchOption, String keyword) throws SQLException {
			
			// 검색옵션, 키워드 맵에 저장
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			
			
			return sqlSession.getMapper(NoticeDao.class).updateCountArticle(map);
		}

		@Override
		public List<UpdateVo> updateSelectAll(int start, int end, String searchOption, String keyword) throws SQLException {
			
			// 검색옵션, 키워드 맵에 저장
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			// BETWEEN #{start}, #{end}에 입력 될 값을 맵에
			map.put("start", start-1);		//limit 0, 10 이렇게 하려면 start-1해줘야함 
			map.put("end", end);	
			
			return sqlSession.getMapper(NoticeDao.class).updateSelectAll(map);
		}

		@Override
		public void updateAdd(UpdateVo bean) throws SQLException {
			
			bean.setUpdate_title(bean.getUpdate_title());
			bean.setUpdate_writer_id(bean.getUpdate_writer_id());
			bean.setRegi_date(bean.getRegi_date());
			bean.setUpdate_hits(bean.getUpdate_hits());
			bean.setUpdate_file_path1(bean.getUpdate_file_path1());
			bean.setUpdate_file_path2(bean.getUpdate_file_path2());
			
			sqlSession.getMapper(NoticeDao.class).updateInsertOne(bean);
			
		}

		@Override
		public void updateFileDelete(int idx) throws SQLException {		//파일 삭제
			
			sqlSession.getMapper(NoticeDao.class).updateFileDelete(idx);
			
		}

		@Override
		public void updateDetail(Model model, int idx) throws SQLException {
			
			model.addAttribute("updatedetail",sqlSession.getMapper(NoticeDao.class).updateSelectOne(idx));
			
		}

		@Override
		public void updateViewcnt(int idx) throws SQLException {
			sqlSession.getMapper(NoticeDao.class).updateIncreaseCnt(idx);
			
		}

		@Override
		public String getUpdateWriter(int idx) throws SQLException {
			return sqlSession.getMapper(NoticeDao.class).getUpdateWriter(idx);
		}

		@Override
		public void updateEdit(int idx, String sub, String content, String writer, UpdateVo bean) throws SQLException {
			Map<String, Object> map = new HashMap<String, Object>();	//Map에 파라미터 넣기
			map.put("idx", idx);
			map.put("sub", sub);
			map.put("content", content);
			map.put("writer", writer);
			map.put("path1", bean.getUpdate_file_path1());
			map.put("path2", bean.getUpdate_file_path2());
			
			sqlSession.getMapper(NoticeDao.class).updateEditOne(map);	
		}

		@Override
		public void updateDelete(int idx) throws SQLException {
			sqlSession.getMapper(NoticeDao.class).updateDeleteOne(idx);
		}

		

		
		

		


//		@Override
//		public void eventUpdateGroupLayer(EventVo bean) throws SQLException {
//			
//			bean.setEvent_origin_no(bean.getEvent_origin_no());
//			bean.setEvent_group_layer(bean.getEvent_group_layer());
//			
//			sqlSession.getMapper(NoticeDao.class).eventUpdateGroupLayer(bean);
//			
//		}
//
//		@Override
//		public void eventDeleteUpdate(int idx) throws SQLException {
//			sqlSession.getMapper(NoticeDao.class).eventDeleteUpdate(idx);
//			
//		}
//
//		@Override
//		public void replyDeleteUpdate(int idx) throws SQLException {
//			sqlSession.getMapper(NoticeDao.class).replyDeleteUpdate(idx);
//			
//		}



	



	

	

}
