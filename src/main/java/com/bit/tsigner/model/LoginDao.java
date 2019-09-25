package com.bit.tsigner.model;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.LoginVo;
import com.bit.tsigner.model.entity.PayVo;
import com.bit.tsigner.model.entity.SupportVo;

public interface LoginDao {
	
	LoginVo login(Map<String, String> map) throws Exception;
	void join(Map<String, Object> map) throws Exception;
	void join_level_mgt(Map<String, Object> map) throws Exception;
	void easyJoin(Map<String, Object> map) throws Exception;
	String idCheck(String id) throws Exception;
	String emailCheck(String email) throws Exception;
	String searchId(Map<String, String> map) throws Exception;
	Boolean searchPw(Map<String, String> map) throws Exception;
	void editPw(Map<String, String> map);
	LoginVo getUser(String id);
	void updateUser(Map<String, Object> map);
	LoginVo emailLogin(String email);
	String checkUser(Map<String, Object> map) throws Exception;
	void leaveUser(String id);
	void leaveUser2(String id);
	List<CommunityVo> getComnList(Map<String, Object> map) throws Exception;
	int getListTotal(Map<String,Object> map);
	void getPayDb(Map<String, Object> map);
	List<PayVo> getPayList(String id);
	void leaveUser3(String id);
	void leaveTogether(String id);
	void leaveBbs(String id);
	List<SupportVo> getInquiryList(Map<String, Object> map);
	int getInqResult(Map<String, Object> map);
	void leaveInquiry(String id);
	void leavePlaner(String id);
}
