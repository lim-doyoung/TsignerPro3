package com.bit.tsigner.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.tsigner.model.LoginDao;
import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.LoginVo;
import com.bit.tsigner.model.entity.PayVo;
import com.bit.tsigner.model.entity.SupportVo;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public LoginVo login(Map<String, String> map) throws Exception {
		return sqlSession.getMapper(LoginDao.class).login(map);
	}

	@Override
	public void join(Map<String, Object> map) throws Exception {
		sqlSession.getMapper(LoginDao.class).join(map);
	}

	@Override
	public void join_level_mgt(Map<String, Object> map) throws Exception {
		sqlSession.getMapper(LoginDao.class).join_level_mgt(map);
	}

	@Override
	public String idCheck(String id) throws Exception {
		
		return sqlSession.getMapper(LoginDao.class).idCheck(id); 
	}

	@Override
	public String emailCheck(String email) throws Exception {
		return sqlSession.getMapper(LoginDao.class).emailCheck(email);
	}

	@Override
	public String searchId(Map<String, String> map) throws Exception {
		return sqlSession.getMapper(LoginDao.class).searchId(map);
	}

	@Override
	public Boolean searchPw(Map<String, String> map) throws Exception {
		return sqlSession.getMapper(LoginDao.class).searchPw(map);
	}

	@Override
	public void editPw(Map<String, String> map) {
		sqlSession.getMapper(LoginDao.class).editPw(map);
	}

	@Override
	public void easyJoin(Map<String, Object> map) throws Exception {
		sqlSession.getMapper(LoginDao.class).easyJoin(map);
	}

	@Override
	public LoginVo getUser(String id) throws Exception {
		return sqlSession.getMapper(LoginDao.class).getUser(id);
	}

	@Override
	public void updateUser(Map<String, Object> map) {
		sqlSession.getMapper(LoginDao.class).updateUser(map);
	}

	@Override
	public LoginVo emailLogin(String email) {
		return sqlSession.getMapper(LoginDao.class).emailLogin(email);
	}

	@Override
	public String checkUser(Map<String, Object> map) throws Exception {
		return sqlSession.getMapper(LoginDao.class).checkUser(map);
	}

	@Override
	public void leaveUser(String id) {
		sqlSession.getMapper(LoginDao.class).leaveUser(id);
	}

	@Override
	public void leaveUser2(String id) {
		sqlSession.getMapper(LoginDao.class).leaveUser2(id);
	}

	@Override
	public List<CommunityVo> getComnList(Map<String,Object> map) throws Exception {
		return sqlSession.getMapper(LoginDao.class).getComnList(map);
	}

	@Override
	public int getListTotal(Map<String,Object> map) {
		return sqlSession.getMapper(LoginDao.class).getListTotal(map);
	}

	@Override
	public void payDb(Map<String, Object> map) throws Exception {
		sqlSession.getMapper(LoginDao.class).getPayDb(map);
	}

	@Override
	public List<PayVo> payList(String id) throws Exception {
		return sqlSession.getMapper(LoginDao.class).getPayList(id);
	}

	@Override
	public void leaveUser3(String id) throws Exception {
		sqlSession.getMapper(LoginDao.class).leaveUser3(id);
	}

	@Override
	public void leaveTogether(String id) throws Exception {
		sqlSession.getMapper(LoginDao.class).leaveTogether(id);
	}

	@Override
	public void leaveBbs(String id) throws Exception {
		sqlSession.getMapper(LoginDao.class).leaveBbs(id);
	}

	@Override
	public List<SupportVo> inquiryList(Map<String, Object> map) throws Exception {
		return sqlSession.getMapper(LoginDao.class).getInquiryList(map);
	}

	@Override
	public int getInqResult(Map<String, Object> map) throws Exception {
		return sqlSession.getMapper(LoginDao.class).getInqResult(map);
	}

	@Override
	public void leaveInquiry(String id) throws Exception {
		sqlSession.getMapper(LoginDao.class).leaveInquiry(id);
	}

	@Override
	public void leavePlaner(String id) throws Exception {
		System.out.println("id °ª : "+id);
		sqlSession.getMapper(LoginDao.class).leavePlaner(id);
	}

}
