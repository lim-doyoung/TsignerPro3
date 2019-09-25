<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../template/header.jsp"></jsp:include>
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="css/summernote.css" />
<link rel="stylesheet" type="text/css" href="../../../dist/summernote.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/summernote.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>


<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $(document).ready(function() {
         $('#summernote').summernote({
             height: 300
         });
      });
      PageList();
      
         
      var checkid = $('#checkid').val();
      $('#submitbtn').click(function() {
         if (checkid == null || checkid == "") {
            alert('로그인이 필요합니다');
         } else {
            pageInsert();
            $('#pageNum').hide();
            $('.topBtn').hide();
         }
         ;
      });

      function PageList() {
         $('#bestList').show();
         $('#mainList').show();
         $('.reviewInsert').hide();
         $('#submitbtn').show();
         levUp();
      }

      function pageInsert(){
         $('.reviewInsert').show();
         $('#bestList').hide();
         $('#mainList').hide();
         $('#submitbtn').hide();
      }
      
   })
   function checkForm(){
      var check=$('input:checkbox[name="check"]').is(":checked");
      var contentCh=$('#summernote').val();
      var titleCh=$('#title').val();
      var content=contentCh.trim();
      if(titleCh==""||content==""){
         alert('양식을 작성해주세요');
         return false;
      }
      if(titleCh==""){
         alert('제목을 입력해주세요');
         return false;
      }
      if(content==""){
         alert('내용을 입력해주세요');
         return false;
       }
       if(check==false){
         alert('동의에 체크해주세요');
         return false;
      }
   }
   
   function list(page){
/* 		$('#option option:selected').attr("selected","selected"); */
		var option=$('#option option:selected').val();
		var keyword=$('#keyword').val();
		location.href="community?curPage="+page+"&option="+option+"&keyword"+keyword;
	}
   function levUp(){
		var levUp=$('#levUp').val();
		if(levUp!="null"){
				alert(levUp);
		}
	}
	
</script>
<style type="text/css">
a {
   color: currentColor;
   text-decoration: none;
}

p {
   font-size: 13px;
}

a:hover .thecard {
   box-shadow: 0 10px 50px rgba(0, 0, 0, .6);
}

.my-column {
   background-color: green;
   padding-top: 10px;
   padding-bottom: 10px;
}

.thecard {
   width: 100%;
   margin: 5% auto;
   box-shadow: 0 1px 30px rgba(0, 0, 0, .6);
   display: block;
   background-color: #fff;
   border-radius: 4px;
   transition: 400ms ease;
   height: 200px;
   margin-top: -14px;
}

.card- {
   height: 100px;
}

.card-img img {
   display: block;
   margin: 0px auto;
   width: 100%;
   height: 100px;
   border-radius: 4px 4px 0px 0px;
}

.card-caption {
   position: relative;
   background: #ffffff;
   padding: 15px 5px 10px 10px;
   border-radius: 0px 0px 4px 4px;
}

.card-outmore {
   /*     padding: 5px 5px 5px 5px; */
   border-radius: 0px 0px 4px 4px;
   border-top: 1px solid #e0e0e0;
   background: #efefef;
   color: #222;
   display: inline-table;
   width: 100%;
   box-sizing: border-box;
   transition: 400ms ease;
   height: 20px;
   padding-left: 10px;
}

.card-outmore h5 {
   float: left;
}
/* best1 */
.thecard1 {
   width: 100%;
   margin: 5% auto;
   margin-top:6px;
   box-shadow: 0 1px 30px rgba(0, 0, 0, .6);
   display: block;
   background-color: #fff;
   border-radius: 4px;
   transition: 400ms ease;
   height: 200px;
}

.card-img1 {
   height: 200px;
}

.card-img1 img {
   display: block;
   width: 65%;
   height: 200px;
   border-radius: 4px 0px 0px 4px;
}

.card-caption1 {
   position: relative;
   background: #ffffff;
   padding: 15px 5px 10px 10px;
   border-radius: 0px 0px 4px 4px;
   float: right;
   width:100px;
   margin-right: 10px;
   margin-top: -60%;
  
}

.card-outmore1 {
   /*     padding: 5px 5px 5px 5px; */
   border-radius: 0px 0px 4px 4px;
   border-top: 1px solid #e0e0e0;
   background: #efefef;
   color: #222;
   display: inline-table;
   width: 100%;
   box-sizing: border-box;
   transition: 400ms ease;
   height: 20px;
   padding-left: 10px;
}

.card-outmore1 h5 {
   float: left;
}
/* best end */
span.date {
   font-size: 10px;
}


h5 {
   margin: 0;
}

#outmore-icon {
   border: 1px solid;
   padding: 1px 6px;
   border-radius: 50em;
}

#hashbtn {
   border-radius: 30px;
}

#submitbtn {
   display: inline-block;
   margin-top:20px;
   margin-right:15%;
   float: right;
   
}

.hashtag {
   text-align: center;
}
.reviewInsert {
   width: 50%;
   margin: auto;
}
#bestImg{
	position:relative;
	width: 10%;
	margin: 0 20px -80px 0;
	z-index:2
}
#medal{
	position:relative;
	width: 20%;
	margin-bottom:-20px;
	z-index:2
}
.bestContent{
		white-stext-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 1; /* 라인수 */
		-webkit-box-orient: vertical;
		word-wrap: break-word;
		line-height: 1.2em;
		height: 1.2em;/* 위에서부터 보여주는 높이 */
		overflow: hidden;
	}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
			String root = request.getContextPath();
			String id=request.getParameter("cmnt_writer_id");
		%>
   <br>
   <!-- 하단 nav -->

   <input type="hidden" id="checkid" name="checkid"
      value="${sessionScope.id }">

   <div class="container">

      <div class="page-header">
         <h1>
            Community Center <small>Subtext for header</small>
         </h1>
      </div>

      <ul class="nav nav-pills nav-justified">
         <li role="presentation"><a href="community_planner">플래너</a></li>
         <li role="presentation"><a href="community_bbs">자유게시판</a></li>
         <li role="presentation"><a href="community_together">투게더</a></li>
         <li role="presentation" class="active"><a href="community">여행후기</a></li>
         <li role="presentation"><a href="community_question">질문</a></li>
      </ul>
   </div>

   <!-- 여기서부터 컨텐츠입니다 -->
   <div id="content">
      <div class="container">
         <div class="row">

            <br>
         </div>
         <br>
         <div id="bestList" style="width: 95%; margin: auto;">
            
            <h3 style="font-weight: bold;">Best Review</h3>
            <hr>
            <!--best num1  -->
                  	<div class="bestImg">
                  		<img id="bestImg" alt="" src="imgs/best.png">
                  	</div>
             <div class="col-md-4 offset-0">
                  <div class="thecard1">
                  <c:forEach items="${bestList }" var="best" begin="0" end="0">
                	<a href="community_reviewDetail?num=${best.cmnt_seq }">
                     <div class="card-img1">
                        <img src="<%=root %>/${best.cmnt_file_path4}${best.cmnt_filename}">
                     </div>
                      <div class="card-caption1">
                       <span class="date">
							<c:set var="year" value="${fn:substring(best.modi_date,0,4) }"/>
							<c:set var="day" value="${fn:substring(best.modi_date,8,10) }"/>
							<c:set var="month" value="${fn:substring(best.modi_date,5,7) }"/>
							<c:choose>
								<c:when test="${(month)==01 }">January</c:when>
								<c:when test="${(month)==02 }">February</c:when>
								<c:when test="${(month)==03 }">March</c:when>
								<c:when test="${(month)==04 }">April</c:when>
								<c:when test="${(month)==05 }">May</c:when>
								<c:when test="${(month)==06 }">June</c:when>
								<c:when test="${(month)==07 }">July</c:when>
								<c:when test="${(month)==08 }">August</c:when>
								<c:when test="${(month)==09 }">September</c:when>
								<c:when test="${(month)==10 }">October</c:when>
								<c:when test="${(month)==11 }">November</c:when>
								<c:when test="${(month)==12 }">December</c:when>
							</c:choose>
							${day },${year }
							</span>
                        <h4 style="font-size: 14px; font-weight: bold;">${best.cmnt_title }</h4>
                        <p class="bestContent">${best.cmnt_title }</p>
                        <span class="date" style="float: right; opacity: 0.8;  margin-left: 10px;"> <i class="fas fa-heart"></i> ${best.likeCnt }</span>
                        <span class="date" style="float: right; opacity: 0.8;"> <i class="fas fa-comment"></i> ${best.reply_total }</span>
                        
                     </div> 
                     </a>
                    </c:forEach>
                  </div>
               </div>
            <div><!-- best num1 end -->
             <c:forEach items="${bestList }" var="best" begin="1" end="4">
               <div class="col-md-2 offset-0">
					<c:set value="${best.rn }" var="num"/>
					<c:choose>
	              	 <c:when test="${num eq 2 }"><img id="medal" alt="" src="imgs/gold.png" ></c:when>
	              	 <c:when test="${num eq 3 }"><img id="medal" alt="" src="imgs/silver.png" ></c:when>
	              	 <c:when test="${num eq 4 }"><img id="medal" alt="" src="imgs/bronze.png" ></c:when>
	              	 <c:when test="${num eq 5 }"><img id="medal" alt="" src="imgs/bronze.png" ></c:when>
	               	 </c:choose>
               <a href="community_reviewDetail?num=${best.cmnt_seq }">
                  <div class="thecard">
                     <div class="card-img">
                        <img src="<%=root %>/${best.cmnt_file_path4}${best.cmnt_filename}">
                     </div>
                     <div class="card-caption">
                        <span class="date">
							<c:set var="year" value="${fn:substring(best.modi_date,0,4) }"/>
							<c:set var="day" value="${fn:substring(best.modi_date,8,10) }"/>
							<c:set var="month" value="${fn:substring(best.modi_date,5,7) }"/>
							<c:set var="date" value="${best.modi_date }"/>
							<fmt:formatDate value="${date}" pattern="E" var="yu"/>
							<c:choose>
								<c:when test="${yu=='월' }">Mon,</c:when>
								<c:when test="${yu=='화' }">Tues,</c:when>
								<c:when test="${yu=='수' }">Wed,</c:when>
								<c:when test="${yu=='목' }">Thu,</c:when>
								<c:when test="${yu=='금' }">Fri,</c:when>
								<c:when test="${yu=='토' }">Sat,</c:when>
								<c:when test="${yu=='일' }">Sun,</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${(month)==01 }">January</c:when>
								<c:when test="${(month)==02 }">February</c:when>
								<c:when test="${(month)==03 }">March</c:when>
								<c:when test="${(month)==04 }">April</c:when>
								<c:when test="${(month)==05 }">May</c:when>
								<c:when test="${(month)==06 }">June</c:when>
								<c:when test="${(month)==07 }">July</c:when>
								<c:when test="${(month)==08 }">August</c:when>
								<c:when test="${(month)==09 }">September</c:when>
								<c:when test="${(month)==10 }">October</c:when>
								<c:when test="${(month)==11 }">November</c:when>
								<c:when test="${(month)==12 }">December</c:when>
							</c:choose>
							${day },${year }
							</span>
                        <h4 class="bestContent" style="font-size: 14px; font-weight: bold;">${best.cmnt_title }</h4>
                        <span class="date" style="float: right; opacity: 0.8;  margin-left: 10px;"> <i class="fas fa-heart"></i> ${best.likeCnt }</span>
                        <span class="date" style="float: right; opacity: 0.8;"> <i class="fas fa-comment"></i> ${best.reply_total }</span>
                        
                     </div>
                  </div>
               </a>
               </div>
               </c:forEach>
            </div>
         </div>
         <%String hello=request.getParameter("hello"); %>
		<input id="levUp" type="hidden" value="<%=hello%>">
         <div id="mainList" style="width: 95%; margin: auto;">
            <!-- 검색 -->
            <hr style="font-weight: bold; margin-top: 250px;">
            <h4 style="font-weight: bold; float: left; margin-bottom: -20px; margin-left: 10%;">여행 후기</h4>
            <div id="bbs" style="width: 90%; margin: auto;">
               <div class="search">
                  <form class="navbar-form navbar-right" action="community" method="get">

                     <button type="submit" class="btn btn-default" style="float: right;">Submit</button>
                     <div class="form-group" style="float: right;">
                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search">
                     </div>
                     <div class="form-group"
                        style="width: 100px; height: 20px; margin-right: -4px; float: right;">
                        <select id="option" class="form-control" name="option" style="font-size: 12px;"></br>
                           <!--  onchange="paging();" -->
                           <option value="">선택</option>
                           <option value="modi_date" style="font-size: 12px;"
                              ${param.option eq "modi_date" ? "selected":"" }>작성일</option>
                           <option value="cmnt_hits" style="font-size: 12px;"
                              ${param.option eq "cmnt_hits" ? "selected":"" }>조회수</option>
                           <option value="cmnt_recom" style="font-size: 12px;"
                              ${param.option eq "cmnt_recom" ? "selected":"" }>좋아요</option>
                        </select>
                     </div>
                  </form>
               </div>
               <table class="table table-hover" style="width: 95%; margin: auto;">
                  <tr>
                     <td width="5%">#</td>
                     <td align="left">제목</td>
                     <td width="18%">작성자</td>
                     <td width="18%">작성일</td>
                     <td width="10%">조회수</td>
                  </tr>
                  <c:forEach items="${notice }" var="notice">
					 <td style="background-color:#E6E6E6; ">공지</td>
                     <td style="background-color:#E6E6E6; "><a href="community_reviewDetail?num=${notice.cmnt_seq }">${notice.cmnt_title }</a></td>
                     <td style="background-color:#E6E6E6; ">${notice.cmnt_writer_id }</td>
                     <c:set var="date" value="${notice.modi_date }"/>
                     <td style="background-color:#E6E6E6; ">${fn:substring(date,0,10)}</td>
                     <td style="background-color:#E6E6E6; ">${notice.cmnt_hits }</td>
                  </c:forEach>
                  <c:forEach items="${reviewList }" var="bean">
                  <tr>
                     <td>${bean.cmnt_seq }</td>
                     <td><a href="community_reviewDetail?num=${bean.cmnt_seq }">${bean.cmnt_title }</a></td>
                     <td>${bean.cmnt_writer_id }</td>
                     <c:set var="date" value="${bean.modi_date }"/>
                     <td>${fn:substring(date,0,10)}</td>
                     <td>${bean.cmnt_hits }</td>
                  </tr>
                  </c:forEach>
               </table>
            </div>
         </div>
      </div>
   </div>

   <div class="reviewInsert">
      <h1 style="font-size: 25px; font-weight: bold; text-align: center;">Review</h1>
      <!--                <img id="bgImg" alt="" src="imgs/write.jpg"> <br> <br> -->
      <br>
      <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">T signer</p>
      <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">여행 숙박 공연 정보를 공유 하고</p>
      <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">함께 여행하자</p> 
      <form action="community_review/add" method="post" enctype="multipart/form-data" style="margin-top: 50px;"
         onsubmit="return checkForm();">
         <div class="row">
            <div class="col-sm-12">
               <div class="form-group">
                  <label for="title">Title</label>
                  <input id="title" type="text" class="form-control" placeholder="write title" name="cmnt_title">
               </div>
            </div>
            <input type="hidden" class="form-control" placeholder="write name" name="cmnt_writer_id" value="${sessionScope.id }"
               readonly="readonly">
         </div>
         <div class="form-group">
            <textarea id="summernote" name="cmnt_content" class="summernote"
               rows="" cols="" style="height: 500px;">
                        
             </textarea>
         </div>
         <div class="form-group">
            <label for="title">메인 화면 사진선택</label> <input type="file"
               id="exampleInputFile" name="file2">
         </div>
         <div class="checkbox" style="text-align: center;">
            <label> <input id="check" name="check" type="checkbox"
               value="0"> 개인정보가 유출될 수 있습니다. 동의하시겠습니까?
            </label>
         </div>
         <button type="submit" class="btn btn-default" style="float: right;">Submit</button>
      </form>
   </div>
   
   <button id="submitbtn" class="btn btn-default btn-sm">글쓰기</button>
   <!-- paging -->
			<div id="pageNum" style="text-align: center; margin-top: 50px;">
				<ul class="pagination" style="text-align: center;">
					<c:if test="${test.curBlock>1 }">
						<li><a href="javascript:list('${test.prevPage}')">&laquo;</a></li>
					</c:if>
					
					<c:forEach var="num" begin="${test.blockBegin}" end="${test.blockEnd}">
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
					<c:if test="${test.curBlock <= test.totBlock }">
						<li><a>&raquo;</a></li>
					</c:if>
				</ul>
			</div><!-- paging끝 -->
   
   <div class="jumbotron1"></div>
   <!-- review insert 끝 -->
   </div>
   
   </div>
   <!-- 여기까지 컨텐츠입니다 -->
   
   
   
   <div class="jumbotron2">
      <%@ include file="../template/footer.jsp"%>
   </div>


</body>
</html>