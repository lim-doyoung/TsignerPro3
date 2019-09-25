package com.bit.tsigner.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.PlannerVo;

public interface PlannerService {

	 List<PlannerVo> searchCode(String areaCode) throws SQLException;

	 String saveData(List<Map<String, Object>> mgtList, List<Map<String, Object>> mstList,List<Map<String, Object>> dtlList) throws SQLException;

	 List<List<Map<String, Object>>> loadPlanner(String planCode) throws SQLException;

	 List<Map<String, Object>> loadHotplace() throws SQLException;

	 List<Map<String, Object>> purPlanner() throws SQLException;

	 List<Map<String, Object>> loadMyPlanner(String userId) throws SQLException;

	 List<List<Map<String, Object>>> commLoadPlanner(String plannerCode) throws SQLException;

	List<Map<String, Object>> loadPlannerList(String userId) throws SQLException;

	String deletePlanner(String plannerCode) throws SQLException;

	int saveCommPlanner(Map<String, Object> saveMap) throws SQLException;

	Map<String, Object> commDetail(int cmmmSeq) throws SQLException;

	String deleteComm(String cmmmSeq) throws SQLException;

	int commPlannerUpdate(Map<String, Object> saveMap) throws SQLException;

	void insertFile(String fileName,String seq) throws SQLException;

	void updateFile(String fileName, String seq) throws SQLException;

	void plannerReply(CommunityVo bean);

	void addRePoint(String userid);

	int totalPoint(String userid);

	int memL(String userid);

	void LevUP(String userid);

	void addPoint(String userid);

}
