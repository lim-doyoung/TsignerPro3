package com.bit.tsigner.service;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.tsigner.model.InqReplyDao;
import com.bit.tsigner.model.SupportDao;
import com.bit.tsigner.model.entity.FaqVo;
import com.bit.tsigner.model.entity.LoginVo;
import com.bit.tsigner.model.entity.SupportVo;

@Service
public class SupportServiceImpl implements SupportService{
	
	@Inject
	SqlSession sqlSession;


	@Override
	public void supportAdd(SupportVo bean) throws SQLException {
		
		bean.setInq_title(bean.getInq_title());
		bean.setUser_id(bean.getUser_id());
		bean.setRegi_date(bean.getRegi_date());
		bean.setInq_type(bean.getInq_type());
		bean.setInq_file_path1(bean.getInq_file_path1());
		bean.setInq_origin_no(bean.getInq_origin_no());
		bean.setInq_group_ord(bean.getInq_group_ord());
		bean.setInq_group_layer(bean.getInq_group_layer());
		
		sqlSession.getMapper(SupportDao.class).supportInsertOne(bean);
	}

	@Override
	public void supportDetail(Model model, int idx) throws SQLException {
		
		model.addAttribute("supportdetail",sqlSession.getMapper(SupportDao.class).supportSelectOne(idx));
		
	}

	@Override
	public void supportUpdate(int idx, String sub, String content) throws SQLException {
		
		Map<String, Object> map = new HashMap<String, Object>(); //Map에 파라미터 넣기
		map.put("idx", idx);
		map.put("sub", sub);
		map.put("content", content);
		
		sqlSession.getMapper(SupportDao.class).supportUpdateOne(map);
	}
	
	@Override
	public void supportDelete(int idx) throws SQLException {
		
		sqlSession.getMapper(SupportDao.class).supportDeleteOne(idx);
		
	}
	
	@Override
	public void replyDelete(int idx) throws SQLException {
		
		sqlSession.getMapper(InqReplyDao.class).replyDeleteOne(idx);
		
	}

	@Override
	public List<SupportVo> supportSelectAll(int start, int end, String searchOption, String keyword, String userId) throws SQLException {
		
		// 검색옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start-1); //limit 0, 10 이렇게 하려면 start-1해줘야함 
		map.put("end", end);
		map.put("userId", userId);
		
		return sqlSession.getMapper(SupportDao.class).supportSelectAll(map);
	}


	@Override
	public List<SupportVo> selectAll(int start, int end, String searchOption, String keyword) throws SQLException {
		
		// 검색옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		// BETWEEN #{start}, #{end}에 입력 될 값을 맵에
		map.put("start", start-1); //limit 0, 10 이렇게 하려면 start-1해줘야함 
		map.put("end", end);	
		
		return sqlSession.getMapper(SupportDao.class).selectAll(map);
	}

	@Override
	public int supportCountArticle(String searchOption, String keyword, String id) throws SQLException {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("id", id);
		
		
		return sqlSession.getMapper(SupportDao.class).supportCountArticle(map);
	}
	
	@Override
	public String getReplyWriter(String id) {
		LoginVo bean =sqlSession.getMapper(SupportDao.class).getReplyWriter(id);
		String result = bean.getProfile_root();
		result += bean.getProfile_file();
		return result;
	}
	
	@Override
	public String getInqReplyWriter(String id) {
		
		LoginVo bean =sqlSession.getMapper(SupportDao.class).getReplyWriter(id);
		String result = bean.getProfile_root();
		result += bean.getProfile_file();
		
		return result;
		
	}

	//// 답변 상태

	@Override
	public List<SupportVo> replyDone(int start, int end, String searchOption, String keyword, String userId)
			throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start-1); //limit 0, 10 이렇게 하려면 start-1해줘야함 
		map.put("end", end);
		map.put("userId", userId);
		
		return sqlSession.getMapper(SupportDao.class).replyDone(map);
	}
	
	@Override
	public List<SupportVo> replyUndone(int start, int end, String searchOption, String keyword, String userId)
			throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start-1); //limit 0, 10 이렇게 하려면 start-1해줘야함 
		map.put("end", end);
		map.put("userId", userId);
		
		return sqlSession.getMapper(SupportDao.class).replyUndone(map);
	}
	
	
	@Override
	public int replyDoneCountArticle(String searchOption, String keyword, String id) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("id", id);
		
		return sqlSession.getMapper(SupportDao.class).replyDoneCountArticle(map);
	}

	@Override
	public int replyUndoneCountArticle(String searchOption, String keyword, String id) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("id", id);
		
		return sqlSession.getMapper(SupportDao.class).replyUndoneCountArticle(map);
	}
	
	
	
	
	////////////////////// FAQ //////////////////////
	
	@Override
	public List<FaqVo> list() throws SQLException {
		
		FaqVo bean = new FaqVo();
		bean.setFaq_seq(bean.getFaq_seq());
		bean.setFaq_title(bean.getFaq_title());
		bean.setFaq_content(bean.getFaq_content());
		bean.setRegi_date(bean.getRegi_date());
		
		return sqlSession.getMapper(SupportDao.class).faqSelectAll();
	}

	@Override
	public void faqAdd(FaqVo bean) throws SQLException {
		
		bean.setFaq_title(bean.getFaq_title());
		bean.setFaq_content(bean.getFaq_content());
		
		sqlSession.getMapper(SupportDao.class).faqInsertOne(bean);
	}
	
	@Override
	public void faqUpdateOne(int idx, String sub, String content) throws SQLException {
		
		Map<String, Object> map = new HashMap<String, Object>();	//Map에 파라미터 넣기
		map.put("idx", idx);
		map.put("sub", sub);
		map.put("content", content);
		
		sqlSession.getMapper(SupportDao.class).faqUpdateOne(map);
	}

	@Override
	public void faqDeleteOne(int idx) throws SQLException {
		
		sqlSession.getMapper(SupportDao.class).faqDeleteOne(idx);
		
	}

	@Override
	public void getUserlist(String id, Model model) {
		
		model.addAttribute("user_list", sqlSession.getMapper(SupportDao.class).userList(id));
		
	}

	@Override
	public void faqDetail(Model model, int idx) throws SQLException {
		
		model.addAttribute("repupdate",sqlSession.getMapper(SupportDao.class).faqSelectOne(idx));

	}

	@Override
	public FaqVo repUpdate(String num) {
		return sqlSession.getMapper(SupportDao.class).repUpdate(num);
	}





	
	

}
