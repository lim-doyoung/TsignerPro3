<%@page import="org.springframework.web.multipart.MultipartHttpServletRequest"%>
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
		//editor
		/* 		CKEDITOR.replace( 'cmnt_content' ); */
		$(document).ready(function() {
			$('#summernote').summernote({
				 height: 300
			});
		});
		
		
		
		//시작 페이지 실행
		pageList();

		var checkid = $('#checkid').val();
		//login check
		$('#submitbtn').click(function() {
			
			if (checkid == null || checkid == "") {
				alert('로그인이 필요합니다');
			} else {
				$('.togetherInsert').show();
				$('.togetherList').hide();
				$('#pageNum').hide();
				$('.topBtn').hide();
				$('#submitbtn').hide();
			}
			;
		});
		//hash tag 출력
/* 		$('#plusHashTag').click(function(e) {
			e.preventDefault();
			hashTag();
		}); */

	});

	//등업 표시
	function levUp(){
		var levUp=$('#levUp').val();
		if(levUp!="null"){
				alert(levUp);
		}
	}
	//투게더 insert
	function pageInsert() {
		$('.togetherInsert').show();
		$('.togetherList').hide();
		$('#submitbtn').hide();
	};
	//list 출력
	function pageList() {
		$('.togetherList').show();
		$('.togetherInsert').hide();
		$('#submitbtn').show();
		levUp();
	};
	//hashtag 출력
	$(document).on('click','#plusHashTag',function(e) {
		if ($('.plusHash div').length < 3) {
			$('.plusHash').append(
							'<div class="col-sm-2"><input type="text" class="form-control" name="hash_tag" style="float: left;"></div>');
		} else {
			alert('3개 까지만 가능합니다.');
		}
	});
	
	//양식 체크
	function checkForm(){
		var check=$('input:checkbox[name="check"]').is(":checked");
		var titleCh=$('#summernote').val();
		var datecheck=$('#together_date').val();
		//이전날짜로 하면 안되게함
		var nowYear=(new Date().getYear())+1900;
		var nowMonth=(new Date().getMonth())+1;
		var nowDay=new Date().getDate();
		var year=datecheck.substring(0,4);
		var month=datecheck.substring(5,7);
		//당일 동행가능하게
		var day=datecheck.substring(8,10);
		var day1=(Number(day))+1;
		console.log(day);
		console.log(day1);
		if(datecheck==""){
			alert('날짜를 선택해주세요');
			return false;
		}
 		else if(datecheck!=""){
			if(nowYear>=year&&nowMonth>=month&&nowDay>=day1){
				alert('당일 이후의 날짜로 선택해야 합니다.');
				return false;
			}
		} 
		if(check==false){
			alert('동의에 체크해주세요');
			return false;
		}
		if(check==false||datecheck==""){
			alert('양식을 작성해주세요');
			return false;
		}
	}

	function list(page){
		$('#option option:selected').attr("selected","selected");
 		var option=$('#option option:selected').val();
		<%String option=request.getParameter("option");%>
		if(option==null){
			option="modi_date";	
		}
		if(page==null){
			page=1;
		}
		location.href="community_together?curPage="+page+"&option="+option;
	}

	function paging(){
		$('#option option:selected').attr("selected","selected");
		var option=$('#option option:selected').val();
		<% String num1= request.getParameter("curPage");%>
		if(option==null){
			option="modi_date";	
		}
		if(page==null){
			page=1;
		}else{
			var page=<%=num1%>;
		}
		location.href="community_together?curPage="+page+"&option="+option;
	}
	
</script>
<style type="text/css">
span.date {
	font-size: 10px;
}

/* 1 */

/*css 초기화*/
.card {
	height: 320px;
	width: 100%;
	border-radius: 5px;
	display: inline-block;
	margin-top: 30px;
	margin-left: 30px;
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	overflow: hidden;
}
.card1 {
	height: 200px;
	width: 100%;
	border-radius: 5px;
	display: inline-block;
	margin-top: 30px;
	margin-left: 30px;
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	overflow: hidden;
}

.card-header {
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
	-moz-transition: 0.5s; /*파이어폭스*/
	-ms-transition: 0.5s; /*인터넷 익스플로러*/
	-o-transition: 0.5s; /*오페라*/
	transition: 0.5s;
	width: 100%;
	height: 200px;
	border-radius: 4px 4px 0 0;
	background-size: 100% 280px;
	background-repeat: no-repeat;
}
.card-header {
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
	-moz-transition: 0.5s; /*파이어폭스*/
	-ms-transition: 0.5s; /*인터넷 익스플로러*/
	-o-transition: 0.5s; /*오페라*/
	transition: 0.5s;
	width: 100%;
	height: 200px;
	border-radius: 4px 4px 0 0;
	background-size: 100% 280px;
	background-repeat: no-repeat;
}

.card:hover .card-header {
	opacity: 0.8;
	height: 100px;
}

.card1:hover .card-header {
	opacity: 0.8;
	height: 80px;
}

/*모집중  */
.card-header-is_closed {
	background-color: #EF5A31;
	color: #FFF;
	font-weight: bold;
	text-align: center;
	float: right;
	margin: 10px 10px 0 0;
	border-radius: 50%;
	font-weight: bold;
	padding: 10px 10px;
	line-height: 20px;
	height: 50px;
	width: 50px;
}

/* h1 {
	font-size: 22px;
	font-weight: bold;
} */

/* 타이틀 해더 */
.card-body-header {
	margin: 10px 20px 0px 20px;
}

.card-body-description {
	opacity: 0;
	color: #757B82;
	line-height: 25px;
	-webkit-transition: .2s ease-in-out; /*사파리&크롬*/
	-moz-transition: .2s ease-in-out; /*파이어폭스*/
	-ms-transition: .2s ease-in-out; /*익스플로러*/
	-o-transition: .2s ease-in-out; /*오페라*/
	transition: .2s ease-in-out;
	overflow: hidden;
	height: 180px;
	margin: 5px 20px;
	/* ...처리하기 */
	white-stext-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2; /* 라인수 */
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	line-height: 1.2em;
	height: 2.4em;/* 위에서부터 보여주는 높이 */
	overflow: hidden;
}

#titleh4{
	white-stext-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1; /* 라인수 */
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	line-height: 1.2em;
	height: 1.2em;/* 위에서부터 보여주는 높이 */
	overflow: hidden;
}

.card:hover .card-body-description {
	opacity: 1;
	-webkit-transition: .5s ease-in-out;
	-moz-transition: .5s ease-in-out;
	-ms-transition: .5s ease-in-out;
	-o-transition: .5s ease-in-out;
	transition: .5s ease-in-out;
	overflow: scroll;
}

.card-body-hashtag {
	color: #2478FF;
	font-style: italic;
}

.card-body-footer {
	position: absolute;
	margin-top: 15px;
	margin-bottom: 6px;
	bottom: 0;
	width: 314px;
	font-size: 14px;
	color: #9FA5A8;
	padding: 0 15px;
}

.reg_date {
	float: right;
}

#hashbtn {
	border-radius: 30px;
}

#submitbtn {
   display: inline-block;
   margin-bottom: 50px;
   float: right;
}

.hashtag {
	text-align: center;
}

.togetherInsert {
	width: 60%;
	margin: auto;
}

#bgImg {
	width: 100%;
	opacity: 0.5;
	height: 100px;
}
/*투게더 날짜 */
.date1 {
  position: absolute;
  top: 0;
  left: 0;
  background-color: #77d7b9;
  color: #fff;
  padding: 0.8em;
}
.date1 span {
  display: block;
  text-align: center;
}
.date1 .day {
  font-weight: 700;
  font-size: 24px;
  text-shadow: 2px 3px 2px rgba(0, 0, 0, 0.18);
}
.date1 .month {
  text-transform: uppercase;
}
.date1 .month,
.date1 .year {
  font-size: 12px;
}

/* best card css */
a {
  text-decoration: none;
}

.row {
  max-width: 100%;
  margin: 50px auto 0;
}

.card2 {
  float: left;
  width: 100%;
}
.card2 .menu-content {
  margin: 0;
  padding: 0;
  list-style-type: none;
}
.card2 .menu-content::before, .card2 .menu-content::after {
  content: '';
  display: table;
}
.card2 .menu-content::after {
  clear: both;
}
.card2 .menu-content li {
  display: inline-block;
}
.card2 .menu-content a {
  color: #fff;
}
.card2 .menu-content span {
  position: absolute;
  left: 50%;
  top: 0;
  font-size: 10px;
  font-weight: 700;
  font-family: 'Open Sans';
  -webkit-transform: translate(-50%, 0);
          transform: translate(-50%, 0);
}
.card2 .wrapper {
  background-color: #fff;
  min-height: 200px;
  position: relative;
  overflow: hidden;
  box-shadow: 0 19px 38px rgba(0, 0, 0, 0.3), 0 15px 12px rgba(0, 0, 0, 0.2);
/*   background-size: cover;   */
  background-size: contain;  
  

}

.example-1 .wrapper {
}
.card2 .wrapper:hover .data {

  -webkit-transform: translateY(0);
          transform: translateY(0);
}
/* 내용 박스 크기 */
.card2 .data {
  position: absolute;
  bottom: 0;
  width: 100%;
  -webkit-transform: translateY(calc(70px + 1em));
          transform: translateY(calc(70px + 1em));
  transition: -webkit-transform 0.3s;
  transition: transform 0.3s;
  transition: transform 0.3s, -webkit-transform 0.3s;
}

/* 내용 표시 */
.card2 .data .content {
  padding: 1em;
  position: relative;
  z-index: 1;
  
}
.card2 .author {
  font-size: 12px;
  float: left;
}
.card2 .title {
  margin-top: 10px;
}
.card2 .text {
  height: 70px;
  margin: 0;
}
.card2 input[type='checkbox'] {
  display: none;
}
.card2 input[type='checkbox']:checked + .menu-content {
  -webkit-transform: translateY(-60px);
          transform: translateY(-60px);
}

.example-1 .date1 {
  position: absolute;
  top: 0;
  left: 0;
  background-color: #77d7b9;
  color: #fff;
  padding: 0.8em;
}
.example-1 .date1 span {
  display: block;
  text-align: center;
}
.example-1 .date1 .day {
  font-weight: 700;
  font-size: 24px;
  text-shadow: 2px 3px 2px rgba(0, 0, 0, 0.18);
}
.example-1 .date1 .month {
  text-transform: uppercase;
}
.example-1 .date1 .month,
.example-1 .date1 .year {
  font-size: 12px;
}
.example-1 .content {
  background-color: #fff;
  box-shadow: 0 5px 30px 10px rgba(0, 0, 0, 0.3);
}
.example-1 .title a {
  color: gray;
}
.example-1 .menu-button {
  position: absolute;
  z-index: 999;
  top: 16px;
  right: 16px;
  width: 25px;
  text-align: center;
  cursor: pointer;
}
.example-1 .menu-button span {
  width: 5px;
  height: 5px;
  background-color: gray;
  color: gray;
  position: relative;
  display: inline-block;
  border-radius: 50%;
}
.example-1 .menu-button span::after, .example-1 .menu-button span::before {
  content: '';
  display: block;
  width: 5px;
  height: 5px;
  background-color: currentColor;
  position: absolute;
  border-radius: 50%;
}
.example-1 .menu-button span::before {
  left: -10px;
}
.example-1 .menu-button span::after {
  right: -10px;
}
.example-1 .menu-content {
  text-align: center;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  z-index: -1;
  transition: -webkit-transform 0.3s;
  transition: transform 0.3s;
  transition: transform 0.3s, -webkit-transform 0.3s;
  -webkit-transform: translateY(0);
          transform: translateY(0);
}
.example-1 .menu-content li {
  width: 33.333333%;
  float: left;
  background-color: #77d7b9;
  height: 60px;
  position: relative;
}
.example-1 .menu-content a {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  font-size: 24px;
}
.example-1 .menu-content span {
  top: -10px;
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
	<div class="container">

		<div class="page-header">
			<h1>
				Community Center <small>Together</small>
			</h1>
		</div>

		<ul class="nav nav-pills nav-justified">
			<li role="presentation"><a href="community_planner">플래너</a></li>
			<li role="presentation"><a href="community_bbs">자유게시판</a></li>
			<li role="presentation" class="active"><a
				href="community_together">투게더</a></li>
			<li role="presentation"><a href="community">여행후기</a></li>
			<li role="presentation"><a href="community_question">질문</a></li>
		</ul>
	</div>

	<!-- session id check -->
	<input type="hidden" id="checkid" name="checkid" value="${sessionScope.id }">

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="container">
			<div class="row">
				<br>
					<div class="topBtn">
					<form action="community_together">
						<div class="hashtag">
							<c:forEach items="${tagList}" var="tag" begin="0" end="2">
							  <input id="hashbtn" type="submit" name="hash_tag" value="# ${tag.keyword }" class="btn btn-default btn-sm" onclick="">
							</c:forEach><br>
							<c:forEach items="${tagList}" var="tag" begin="2" end="6">
							  <input id="hashbtn" type="submit" name="hash_tag" style="margin-top: 5px;" value="# ${tag.keyword }" class="btn btn-default btn-sm" onclick="">
							</c:forEach>
						</div>
					</form>
					
					</div>
				<br>
				<!-- best 등급 의 동행 list-->
				<div class="togetherList" style="width: 95%; margin: auto;">
					<h3 style="font-weight: bold;">Best tsigner</h3>
					<hr>
					<div style="text-align: center; align-content: center; margin: 0px,auto;">
					<c:forEach items="${togetherAlistUp}" var="bean" begin="0" end="5">
					
						<div class="col-md-2">
						<a href="community_togetherDetail/${bean.cmnt_seq}">
							<div class="example-1 card2">
 						    <div class="wrapper" style=" background: url('<%=root %>/${bean.cmnt_file_path3}${bean.cmnt_filename}'); ">
<!-- 						    <div class="wrapper"> -->
 						      <div class="date1">
						        <span class="day" style="font-size: 10px;">
						        	 <c:set var="month" value="${fn:substring(bean.together_date,5,7) }"/>
									<c:set var="date" value="${bean.together_date }"/>
									<c:set var="day" value="${fn:substring(bean.together_date,8,10) }"/>
									<fmt:formatDate value="${date}" pattern="E" var="yu"/>
						        
						        ${day } , 
<%-- 						    <img alt="" src="<%=root %>/${bean.cmnt_file_path3}${bean.cmnt_filename}')" style="width: 100%;"> --%>
						        <c:choose>
									<c:when test="${month==01 }">Jan</c:when>
									<c:when test="${month==02 }">Feb</c:when>
									<c:when test="${month==03 }">March</c:when>
									<c:when test="${month==04 }">April</c:when>
									<c:when test="${month==05 }">May</c:when>
									<c:when test="${month==06 }">June</c:when>
									<c:when test="${month==07 }">July</c:when>
									<c:when test="${month==08 }">Aug</c:when>
									<c:when test="${month==09 }">Sep</c:when>
									<c:when test="${month==10 }">Oct</c:when>
									<c:when test="${month==11 }">Nov</c:when>
									<c:when test="${month==12 }">Dec</c:when>
								</c:choose> 
						        
						        </span>
						      </div>
						      <div>
						      	<span class="date" style="float: right; margin: 5px 5px 0 0;"><i class="fas fa-heart"></i> ${bean.likeCnt } </span>
						      </div>
						      
						      <div class="data">
						        <div class="content">
						          <span class="author">${bean.cmnt_writer_id }</span><br>
						          <h1 class="title" style="font-size: 10px; text-align: left;">${bean.cmnt_title }</h1>
						          <p class="text" style="font-size: 10px;">${bean.myself }</p>
<!-- 						          <label for="show-menu" class="menu-button"><span></span></label> -->
						        </div>
<!-- 						        <input type="checkbox" id="show-menu" />
						        <ul class="menu-content">
						          <li>
						            <a href="#" class="fa fa-bookmark-o"></a>
						          </li>
						          <li><a href="#" class="fa fa-heart-o"><span>47</span></a></li>
						          <li><a href="#" class="fa fa-comment-o"><span>8</span></a></li>
						        </ul> -->
						      </div>
						    </div>
						  </div>
						  </a>
						</div>
				</c:forEach>
				</div>
				<!-- main list -->
				<%String hello=request.getParameter("hello"); %>
				<input id="levUp" type="hidden" value="<%=hello%>">
				<br>
					<div class="search" style="margin-top:250px; ">
	                  <form class="navbar-form navbar-right" action="community_together">
	                     <button type="submit" class="btn btn-default" style="float: right;">Submit</button>
	                     <div class="form-group" style="float: right;">
	                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search">
	                     </div>
	                     <div class="form-group"
	                        style="width: 100px; height: 20px; margin-right: -4px; float: right;">
	                        <select id="option" class="form-control" name="option" style="font-size: 12px;"></br>
	                           <!--  onchange="paging();" -->
	                            <option value="">선택</option>
	                        	<option value="modi_date" style="font-size: 12px;" ${param.option eq "modi_date" ? "selected":"" }>작성일</option>
								<option value="cmnt_hits" style="font-size: 12px;" ${param.option eq "cmnt_hits" ? "selected":"" }>조회수</option>
								<option value="together_date" style="font-size: 12px;" ${param.option eq "together_date" ? "selected":"" } >마감</option>
	                        </select>
	                     </div>
	                     <div class="form-group" style="float: right; margin-right: 10px;">
	                        <input type="date" id="date" name="startD" class="form-control" placeholder="Search">~
	                        <input type="date" id="date" name="endD" class="form-control" placeholder="Search">
	                     </div>
	                  </form>
	               </div>
	               <h4 style="font-weight: bold; margin-top: 270px;">Together</h4>
				   <hr>
				<div style="text-align: center; width: 95%; align-content: center; margin: 0px,auto;">
						<c:forEach items="${togetherAlist}" var="bean">
		<%-- 					<c:set var="dateForm" value="${bean.modi_date }" />
							<input id="dateDelete" name="dateDelete" type="text" value="${fn:substring(dateForm,0,10) }"> --%>
							<div class="col-md-3">
								<!-- 클릭 시 링크 설정 -->
								<a href="community_togetherDetail/${bean.cmnt_seq}">
									<div class="card">
									 <div class="date1">
									 <c:set var="month" value="${fn:substring(bean.together_date,5,7) }"/>
									<c:set var="date" value="${bean.together_date }"/>
									<c:set var="day" value="${fn:substring(bean.together_date,8,10) }"/>
									<fmt:formatDate value="${date}" pattern="E" var="yu"/>
									 	 <span class="year">
							        	<c:choose>
											<c:when test="${yu=='월' }">Mon</c:when>
											<c:when test="${yu=='화' }">Tues</c:when>
											<c:when test="${yu=='수' }">Wed</c:when>
											<c:when test="${yu=='목' }">Thu</c:when>
											<c:when test="${yu=='금' }">Fri</c:when>
											<c:when test="${yu=='토' }">Sat</c:when>
											<c:when test="${yu=='일' }">Sun</c:when>
										</c:choose>
								        </span>
								        <span class="day">
								        	${day }
								        </span>
								        <span class="month">
								        <c:choose>
											<c:when test="${month==01 }">Jan</c:when>
											<c:when test="${month==02 }">Feb</c:when>
											<c:when test="${month==03 }">March</c:when>
											<c:when test="${month==04 }">April</c:when>
											<c:when test="${month==05 }">May</c:when>
											<c:when test="${month==06 }">June</c:when>
											<c:when test="${month==07 }">July</c:when>
											<c:when test="${month==08 }">Aug</c:when>
											<c:when test="${month==09 }">Sep</c:when>
											<c:when test="${month==10 }">Oct</c:when>
											<c:when test="${month==11 }">Nov</c:when>
											<c:when test="${month==12 }">Dec</c:when>
										</c:choose> 
								        </span>
								       
								      </div>
										<!-- 카드 헤더 -->
										<div class="card-header"
											style="background-image: url('<%=root %>/${bean.cmnt_file_path3}${bean.cmnt_filename}');">
											<c:choose>
												<c:when test="${bean.recru_per eq bean.total_per }">
												<div class="card-header-is_closed" style="background-color: #77d7b9">
														<div style="font-size: 10px; margin-top: -5px;" class="card-header-text">모집완</div>
													<div class="card-header-number">${bean.recru_per}/
														${bean.total_per}</div>
												</div>
												</c:when>
												<c:when test="${bean.recru_per ne bean.total_per }">
												<div class="card-header-is_closed"">
														<div style="font-size: 10px; margin-bottom: -5px;" class="card-header-text">모집중</div>
													<div class="card-header-number">${bean.recru_per}/
														${bean.total_per}</div>
												</div>
												</c:when>
											</c:choose>
										</div>
										<!--  카드 바디 -->
										<div class="card-body">
											<!--  카드 바디 헤더 -->
											<div class="card-body-header">
												<!-- title 글자수 조정-->
												<h4 id="titleh4" style="font-size:16px; font-weight: bold; padding-bottom: -20px;">${bean.cmnt_title }</h4>
												<c:set var="tel" value="${bean.hash_tag }" />
												<c:forEach var="telNum" items="${tel}" varStatus=",">
													<span style="font-size: 12px; class="card-body-hashtag"># ${telNum } &nbsp;</span>
												</c:forEach>
												<br>
												<p style="font-size: 12px;" class="card-body-nickname">작성자: ${bean.cmnt_writer_id }</p>
											</div>
											<p class="card-body-description" style="overflow: hidden;">${bean.cmnt_content }</p>
											<!--  카드 바디 본문 -->
											<!--  카드 바디 푸터 -->
											<div class="card-body-footer">
												<table border="0" style="width: 70%;">
													<tr>
														<c:set var="dateForm" value="${bean.modi_date }" />
														<td style="text-align: left;"><span  class="date">${fn:substring(dateForm,0,10) }</span></td>
														<td style="text-align: right;"><span class="date"><i class="fas fa-heart"></i> ${bean.cmnt_recom } </span></td>
														<td style="text-align: right;"><span class="date"><i class="fas fa-comment"></i> ${bean.reqly_total } 개</span></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- 리스트 끝 -->
				<div class="togetherInsert">
					<h1 style="font-size: 25px; font-weight: bold; text-align: center;">Together</h1>
<!-- 					<img id="bgImg" alt="" src="imgs/write.jpg"> <br> <br> -->
<!-- 					<p style="text-align: center;">T signer</p>
					<p style="text-align: center;">여행 숙박 공연 정보를 공유 하고</p>
					<p style="text-align: center;">함께 여행하자</p> -->
					<form action="community_together/add" method="post"
						enctype="multipart/form-data" style="margin-top: 50px;" onsubmit="return checkForm();" >
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label for="title">Title</label> <input type="text"
										class="form-control" placeholder="write title"
										name="cmnt_title">
								</div>
							</div>
							<input type="hidden" class="form-control"
								placeholder="write name" name="cmnt_writer_id"
								value="${sessionScope.id }" readonly="readonly">
							<!-- 							<div class="form-group">
								<div class="row">
								<div class="col-sm-1"><label for="name">Name</label></div>
								<div class="col-sm-11"> 
								</div>
								</div> 
							</div>-->
							<div class="col-sm-2">
								<div class="form-group">
									<label for="title">Limit Per</label> <select
										class="form-control" name="total_per"></br>
										<%
											for (int i = 2; i <= 8; i++) {
										%>
										<option value="<%=i%>"><%=i%></option>
										<%
											}
										%>
									</select>
								</div>
							</div>
							<div class="col-sm-10">
								<label for="title">Together Date</label> <input type="date"
									class="form-control" placeholder="write title" id="together_date"
									name="together_date">
							</div>
						</div>
						<div class="form-group">
							<textarea id="summernote" name="cmnt_content" class="summernote"
								rows="" cols="" style="height: 500px;">
								
							</textarea>
						</div>
						<div class="row">
						<div class="col-sm-12">
							<label for="title">HashTag</label>
							<div class="plusHash">
								<div id="hashtagForm" class="col-sm-2">
									<input type="text" class="form-control" name="hash_tag"
										style="float: left;">
								</div>
							</div>
							<button type="button" id="plusHashTag" class="btn btn-default btn-xs" style="float: left;">+</button>
						</div>
						</div>



						<div class="form-group">
							<label for="title">메인 화면 사진선택</label> <input
								type="file" id="exampleInputFile" name="file2">
						</div>
						<div class="checkbox" style="text-align: center;">
						    <label>
						      <input id="check" name="check" type="checkbox" value="0"> 개인정보가 유출될 수 있습니다. 동의하시겠습니까?
						    </label>
						  </div>
						<button type="submit" class="btn btn-default" style="float: right;">Submit</button>
					</form>
				</div>
				<div class="jumbotron1"></div>
				<!-- together insert 끝 -->
			</div>
			<button id="submitbtn" class="btn btn-default btn-sm">글쓰기</button>
			<!-- paging -->
			<div id="pageNum" style="text-align: center;  margin-top: 50px;">
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
			</div>
		</div>
	</div>

	<!-- 여기까지 컨텐츠입니다 -->
	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>


</body>
</html>