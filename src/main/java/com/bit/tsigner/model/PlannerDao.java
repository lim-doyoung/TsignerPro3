package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.PlannerVo;


public interface PlannerDao {
	
	//시,군,구 코드세팅
	List<PlannerVo> searchCode(String areaCode)throws SQLException;

	//planMgt저장
	void insertMgt(Map<String, Object> mgtMap)throws SQLException;

	//planMst저장
	void insertMst(Map<String, Object> mstMap)throws SQLException;

	//planDtl저장
	void insertDtl(Map<String, Object> dtlMap)throws SQLException;

	//플랜코드생성
	String createCode()throws SQLException;

	//업데이트시 이전정보들 삭제
	void deleteData(String plan_code)throws SQLException;

	void updateMgt(Map<String, Object> mgtMap)throws SQLException;

	List<Map<String,Object>> loadPlanDtl(String planCode)throws SQLException;
	
	List<Map<String,Object>> loadPlanMst(String planCode)throws SQLException;

	List<Map<String,Object>> loadPlanMgt(String planCode)throws SQLException;

	List<Map<String, Object>> loadHotplace()throws SQLException;

	List<Map<String, Object>> loadPurPlanner()throws SQLException;

	List<Map<String, Object>> loadMyPlanner(String userId)throws SQLException;

	List<Map<String,Object>> commLoadPlanDtl(String plannerCode)throws SQLException;
	
	List<Map<String,Object>> commLoadPlanMst(String plannerCode)throws SQLException;

	List<Map<String,Object>> commLoadPlanMgt(String plannerCode)throws SQLException;

	List<Map<String, Object>> loadPlannerList(String userId)throws SQLException;

	void deletePlanner(String plannerCode)throws SQLException;

	int saveCommPlanner(Map<String, Object> saveMap)throws SQLException;

	int maxSeq()throws SQLException;

	Map<String, Object> commDetail(int cmmmSeq)throws SQLException;

	void deleteComm(String cmmmSeq)throws SQLException;

	int commPlannerUpdate(Map<String, Object> saveMap)throws SQLException;

	void insertFile(Map<String, String> dmap)throws SQLException;

	void updateFile(Map<String, String> dmap)throws SQLException;

	void plannerReply(CommunityVo bean);

	void addPoint(String userid);

	void addRePoint(String userid);

	int totalPoint(String userid);

	void LevelUp(String userid);

	int memberLevel(String userid);

}
