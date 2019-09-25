package com.bit.tsigner.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.tsigner.model.ReplyDao;
import com.bit.tsigner.model.entity.ReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void eventAdd(ReplyVo bean) throws SQLException {
		bean.setEvent_seq(bean.getEvent_seq());
		bean.setReply_seq(bean.getReply_seq());
		bean.setReply_content(bean.getReply_content());
		bean.setReply_id(bean.getReply_id());
		
		sqlSession.getMapper(ReplyDao.class).insertReply(bean);

	}

	@Override
	public List<ReplyVo> list(int event_seq) throws SQLException {
		return sqlSession.getMapper(ReplyDao.class).selectReply(event_seq);
	}

	

	@Override
	public void delete(Integer reply_seq) throws SQLException {
		sqlSession.getMapper(ReplyDao.class).delete(reply_seq);
		
	}
	
	

}
