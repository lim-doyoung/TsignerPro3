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
import com.bit.tsigner.model.entity.InqReplyVo;

@Service
public class InqReplyServiceImpl implements InqReplyService {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void inquiryAdd(InqReplyVo bean) throws SQLException {
		bean.setInq_seq(bean.getInq_seq());
		bean.setReply_seq(bean.getReply_seq());
		bean.setReply_content(bean.getReply_content());
		bean.setReply_id(bean.getReply_id());
		
		sqlSession.getMapper(InqReplyDao.class).insertReply(bean);

	}

	@Override
	public List<InqReplyVo> list(int inq_seq) throws SQLException {
		return sqlSession.getMapper(InqReplyDao.class).selectReply(inq_seq);
	}

	

	@Override
	public void delete(Integer reply_seq) throws SQLException {
		sqlSession.getMapper(InqReplyDao.class).delete(reply_seq);
		
	}
	
	
	/*문의하기 댓글 수정*/
	@Override
	public void inqRepUpdate(String idx, String content) throws SQLException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);
		map.put("content", content);
		
		sqlSession.getMapper(InqReplyDao.class).inqRepUpdate(map);
		
	}

//	@Override
//	public void update(Integer reply_seq, String reply_content) {
//		Map<String, Object> map = new HashMap<String, Object>();	//Map에 파라미터 넣기
//		map.put("idx", reply_seq);
//		map.put("content", reply_content);
//		
//		sqlSession.getMapper(InqReplyDao.class).update(map);
//		
//		
//	}

	

	
	

}
