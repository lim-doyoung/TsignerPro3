package com.bit.tsigner.service;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.tsigner.model.CommunityDao;
import com.bit.tsigner.model.SearchDao;
import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.Criteria;
import com.bit.tsigner.model.entity.SearchVo;

@Service
public class CommunityServiceImpl implements CommunityService{

   @Inject
   SqlSession sqlsession;
   @Override
   public void list(Model model,int start,String keyword,String option) throws SQLException {
      // TODO Auto-generated method stub
//      model.addAttribute(page);
      System.out.println("service:"+model);
      Map<String,Object> map=new HashMap<String,Object>();
      map.put("start",start-1);
      map.put("option",option);
      map.put("keyword",keyword);
      model.addAttribute("alist",sqlsession.getMapper(CommunityDao.class).selectAll(map));
      System.out.println(model);
   }
   
   @Override
   public int bbsCount() throws SQLException {
      // TODO Auto-generated method stub
      return sqlsession.getMapper(CommunityDao.class).bbsCount();
   }
   

   @Override
   public void add(CommunityVo bean) throws SQLException {
      // TODO Auto-generated method stub
      bean.setCmnt_seq(bean.getCmnt_seq());
      bean.setCmnt_title(bean.getCmnt_title());
      bean.setCmnt_content(bean.getCmnt_content());
      bean.setCmnt_writer_id(bean.getCmnt_writer_id());
      bean.setCmnt_filename(bean.getCmnt_filename());
      bean.setCmnt_file_path2(bean.getCmnt_file_path2());
      bean.setRegi_date(new Timestamp(System.currentTimeMillis()));
      bean.setModi_date(new Timestamp(System.currentTimeMillis()));
      sqlsession.getMapper(CommunityDao.class).insertOne(bean);
      System.out.println("add:"+bean);
   }

   @Override
   public CommunityVo detail(int cmnt_seq) throws SQLException {
      return (CommunityVo) sqlsession.getMapper(CommunityDao.class).selectOne(cmnt_seq);
   }
   
   @Override
   public List<CommunityVo> BbsReplyList(int cmnt_seq) throws SQLException {
   	// TODO Auto-generated method stub
//	   addAttribute("replyList",sqlsession.getMapper(CommunityDao.class).togetherReply(cmnt_seq));
   	return sqlsession.getMapper(CommunityDao.class).togetherReply(cmnt_seq);
   }
   
//   @Override
//   public CommunityVo bbsDetail(Model model, int cmnt_seq) throws SQLException {
//      // TODO Auto-generated method stub
//      model.addAttribute("bean", sqlsession.getMapper(CommunityDao.class).bbsDetail(cmnt_seq));
//      return null;
//   }

   public void detailCnt(int cmnt_seq) throws SQLException {
      sqlsession.getMapper(CommunityDao.class).selectOneCnt(cmnt_seq);
   }

   @Override
   public void delete(int cmnt_seq) throws SQLException {
      sqlsession.getMapper(CommunityDao.class).deleteOne(cmnt_seq);
   }

   @Override
   public void update(CommunityVo bean,int cmnt_seq) throws SQLException {
      // TODO Auto-generated method stub
      bean.setCmnt_seq(bean.getCmnt_seq());
      bean.setCmnt_title(bean.getCmnt_title());
      bean.setCmnt_content(bean.getCmnt_content());
      bean.setCmnt_writer_id(bean.getCmnt_content());
      bean.setModi_date(new Timestamp(System.currentTimeMillis()));
      System.out.println("update"+bean.toString());
      sqlsession.getMapper(CommunityDao.class).editOne(bean);
   }
   @Override
   public void TogetherAdd(CommunityVo bean) throws SQLException {
      bean.setCmnt_seq(bean.getCmnt_seq());
      bean.setCmnt_title(bean.getCmnt_title());
      bean.setCmnt_content(bean.getCmnt_content());
      bean.setCmnt_writer_id(bean.getCmnt_writer_id());
      bean.setRecru_per(bean.getRecru_per());
      bean.setTotal_per(bean.getTotal_per());
      bean.setHash_tag(bean.getHash_tag());
      bean.setTogether_date(bean.getTogether_date());
      bean.setCmnt_writer_id(bean.getCmnt_writer_id());
      bean.setCmnt_filename(bean.getCmnt_filename());
      bean.setCmnt_file_path3(bean.getCmnt_file_path3());
      bean.setRegi_date(new Timestamp(System.currentTimeMillis()));
      bean.setModi_date(new Timestamp(System.currentTimeMillis()));
      sqlsession.getMapper(CommunityDao.class).togetherInsertOne(bean);
      System.out.println("add:"+bean);
      
   }

   @Override
   public void TogetherList(Model model,int start,String option,String startD,String endD) throws SQLException {
      // TODO Auto-generated method stub
      System.out.println("service:"+model);
      Map<String, Object> map=new HashMap<String, Object>();
      map.put("option", option);
      map.put("start", start-1);
      map.put("startD", startD);
      map.put("endD", endD);
      model.addAttribute("togetherAlist",sqlsession.getMapper(CommunityDao.class).togetherSelectAll(map));
   }
   @Override
   public void TogetherDetail(Model model, int cmnt_seq) throws SQLException {
      // TODO Auto-generated method stub
      System.out.println("togetherDetail:"+model);
      model.addAttribute("bean", sqlsession.getMapper(CommunityDao.class).togetherSelectOne(cmnt_seq));
   }
   @Override
   public void TogetherDetailCnt(int cmnt_seq) throws SQLException {
      sqlsession.getMapper(CommunityDao.class).togetherSelectOneCnt(cmnt_seq);
   }
   @Override
   public void TogetherDelete(int cmnt_seq) throws SQLException {
      sqlsession.getMapper(CommunityDao.class).togetherDeleteOne(cmnt_seq);
   }

   @Override
   public void TogetherReplyAdd(CommunityVo bean) throws SQLException {
      bean.setCmnt_seq(bean.getCmnt_seq());
      bean.setReply_seq(bean.getReply_seq());
      bean.setReply_id(bean.getReply_id());
      bean.setReply_content(bean.getReply_content());
      bean.setR_regi_date(new Timestamp(System.currentTimeMillis()));
      bean.setR_modi_date(new Timestamp(System.currentTimeMillis()));
      sqlsession.getMapper(CommunityDao.class).togetherReplyAdd(bean);
      // TODO Auto-generated method stub
      
   }
   
   @Override
	public void togetherUpdate(CommunityVo bean) {
		// TODO Auto-generated method stub
	   bean.setR_modi_date(new Timestamp(System.currentTimeMillis()));
	   sqlsession.getMapper(CommunityDao.class).togetherUpdate(bean);
	}
   
   @Override
   public void TogetherReplyList(Model model, int cmnt_seq) throws SQLException {
      // TODO Auto-generated method stub
      model.addAttribute("replyList",sqlsession.getMapper(CommunityDao.class).togetherReply(cmnt_seq));
   }

   @Override
   public void TogetherReplyDelete(int reply_seq) throws SQLException {
      // TODO Auto-generated method stub
      sqlsession.getMapper(CommunityDao.class).togetherReplyDelete(reply_seq);
   }
   @Override
   public void TogetherAssignmentAdd(CommunityVo bean) {
      bean.setRegi_date(new Timestamp(System.currentTimeMillis()));
      bean.setModi_date(new Timestamp(System.currentTimeMillis()));
      sqlsession.getMapper(CommunityDao.class).togetherAssignmentAdd(bean);
   }

   @Override
   public CommunityVo idCheck(CommunityVo bean) {
      return sqlsession.getMapper(CommunityDao.class).AssignmentIdcheck(bean);
   }

   @Override
   public void TogetherListSearch(Model model, String keyword) throws SQLException {
      // TODO Auto-generated method stub
      model.addAttribute("togetherAlist",sqlsession.getMapper(CommunityDao.class).togetherSelectAllSearch(keyword));
   }
   
   @Override
   public int togetherCount() {
      // TODO Auto-generated method stub
      return sqlsession.getMapper(CommunityDao.class).togetherCount();
   }
   
   @Override
   public void TogetherListUp(Model model) {
      model.addAttribute("togetherAlistUp",sqlsession.getMapper(CommunityDao.class).togetherSelectAllUp());
   }
   
   @Override
   public void OutOfDateTogether() {
      sqlsession.getMapper(CommunityDao.class).OutofDateDelete();
   }
   
   @Override
   public void TogetherCandidate(Model model, int cmnt_seq) throws SQLException {
      // TODO Auto-generated method stub
      model.addAttribute("candidateList", sqlsession.getMapper(CommunityDao.class).candidateList(cmnt_seq));
      
   }
   
   @Override
   public void TogetherapprovalList(Model model, int cmnt_seq) throws SQLException {
      // TODO Auto-generated method stub
      model.addAttribute("approvalList", sqlsession.getMapper(CommunityDao.class).approvalList(cmnt_seq));
   }
   
   @Override
   public void approvalUpdate(CommunityVo bean) {
      // TODO Auto-generated method stub
      sqlsession.getMapper(CommunityDao.class).approvalUpdate(bean);
   }
   
   @Override
   public void defusalUpdate(CommunityVo bean) {
      // TODO Auto-generated method stub
      sqlsession.getMapper(CommunityDao.class).defusalUpdate(bean);
      sqlsession.getMapper(CommunityDao.class).cancleUpdate(bean);
   }
   
   @Override
   public void togetherDetailUpdate(CommunityVo bean) {
      // TODO Auto-generated method stub
      sqlsession.getMapper(CommunityDao.class).togetherDetailUpdate(bean);
   }
   
   
   @Override
      public void reviewAdd(CommunityVo bean) throws SQLException {
         // TODO Auto-generated method stub
         bean.setCmnt_seq(bean.getCmnt_seq());
         bean.setRegi_date(new Timestamp(System.currentTimeMillis()));
         bean.setModi_date(new Timestamp(System.currentTimeMillis()));
         sqlsession.getMapper(CommunityDao.class).reviewAdd(bean);
         System.out.println("serviceimp"+bean);
      }
   
      @Override
      public void reviewList(Model model,int start, String option, String keyword) throws SQLException{
         // TODO Auto-generated method stub
         Map<String, Object> map=new HashMap<String, Object>();
         map.put("start", start-1);
         map.put("option", option);
         map.put("keyword", keyword);
         model.addAttribute("reviewList",sqlsession.getMapper(CommunityDao.class).selectReviewAll(map));
      }

   @Override
   public void ReviewDetail(Model model, int cmnt_seq) throws SQLException{
      // TODO Auto-generated method stub
      model.addAttribute("bean", sqlsession.getMapper(CommunityDao.class).selectReviewOne(cmnt_seq));
   }

   @Override
   public void ReviewDetailCnt(int cmnt_seq) throws SQLException{
      // TODO Auto-generated method stub
      sqlsession.getMapper(CommunityDao.class).ReviewDetailCnt(cmnt_seq);
   }

   @Override
   public void ReviewReplyAdd(CommunityVo bean) throws SQLException{
      // TODO Auto-generated method stub
      bean.setR_regi_date(new Timestamp(System.currentTimeMillis()));
       bean.setR_modi_date(new Timestamp(System.currentTimeMillis()));
      sqlsession.getMapper(CommunityDao.class).ReviewReply(bean);
   }

   @Override
   public void ReviewReplyList(Model model, int cmnt_seq) throws SQLException{
      // TODO Auto-generated method stub
      model.addAttribute("replyList",sqlsession.getMapper(CommunityDao.class).reviewReply(cmnt_seq));
   }

   @Override
   public void ReviewDelete(int cmnt_seq) throws SQLException {
      // TODO Auto-generated method stub
      sqlsession.getMapper(CommunityDao.class).reviewDeleteOne(cmnt_seq);
   }

   @Override
   public void ReviewUpdate(CommunityVo bean) throws SQLException {
      // TODO Auto-generated method stub
      bean.setModi_date(new Timestamp(System.currentTimeMillis()));
      sqlsession.getMapper(CommunityDao.class).reviewUpdateOne(bean);
   }

   @Override
   public int reviewCount() throws SQLException {
      // TODO Auto-generated method stub
      return sqlsession.getMapper(CommunityDao.class).reviewCount();
   }

   @Override
   public void reviewLike(int cmnt_seq,String recod_id) throws SQLException {
      // TODO Auto-generated method stub
      Map<String, Object> map=new HashMap<String, Object>();
      map.put("cmnt_seq", cmnt_seq);
      map.put("userid", recod_id);
      sqlsession.getMapper(CommunityDao.class).reviewLike(map);
   }

   @Override
   public String searchId(int cmnt_seq,String userId) throws SQLException {
      // TODO Auto-generated method stub
      Map<String, Object> map=new HashMap<String, Object>();
      map.put("cmnt_seq", cmnt_seq);
      map.put("userid", userId);
      return sqlsession.getMapper(CommunityDao.class).searchId(map);
   }

   @Override
   public String searchId(int cmnt_seq) throws SQLException {
      // TODO Auto-generated method stub
      return sqlsession.getMapper(CommunityDao.class).searchCk(cmnt_seq);
   }

   @Override
   public void bestList(Model model) throws SQLException {
      // TODO Auto-generated method stub
      model.addAttribute("bestList", sqlsession.getMapper(CommunityDao.class).bestList());
      System.out.println(model);
   }

   @Override
   public void numOne(Model model) throws SQLException {
      // TODO Auto-generated method stub
      model.addAttribute("numOne", sqlsession.getMapper(CommunityDao.class).numOne());
   }

   @Override
   public void notice(Model model) throws SQLException {
      // TODO Auto-generated method stub
      model.addAttribute("notice", sqlsession.getMapper(CommunityDao.class).notice());
   }

   
	@Override
	public void searchTest(SearchVo bean) {
		// TODO Auto-generated method stub
		sqlsession.getMapper(SearchDao.class).searchTest(bean);
	}

	@Override
	public void OutofKeyword() {
		// TODO Auto-generated method stub
		sqlsession.getMapper(SearchDao.class).OutofKeyword();
	}

	@Override
	public void TagList(Model model) {
		// TODO Auto-generated method stub
		model.addAttribute("tagList",sqlsession.getMapper(SearchDao.class).TagList());
	}

	@Override
	public int plannerCount() throws SQLException {
		return sqlsession.getMapper(CommunityDao.class).plannerCount();
	}

	@Override
	public void plannerList(Model model, String keyword, String option, int start) throws SQLException {
		 Map<String, Object> map=new HashMap<String, Object>();
         map.put("start", start-1);
         map.put("option", option);
         map.put("keyword", keyword);
		model.addAttribute("plannerList", sqlsession.getMapper(CommunityDao.class).plannerList(map));
	}

	
	
//qna 
	@Override
	public void qnaAdd(CommunityVo bean) throws SQLException {
		// TODO Auto-generated method stub
		 bean.setCmnt_seq(bean.getCmnt_seq());
	      bean.setCmnt_title(bean.getCmnt_title());
	      bean.setCmnt_content(bean.getCmnt_content());
	      bean.setCmnt_writer_id(bean.getCmnt_writer_id());
	      bean.setCmnt_filename(bean.getCmnt_filename());
	      bean.setCmnt_file_path2(bean.getCmnt_file_path2());
	      bean.setRegi_date(new Timestamp(System.currentTimeMillis()));
	      bean.setModi_date(new Timestamp(System.currentTimeMillis()));
	      sqlsession.getMapper(CommunityDao.class).insertQnaOne(bean);
	      System.out.println("add:"+bean);
	}

	@Override
	public int QnaCount() throws SQLException {
		// TODO Auto-generated method stub
		 return sqlsession.getMapper(CommunityDao.class).QnaCount();
	}

	@Override
	public void qnaList(Model model, int start,String keyword,String option) throws SQLException {
		 System.out.println("service:"+model);
	      Map<String,Object> map=new HashMap<String,Object>();
	      map.put("start",start-1);
	      map.put("keyword",keyword);
	      map.put("option",option);
	      model.addAttribute("alist",sqlsession.getMapper(CommunityDao.class).selectQnaAll(map));
	      System.out.println(model);
		
	}

	@Override
	public CommunityVo qnaDetail(int cmnt_seq) throws SQLException {
		// TODO Auto-generated method stub
		return (CommunityVo) sqlsession.getMapper(CommunityDao.class).selectQnaOne(cmnt_seq);
	}

	@Override
	public void qnaDetailCnt(int cmnt_seq) {
		sqlsession.getMapper(CommunityDao.class).selectOneQnaCnt(cmnt_seq);
	}

	@Override
	public List<CommunityVo> qnaReplyList(int cmnt_seq) throws SQLException {
		// TODO Auto-generated method stub
		return sqlsession.getMapper(CommunityDao.class).togetherReply(cmnt_seq);
	}

	@Override
	public void qnaDelete(int cmnt_seq) {
		// TODO Auto-generated method stub
		sqlsession.getMapper(CommunityDao.class).qnaDeleteOne(cmnt_seq);
	}

	@Override
	public void updateQna(CommunityVo bean, int cmnt_seq) throws SQLException {
		// TODO Auto-generated method stub
		bean.setCmnt_seq(bean.getCmnt_seq());
		bean.setCmnt_title(bean.getCmnt_title());
		bean.setCmnt_content(bean.getCmnt_content());
		bean.setCmnt_writer_id(bean.getCmnt_content());
		bean.setModi_date(new Timestamp(System.currentTimeMillis()));
		System.out.println("update"+bean.toString());
		sqlsession.getMapper(CommunityDao.class).editQnaOne(bean);
	}

	@Override
	public void ReReplyAdd(CommunityVo bean) {
		// TODO Auto-generated method stub
		bean.setRe_modi_date(new Timestamp(System.currentTimeMillis()));
		System.out.println(bean);
		sqlsession.getMapper(CommunityDao.class).addReReply(bean);
	}

	@Override
	public List<CommunityVo> ReReplyList(Model model, int reply_seq) {
		return sqlsession.getMapper(CommunityDao.class).reReplyList(reply_seq);
	}

	@Override
	public int ReReplyListCnt(int reply_seq) {
		return sqlsession.getMapper(CommunityDao.class).replyCnt(reply_seq);
		
	}

	@Override
	public void ReReplyDelete(int re_reply_seq) {
		// TODO Auto-generated method stub
		sqlsession.getMapper(CommunityDao.class).reReplyDelete(re_reply_seq);
	}
	
	@Override
	public void addPoint(String userid) {
		// TODO Auto-generated method stub
		sqlsession.getMapper(CommunityDao.class).addPoint(userid);
	}

	@Override
	public void addRePoint(String userid) {
		// TODO Auto-generated method stub
		sqlsession.getMapper(CommunityDao.class).addRePoint(userid);
		
	}

	@Override
	public int totalPoint(String userid) {
		return sqlsession.getMapper(CommunityDao.class).totalPoint(userid);
	}

	@Override
	public int memL(String userid) {
		// TODO Auto-generated method stub
		return sqlsession.getMapper(CommunityDao.class).memberLevel(userid);
	}

	@Override
	public void LevUP(String userid) {
		// TODO Auto-generated method stub
		sqlsession.getMapper(CommunityDao.class).LevelUp(userid);
	}
	
	@Override
	public int likeId(int cmnt_seq, String userId) {
		 Map<String, Object> map=new HashMap<String, Object>();
		 System.out.println(cmnt_seq);
		 System.out.println(userId);
	      map.put("cmnt_seq", cmnt_seq);
	      map.put("userId", userId);
	      return sqlsession.getMapper(CommunityDao.class).likeId(map);
	}

	@Override
	public void like(int cmnt_seq, String userId) {
		// TODO Auto-generated method stub
		 Map<String, Object> map=new HashMap<String, Object>();
	      map.put("cmnt_seq", cmnt_seq);
	      map.put("userId", userId);
	      sqlsession.getMapper(CommunityDao.class).like(map);
	}

	@Override
	public void likeCancle(int cmnt_seq, String userId) {
		// TODO Auto-generated method stub
		 Map<String, Object> map=new HashMap<String, Object>();
	      map.put("cmnt_seq", cmnt_seq);
	      map.put("userId", userId);
	      sqlsession.getMapper(CommunityDao.class).likeCancle(map);
	}
	
	@Override
	public void plannerBestList(Model model) throws SQLException {
	   // TODO Auto-generated method stub
	   model.addAttribute("bestList", sqlsession.getMapper(CommunityDao.class).plannerBestList());
	   System.out.println(model);
	}

	@Override
	public CommunityVo commContent(int cmmmSeq) throws SQLException {
		System.out.println("서비스임플 : "+cmmmSeq);
		System.out.println("컨텐츠 서비스임플 : "+sqlsession.getMapper(CommunityDao.class).commContent(cmmmSeq));
		return sqlsession.getMapper(CommunityDao.class).commContent(cmmmSeq);
	}

	@Override
	public void plannerCnt(int cmnt_seq) {
		// TODO Auto-generated method stub
		sqlsession.getMapper(CommunityDao.class).plannerCnt(cmnt_seq);
	}

	@Override
	public int TogetherDefaList(Model model, int cmnt_seq) {
		// TODO Auto-generated method stub
		return sqlsession.getMapper(CommunityDao.class).defList(cmnt_seq);
	}

	@Override
	public void defusaldelete(CommunityVo bean) {
		// TODO Auto-generated method stub
		sqlsession.getMapper(CommunityDao.class).defusalUpdate(bean);
	}

	

}