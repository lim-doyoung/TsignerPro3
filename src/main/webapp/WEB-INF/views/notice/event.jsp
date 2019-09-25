<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>
<%@ page import="com.bit.tsigner.model.entity.EventVo, com.bit.tsigner.model.entity.ReplyVo, com.bit.tsigner.model.NoticeDao" %>
<%@ page import= "java.sql.*, java.util.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../template/header.jsp"></jsp:include>
<!-- font -->
<link
   href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
   rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../../../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../../../dist/summernote.css" />
<!-- Font Awesome -->

<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/summernote.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>


<script type="text/javascript">

$(document).ready(function(){
	 $('#eventadd').hide();

	 $(document).ready(function() {
			$('#summernote').summernote({
				 height: 300
			});
		});

   $('#addBtn>button').click(function(){
      $('#eventlist').hide();
      $('#eventadd').show();

   });

   $('#noti').click(function(){
       location.href="/tsigner/notice";

  });

  $('#htu').click(function(){
       location.href="/tsigner/howtouse";

  });

  $('#eve').click(function(){
       location.href="/tsigner/event";

  });

  $('#upd').click(function(){
       location.href="/tsigner/update";

  });
   
   
});

//원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
function list(page){
   location.href="event?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
}
</script>

<style type="text/css">
      #pageNum {
         text-align: center;
      }
      
      #addBtn {	
    
         text-align: right;
		 border: black;	       
      }
      #addBtn>button {	
    		
         border-radius: 4px;
         text-decoration: none;
         background-color: white;
         font-size: 16px;
         
      }
      
      #ser{
      		width: 50px;
         height: 35px;
          border-radius: 8px;
        background-color: #00cc00; 
		
      	 border: none;
        color: white;
        text-align: center;
        text-decoration: none;
       
      }
      #addBtns {
         text-align: center;
      }
       #addBtns>button {
         background-color: white;
      }
      
      #updateBtns {
         text-align: center;
      }
      
      
      #addFile {
        
      }
      .detailList{
         display: block;
         color: #595959;
      }
      .th,.td{
      	text-align: center;
      }
      
      .detailList{
      	text-decoration: none;
      }
      
      .button {
  
  transition-duration: 0.2s;
  cursor: pointer;
}
      
      #noti{
        width: 100%;
         height: 40px;
       border-radius: 8px;
         background:none ; 
       width: 100%;
         
         border: none;
        color: #66b5ff;
       
        text-align: center;
        text-decoration: none;
        display: inline-block;
      }
      #noti:hover{
         width: 100%;
         height: 40px;
       border-radius: 8px;
         background-color:#b3daff; 

       width: 100%;
         
         border: none;
        color: white;
       
        text-align: center;
        text-decoration: none;
        display: inline-block;
        
      }
       #htu{
         width: 100%;
         height: 40px;
       border-radius: 8px;
         background:none ; 
       width: 100%;
         
         border: none;
        color: #66b5ff;
       
        text-align: center;
        text-decoration: none;
        display: inline-block;
        
      }
      #htu:hover{
         width: 100%;
         height: 40px;
       border-radius: 8px;
         background-color:#b3daff; 

       width: 100%;
         
         border: none;
        color: white;
       
        text-align: center;
        text-decoration: none;
        display: inline-block;
        
      }
      
      
       #eve{
         width: 100%;
         height: 40px;
          border-radius: 8px;
        background-color: #80c1ff; 

       width: 100%;
      
         border: none;
        color: white;
       
        text-align: center;
        text-decoration: none;
        display: inline-block;
      }
      
       #upd{
       border-radius: 8px;
         background:none ; 
       width: 100%;
         height: 40px;
         border: none;
        color: #66b5ff;
       text-align: center;
        text-decoration: none;
        display: inline-block;
        
      }
      #upd:hover{
         width: 100%;
         height: 40px;
       border-radius: 8px;
         background-color:#b3daff; 

       width: 100%;
         
         border: none;
        color: white;
       
        text-align: center;
        text-decoration: none;
        display: inline-block;
        
      }
      a:hover {
		text-decoration: none;
	}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
   
   <br>
   <%
      String root = request.getContextPath();
   %>
   <!-- 여기서부터 컨텐츠입니다 -->
   <div class="container">
         <!-- 컨텐츠의 내용을 입력하세요 -->
            <div class="col-md-12"> 
               <div class="page-header">
                  <h1>
                    ${bean.reply_id } Event <small> 이벤트</small>
                  </h1>
               </div>
         
          <!--       <ul class="nav nav-pills nav-justified">
                  <li role="presentation"><a href="<%=root %>/notice">공지사항</a></li>
                  <li role="presentation"><a href="<%=root %>/howtouse">이용방법</a></li>
                  <li role="presentation" class="active"><a href="<%=root %>/event">이벤트</a></li>
                  <li role="presentation"><a href="<%=root %>/update">업데이트</a></li>
                  
               </ul>  -->
               
               <div class="col-md-3">
                     <button class="button" id="noti">공지사항</button>
              </div>
              <div class="col-md-3">
                     <button class="button" id="htu">이용방법</button>
              </div>
              <div class="col-md-3">
                     <button class="button" id=eve>이벤트</button>
              </div>
              <div class="col-md-3">
                     <button class="button" id="upd">업데이트</button>
              </div>
            
              
               
          </div>
 <div class="col-md-12"> 
<div id="eventlist">      <!-- 자유게시판 리스트 시작-->   
               
               <div class="row">
                  <br>
                  <br>
                  
               </div>
               <div class="form-group">
               <form name="form1" method="post" action="event" class="navbar-form navbar-right">
                  <select name="searchOption" class="form-control">
                     <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
                     <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >전체</option>
                     <option value="event_writer_id" <c:out value="${map.searchOption == 'event_writer_id'?'selected':''}"/> >이름</option>
                     <option value="event_content" <c:out value="${map.searchOption == 'event_content'?'selected':''}"/> >내용</option>
                     <option value="event_title" <c:out value="${map.searchOption == 'event_title'?'selected':''}"/> >제목</option>
                  </select>
                  <input name="keyword" value="${map.keyword}" class="form-control">
                  <input id="ser" type="submit" value="조회">
                  
               </form>
          </div>     

               
               <!-- 레코드의 갯수를 출력 -->
               
               <div class="detaillist">
                  <table class="table table-hover">
                      <tr>
                         <th class="th" >글 번호</th>
                         <th class="th">제목</th>
                         <th class="th" >작성자</th>
                         <th class="th">작성일</th>
                         <th class="th">조회수</th>
                      </tr>
                      <%
                      //	 if(listSize > 0){
                      //		 for (var i=0; i<listSize; i++){
                      //			 var groupLayer = list[i].event_group_layer;
                      //			 
                      //			 if(groupLayer > 0){
                      //				 for(var j=0; j<groupLayer; j++){
                      //					 sub +="Re : ";
                      //				 }
                     // 			 }
                      //		 }
                     // 	 }
                      %>
                       <c:forEach items="${map.list }" var="bean"> 
                   
                   <c:choose>
                   <c:when test="${bean.event_fix ==1 }">  <!-- 공지글 일때 -->    
                         <tr style="background-color: #e5f2ff; ">
                            <td class="td" style="width: 6%; "><a style="color:white";  " class="detailList" href="event/detail?idx=${bean.event_seq }"><strong>
							<button style="border-radius: 4px; border: none; background-color: red;" >공지</button>
							</strong></a></td>
                            <td  style="width: 60%; text-decoration: none;"><a style="color:#ff6666";  " class="detailList" href="event/detail?idx=${bean.event_seq }">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <c:if test="${bean.event_group_layer > 0}">
                            	<c:forEach begin="1" end = "${bean.event_group_layer }">
                            		&nbsp;&nbsp;	<!-- 답변 글이면 글 제목앞에 공백 주기 -->
                            	</c:forEach>
                            	Re : 
                            </c:if>
                            <strong>${bean.event_title }</strong>
                          
                            <!-- 첨부파일 있으면  -->
                           		<c:if test="${bean.event_file_path1 != null}">
                               		 <span class="glyphicon glyphicon-paperclip"></span>
                               </c:if>
                            
                            <!-- 댓글이 있으면 게시글 이름 옆에 출력하기 -->
                            	<c:if test="${bean.event_reply_cnt > 0 }">
                            		&nbsp;&nbsp;&nbsp;<span class="badge">${bean.event_reply_cnt }
                            		</span>
                            	</c:if>
                            	
                       
                            </a></td>
                            
                            <td class="td"><a style="color:#ff6666";  " class="detailList" href="event/detail?idx=${bean.event_seq }"><strong>${bean.event_writer_id }</strong></a></td>
                            <td class="td" style="width: 10%; "><a style="color:#ff6666";  " class="detailList" href="event/detail?idx=${bean.event_seq }">
                            	<span id="date"><strong><fmt:formatDate value="${bean.regi_date }" pattern="yyyy-MM-dd"/></strong></span> 
                            </a></td>
                            <td class="td" style="width: 6%; "><a style="color:#ff6666";  " class="detailList" href="event/detail?idx=${bean.event_seq }"><strong>${bean.event_hits }</strong></a></td>
                           
                         </tr>
                  </c:when>
                  <c:otherwise>
                  			<tr>
                            
                            <td class="td" style="width: 6%; "><a class="detailList" href="event/detail?idx=${bean.event_seq }">${bean.event_seq }</a></td>
                            <td  style="width: 60%; text-decoration: none;"><a class="detailList" href="event/detail?idx=${bean.event_seq }">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <c:if test="${bean.event_group_layer > 0}">
                            	<c:forEach begin="1" end = "${bean.event_group_layer }">
                            		&nbsp;&nbsp;	<!-- 답변 글이면 글 제목앞에 공백 주기 -->
                            	</c:forEach>
                            	Re : 
                            </c:if>
                            ${bean.event_title }
                          
                            <!-- 첨부파일 있으면  -->
                           		<c:if test="${bean.event_file_path1 != null}">
                               		 <span class="glyphicon glyphicon-paperclip"></span>
                               </c:if>
                            
                            <!-- 댓글이 있으면 게시글 이름 옆에 출력하기 -->
                            	<c:if test="${bean.event_reply_cnt > 0 }">
                            		&nbsp;&nbsp;&nbsp;<span class="badge">${bean.event_reply_cnt }
                            		</span>
                            	</c:if>
                            	
                       
                            </a></td>
                            
                            <td class="td"><a class="detailList" href="event/detail?idx=${bean.event_seq }">${bean.event_writer_id }
                            													</a></td>
                            <td class="td" style="width: 10%; "><a class="detailList" href="event/detail?idx=${bean.event_seq }">
                            	<span id="date"><fmt:formatDate value="${bean.regi_date }" pattern="yyyy-MM-dd"/></span> 
                            </a></td>
                            <td class="td" style="width: 6%; "><a class="detailList" href="event/detail?idx=${bean.event_seq }">${bean.event_hits }</a></td>
                           
                         </tr>
                  </c:otherwise>
                  </c:choose>
                      </c:forEach>
                      
                  </table>
               </div>
               
            
                  <div id="addBtn">
                     <!-- 관리자 로그인만 글쓰기 버튼 활성화 -->
                     <c:if test="${sessionScope.id == '관리자'}">
                     	
                        <button  type="submit">
                        <span class="glyphicon glyphicon-pencil"></span>
                        	글쓰기</button>
                     </c:if>
                  </div>
               
               <div id="pageNum">
                     <nav aria-label="Page navigation">
                       <ul class="pagination">
                         <li>
                            <!-- 이전 페이지 블록으로 이동 :현재 페이지 블럭이 1보다 크면 Previous 버튼을 화면에 출력-->
                         <c:if test="${map.boardPager.curBlock > 1}">
                            <a href="javascript:list('${map.boardPager.prevPage}')" aria-label="Previous">
                                  <span aria-hidden="true">&laquo;</span>
                              </a>
                         </c:if>
                         </li>
                         </li>
                        
                         <!-- 하나의 블럭에서 반복문 수행 시작페이지 부터 끝 페이지까지  -->
                         <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
                            <!-- 현재페이지면 하이퍼링크 제거 -->
                            <c:choose>
                               <c:when test="${num == map.boardPager.curPage}">
                                  <li><span style="color: red">${num }</span></li>&nbsp;
                               </c:when>
                               <c:otherwise>
                                  
                                  <li><a href="javascript:list('${num}')">${num }</a></li>&nbsp;
                                  
                               </c:otherwise>
                            </c:choose>
                         </c:forEach>
                         
                         <!-- 다음 페이지 블록으로 이동 : 현재 페이지 블록이 전체 페이지 블럭보다 작거나 같으면 이 버튼을 화면에 출력 -->  
                         <li>
                            <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock }">
                               <a href="javascript:list('${map.boardPager.nextPage}')" aria-label="Next">
                               
                                   <span aria-hidden="true">&raquo;</span>
                                   
                                 </a>
                            </c:if>  
                           
                         </li>
                       </ul>
                     </nav>
               
               </div>
</div>      <!-- 자유게시판 리스트 끝-->   

</div>   <!-- col-md-12 끝 -->

 <div class="col-md-12"> 
<div id="eventadd">   <!-- 글쓰기 페이지 -->
         
      <!-- 첨부파일 시작 -->   
      	<br>
		<br>
		<br>
      <form action="event/add" method="post" enctype="multipart/form-data">
         <div id="addFile">
	         <div class="col-md-9"> 
		           <label>
						<input type="checkbox" name="event_fix" value="1">
							    공지 글
					 </label> 
	          </div>  
	          <div class="col-md-3"> 
			         	 <label>
			               <input type="file" name="upload_files" />
			            </label>   
			  </div>
         </div>
      <!-- 첨부파일 끝 -->
      
      <div>
            <input type="text" name="event_title" class="form-control" placeholder="제목을 입력해주세요">
            
         </div>
         <div>
         
          <!--    <textarea id="summernote" class="summernote" name="event_content" rows="" cols="" style="height: 500px;"></textarea>-->
          <textarea id="summernote" class="summernote" name="event_content" rows="" cols="" style="height: 500px;"></textarea>
          
         </div>
         
         <div id="addBtns">
            <button type="submit">등록하기</button>
            <button  type="reset">취소</button>
            
         </div>
      
      </form>
      
      </div>  <!-- 글쓰기 페이지 끝-->
</div>   <!-- col-md-12 끝 -->      
      </div>
            
            
      
   <!-- 여기까지 컨텐츠입니다 -->
   <div class="jumbotron2">
      <%@ include file="../template/footer.jsp"%>
   </div>


</body>
</html>