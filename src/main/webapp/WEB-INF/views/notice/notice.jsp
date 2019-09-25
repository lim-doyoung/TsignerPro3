<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="dist/summernote.css" />
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
   $('#noticeadd').hide();

   $(document).ready(function() {
      $('#summernote').summernote({
          height: 300
      });
   });

   $('#addBtn>button').click(function(){
      $('#noticelist').hide();
      $('#noticeadd').show();

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
   location.href="notice?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
}
</script>

<script>
   $(document).ready(function() {
      
      // 1. 드래그 영역 기본 효과(바로보기)를 제한
      $(".fileDrop").on("dragenter dragover", function(event) {
         event.preventDefault(); // 기본효과를 제한
      });

      
      // 2. 파일 업로드
      // event : jQuery 이벤트, originalEvent : javascript 이벤트
      $(".fileDrop").on("drop", function(event) {
         event.preventDefault(); // 기본효과를 제한
         // 드래그된 파일의 정보
         var files = event.originalEvent.dataTransfer.files;
         // 첫번째 파일
         var file = files[0];
         // 콘솔에서 파일정보 확인
         console.log(file);
         // ajax로 전달할 폼 객체
         var formData = new FormData();
         // 폼 객체에 파일추가, append("변수명", 값)
         formData.append("file", file);
         
         $.ajax({
            type: "post",
            url: "notice/upload",
            data: formData,
            dataType: "text",
            // processData: true=> get방식, false => post방식
            processData: false,
            // contentType: true => application/x-www-form-urlencoded, 기본옵션
            //            false => multipart/form-data, 멀티파트
            contentType: false,
            success: function(data) {
               //alert(data);
               console.log(data);
               var str = "";
               // 이미지파일이면 썸네일 이미지 출력
               if(checkImageType(data)){ 
                  //'target=_blank' : 새페이지에 띄우기
                  str = "<div><a href='notice/upload/displayFile?fileName="+getImageLink(data)+  "'>";
                  str += "<img src='notice/upload/displayFile?fileName="+data+"'></a>";
               // 이미지 파일이 아니면 다운로드
               } else { 
                  str = "<div><a href='notice/upload/displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a>";   
               }
                  str += "<span data-src="+data+">[삭제]</span></div>";
               $(".uploadedList").append(str);
            }
         });
      });
      // 2. 파일 삭제
      // 태그.on("이벤트", "자손태그", "이벤트핸들러")
      $(".uploadedList").on("click", "span", function(event){
         alert("이미지 삭제")
         var that = $(this); // 여기서 this는 클릭한 span태그
         $.ajax({
            url: "notice/upload/deleteFile",
            type: "post",
            // data: "fileName="+$(this).attr("date-src") = {fileName:$(this).attr("data-src")}
            // 태그.attr("속성")
            data: {fileName:$(this).attr("data-src")}, // json방식
            dataType: "text",
            success: function(result){
               if( result == "deleted" ){
                  // 클릭한 span태그가 속한 div를 제거
                  that.parent("div").remove();
               }
            }
         });
      });

      
   
   });
   
   // 원본파일이름
   function getOriginalName(fileName) {
      // 이미지 파일이면
      if(checkImageType(fileName)) {
         return; // 함수종료
      }
      // uuid를 제외한 원래 파일 이름을 리턴
      var idx = fileName.indexOf("_")+1;
      return fileName.substr(idx);
   }
   
   // 이미지파일 링크
   function getImageLink(fileName) {
      // 이미지파일이 아니면
      if(!checkImageType(fileName)) { 
         return; // 함수 종료 
      }
      // 이미지 파일이면
      var front = fileName.substr(0, 27); // 연원일경로 추출
//      var front = fileName.substr(15, 27); // 연원일경로 추출
      var end = fileName.substr(29); // s_ 제거
//      var end = fileName.substr(14); // s_ 제거
      console.log(front);
      console.log(end);
      return front+end;
   }
   
   // 이미지파일 형식 체크
   function checkImageType(fileName) {
      // i : ignore case(대소문자 무관)
      var pattern = /jpg|gif|png|jpeg/i; // 정규표현식
      return fileName.match(pattern); // 규칙이 맞으면 true
   }            

   var DATA;
   $('input:checkbox[name=noti_fix]').each(function(){
		if($(this).is(':checked'))
			DATA += $(this).val();
   });

  
</script>
<!-- #ifr{ 
         color:"red";
      }
      
      .fileDrop{
         width: 100%;
         height: 150px;
         border: 3px gray;
         border-style: dashed; 
      }		 -->

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
      
      iframe {
         width: 100%;
         height:100px;
         border:1px;
         border-style: solid;
         border-color: #D5D5D5;
      }
      
     
      
      .th{
         text-align: center;
      }
      .td{
         text-align: center;
         color: gray;
      }
      
      #noticeMenu{
         
      }
      
      .button {
  
  transition-duration: 0.2s;
  cursor: pointer;
}
      
      #noti{
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
        background:none ; 
       width: 100%;
         
         border: none;
        color: #66b5ff;
       
        text-align: center;
        text-decoration: none;
        display: inline-block;
      }
      #eve:hover{
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
   <% String root = request.getContextPath(); %>
   <!-- 여기서부터 컨텐츠입니다 -->
   <div class="container">
         <!-- 컨텐츠의 내용을 입력하세요 -->
           <div class="col-md-12"> 
               <div class="page-header">
                  <h1>
                   Notice <small> 공지사항</small>
                  </h1>
               </div>
         
      <!--        <ul class="nav nav-pills nav-justified">
                  <li role="presentation" class="active"><a href="<%=root %>/notice">공지사항</a></li>
                  <li role="presentation"><a href="<%=root %>/howtouse">이용방법</a></li>
                <li role="presentation"><a href="<%=root %>/event">이벤트</a></li>
                <li role="presentation"><a href="<%=root %>/update">업데이트</a></li>
               </ul>          -->
      
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
   <div id="noticelist">      <!-- 자유게시판 리스트 시작-->   
                  
                  <div class="row">
                     <br>
                     <br>
                     
                     
                  </div>
                  <div class="form-group">
                  <form name="form1" method="post" action="notice" class="navbar-form navbar-right">
                     <select name="searchOption" class="form-control">
                        <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
                        <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >전체</option>
                        <option value="noti_writer_id" <c:out value="${map.searchOption == 'noti_writer_id'?'selected':''}"/> >이름</option>
                        <option value="noti_content" <c:out value="${map.searchOption == 'noti_content'?'selected':''}"/> >내용</option>
                        <option value="noti_title" <c:out value="${map.searchOption == 'noti_title'?'selected':''}"/> >제목</option>
                     </select>
                     <input name="keyword" value="${map.keyword}" class="form-control">
                     <input id="ser" type="submit" value="조회">
                    
                     <br>
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
                          <c:forEach items="${map.list }" var="bean"> 
                          
                  <c:choose>
                  <c:when test="${bean.noti_fix ==1 }">	<!-- 공지글일 때 -->
                         <tr style="background-color: #e5f2ff;  " >
                        
                          
                               <td class="td" style="width: 6%; "><a style="color: white"; class="detailList" href="notice/detail?idx=${bean.noti_seq }"><strong><button
                               style="border-radius: 4px; border: none; background-color: red;"
                               >공지</button></strong></a></td>
                               <td style="width: 60%; "><a style="color: #ff6666"; class="detailList" href="notice/detail?idx=${bean.noti_seq }">
                              <strong>
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                              ${bean.noti_title }</strong>           
                               <c:if test="${bean.noti_file_path1 != null}">
                               		 <span class="glyphicon glyphicon-paperclip"></span>
                               </c:if>		 
                               		 </a></td>
                               <td class="td"><a style="color: #ff6666"; class="detailList" href="notice/detail?idx=${bean.noti_seq }"><strong>${bean.noti_writer_id }</strong></a></td>
                               <td class="td" style="width: 10%; "><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">
                                     <span style="color: #ff6666"; id="date"><strong><fmt:formatDate value="${bean.regi_date }" pattern="yyyy-MM-dd"/></strong></span> 
                        </a></td>
                               <td class="td" style="width: 6%; "><a style="color: #ff6666"; class="detailList" href="notice/detail?idx=${bean.noti_seq }"><strong>${bean.noti_hits }</strong></a></td>
                            </tr>
                 </c:when>  
                 <c:otherwise>
                 		<tr>
                        	<td class="td" style="width: 6%; "><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">${bean.noti_seq }</a></td>
                               <td style="width: 60%; "><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                               ${bean.noti_title }           
                               <c:if test="${bean.noti_file_path1 != null}">
                               		 <span class="glyphicon glyphicon-paperclip"></span>
                               </c:if>		 
                               		 </a></td>
                               <td class="td"><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">${bean.noti_writer_id }</a></td>
                               <td class="td" style="width: 10%; "><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">
                                     <span id="date"><fmt:formatDate value="${bean.regi_date }" pattern="yyyy-MM-dd"/></span> 
                        </a></td>
                               <td class="td" style="width: 6%; "><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">${bean.noti_hits }</a></td>
                            </tr>
                 </c:otherwise>         
                 </c:choose>  
                         </c:forEach>
                         
                     </table>
                  </div>
                  
               
                     <div id="addBtn">
                        <!-- 관리자 로그인만 글쓰기 버튼 활성화 -->
                         <c:if test="${sessionScope.id == '관리자' }">
                           <button type="submit" >
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

	<div id="noticeadd">   <!-- 글쓰기 페이지 -->
	         
	     
	      <!-- 첨부파일 시작 -->
	        <br>
	      <br>
	      <br>
	     <form action="notice/add" method="post" enctype="multipart/form-data">
	     <!-- target을 지정한 곳으로 form data가 이동  
	     <form id="form1" target="iframePhoto" action="upload" method="post" enctype="multipart/form-data"> -->   
	     	
	         <div id="addFile">
	         	<div class="col-md-9"> 
			         	<label>
						    <input type="checkbox" name="noti_fix" id="noti_fix" value="1" >
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
	            <input type="text" name="noti_title" class="form-control" placeholder="제목을 입력해주세요">
	            
	         </div>
	         <div>
	            <textarea id="summernote" class="summernote" name="noti_content"  rows="" cols="" style="height: 500px;"></textarea>
	         </div>
	         
	 <!-- 파일을 업로드할 영역 
	         <div class="fileDrop">
	            <label id="ifr">첨부파일</label>
	            
	               <div style="text-align: center; color: grey">
	                  <br>
	                  <br>
	                  
	               업로드 할 파일을 드래그 하세요</div>
	            <!-- form data가 이곳으로 이동 <iframe style=" vertical-align: middle;" name="iframePhoto"></iframe>
	            <br>
	            <br>
	         </div> -->
	 <!-- 업로드된 파일 목록 -->
	         <div class="uploadedList"></div>
	         
	         <div id="addBtns">
	            <button type="submit">등록하기</button>
	            <button type="reset">취소</button>
	            
	         </div>
	      
	      </form>
	      
	      </div>  <!-- 글쓰기 페이지 끝-->
</div>   <!-- col-md-12 끝 -->  
	      
	      </div>
        
            <br>
   <!-- 여기까지 컨텐츠입니다 -->
   <div class="jumbotron2">
   
      <%@ include file="../template/footer.jsp"%>
   </div>


</body>
</html>