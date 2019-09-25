package com.bit.tsigner.service;

import java.util.List;
import java.util.Map;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.LoginVo;
import com.bit.tsigner.model.entity.PayVo;
import com.bit.tsigner.model.entity.SupportVo;

public interface LoginService {
	LoginVo login(Map<String, String> map) throws Exception;
	void join(Map<String, Object> map) throws Exception;
	void join_level_mgt(Map<String, Object> map) throws Exception;
	void easyJoin(Map<String, Object> map) throws Exception;
	String idCheck(String id) throws Exception;
	String emailCheck(String email) throws Exception;
	String searchId(Map<String, String> map) throws Exception;
	Boolean searchPw(Map<String, String> map) throws Exception;
	void editPw(Map<String, String> map);
	LoginVo getUser(String id) throws Exception;
	void updateUser(Map<String, Object> map);
	LoginVo emailLogin(String email);
	String checkUser(Map<String, Object> map) throws Exception;
	void leaveUser(String id) throws Exception;
	void leaveUser2(String id) throws Exception;
	List<CommunityVo> getComnList(Map<String,Object> map) throws Exception;
	int getListTotal(Map<String,Object> map);
	void payDb(Map<String, Object> map) throws Exception;
	List<PayVo> payList(String id) throws Exception;
	void leaveUser3(String id) throws Exception;
	void leaveTogether(String id) throws Exception;
	void leaveBbs(String id) throws Exception;
	List<SupportVo> inquiryList(Map<String, Object> map) throws Exception;
	int getInqResult(Map<String, Object> map) throws Exception;
	void leaveInquiry(String id) throws Exception;
	void leavePlaner(String id) throws Exception;
}

