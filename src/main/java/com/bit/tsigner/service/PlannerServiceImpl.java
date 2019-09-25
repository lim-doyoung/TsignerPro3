package com.bit.tsigner.service;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.bit.tsigner.model.CommunityDao;
import com.bit.tsigner.model.PlannerDao;
import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.PlannerVo;


@Service
public class PlannerServiceImpl implements PlannerService{

	@Inject
	SqlSession sqlSession;
//	PlannerDao plannerDao;

	@Override
	public List<PlannerVo> searchCode(String areaCode) throws SQLException{
		
		return sqlSession.getMapper(PlannerDao.class).searchCode(areaCode);
	}

	@Override
	public String saveData(List<Map<String, Object>> mgtList, List<Map<String, Object>> mstList,List<Map<String, Object>> dtlList) throws SQLException{
		
		boolean planCodeYn=true;
		String plan_code=(String)mgtList.get(0).get("plan_code");
		
		
		if(mgtList.get(0).get("plan_code")==null || "".equals(mgtList.get(0).get("plan_code"))) {
			planCodeYn=false;
			plan_code=sqlSession.getMapper(PlannerDao.class).createCode();
		}else {
			plan_code=(String)mgtList.get(0).get("plan_code");
			sqlSession.getMapper(PlannerDao.class).deleteData(plan_code);
		}
		
			Map<String, Object> mgtMap=new HashMap<String, Object>();
			
			mgtMap.put("plan_code", plan_code);
			mgtMap.put("plan_title", mgtList.get(0).get("plan_title"));
			mgtMap.put("user_id", mgtList.get(0).get("user_id"));
			mgtMap.put("tot_amt", mgtList.get(0).get("tot_amt"));
			mgtMap.put("trv_from_date", mgtList.get(0).get("trv_from_date"));
			mgtMap.put("trv_to_date", mgtList.get(0).get("trv_to_date"));
			mgtMap.put("tot_dist", mgtList.get(0).get("tot_dist"));
			mgtMap.put("tot_room_chg", mgtList.get(0).get("tot_room_chg"));
			mgtMap.put("tot_food_exp", mgtList.get(0).get("tot_food_exp"));
			mgtMap.put("tot_tran_exp", mgtList.get(0).get("tot_tran_exp"));
			
			if(planCodeYn==false) {
				sqlSession.getMapper(PlannerDao.class).insertMgt(mgtMap);
			}else {
				sqlSession.getMapper(PlannerDao.class).updateMgt(mgtMap);
			}
			
			for(int i=0;i<mstList.size();i++) {
				Map<String, Object> mstMap=new HashMap<String, Object>();
				
				mstMap.put("plan_code", plan_code);
				mstMap.put("trv_deg", mstList.get(i).get("trv_deg"));
				mstMap.put("trv_date", mstList.get(i).get("trv_date"));
				mstMap.put("day_dist", mstList.get(i).get("day_dist"));
				mstMap.put("day_amt", mstList.get(i).get("day_amt"));
				mstMap.put("day_room_chg", mstList.get(i).get("day_room_chg"));
				mstMap.put("day_food_exp", mstList.get(i).get("day_food_exp"));
				mstMap.put("day_tran_exp", mstList.get(i).get("day_tran_exp"));
				
				sqlSession.getMapper(PlannerDao.class).insertMst(mstMap);
			}
			
			for(int i=0;i<dtlList.size();i++) {
				Map<String, Object> dtlMap=new HashMap<String, Object>();
				
				dtlMap.put("plan_code", plan_code);
				dtlMap.put("loc_name", dtlList.get(i).get("loc_name"));
				dtlMap.put("loc_addr", dtlList.get(i).get("loc_addr"));
				dtlMap.put("loc_type", dtlList.get(i).get("loc_type"));
				dtlMap.put("trv_deg", dtlList.get(i).get("trv_deg"));
				dtlMap.put("loc_post_code", dtlList.get(i).get("loc_post_code"));
				dtlMap.put("position_x", dtlList.get(i).get("position_x"));
				dtlMap.put("position_y", dtlList.get(i).get("position_y"));
				dtlMap.put("loc_img_url", dtlList.get(i).get("loc_img_url"));
				dtlMap.put("content_id", dtlList.get(i).get("content_id"));
				dtlMap.put("loc_tel", dtlList.get(i).get("loc_tel"));
				dtlMap.put("overview", dtlList.get(i).get("overview"));
				dtlMap.put("loc_bdg", dtlList.get(i).get("loc_bdg"));
				dtlMap.put("loc_memo", dtlList.get(i).get("loc_memo"));
				dtlMap.put("loc_seq", dtlList.get(i).get("loc_seq"));
				dtlMap.put("loc_distance", dtlList.get(i).get("loc_distance"));
				
				sqlSession.getMapper(PlannerDao.class).insertDtl(dtlMap);
				
			}
			
			return plan_code;
	}

	//플래너 불러오기
	@SuppressWarnings("unchecked")
	@Override
	public List<List<Map<String, Object>>> loadPlanner(String planCode) throws SQLException {
		
		List<List<Map<String, Object>>> loadList=new ArrayList<List<Map<String, Object>>>();
		List<Map<String, Object>> dtlList=new ArrayList<Map<String, Object>>(); 
		List<Map<String, Object>> mstList=new ArrayList<Map<String, Object>>(); 
		List<Map<String, Object>> mgtList=new ArrayList<Map<String, Object>>(); 
		
		dtlList=sqlSession.getMapper(PlannerDao.class).loadPlanDtl(planCode);
		mstList=sqlSession.getMapper(PlannerDao.class).loadPlanMst(planCode);
		mgtList=sqlSession.getMapper(PlannerDao.class).loadPlanMgt(planCode);
		
		loadList.add(mgtList);
		loadList.add(mstList);
		loadList.add(dtlList);
		
		return loadList;
	}

	//핫플레이스5
	@Override
	public List<Map<String, Object>> loadHotplace() throws SQLException {
		List<Map<String, Object>> loadHotp=new ArrayList<Map<String, Object>>();
		loadHotp=sqlSession.getMapper(PlannerDao.class).loadHotplace();
		System.out.println(loadHotp);
		return loadHotp;
	}

	//인기플래너 불러오기
	@Override
	public List<Map<String, Object>> purPlanner() throws SQLException {
		List<Map<String, Object>> loadPurPlanner=new ArrayList<Map<String, Object>>();
		loadPurPlanner=sqlSession.getMapper(PlannerDao.class).loadPurPlanner();
		return loadPurPlanner;
	}

	@Override
	public List<Map<String, Object>> loadMyPlanner(String userId) throws SQLException {
		List<Map<String, Object>> loadMyPlanner=new ArrayList<Map<String, Object>>();
		loadMyPlanner=sqlSession.getMapper(PlannerDao.class).loadMyPlanner(userId);
		return loadMyPlanner;
	}

	@Override
	public List<List<Map<String, Object>>> commLoadPlanner(String plannerCode) throws SQLException {
		List<List<Map<String, Object>>> loadList=new ArrayList<List<Map<String, Object>>>();
		List<Map<String, Object>> dtlList=new ArrayList<Map<String, Object>>(); 
		List<Map<String, Object>> mstList=new ArrayList<Map<String, Object>>(); 
		List<Map<String, Object>> mgtList=new ArrayList<Map<String, Object>>(); 
		
		dtlList=sqlSession.getMapper(PlannerDao.class).commLoadPlanDtl(plannerCode);
		mstList=sqlSession.getMapper(PlannerDao.class).commLoadPlanMst(plannerCode);
		mgtList=sqlSession.getMapper(PlannerDao.class).commLoadPlanMgt(plannerCode);
		
		loadList.add(mgtList);
		loadList.add(mstList);
		loadList.add(dtlList);
		
		return loadList;
	}

	@Override
	public List<Map<String, Object>> loadPlannerList(String userId) throws SQLException {
		
		return sqlSession.getMapper(PlannerDao.class).loadPlannerList(userId);
	}

	@Override
	public String deletePlanner(String plannerCode) throws SQLException {
		System.out.println("시스템임플 : "+plannerCode);
		sqlSession.getMapper(PlannerDao.class).deletePlanner(plannerCode);
		return "1";
	}

	@Override
	public int saveCommPlanner(Map<String, Object> saveMap) throws SQLException {

		int seq=0;
		int cmnt_seq=sqlSession.getMapper(PlannerDao.class).saveCommPlanner(saveMap);
		seq=sqlSession.getMapper(PlannerDao.class).maxSeq();
		return seq;
	}

	@Override
	public Map<String, Object> commDetail(int cmmmSeq) throws SQLException {
		return sqlSession.getMapper(PlannerDao.class).commDetail(cmmmSeq);
	}

	@Override
	public String deleteComm(String cmmmSeq) throws SQLException {
		
		sqlSession.getMapper(PlannerDao.class).deleteComm(cmmmSeq);
		return "1";
	}

	@Override
	public int commPlannerUpdate(Map<String, Object> saveMap) throws SQLException {
		return sqlSession.getMapper(PlannerDao.class).commPlannerUpdate(saveMap);
	}

	@Override
	public void insertFile(String fileName,String seq) throws SQLException {
		Map<String, String> dmap=new HashMap<String, String>();
		dmap.put("fileName", fileName);
		dmap.put("seq", seq);
		sqlSession.getMapper(PlannerDao.class).insertFile(dmap);
	}
	
	@Override
	public void updateFile(String fileName,String seq) throws SQLException {
		Map<String, String> dmap=new HashMap<String, String>();
		dmap.put("fileName", fileName);
		dmap.put("seq", seq);
		sqlSession.getMapper(PlannerDao.class).updateFile(dmap);
	}

	@Override
	public void plannerReply(CommunityVo bean) {
		// TODO Auto-generated method stub
		bean.setR_regi_date(new Timestamp(System.currentTimeMillis()));
		bean.setR_modi_date(new Timestamp(System.currentTimeMillis()));
		sqlSession.getMapper(PlannerDao.class).plannerReply(bean);
	}

	@Override
	public void addPoint(String userid) {
		// TODO Auto-generated method stub
		sqlSession.getMapper(PlannerDao.class).addPoint(userid);
	}

	@Override
	public void addRePoint(String userid) {
		// TODO Auto-generated method stub
		sqlSession.getMapper(PlannerDao.class).addRePoint(userid);
		
	}

	@Override
	public int totalPoint(String userid) {
		return sqlSession.getMapper(PlannerDao.class).totalPoint(userid);
	}

	@Override
	public int memL(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(PlannerDao.class).memberLevel(userid);
	}

	@Override
	public void LevUP(String userid) {
		// TODO Auto-generated method stub
		sqlSession.getMapper(PlannerDao.class).LevelUp(userid);
	}

}
