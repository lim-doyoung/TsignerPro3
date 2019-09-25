package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.Criteria;
import com.bit.tsigner.model.entity.TestVo;

public interface CommunityDao {


//   List<CommunityVo> selectAll() throws SQLException;
   List<CommunityVo> selectAll(Map<String, Object> map) throws SQLException;
   void insertOne(CommunityVo bean) throws SQLException;
   CommunityVo selectOne(int num) throws SQLException;
//   CommunityVo bbsDetail(int cmnt_seq);
   void selectOneCnt(int cmnt_seq) throws SQLException;
   void deleteOne(int cmnt_seq) throws SQLException;
   void editOne(CommunityVo bean) throws SQLException;

//   List<CommunityVo> togetherSelectAll(int start,String option) throws SQLException;
   List<CommunityVo> togetherSelectAll(Map<String, Object> map);
   List<CommunityVo> togetherSelectAllUp();
   void togetherInsertOne(CommunityVo bean) throws SQLException;
   CommunityVo togetherSelectOne(int cmnt_seq) throws SQLException;
   void togetherSelectOneCnt(int cmnt_seq) throws SQLException;
   void togetherDeleteOne(int cmnt_seq) throws SQLException;
   void togetherReplyAdd(CommunityVo bean) throws SQLException;
   List<CommunityVo> togetherReply(int cmnt_seq) throws SQLException;
   List<CommunityVo> candidateList(int cmnt_seq) throws SQLException;
   List<CommunityVo> approvalList(int cmnt_seq) throws SQLException;
   void togetherReplyDelete(int reply_seq) throws SQLException;
   void togetherAssignmentAdd(CommunityVo bean);
   CommunityVo AssignmentIdcheck(CommunityVo bean);
   List<CommunityVo> togetherSelectAllSearch(String keyword) throws SQLException;
   int togetherCount();
   void OutofDateDelete();
   void approvalUpdate(CommunityVo bean);
   void defusalUpdate(CommunityVo bean);
   void togetherDetailUpdate(CommunityVo bean);


   List<CommunityVo> selectReviewAll(Map<String, Object> map);
   void reviewAdd(CommunityVo bean) throws SQLException;
   CommunityVo selectReviewOne(int cmnt_seq) throws SQLException;
   void ReviewDetailCnt(int cmnt_seq) throws SQLException;
   void ReviewReply(CommunityVo bean) throws SQLException;
   List<CommunityVo> reviewReply(int cmnt_seq) throws SQLException;
   void reviewDeleteOne(int cmnt_seq) throws SQLException;
   void reviewUpdateOne(CommunityVo bean) throws SQLException;
   int reviewCount() throws SQLException;
   void reviewLike(Map<String, Object> map) throws SQLException;
   String searchId(Map<String, Object> map) throws SQLException;
   String searchCk(int cmnt_seq) throws SQLException;
   List<CommunityVo> bestList() throws SQLException;
   List<CommunityVo> numOne() throws SQLException;
   List<CommunityVo> notice() throws SQLException;
   int bbsCount() throws SQLException;
   
 
   List<CommunityVo> plannerList(Map<String, Object> map) throws SQLException;
   int plannerCount() throws SQLException;
   List<CommunityVo> plannerBestList() throws SQLException;
   CommunityVo commContent(int cmmmSeq) throws SQLException;
   
//qna
   List<CommunityVo> selectQnaAll(Map<String, Object> map) throws SQLException;
   void insertQnaOne(CommunityVo bean) throws SQLException;
   int QnaCount() throws SQLException;
   CommunityVo selectQnaOne(int cmnt_seq);
   void selectOneQnaCnt(int cmnt_seq);
   void qnaDeleteOne(int cmnt_seq);
   void editQnaOne(CommunityVo bean);
   void addReReply(CommunityVo bean);
   List<CommunityVo> reReplyList(int reply_seq);
   int replyCnt(int reply_seq);
   void reReplyDelete(int re_reply_seq);
   
 
   void addPoint(String userid);
   void addRePoint(String userid);
   int totalPoint(String userid);
   int memberLevel(String userid);
   void LevelUp(String userid);
   void cancleUpdate(CommunityVo bean);
   

   int likeId(Map<String, Object> map);
   void like(Map<String, Object> map);
   void likeCancle(Map<String, Object> map);
   void plannerCnt(int cmnt_seq);
   void togetherUpdate(CommunityVo bean);
   int defList(int cmnt_seq);

   
}