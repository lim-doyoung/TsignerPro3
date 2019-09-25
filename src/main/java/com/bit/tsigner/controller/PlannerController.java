package com.bit.tsigner.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.SendFailedException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.PlannerVo;
import com.bit.tsigner.service.PlannerService;

@Controller
public class PlannerController {
	
	@Inject
	PlannerService plannerService;
	
	/////////////////////////////////플래너 게시물/////////////////////////////////////////
	
	//플래너 게시물 저장
	@PostMapping(value="/planner/add")
	@ResponseBody
	public String saveCommPlanner(@RequestBody String sJson,HttpServletRequest res,HttpServletResponse resp,Model model) throws SQLException {
		
		JSONParser jsonParse=new JSONParser();
		Map<String, Object> saveMap=new HashMap<String, Object>();
		
		try {
			JSONObject jsonObj=(JSONObject)jsonParse.parse(sJson);
			JSONArray planJson = (JSONArray) jsonObj.get("commPlan");
			JSONObject planObject = (JSONObject) planJson.get(0);
			
			saveMap.put("plan_code", planObject.get("plannerCode"));
			saveMap.put("cmnt_title", planObject.get("title"));
			saveMap.put("cmnt_writer_id", planObject.get("userId"));
			saveMap.put("cmnt_content", planObject.get("content"));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("1:"+saveMap.get("cmnt_writer_id"));
		int result=plannerService.saveCommPlanner(saveMap);
		
		//리턴 할 json객체 생성
		JSONObject planObject = new JSONObject();
		JSONArray planArray = new JSONArray();
		JSONObject planInfo = new JSONObject();
		planInfo.put("result", result);
		planArray.add(planInfo);
		planObject.put("result", planArray);
		
		String jsonResult = planObject.toJSONString();
		System.out.println("json result : "+jsonResult);
		
		String userid=(String) saveMap.get("cmnt_writer_id");
		System.out.println(userid);
	      plannerService.addPoint("userid:"+userid);
	      int totalP=plannerService.totalPoint(userid);
	      int memL=plannerService.memL(userid);
	      
	      System.out.println("memL:"+memL);
		  System.out.println("point:"+totalP);
	      
		  if(totalP>=50&&memL==0) {
			  plannerService.LevUP(userid);
	    	  System.out.println("1");
	    	  model.addAttribute("hello","T beignner가 되신것을 축하드립니다!");
	      }else if(totalP>=200&&memL==1) {
	    	  System.out.println("2");
	    	  plannerService.LevUP(userid);
	    	  model.addAttribute("hello","T Expert가 되신것을 축하드립니다!");
	      }else if(totalP>=300&&memL==2) {
	    	  System.out.println("3");
	    	  plannerService.LevUP(userid);
	    	  model.addAttribute("hello","T Guide가 되신것을 축하드립니다!");
	      }else if(totalP>=700&&memL==3) {
	    	  System.out.println("4");
	    	  plannerService.LevUP(userid);
	    	  model.addAttribute("hello","T Signer가 되신것을 축하드립니다!");
	      }else if(totalP>=1500&&memL==4) {
	    	  System.out.println("5");
	    	  plannerService.LevUP(userid);
	    	  model.addAttribute("hello","T Master가 되신것을 축하드립니다!");
	      }
		
		return jsonResult;
	}	
	
	//플래너 게시물 업데이트
	@PostMapping(value="/planner/commUpdate")
	@ResponseBody
	public String commPlannerUpdate(@RequestBody String sJson) throws SQLException {
		
		JSONParser jsonParse=new JSONParser();
		Map<String, Object> saveMap=new HashMap<String, Object>();
		
		try {
			JSONObject jsonObj=(JSONObject)jsonParse.parse(sJson);
			JSONArray planJson = (JSONArray) jsonObj.get("commPlan");
			JSONObject planObject = (JSONObject) planJson.get(0);
			
			saveMap.put("cmnt_seq", planObject.get("cmnt_seq"));
			saveMap.put("plan_code", planObject.get("plannerCode"));
			saveMap.put("cmnt_title", planObject.get("title"));
			saveMap.put("cmnt_writer_id", planObject.get("userId"));
			saveMap.put("cmnt_content", planObject.get("content"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int result=plannerService.commPlannerUpdate(saveMap);
		
		//리턴 할 json객체 생성
		JSONObject planObject = new JSONObject();
		JSONArray planArray = new JSONArray();
		JSONObject planInfo = new JSONObject();
		planInfo.put("result", result);
		planArray.add(planInfo);
		planObject.put("result", planArray);
		
		String jsonResult = planObject.toJSONString();
		System.out.println("json result : "+jsonResult);
		return jsonResult;
	}	
	
	//게시물 디테일 불러오기
	@PostMapping(value="/load/commDetail",produces = "application/text; charset=utf8")
	public @ResponseBody String commDetail(@RequestParam("cmmmSeq") int cmmmSeq,HttpServletRequest req) throws SQLException {
		System.out.println("cmmmSeq : "+cmmmSeq);
		
		Map<String, Object> loadDetail=new HashMap<String, Object>();
		loadDetail=plannerService.commDetail(cmmmSeq);
		System.out.println("디테일 : "+loadDetail);
		
		
		JSONObject planObject = new JSONObject();
		JSONArray planArray = new JSONArray();
		JSONObject planInfo = new JSONObject();
		planInfo.put("cmnt_hits", String.valueOf(loadDetail.get("CMNT_HITS")));
		planInfo.put("reply_total", String.valueOf(loadDetail.get("REPLY_TOTAL")));
		planInfo.put("cmnt_seq", String.valueOf(loadDetail.get("CMNT_SEQ")));
		planInfo.put("cmnt_content", String.valueOf(loadDetail.get("CMNT_CONTENT")));
		planInfo.put("plan_code", String.valueOf(loadDetail.get("PLAN_CODE")));
		planInfo.put("modi_date", String.valueOf(loadDetail.get("MODI_DATE")));
		planInfo.put("cmnt_filename", String.valueOf(loadDetail.get("CMNT_FILENAME")));
		planInfo.put("cmnt_title", String.valueOf(loadDetail.get("CMNT_TITLE")));
		planInfo.put("cmnt_recom", String.valueOf(loadDetail.get("CMNT_RECOM")));
		planInfo.put("cmnt_writer_id", String.valueOf(loadDetail.get("CMNT_WRITER_ID")));
		planInfo.put("cmnt_type", String.valueOf(loadDetail.get("CMNT_TYPE")));
		planInfo.put("regi_date", String.valueOf(loadDetail.get("REGI_DATE")));
		planInfo.put("modi_date", String.valueOf(loadDetail.get("MODI_DATE")));
		planInfo.put("likeCnt", String.valueOf(loadDetail.get("likeCnt")));
		planArray.add(planInfo);
		planObject.put("result", planArray);
		
		String jsonResult = planObject.toJSONString();
		System.out.println("json result : "+jsonResult);
		
		return jsonResult;
		
		
	}
	
	//게시물삭제
	@SuppressWarnings("unchecked")
	@ResponseBody
	@GetMapping(value="/comm/deleteComm")
	public String deleteComm(@RequestParam("cmmmSeq") String cmmmSeq) throws SQLException {
				
		System.out.println("cmmmSeq : "+cmmmSeq);
		String result=plannerService.deleteComm(cmmmSeq);
		
		//리턴 할 json객체 생성
		JSONObject planObject = new JSONObject();
		JSONArray planArray = new JSONArray();
		JSONObject planInfo = new JSONObject();
		planInfo.put("result", result);
		planArray.add(planInfo);
		planObject.put("result", planArray);
		
		String jsonResult = planObject.toJSONString();
		System.out.println("json result : "+jsonResult);
		return jsonResult;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////
	
	//플래너 메인
	@GetMapping(value = "/planner")
	public String planner() {
		
		return "planner/planner";
	}
	
	//플래너 만들기
	@GetMapping(value = "/makeplan")
	public String makeplan() {
		
		return "planner/makeplan";
	}
	
	//플래너불러오기
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/loadPlanner",produces = "application/text; charset=utf8")
	public String loadPlanner(@RequestBody String planCode) throws SQLException, IOException{
		JSONParser jsonParse=new JSONParser();
		String plannerCode="";
		try {
			JSONObject jsonObj=(JSONObject)jsonParse.parse(planCode);
			JSONArray planCodeArray = (JSONArray) jsonObj.get("planCode");
			Map<String, Object> planCodeMap=new HashMap<String, Object>();
			JSONObject planCodeObject = (JSONObject) planCodeArray.get(0);
			planCodeMap.put("planCode", planCodeObject.get("planCode"));
			
			plannerCode=(String) planCodeMap.get("planCode");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		List<List<Map<String, Object>>> loadList = plannerService.loadPlanner(plannerCode);
		
		List<Map<String, Object>> mgtList=loadList.get(0);
		List<Map<String, Object>> mstList=loadList.get(1);
		List<Map<String, Object>> dtlList=loadList.get(2);
		
		
		//JSON 객체만들기
		JSONObject planObject = new JSONObject();
		
		JSONArray planMgtArray = new JSONArray();
		JSONObject planMgt = new JSONObject();
		
		planMgt.put("plan_code",mgtList.get(0).get("PLAN_CODE"));
		planMgt.put("plan_title",mgtList.get(0).get("PLAN_TITLE"));
		planMgt.put("user_id",mgtList.get(0).get("USER_ID"));
		planMgt.put("sns_type",mgtList.get(0).get("SNS_TYPE"));
		planMgt.put("trv_from_date",String.valueOf(mgtList.get(0).get("TRV_FROM_DATE")));
		planMgt.put("trv_to_date",String.valueOf(mgtList.get(0).get("TRV_TO_DATE")));
		planMgt.put("tot_dist",mgtList.get(0).get("TOT_DIST"));
		planMgt.put("tot_amt",mgtList.get(0).get("TOT_AMT"));
		planMgt.put("tot_room_chg",mgtList.get(0).get("TOT_ROOM_CHG"));
		planMgt.put("tot_food_exp",mgtList.get(0).get("TOT_FOOD_EXP"));
		planMgt.put("tot_tran_exp",mgtList.get(0).get("TOT_TRAN_EXP"));
		planMgt.put("regi_date",String.valueOf(mgtList.get(0).get("REGI_DATE")));
		planMgt.put("modi_date",String.valueOf(mgtList.get(0).get("MODI_DATE")));
		planMgtArray.add(planMgt);
		
		planObject.put("planMgt", planMgtArray);
		
		JSONArray planMstArray = new JSONArray();
		
		for(int i=0;i<mstList.size();i++) {
			JSONObject planMst = new JSONObject();
			
			planMst.put("plan_code",mstList.get(i).get("PLAN_CODE"));
			planMst.put("trv_deg",mstList.get(i).get("TRV_DEG"));
			planMst.put("trv_date",String.valueOf(mstList.get(i).get("TRV_DATE")));
			planMst.put("day_dist",mstList.get(i).get("DAY_DIST"));
			planMst.put("day_amt",mstList.get(i).get("DAY_AMT"));
			planMst.put("day_room_chg",mstList.get(i).get("DAY_ROOM_CHG"));
			planMst.put("day_food_exp",mstList.get(i).get("DAY_FOOD_EXP"));
			planMst.put("day_tran_exp",mstList.get(i).get("DAY_TRAN_EXP"));
			planMst.put("regi_date",String.valueOf(mstList.get(i).get("REGI_DATE")));
			planMst.put("modi_date",String.valueOf(mstList.get(i).get("MODI_DATE")));
			
			planMstArray.add(planMst);
		}
		
		planObject.put("planMst", planMstArray);
		
		JSONArray planDtlArray = new JSONArray();
		
		for(int i=0;i<dtlList.size();i++) {
			JSONObject planDtl = new JSONObject();
			
			planDtl.put("plan_code",dtlList.get(i).get("PLAN_CODE"));
			planDtl.put("trv_deg",dtlList.get(i).get("TRV_DEG"));
			planDtl.put("loc_seq",dtlList.get(i).get("LOC_SEQ"));
			planDtl.put("loc_name",dtlList.get(i).get("LOC_NAME"));
			planDtl.put("loc_type",dtlList.get(i).get("LOC_TYPE"));
			planDtl.put("area_code",dtlList.get(i).get("AREA_CODE"));
			planDtl.put("loc_addr",dtlList.get(i).get("LOC_ADDR"));
			planDtl.put("loc_post_code",dtlList.get(i).get("LOC_POST_CODE"));
			planDtl.put("content_id",dtlList.get(i).get("CONTENT_ID"));
			planDtl.put("loc_tel",dtlList.get(i).get("LOC_TEL"));
			planDtl.put("overview",dtlList.get(i).get("OVERVIEW"));
			planDtl.put("position_x",dtlList.get(i).get("POSITION_X"));
			planDtl.put("position_y",dtlList.get(i).get("POSITION_Y"));
			planDtl.put("loc_img_url",dtlList.get(i).get("LOC_IMG_URL"));
			planDtl.put("loc_memo",dtlList.get(i).get("LOC_MEMO"));
			planDtl.put("loc_bdg",dtlList.get(i).get("LOC_BDG"));
			planDtl.put("loc_distance",dtlList.get(i).get("LOC_DISTANCE"));
			planDtl.put("regi_date",String.valueOf(dtlList.get(i).get("REGI_DATE")));
			planDtl.put("modi_date",String.valueOf(dtlList.get(i).get("MODI_DATE")));
			
			planDtlArray.add(planDtl);
		}
		
		planObject.put("planDtl", planDtlArray);
		String jsonResult = planObject.toJSONString();
		
		
		System.out.println(jsonResult);
		
		return jsonResult;
	}
	
	//플래너불러오기
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/comm/loadPlanner",produces = "application/text; charset=utf8")
	public String commLoadPlanner(@RequestBody String planCode) throws SQLException, IOException{
		JSONParser jsonParse=new JSONParser();
		String plannerCode="";
		try {
			JSONObject jsonObj=(JSONObject)jsonParse.parse(planCode);
			JSONArray planCodeArray = (JSONArray) jsonObj.get("planCode");
			Map<String, Object> planCodeMap=new HashMap<String, Object>();
			JSONObject planCodeObject = (JSONObject) planCodeArray.get(0);
			planCodeMap.put("planCode", planCodeObject.get("planCode"));
			
			plannerCode=(String) planCodeMap.get("planCode");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("시퀀스 : "+plannerCode);
		List<List<Map<String, Object>>> loadList = plannerService.commLoadPlanner(plannerCode);
		
		List<Map<String, Object>> mgtList=loadList.get(0);
		List<Map<String, Object>> mstList=loadList.get(1);
		List<Map<String, Object>> dtlList=loadList.get(2);
		
		
		//JSON 객체만들기
		JSONObject planObject = new JSONObject();
		
		JSONArray planMgtArray = new JSONArray();
		JSONObject planMgt = new JSONObject();
		
		planMgt.put("plan_code",mgtList.get(0).get("PLAN_CODE"));
		planMgt.put("plan_title",mgtList.get(0).get("PLAN_TITLE"));
		planMgt.put("user_id",mgtList.get(0).get("USER_ID"));
		planMgt.put("sns_type",mgtList.get(0).get("SNS_TYPE"));
		planMgt.put("trv_from_date",String.valueOf(mgtList.get(0).get("TRV_FROM_DATE")));
		planMgt.put("trv_to_date",String.valueOf(mgtList.get(0).get("TRV_TO_DATE")));
		planMgt.put("tot_dist",mgtList.get(0).get("TOT_DIST"));
		planMgt.put("tot_amt",mgtList.get(0).get("TOT_AMT"));
		planMgt.put("tot_room_chg",mgtList.get(0).get("TOT_ROOM_CHG"));
		planMgt.put("tot_food_exp",mgtList.get(0).get("TOT_FOOD_EXP"));
		planMgt.put("tot_tran_exp",mgtList.get(0).get("TOT_TRAN_EXP"));
		planMgt.put("regi_date",String.valueOf(mgtList.get(0).get("REGI_DATE")));
		planMgt.put("modi_date",String.valueOf(mgtList.get(0).get("MODI_DATE")));
		planMgtArray.add(planMgt);
		
		planObject.put("planMgt", planMgtArray);
		
		JSONArray planMstArray = new JSONArray();
		
		for(int i=0;i<mstList.size();i++) {
			JSONObject planMst = new JSONObject();
			
			planMst.put("plan_code",mstList.get(i).get("PLAN_CODE"));
			planMst.put("trv_deg",mstList.get(i).get("TRV_DEG"));
			planMst.put("trv_date",String.valueOf(mstList.get(i).get("TRV_DATE")));
			planMst.put("day_dist",mstList.get(i).get("DAY_DIST"));
			planMst.put("day_amt",mstList.get(i).get("DAY_AMT"));
			planMst.put("day_room_chg",mstList.get(i).get("DAY_ROOM_CHG"));
			planMst.put("day_food_exp",mstList.get(i).get("DAY_FOOD_EXP"));
			planMst.put("day_tran_exp",mstList.get(i).get("DAY_TRAN_EXP"));
			planMst.put("regi_date",String.valueOf(mstList.get(i).get("REGI_DATE")));
			planMst.put("modi_date",String.valueOf(mstList.get(i).get("MODI_DATE")));
			
			planMstArray.add(planMst);
		}
		
		planObject.put("planMst", planMstArray);
		
		JSONArray planDtlArray = new JSONArray();
		
		for(int i=0;i<dtlList.size();i++) {
			JSONObject planDtl = new JSONObject();
			
			planDtl.put("plan_code",dtlList.get(i).get("PLAN_CODE"));
			planDtl.put("trv_deg",dtlList.get(i).get("TRV_DEG"));
			planDtl.put("loc_seq",dtlList.get(i).get("LOC_SEQ"));
			planDtl.put("loc_name",dtlList.get(i).get("LOC_NAME"));
			planDtl.put("loc_type",dtlList.get(i).get("LOC_TYPE"));
			planDtl.put("area_code",dtlList.get(i).get("AREA_CODE"));
			planDtl.put("loc_addr",dtlList.get(i).get("LOC_ADDR"));
			planDtl.put("loc_post_code",dtlList.get(i).get("LOC_POST_CODE"));
			planDtl.put("content_id",dtlList.get(i).get("CONTENT_ID"));
			planDtl.put("loc_tel",dtlList.get(i).get("LOC_TEL"));
			planDtl.put("overview",dtlList.get(i).get("OVERVIEW"));
			planDtl.put("position_x",dtlList.get(i).get("POSITION_X"));
			planDtl.put("position_y",dtlList.get(i).get("POSITION_Y"));
			planDtl.put("loc_img_url",dtlList.get(i).get("LOC_IMG_URL"));
			planDtl.put("loc_memo",dtlList.get(i).get("LOC_MEMO"));
			planDtl.put("loc_bdg",dtlList.get(i).get("LOC_BDG"));
			planDtl.put("loc_distance",dtlList.get(i).get("LOC_DISTANCE"));
			planDtl.put("regi_date",String.valueOf(dtlList.get(i).get("REGI_DATE")));
			planDtl.put("modi_date",String.valueOf(dtlList.get(i).get("MODI_DATE")));
			
			planDtlArray.add(planDtl);
		}
		
		planObject.put("planDtl", planDtlArray);
		String jsonResult = planObject.toJSONString();
		
		
		System.out.println(jsonResult);
		
		return jsonResult;
	}
	
	//플래너 검색
	@RequestMapping(value = "/searchMap", method = RequestMethod.POST)
	public String searchMap() {
		
		System.out.println("검색");
		
		
		return "planner/makeplan";
	}
	
		//플래너 시,군,구 코드 세팅
		@GetMapping("/search/areacode")
		public @ResponseBody List<PlannerVo> searchCode(@RequestParam("areaCode") String areaCode) throws SQLException {
			System.out.println("areaCode : "+areaCode);
				
			return plannerService.searchCode(areaCode);
		}
		
		//나의 플래너리스트 불러오기
		@GetMapping("/load/loadPlannerList")
		public @ResponseBody List<Map<String, Object>> loadPlannerList(@RequestParam("userId") String userId) throws SQLException {
			System.out.println("userId : "+userId);
			
			return plannerService.loadPlannerList(userId);
		}
		
		//핫플레이스 불러오기
		@GetMapping("/load/hotplace")
		public @ResponseBody List<Map<String, Object>> loadHotplace() throws SQLException {
			
			return plannerService.loadHotplace();
		}
		
		//인기플래너 불러오기
		@GetMapping("/load/purPlanner")
		public @ResponseBody List<Map<String, Object>> purPlanner() throws SQLException {
			
			return plannerService.purPlanner();
		}
		
		//나의플래너 불러오기
		@GetMapping("/load/myPlanner")
		public @ResponseBody List<Map<String, Object>> loadMyPlanner(@RequestParam("userId") String userId) throws SQLException {
			System.out.println("userId : "+userId);
			
			return plannerService.loadMyPlanner(userId);
		}
		
		//데이터 저장
		@SuppressWarnings("unchecked")
		@ResponseBody
		@PostMapping("/save")
		public String saveData(@RequestBody String sJson) throws SQLException {
			
			JSONParser jsonParse=new JSONParser();
			List<Map<String,Object>> mgtList=new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> mstList=new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> dtlList=new ArrayList<Map<String,Object>>();
			try {
				JSONObject jsonObj=(JSONObject)jsonParse.parse(sJson);
				
				JSONArray mgtArray = (JSONArray) jsonObj.get("planMgt");
				JSONArray mstArray=(JSONArray)jsonObj.get("planMst");
				JSONArray dtlArray=(JSONArray)jsonObj.get("planDtl");
				
				//planMgt
				for(int i=0; i < ((JSONArray) mgtArray).size(); i++) {
					Map<String, Object> mgtMap=new HashMap<String, Object>();
					System.out.println("==============================");
					JSONObject mgtObject = (JSONObject) mgtArray.get(i);
					
					mgtMap.put("plan_code", mgtObject.get("plan_code"));
					mgtMap.put("plan_title", mgtObject.get("plan_title"));
					mgtMap.put("user_id", mgtObject.get("user_id"));
					mgtMap.put("tot_amt", mgtObject.get("tot_amt"));
					mgtMap.put("trv_from_date", mgtObject.get("trv_from_date"));
					mgtMap.put("trv_to_date", mgtObject.get("trv_to_date"));
					mgtMap.put("tot_dist", mgtObject.get("tot_dist"));
					mgtMap.put("tot_room_chg", mgtObject.get("tot_room_chg"));
					mgtMap.put("tot_food_exp", mgtObject.get("tot_food_exp"));
					mgtMap.put("tot_tran_exp", mgtObject.get("tot_tran_exp"));
					
					mgtList.add(mgtMap);
					
					System.out.println(mgtObject.get("plan_code"));
					System.out.println(mgtObject.get("user_id"));
					System.out.println(mgtObject.get("tot_amt"));
					System.out.println(mgtObject.get("trv_from_date"));
					System.out.println(mgtObject.get("trv_to_date"));
					System.out.println(mgtObject.get("tot_dist"));
					System.out.println("==============================");
				}
				
				//planMst
				for(int i=0; i < ((JSONArray) mstArray).size(); i++) {
					Map<String, Object> mstMap=new HashMap<String, Object>();
					System.out.println("==============================");
					JSONObject mstObject = (JSONObject) mstArray.get(i);
					
					mstMap.put("plan_code", mstObject.get("plan_code"));
					mstMap.put("trv_deg", mstObject.get("trv_deg"));
					mstMap.put("trv_date", mstObject.get("trv_date"));
					mstMap.put("day_dist", mstObject.get("day_dist"));
					mstMap.put("day_amt", mstObject.get("day_amt"));
					mstMap.put("day_room_chg", mstObject.get("day_room_chg"));
					mstMap.put("day_food_exp", mstObject.get("day_food_exp"));
					mstMap.put("day_tran_exp", mstObject.get("day_tran_exp"));
					
					mstList.add(mstMap);
					
					System.out.println(mstObject.get("plan_code"));
					System.out.println(mstObject.get("trv_deg"));
					System.out.println(mstObject.get("trv_date"));
					System.out.println(mstObject.get("day_dist"));
					System.out.println(mstObject.get("day_amt"));
					System.out.println(mstObject.get("day_room_chg"));
					System.out.println(mstObject.get("day_food_exp"));
					System.out.println(mstObject.get("day_tran_exp"));
					System.out.println("==============================");
				}
				
				//planDtl
				for(int i=0; i < ((JSONArray) dtlArray).size(); i++) {
					Map<String, Object> dtlMap=new HashMap<String, Object>();
					System.out.println("==============================");
					JSONObject dtlObject = (JSONObject) dtlArray.get(i);
					
					String loc_post_code="";
					if("undefined".equals((String)dtlObject.get("loc_post_code"))) {
						loc_post_code="";
					}else {
						loc_post_code=(String) dtlObject.get("loc_post_code");
					}
					
					String loc_img_url="";
					if("undefined".equals((String)dtlObject.get("loc_img_url"))) {
						loc_img_url="";
					}else {
						loc_img_url=(String) dtlObject.get("loc_img_url");
					}
					
					String loc_tel="";
					if("undefined".equals((String)dtlObject.get("loc_tel"))) {
						loc_tel="";
					}else {
						loc_tel=(String) dtlObject.get("loc_tel");
					}
					
					dtlMap.put("loc_name", dtlObject.get("loc_name"));
					dtlMap.put("loc_addr", dtlObject.get("loc_addr"));
					dtlMap.put("loc_type", dtlObject.get("loc_type"));
					dtlMap.put("trv_deg", dtlObject.get("trv_deg"));
					dtlMap.put("loc_post_code", loc_post_code);
					dtlMap.put("position_x", dtlObject.get("position_x"));
					dtlMap.put("position_y", dtlObject.get("position_y"));
					dtlMap.put("loc_img_url", loc_img_url);
					dtlMap.put("content_id", dtlObject.get("content_id"));
					dtlMap.put("loc_tel", loc_tel);
					dtlMap.put("overview", dtlObject.get("overview"));
					dtlMap.put("loc_seq", dtlObject.get("loc_seq"));
					dtlMap.put("loc_bdg", dtlObject.get("loc_bdg"));
					dtlMap.put("loc_memo", dtlObject.get("loc_memo"));
					dtlMap.put("loc_distance", dtlObject.get("loc_distance"));
					
					dtlList.add(dtlMap);
					
					System.out.println(dtlObject.get("loc_name"));
					System.out.println(dtlObject.get("loc_addr"));
					System.out.println(dtlObject.get("loc_type"));
					System.out.println(dtlObject.get("trv_deg"));
					System.out.println(dtlObject.get("loc_post_code"));
					System.out.println(dtlObject.get("position_x"));
					System.out.println(dtlObject.get("position_y"));
					System.out.println(dtlObject.get("loc_img_url"));
					System.out.println(dtlObject.get("content_id"));
					System.out.println(dtlObject.get("loc_tel"));
					System.out.println(dtlObject.get("overview"));
					System.out.println(dtlObject.get("loc_seq"));
					System.out.println(dtlObject.get("loc_bdg"));
					System.out.println(dtlObject.get("loc_memo"));
					System.out.println("==============================");
				}
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			String planCode=plannerService.saveData(mgtList,mstList,dtlList);
			
			//리턴 할 json객체 생성
			JSONObject planObject = new JSONObject();
			JSONArray planArray = new JSONArray();
			JSONObject planInfo = new JSONObject();
			planInfo.put("planCode", planCode);
			planArray.add(planInfo);
			planObject.put("planCode", planArray);
			
			String jsonResult = planObject.toJSONString();
			
			return jsonResult;
		}
		
		//플래너 삭제
		@SuppressWarnings("unchecked")
		@ResponseBody
		@GetMapping("/delete/planner")
		public String deletePlanner(@RequestParam("plannerCode") String plannerCode) throws SQLException {
			System.out.println(plannerCode);
			
			String result=plannerService.deletePlanner(plannerCode);
			
			//리턴 할 json객체 생성
			JSONObject planObject = new JSONObject();
			JSONArray planArray = new JSONArray();
			JSONObject planInfo = new JSONObject();
			planInfo.put("result", result);
			planArray.add(planInfo);
			planObject.put("result", planArray);
			
			String jsonResult = planObject.toJSONString();
			System.out.println("json result : "+jsonResult);
			return jsonResult;
		}
		
		//플래너불러오기
		@SuppressWarnings("unchecked")
		@ResponseBody
		@RequestMapping(value="/loadData",produces = "application/text; charset=utf8")
		public String loadData(@RequestBody String planCode) throws SQLException, IOException{
			JSONParser jsonParse=new JSONParser();
			String plannerCode="";
			try {
				JSONObject jsonObj=(JSONObject)jsonParse.parse(planCode);
				JSONArray planCodeArray = (JSONArray) jsonObj.get("planCode");
				Map<String, Object> planCodeMap=new HashMap<String, Object>();
				JSONObject planCodeObject = (JSONObject) planCodeArray.get(0);
				planCodeMap.put("planCode", planCodeObject.get("planCode"));
				
				plannerCode=(String) planCodeMap.get("planCode");
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			List<List<Map<String, Object>>> loadList = plannerService.loadPlanner(plannerCode);
			
			List<Map<String, Object>> mgtList=loadList.get(0);
			List<Map<String, Object>> mstList=loadList.get(1);
			List<Map<String, Object>> dtlList=loadList.get(2);
			
			
			//JSON 객체만들기
			JSONObject planObject = new JSONObject();
			
			JSONArray planMgtArray = new JSONArray();
			JSONObject planMgt = new JSONObject();
			
			planMgt.put("plan_code",mgtList.get(0).get("PLAN_CODE"));
			planMgt.put("plan_title",mgtList.get(0).get("PLAN_TITLE"));
			planMgt.put("user_id",mgtList.get(0).get("USER_ID"));
			planMgt.put("sns_type",mgtList.get(0).get("SNS_TYPE"));
			planMgt.put("trv_from_date",String.valueOf(mgtList.get(0).get("TRV_FROM_DATE")));
			planMgt.put("trv_to_date",String.valueOf(mgtList.get(0).get("TRV_TO_DATE")));
			planMgt.put("tot_dist",mgtList.get(0).get("TOT_DIST"));
			planMgt.put("tot_amt",mgtList.get(0).get("TOT_AMT"));
			planMgt.put("tot_room_chg",mgtList.get(0).get("TOT_ROOM_CHG"));
			planMgt.put("tot_food_exp",mgtList.get(0).get("TOT_FOOD_EXP"));
			planMgt.put("tot_tran_exp",mgtList.get(0).get("TOT_TRAN_EXP"));
			planMgt.put("regi_date",String.valueOf(mgtList.get(0).get("REGI_DATE")));
			planMgt.put("modi_date",String.valueOf(mgtList.get(0).get("MODI_DATE")));
			planMgtArray.add(planMgt);
			
			planObject.put("planMgt", planMgtArray);
			
			JSONArray planMstArray = new JSONArray();
			
			for(int i=0;i<mstList.size();i++) {
				JSONObject planMst = new JSONObject();
				
				planMst.put("plan_code",mstList.get(i).get("PLAN_CODE"));
				planMst.put("trv_deg",mstList.get(i).get("TRV_DEG"));
				planMst.put("trv_date",String.valueOf(mstList.get(i).get("TRV_DATE")));
				planMst.put("day_dist",mstList.get(i).get("DAY_DIST"));
				planMst.put("day_amt",mstList.get(i).get("DAY_AMT"));
				planMst.put("day_room_chg",mstList.get(i).get("DAY_ROOM_CHG"));
				planMst.put("day_food_exp",mstList.get(i).get("DAY_FOOD_EXP"));
				planMst.put("day_tran_exp",mstList.get(i).get("DAY_TRAN_EXP"));
				planMst.put("regi_date",String.valueOf(mstList.get(i).get("REGI_DATE")));
				planMst.put("modi_date",String.valueOf(mstList.get(i).get("MODI_DATE")));
				
				planMstArray.add(planMst);
			}
			
			planObject.put("planMst", planMstArray);
			
			JSONArray planDtlArray = new JSONArray();
			
			for(int i=0;i<dtlList.size();i++) {
				JSONObject planDtl = new JSONObject();
				
				planDtl.put("plan_code",dtlList.get(i).get("PLAN_CODE"));
				planDtl.put("trv_deg",dtlList.get(i).get("TRV_DEG"));
				planDtl.put("loc_seq",dtlList.get(i).get("LOC_SEQ"));
				planDtl.put("loc_name",dtlList.get(i).get("LOC_NAME"));
				planDtl.put("loc_type",dtlList.get(i).get("LOC_TYPE"));
				planDtl.put("area_code",dtlList.get(i).get("AREA_CODE"));
				planDtl.put("loc_addr",dtlList.get(i).get("LOC_ADDR"));
				planDtl.put("loc_post_code",dtlList.get(i).get("LOC_POST_CODE"));
				planDtl.put("content_id",dtlList.get(i).get("CONTENT_ID"));
				planDtl.put("loc_tel",dtlList.get(i).get("LOC_TEL"));
				planDtl.put("overview",dtlList.get(i).get("OVERVIEW"));
				planDtl.put("position_x",dtlList.get(i).get("POSITION_X"));
				planDtl.put("position_y",dtlList.get(i).get("POSITION_Y"));
				planDtl.put("loc_img_url",dtlList.get(i).get("LOC_IMG_URL"));
				planDtl.put("loc_memo",dtlList.get(i).get("LOC_MEMO"));
				planDtl.put("loc_bdg",dtlList.get(i).get("LOC_BDG"));
				planDtl.put("regi_date",String.valueOf(dtlList.get(i).get("REGI_DATE")));
				planDtl.put("modi_date",String.valueOf(dtlList.get(i).get("MODI_DATE")));
				
				planDtlArray.add(planDtl);
			}
			
			planObject.put("planDtl", planDtlArray);
			String jsonResult = planObject.toJSONString();
			
			
			System.out.println(jsonResult);
			
			return jsonResult;
		}
	
		//파일업로드
		@RequestMapping(value = "/plannerFileUpload",method = RequestMethod.POST)
		   public String plannerFileUpload(@RequestParam("file2")MultipartFile CMNT_FILENAME,HttpServletRequest req) throws SQLException {
			String seq=req.getParameter("cmnt_seq_file");
			System.out.println("업로드 : "+seq);
			System.out.println("파일 : "+CMNT_FILENAME);
			long size=CMNT_FILENAME.getSize();
			 String fileName="";
	            if(size!=0) {
	               String uploadDir="C:\\tsigner\\plannerImg\\";
	               
	               long time=System.currentTimeMillis();
	               String origin=CMNT_FILENAME.getOriginalFilename();
	               String newName=time+origin;
	               System.out.println(newName);
	               fileName=newName;
	               File file=new File(uploadDir+newName);
	         
	               try {
	                  CMNT_FILENAME.transferTo(file);
	               } catch (IllegalStateException e) {
	                  e.printStackTrace();
	               } catch (IOException e) {
	                  e.printStackTrace();
	               }
	            }else {
	               fileName="default.jpg";
	            }
	            System.out.println("파일이름 : "+fileName);
	            plannerService.insertFile(fileName,seq);
	            
	            return "redirect:/planner";
	      }

		
		//파일업데이트
	      @RequestMapping(value = "/plannerFileUpdate",method = RequestMethod.POST)
	      public String plannerFileUpdate(@RequestParam("file2")MultipartFile CMNT_FILENAME,HttpServletRequest req) throws SQLException {
	         String seq=req.getParameter("cmnt_seq_file");
	         long size=CMNT_FILENAME.getSize();
	         String fileName="";
	         if(size!=0) {
	            String uploadDir="C:\\tsigner\\plannerImg\\";
	            
	            long time=System.currentTimeMillis();
	            String origin=CMNT_FILENAME.getOriginalFilename();
	            String newName=time+origin;
	            System.out.println(newName);
	            fileName=newName;
	            File file=new File(uploadDir+newName);
	            
	            try {
	               CMNT_FILENAME.transferTo(file);
	            } catch (IllegalStateException e) {
	               e.printStackTrace();
	            } catch (IOException e) {
	               e.printStackTrace();
	            }
	         }else {
	            fileName="default.jpg";
	         }
	         plannerService.updateFile(fileName,seq);
	         
	         return "redirect:/planner";
	      }
		
		@RequestMapping(value = "/plannerReply",method = RequestMethod.GET)
		public String plannerReply(@ModelAttribute CommunityVo bean,HttpServletRequest res,Model model) {
//			int cmnt_seq=res.getParameter("")
			System.out.println("1:"+bean);
			plannerService.plannerReply(bean);
			
			String userid=res.getParameter("reply_id");
		    plannerService.addRePoint(userid);
		    int totalP=plannerService.totalPoint(userid);
		    int memL=plannerService.memL(userid);
		    
		    System.out.println("memL:"+memL);
		    System.out.println("point:"+totalP);
		    
		    if(totalP>=50&&memL==0) {
		    	plannerService.LevUP(userid);
		    	System.out.println("1");
		    	model.addAttribute("hello","T beignner가 되신것을 축하드립니다!");
		    }else if(totalP>=200&&memL==1) {
		    	System.out.println("2");
		    	plannerService.LevUP(userid);
		    	model.addAttribute("hello","T Expert가 되신것을 축하드립니다!");
		    }else if(totalP>=300&&memL==2) {
		    	System.out.println("3");
		    	plannerService.LevUP(userid);
		    	model.addAttribute("hello","T Guide가 되신것을 축하드립니다!");
		    }else if(totalP>=700&&memL==3) {
		    	System.out.println("4");
		    	plannerService.LevUP(userid);
		    	model.addAttribute("hello","T Signer가 되신것을 축하드립니다!");
		    }else if(totalP>=1500&&memL==4) {
		    	System.out.println("5");
		    	plannerService.LevUP(userid);
		    	model.addAttribute("hello","T Master가 되신것을 축하드립니다!");
		    }
			
			
			return "redirect:/community_plannerDetail?num="+bean.getCmnt_seq();
		}
		
		//플래너 pdf다운
		@GetMapping(value = "/planner/pdfDown")
		public String pdfDown() {
			
			return "planner/pdfDown";
		}
		
		//pdf다운
				@RequestMapping(value = "/planner/download/pdf", method = RequestMethod.GET)
				public ModelAndView downloadPdf(HttpServletRequest request) throws SQLException {
					System.out.println("downloadPdf Controller code : "+request.getParameter("code"));
					
					List<List<Map<String, Object>>> loadList = plannerService.loadPlanner(request.getParameter("code"));
					System.out.println("pdfDown list : "+loadList);
					
				    ModelAndView modelAndView = new ModelAndView("pdfView", "fileName", "planner.pdf");
				    modelAndView.addObject("loadList", loadList);
				    System.out.println("pdf다운로드");
				    return modelAndView;
				}
		
}
