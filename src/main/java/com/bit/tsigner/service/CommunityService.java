package com.bit.tsigner.service;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.Criteria;
import com.bit.tsigner.model.entity.SearchVo;

public interface CommunityService {
   void list(Model model, int start, String keyword, String option) throws SQLException;
   void add(CommunityVo bean) throws SQLException;
   CommunityVo detail(int num) throws SQLException;
//   CommunityVo bbsDetail(Model model, int cmnt_seq) throws SQLException;
   void detailCnt(int cmnt_seq) throws SQLException;
   void delete(int cmnt_seq) throws SQLException;
   void update(CommunityVo bean,int cmnt_seq) throws SQLException;
   List<CommunityVo> BbsReplyList(int cmnt_seq) throws SQLException;
   
   void TogetherList(Model model, int start,String option,String startD,String endD) throws SQLException;
   void TogetherListUp(Model model);   
   void TogetherAdd(CommunityVo bean) throws SQLException;
   void TogetherDetail(Model model, int cmnt_seq) throws SQLException;
   void togetherUpdate(CommunityVo bean);
   void togetherDetailUpdate(CommunityVo bean);
   void TogetherCandidate(Model model, int cmnt_seq) throws SQLException;
   void TogetherapprovalList(Model model, int cmnt_seq) throws SQLException;
   void TogetherDelete(int cmnt_seq) throws SQLException;
   void TogetherDetailCnt(int cmnt_seq) throws SQLException;
   void TogetherReplyAdd(CommunityVo bean) throws SQLException;
   void TogetherReplyList(Model model, int cmnt_seq) throws SQLException;
   void TogetherReplyDelete(int reply_seq) throws SQLException;
   void TogetherAssignmentAdd(CommunityVo bean);
   CommunityVo idCheck(CommunityVo bean);
   void TogetherListSearch(Model model, String keyword) throws SQLException;
   int togetherCount();
   void OutOfDateTogether();
   void approvalUpdate(CommunityVo bean);
   void defusalUpdate(CommunityVo bean);
   
   void reviewList(Model model, int start, String option, String keyword) throws SQLException;
   void reviewAdd(CommunityVo bean) throws SQLException;
   void ReviewDetail(Model model, int cmnt_seq) throws SQLException;
   void ReviewDetailCnt(int cmnt_seq) throws SQLException;
   void ReviewReplyAdd(CommunityVo bean) throws SQLException;
   void ReviewReplyList(Model model, int cmnt_seq) throws SQLException;
   void ReviewDelete(int cmnt_seq) throws SQLException;
   void ReviewUpdate(CommunityVo bean) throws SQLException;
   int reviewCount() throws SQLException;
   void reviewLike(int cmnt_seq, String recod_id) throws SQLException;
   String searchId(int cmnt_seq, String userId) throws SQLException;
   String searchId(int cmnt_seq) throws SQLException;
   void bestList(Model model) throws SQLException;
   void numOne(Model model) throws SQLException;
   void notice(Model model) throws SQLException;
   int bbsCount() throws SQLException;
   
   void searchTest(SearchVo bean) throws SQLException;
   void OutofKeyword() throws SQLException;
   void TagList(Model model) throws SQLException;
   
   //플래너
   int plannerCount() throws SQLException;
   void plannerList(Model model, String keyword, String option, int start) throws SQLException;
   CommunityVo commContent(int cmnt_seq) throws SQLException;
   void plannerBestList(Model model) throws SQLException;
   
   //qna
   void qnaAdd(CommunityVo bean) throws SQLException;
   int QnaCount() throws SQLException;
   void qnaList(Model model, int start,String keyword,String option) throws SQLException;
   CommunityVo qnaDetail(int cmnt_seq) throws SQLException;
   void qnaDetailCnt(int cmnt_seq);
   List<CommunityVo> qnaReplyList(int cmnt_seq) throws SQLException;
   void qnaDelete(int cmnt_seq) throws SQLException;
   void updateQna(CommunityVo bean, int cmnt_seq) throws SQLException;
   void ReReplyAdd(CommunityVo bean);
   List<CommunityVo> ReReplyList(Model model, int reply_seq);
   int ReReplyListCnt(int reply_seq);
   void ReReplyDelete(int re_reply_seq);
   
   void addPoint(String userid);//30point
   void addRePoint(String userid);//10point
   int totalPoint(String userid);
   int memL(String userid);
   void LevUP(String userid);
   
   int likeId(int cmnt_seq, String userId);
   void like(int cmnt_seq, String userId);
   void likeCancle(int cmnt_seq, String userId);
   void plannerCnt(int cmnt_seq);
   //거절리스트
   int TogetherDefaList(Model model, int cmnt_seq);
   void defusaldelete(CommunityVo bean);
   




}