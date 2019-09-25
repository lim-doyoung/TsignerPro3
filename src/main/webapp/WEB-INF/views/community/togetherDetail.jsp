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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="css/summernote.css" />
<link rel="stylesheet" type="text/css" href="../../../dist/summernote.css" />
<script type="text/javascript" src="js/summernote.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<script type="text/javascript">
	$('#assignForm').on('shown.bs.modal', function () {
		  $('#myInput').focus()
	});
	$(document).ready(function() {

		
		//글수정 삭제
		var list1='<c:forEach items="${replyList}" var="reply">';
		var list2='<input id="number" type="text" value="${reply.reply_id }">';
		var list3='</c:forEach>';
		$('.togetherEdit').hide();

		candidate();	//신청자리스트

		
		$('.replyList').append('<p id="replyDeleteId" style="font-weight: bold;">${reply.reply_id }</p>').append('<p>${reply.reply_content}</p>')
		if($('#writer').val()==$('#user').val()){
			//삭제
			$('#edBtn').append('<a href="delete/${bean.cmnt_seq }" class="btn btn-warning" style="float: right; margin-right: 10px;">Delete</a>');
			$('#edBtn').append('<button id="edit" class="btn btn-success" style="float: right; margin-right: 10px;" onclick="edit();">Edit</button>');
			//수정
		}else if($('#user').val()=='관리자'){
			$('#edBtn').append('<a href="delete/${bean.cmnt_seq }" class="btn btn-warning" style="float: right; margin-right: 10px;">Delete</a>');
			$('#edBtn').append('<button id="edit" class="btn btn-success" style="float: right; margin-right: 10px;" onclick="edit();">Edit</button>');
		}
		
	});
//동행 참가 신청
 	$(document).on('click', '#incrute', function(e) {
		var userid=$('#replyid').val();
		if(userid!=""&&userid!=null){
			if (confirm("동행에 참가하시겠습니까?") == true) {
				$('#assignForm').modal('show')
			} else { //취소
				return false;
			}
		}else{
			alert("로그인이 필요합니다."); 
		}
		
	}); 

 	function com(){
 	 	alert("참가모집이 끝났습니다.");
 	}

 	function edit(){
		$('.togetherDetail').hide();
		$('.togetherEdit').show();
      }
	
	
//지원저 승인
	$(document).on('click','#canAppV',function(e){
		var appV=e.target.value;
		var num=$('#cmnt_seq').val();
		location.href="approval?num="+num+"&appV="+appV;
	})
	
//지원자 취소
	$(document).on('click','#canDefV',function(e){
		var appV=e.target.value;
		var num=$('#cmnt_seq').val();
		location.href="defusal?num="+num+"&appV="+appV;
	})
//지원자 거절	
	$(document).on('click','#canDefV1',function(e){
		var appV=e.target.value;
		var num=$('#cmnt_seq').val();
		location.href="defusal1?num="+num+"&appV="+appV;
	})
//신청자 리스트 숨김
	function candidate(){
		var loginId=$('#replyid').val();
		var writerId=$('#writer').val();
		if(loginId==writerId){
			$('#assignmentList').show();
		}else{
			$('#assignmentList').hide();
		}
	}
	
	$('#plusHashTag').click(function(e) {
		e.preventDefault();
		hashTag();
	});

	//hashtag 출력
	$(document).on('click','#plusHashTag',function(e) {
		if ($('.plusHash div').length < 3) {
			$('.plusHash').append(
							'<div class="col-sm-2"><input type="text" class="form-control" name="hash_tag" style="float: left;"></div>');
		} else {
			alert('3개 까지만 가능합니다.');
		}
	});
	
//로그인 검사
	function checkForm(){
		var content=$('#replyContent').val();
		var num=$('#cmnt_seq').val();
		var userId=$('#user').val();
		console.log(content);
		console.log(num);
		console.log(userId);
		if(userId==''||userId==null){
				alert('로그인 해야 합니다');
				return false;
		}
		var content=$('#replyContent').val();
		if(content==''||content==null){
			alert('내용을 입력하세요');
			return false;
		}
		if(content!=""&&userId!=""){
			$.ajax({
				type:"post",
				url:"reply",
				data:"cmnt_seq="+num+"&reply_id="+userId+"&reply_content="+content,
				dataType:"json",
				success : function(data,textStatus,xhr) {
					alert(data);
				}
			})
		}
	};

	function checkForm2(){
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

// 투게더 취소

	function cancle(num){
		 if (confirm("정말 취소하시겠습니까??") == true){    //확인
			 location.href="togetherCancle?idx="+num;
		 }else{   //취소
		     return false;
		 }
	};
	
//together assignment
	function assignment(){
		var userid=$('#replyid').val();
		var assign_content = $('#assignContent').val();
		var assign_title = $('#assignTitle').val();
		var assign_id=$('#replyid').val();
		var writerId=$('#writer').val();
		var cmnt_seq=$('#cmnt_seq').val();
		var page = window.location.pathname;
		cmnt_seq=parseInt(cmnt_seq);
		var check=$('input:checkbox[name="check"]').is(":checked");
		if(check==true&&assign_id!=null&&assign_id!=""){
			$.ajax({
				type : "get",
				url : "assignment",
				data : "assign_id=" + assign_id + "&assign_title=" + assign_title + "&assign_content=" + assign_content+"&cmnt_seq="+cmnt_seq,
				dataType : "text",
				success : function(data, textStatus, xhr) {
					if (data == 'assignFail') {
						alert('이미 신청 되었습니다...');
					} else {
						window.location.href = page;
					}
				},
			})
			
		}else if(check==false){
			//동의 할것
			alert('항목에 체크해 주세요');
			return false;
		}else if(assign_id==""){
			alert('로그인이 필요합니다');
			return false;
		}
		if(assign_id==writerId){
			return false;
			alert('모임장은 참가신청 할 수 없습니다.');
		}		
		
	};
//좋아요
	function like(){
		var cmnt_seq=$('#seq').val();
		var user=$('#user').val();
		if(user==""){
			alert('로그인 해야 합니다');
		}else{
			$.ajax({
				type:"get",
				url:"reviewLike",
				data:"cmnt_recom=1&cmnt_seq="+cmnt_seq+"&userID="+user,
				datatype:"text",
				success:function(data){
					if (data == 'msg1') {
						alert('좋아요!');
						location.href=cmnt_seq;
					} else if(data=='msg2') {
						alert('좋아요 취소!');
						location.href=cmnt_seq;
					}
				}
			});
		}
      };
	
	
	
</script>
<style type="text/css">
span.date {
	font-size: 10px;
}

/* 1 */

/*css 초기화*/

.togetherEdit {
	width: 60%;
	margin: auto;
}
.card-header {
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
	-moz-transition: 0.5s; /*파이어폭스*/
	-ms-transition: 0.5s; /*인터넷 익스플로러*/
	-o-transition: 0.5s; /*오페라*/
	transition: 0.5s;
	width: 100%;
	height: 100%;
	border-radius: 4px 4px 0 0;
	background-size: 100% 280px;
	background-repeat: no-repeat;
}

/*모집중  */
.card-header-is_closed {
	background-color: #EF5A31;
	color: #FFF;
	font-weight: bold;
	text-align: center;
	float: right;
	position: absolute;
	margin-top: -100px;
	margin-left: 60%;
	border-radius: 50%;
	font-weight: bold;
	padding: 10px 10px;
	line-height: 20px;
	border-radius: 50%;
/* 	width: 70px;
	height: 70px; */
}

h1 {
	font-size: 22px;
	font-weight: bold;
}

h4 {
	font-weight: bold;
}

/* 타이틀 해더 */
.card-body-header {
	margin: 10px 20px 0px 20px;
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
	width: 50%;
	font-size: 16px;
	color: #9FA5A8;
	padding: 0 15px;
}

.reg_date {
	float: right;
}

#cardImg {
	width: 80%;
	display: block;
	margin: 0px auto;
	margin-top: 50px;
	border-radius: 5px;
}

.article {
	margin: auto;
	margin-top: 10%;
	width: 50%;
	align-content: center;
}

.date {
	align-content: center;
	text-align: center;
	margin: auto;
}

.article h1 {
	margin-top: 50px;
}
/* card template */
.card {
	width: 200px;
	min-height: 200px;
	background: #ffff;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	border-radius: 10px;
	transition: 0.5s;
	margin-top: 70px;
}

.card:hover {
	box-shadow: 0 30px 70px rgba(0, 0, 0, .2);
}

.card .box {
	top: 50%;
	left: 0;
	text-align: center;
	padding: 20px;
	box-sizing: border-box;
	width: 100%;
}

.card .box .img {
	width: 100px;
	height: 100px;
	margin: 0 auto;
	margin-top: -80px;
	border-radius: 50%;
	overflow: hidden;
}

.card .box .img img {
	width: 100%;
	height: 100%;
}

.card .box h2 {
	font-size: 20px;
	color: #262626;
	margin: 20px auto;
}

.card .box h2 span {
	font-size: 14px;
	background: #e91e63;
	color: #fff;
	display: inline-block;
	padding: 4px 10px;
	border-radius: 15px;
}

.card .box p {
	color: #262626;
}

.card .box span {
	display: inline-flex;
}

.card .box ul {
	margin: 0;
	padding: 0;
}

.card .box ul li {
	list-style: none;
	float: left;
}

.card .box ul li a {
	display: block;
	color: #aaa;
	margin: 0 10px;
	font-size: 20px;
	transition: 0.5s;
	text-align: center;
}

.card .box ul li:hover a {
	color: #e91e63;
	transform: rotateY(360deg);
}
/* 2 */
.card2 {
	width: 150px;
	min-height: 100px;
	background: #ffff;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	border-radius: 10px;
	transition: 0.5s;
	margin-top: 70px;
}

.card2:hover {
	box-shadow: 0 30px 70px rgba(0, 0, 0, .2);
}

.card2 .box2 {
	top: 50%;
	left: 0;
	text-align: center;
	padding: 20px;
	box-sizing: border-box;
	width: 100%;
}

.card2 .box2 .img2 {
	width: 80px;
	height: 80px;
	margin: 0 auto;
	margin-top: -60px;
	border-radius: 50%;
	overflow: hidden;
}

.card2 .box2 .img2 img {
	width: 100%;
	height: 100%;
}

.card2 .box2 h2 {
	margin-top: 10px;
	font-size: 15px;
	color: #262626;
}

.card2 .box2 h2 span {
	font-size: 10px;
	background: #e91e63;
	color: #fff;
	display: inline-block;
	padding: 4px 10px;
	border-radius: 15px;
}

.card2 .box2 p {
	font-size: 10px;
	color: #262626;
}

.card2 .box2 span {
	display: inline-flex;
}

.card2 .box2 ul {
	margin: 0;
	padding: 0;
}

.card2 .box2 ul li {
	list-style: none;
	float: left;
}

.card2 .box2 ul li a {
	display: block;
	color: #aaa;
	margin: 0 10px;
	font-size: 20px;
	transition: 0.5s;
	text-align: center;
}

.card2 .box2 ul li:hover a {
	color: #e91e63;
	transform: rotateY(360deg);
}
/*2  */
/* 신청자 목록 */
a.panel-heading {
    display: block;
}
.panel-primary .panel-heading[aria-expanded="true"], .panel-primary .panel-heading a:hover, .panel-primary .panel-heading a:focus, .panel-primary a.panel-heading:hover, .panel-primary a.panel-heading:focus {
	background-color: #286090;
}
.panel-danger .panel-heading[aria-expanded="true"], .panel-danger .panel-heading a:hover, .panel-danger .panel-heading a:focus, .panel-danger a.panel-heading:hover, .panel-danger a.panel-heading:focus {
	background-color: #c9302c;
}
.panel-default .panel-heading[aria-expanded="true"], .panel-default .panel-heading a:hover, .panel-default .panel-heading a:focus, .panel-default a.panel-heading:hover, .panel-default a.panel-heading:focus {
	background-color: #dcdcdc;
}
.panel-info .panel-heading[aria-expanded="true"], .panel-info .panel-heading a:hover, .panel-info .panel-heading a:focus, .panel-info a.panel-heading:hover, .panel-info a.panel-heading:focus {
	background-color: #31b0d5;
}
.panel-success .panel-heading[aria-expanded="true"], .panel-success .panel-heading a:hover, .panel-success .panel-heading a:focus, .panel-success a.panel-heading:hover, .panel-success a.panel-heading:focus {
	background-color: #449d44;
}
.panel-warning .panel-heading[aria-expanded="true"], .panel-warning .panel-heading a:hover, .panel-warning .panel-heading a:focus, .panel-warning a.panel-heading:hover, .panel-warning a.panel-heading:focus {
	background-color: #ec971f;
}
.panel-group .panel, .panel-group .panel-heading {
	border: none !important;
}
.panel-group .panel-body {
	border: 1px solid #ddd !important;
	border-width: 0 1px 1px 1px !important;
	border-radius: 0 0 5px 5px;
}
.panel-group .panel-heading a, .panel-group a.panel-heading {
	outline: 0;
}
.panel-group .panel-heading a:hover, .panel-group .panel-heading a:focus, .panel-group a.panel-heading:hover, .panel-group a.panel-heading:focus {
	text-decoration: none;
}
.panel-group .panel-heading .icon-indicator {
	margin-right: 10px;
}
.panel-group .panel-heading .icon-indicator:before {
	content: "\e114";
}
.panel-group .panel-heading.collapsed .icon-indicator:before {
	content: "\e080";
}
#canAppV,#canDefV{
	margin-top: 90%; margin-left:5px; float: right;
}
#canAppV,#canDefV1{
	margin-top: 90%; margin-left:5px; float: right;
}

/* 좋아요 */
.btn_like {
  position: relative;
  margin: 100px auto;
  display: block;
  width: 44px;
  height: 44px;
  border: 1px solid #e8e8e8;
  border-radius: 44px;
  font-family: notokr-bold,sans-serif;
  font-size: 14px;
  line-height: 16px;
  background-color: #fff;
  color: #DD5D54;
  box-shadow: 0 2px 2px 0 rgba(0,0,0,0.03);
  transition: border .2s ease-out,box-shadow .1s ease-out,background-color .4s ease-out;
  cursor: pointer;
}

.btn_like:hover {
  border: 1px solid rgba(228,89,89,0.3);
  background-color: rgba(228,89,89,0.02);
  box-shadow: 0 2px 4px 0 rgba(228,89,89,0.2);
}

.btn_unlike .img_emoti {
    background-position: -30px -120px;
}

.img_emoti {
    display: inline-block;
    overflow: hidden;
    font-size: 0;
    line-height: 0;
    background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
    text-indent: -9999px;
    vertical-align: top;
    width: 20px;
    height: 17px;
    margin-top: 1px;
    background-position: 0px -120px;
    text-indent: 0;
}

.btn_like .ani_heart_m {
    margin: -63px 0 0 -63px;
}


.ani_heart_m {
    display: block;
    position: absolute;
    top: 50%;
    left: 50%;
    width: 125px;
    height: 125px;
    margin: -63px 0 0 -63px;
    pointer-events: none;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 투게더 신청서 양식 -->

<!-- Modal -->
<div class="modal fade" id="assignForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content" >
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Assignment Form</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
        
         <div class="form-group">
		    <label for="exampleInputEmail1">Title</label>
		    <input type="email" id="assignTitle" name="assignTitle" class="form-control" placeholder="제목을 적어 주세요">
		    <input type="hidden" id="replyid" name="replyid" value="${sessionScope.id }">
		    <input type="hidden" id="cmnt_seq" name="cmnt_seq" value="${bean.cmnt_seq }">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Content</label>
		    <textarea class="form-control" name="assignContent" id="assignContent" placeholder="여행성향을 적어 주세요"></textarea>
		  </div>
		  <div class="checkbox">
		    <label>
		      <input id="check" name="check" type="checkbox" value="0">개인정보가 유출될 수 있습니다. 동의하시겠습니까?
		    </label>
		  </div>
        
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="assignment();">Assignment</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

	
	<br>
	<!-- 하단 nav -->
	<div class="container">

		<div class="page-header">
			<h1>
				Community Center <small>Together</small>
			</h1>
		</div>

		<%
			String root = request.getContextPath();
			String id=request.getParameter("cmnt_writer_id");
		%>
		<ul class="nav nav-pills nav-justified">
			<li role="presentation"><a href="<%=root%>/community_planner">플래너</a></li>
			<li role="presentation"><a href="<%=root%>/community_bbs">자유게시판</a></li>
			<li role="presentation" class="active"><a
				href="<%=root%>/community_together">투게더</a></li>
			<li role="presentation"><a href="<%=root%>/community">여행후기</a></li>
			<li role="presentation"><a href="<%=root%>/community_question">질문</a></li>
		</ul>
	</div>

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="container">
			<div class="togetherDetail" style="width: 80%; margin: 0px auto;">
				<br>
				<!-- 수정 삭제 btn -->
				<div id="edBtn">
					<input id="writer" type="hidden" id="writerId" value="${bean.cmnt_writer_id }">
					<input type="hidden" id="user" value="${sessionScope.id }">
				</div>
				<!-- 동행 본문 -->
				<div class="article">
				<p class="date">
				<c:set var="day" value="${fn:substring(bean.together_date,0,4) }"/>
				<c:set var="year" value="${fn:substring(bean.together_date,8,10) }"/>
				<c:set var="month" value="${fn:substring(bean.together_date,5,7) }"/>
				<c:set var="date" value="${bean.together_date }"/>
				<fmt:formatDate value="${date}" pattern="E" var="yu"/>
				<c:choose>
					<c:when test="${yu=='월' }">Monday,</c:when>
					<c:when test="${yu=='화' }">Tuesday,</c:when>
					<c:when test="${yu=='수' }">Wednesday,</c:when>
					<c:when test="${yu=='목' }">Thursday,</c:when>
					<c:when test="${yu=='금' }">Friday,</c:when>
					<c:when test="${yu=='토' }">Saturday,</c:when>
					<c:when test="${yu=='일' }">Sunday,</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${month==01 }">January</c:when>
					<c:when test="${month==02 }">February</c:when>
					<c:when test="${month==03 }">March</c:when>
					<c:when test="${month==04 }">April</c:when>
					<c:when test="${month==05 }">May</c:when>
					<c:when test="${month==06 }">June</c:when>
					<c:when test="${month==07 }">July</c:when>
					<c:when test="${month==08 }">August</c:when>
					<c:when test="${month==09 }">September</c:when>
					<c:when test="${month==10 }">October</c:when>
					<c:when test="${month==11 }">November</c:when>
					<c:when test="${month==12 }">December</c:when>
				</c:choose>
				${day },${year }
				</p>
				
				<span style="float: right;"> <i class="fa fa-heart"></i> ${bean.likeCnt }</span>
				<span style="float: right; margin-right: 10px;"> <i class="fa fa-comment"></i> ${bean.reply_total }</span>
					<h1 class="date">${bean.cmnt_title }</h1>
					
					<p class="date" style="margin-top: 50px; line-height: 30px;">${bean.cmnt_content}</p>
				</div>
				<!-- 동행 본문 -->
				<!-- 모집중 -->
				<c:choose>
					<c:when test="${bean.recru_per eq bean.total_per }">
					<div onclick="com();" class="card-header-is_closed" style="background-color: #77d7b9">
							<div style="class="card-header-text">모집완</div>
						<div class="card-header-number">${bean.recru_per}/
							${bean.total_per}</div>
					</div>
					</c:when>
					<c:when test="${bean.recru_per ne bean.total_per }">
					<div id="incrute" class="card-header-is_closed"">
							<div class="card-header-text">모집중</div>
						<div class="card-header-number">${bean.recru_per}/
							${bean.total_per}</div>
					</div>
					</c:when>
				</c:choose>
				<!--  카드 바디 -->
				<br>
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
					<!-- 톰켓 외부경로 지정 -->
						<img id="cardImg" src="<%=root %>/${bean.cmnt_file_path3}${bean.cmnt_filename}">
					</div>
				</div>
				<button type="button" class="btn_like" onclick="like();">
				  <span class="img_emoti">좋아요</span>
				  <span class="ani_heart_m"></span>
				</button>
				<a href="communityList" class="btn btn-primary btn-sm" style="float: right;">목록</a>
				<br>
				<!-- 참가중인 사람 리스트 -->
				<div class="card-body">
					<hr style="color: red; width: 100%;">
					<h1>Who's Coming With Me?</h1>
					<div class="col-sm-3">
						<!-- 글쓴이 -->
						<div class="card">
							<div class="box">
								<div class="img">
									<img src="<%=root %>/${bean.profile_root }${bean.profile_file }">
								</div>
								
								<h2>${bean.cmnt_writer_id }<br>
								
									<!-- 등급 -->
									<c:set var="lev" value="${bean.user_mem_lev }"></c:set>
									<span>
										<c:choose>
											<c:when test="${lev==0 }">T Baby</c:when>		
											<c:when test="${lev==1 }">T beignner</c:when>		
											<c:when test="${lev==2 }">T Expert</c:when>		
											<c:when test="${lev==3 }">T Guide</c:when>
											<c:when test="${lev==4 }">T Signer</c:when>
											<c:when test="${lev==5 }">T Master</c:when>
										</c:choose>
									</span>
								</h2>
								<p>${bean.myself }</p>
								<span>
									<ul>
										<li><a href="https://www.facebook.com/Dlaehxjf"><i class="fa fa-facebook"
												aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"
												aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-google-plus"
												aria-hidden="true"></i></a></li>
										<li><a href="https://www.instagram.com/lian_lim_dy/"><i class="fa fa-instagram"
												aria-hidden="true"></i></a></li>
									</ul>
								</span>
							</div>
						</div>
					</div>
					<!-- 참가자 -->
					<div class="col-sm-9">
						<div class="row">
							<c:forEach items="${approvalList }" var="appVList">
							<div class="col-sm-3">
								<div class="card2">
									<div class="box2">
									<div class="img2">
											<img src="<%=root %>/${appVList.profile_root }${appVList.profile_file }">
										</div>
										<h2>${appVList.assign_id }<br>
										
											<!-- 등급 -->
											<c:set var="lev" value="${appVList.user_mem_lev }"></c:set>
											<span>
												<c:choose>
													<c:when test="${lev==0 }">T Baby</c:when>		
													<c:when test="${lev==1 }">T beignner</c:when>		
													<c:when test="${lev==2 }">T Expert</c:when>		
													<c:when test="${lev==3 }">T Guide</c:when>
													<c:when test="${lev==4 }">T Signer</c:when>
													<c:when test="${lev==5 }">T Master</c:when>
												</c:choose>
											</span>
										</h2>
										<p>${appVList.myself }</p>
										<p>
											<c:set var="te2" value="${appVList.assign_id}"></c:set>
										<c:set var="te1" value="${sessionScope.id }" />
										<c:set var="te3" value="${bean.cmnt_writer_id }"/>
										<c:set var="assignNum" value="${appVList.assign_seq }"/>
										<c:choose>
											<c:when test="${ te1 eq te2}"><button class="btn btn-danger btn-sm" style="margin-top: -10px;" id="canDefV" value="${assignNum}">취소</button></c:when>
											<c:when test="${ te3 eq te1}"><button class="btn btn-danger btn-sm" style="margin-top: -10px;" id="canDefV" value="${assignNum}">취소</button></c:when>
										</c:choose>
										
										</p>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
					<br>
					<c:set var="te2" value="${bean.cmnt_writer_id }"/>
					<c:set var="te1" value="${sessionScope.id }" />
					
					<c:if test="${bean.recru_per ne bean.total_per }">
						<a id="incrute" class="btn btn-primary" style="margin-left: 85%;" onclick="incrute();">Come Together</a>
					</c:if>	
					<c:if test="${bean.recru_per eq bean.total_per }">
						<a class="btn btn-primary" style="margin-left: 85%;" onclick="com();">Come Together</a>
					</c:if>
					
				</div>
				
				<!-- 신청자 목록 -->
				<div id="assignmentList">
					<hr style="color: red; width: 100%;">
					<h2>Candidate List</h2>
					<div aria-multiselectable="true" role="tablist" id="accordion" class="panel-group">
						<c:forEach items="${candidateList}" var="candiList">
					    <div class="panel panel-default"> <a title="Tab 1" aria-controls="collapse${candiList.assign_seq }" aria-expanded="false" href="#collapse${candiList.assign_seq }" data-parent="#accordion" data-toggle="collapse" id="heading" role="tab" class="panel-heading collapsed"><span class="glyphicon icon-indicator"></span> <span class="panel-title">${candiList.assign_title }</span> </a>
					        <div aria-labelledby="heading1" role="tabpanel" class="panel-collapse collapse" id="collapse${candiList.assign_seq }" aria-expanded="false">
						       	<div class="col-sm-3">
									<div class="card2">
										<div class="box2">
	 										<div class="img2">
												<img src="<%=root %>/${candiList.profile_root }${candiList.profile_file }">
											</div> 
											<h2>${candiList.assign_id }<br>
												<!-- 등급 -->
												<c:set var="lev" value="${candiList.user_mem_lev }"></c:set>
												<span>
													<c:choose>
														<c:when test="${lev==0 }">T Baby</c:when>		
														<c:when test="${lev==1 }">T beignner</c:when>		
														<c:when test="${lev==2 }">T Expert</c:when>		
														<c:when test="${lev==3 }">T Guide</c:when>
														<c:when test="${lev==4 }">T Signer</c:when>
														<c:when test="${lev==5 }">T Master</c:when>
													</c:choose>
												</span>
											</h2>
											<p>${candiList.myself }</p>
										</div>
									</div>
						        </div>
					            <div class="panel-body">
							        <div class="col-sm-6">
						            	<h3>${candiList.assign_title }</h3>
						                <p style="margin-top: 20px;">${candiList.assign_content }</p>
						            </div>
						            <div class="col-sm-3">
						            	<button id="canDefV1" class="btn btn-default" value="${candiList.assign_seq }" style="">거절</button>
						            	<c:if test="${bean.recru_per ne bean.total_per }">
						            		<button id="canAppV" class="btn btn-success" value="${candiList.assign_seq }" style="">승인</button>
						            	</c:if>
										<c:if test="${bean.recru_per eq bean.total_per }">
											<button id="canAppV" class="btn btn-default" value="${candiList.assign_seq }" disabled="disabled" style="" >승인</button>
										</c:if>
						            </div>
					            </div>
					        </div>
					    </div>
					    </c:forEach>
					</div>
				</div> 
				
				<!-- 댓글-->
				<div class="card-body">
					<div class="form-group">
						<hr style="color: red; width: 100%;">
						<h2>Are you curious?</h2>
						<input type="hidden" id="seq" name="seq" value="${bean.cmnt_seq }">
						<form onsubmit="return checkForm();">
							<div class="col-sm-11">
								<input type="text" name="reply_content" id="replyContent" class="form-control">
								<input type="hidden" name="cmnt_seq" id="cmnt_seq" value="${bean.cmnt_seq }">
								<input type="hidden" name="reply_id" id="reply_id" value="${sessionScope.id }">
							</div>
							<div class="col-sm-1">
								<button id="replyAdd" class="btn btn-default" style="float: right;">Reply</button>
							</div>
						</form>
						<hr>
						<br>
						<div class="replyList">
							<c:forEach items="${replyList}" var="reply">
 								<p id="replyDeleteId" style="font-weight: bold;">${reply.reply_id }
 								<span class="date" style="font-size: 10px;">
 								<c:set var="date" value="${fn:substring(reply.r_modi_date,0,10) }"/>
 								${date }
 								</span>
 								</p>
								<c:set var="te2" value="${reply.reply_id }" />
								<c:set var="te1" value="${sessionScope.id }" />
									<c:if test="${te1 eq te2}">
									   <a href="replyDelete?reply_seq=${reply.reply_seq }&cmnt_seq=${reply.cmnt_seq}" class="btn btn-primary btn-sm" style="float: right;">삭제</a>
									</c:if>
								<p>${reply.reply_content}</p>
								<hr>
							</c:forEach>
						</div>
						<br><br>
<!-- 						<hr style="color: red; width: 100%;"> -->
					</div>
				</div><!--댓글 끝  -->
			</div>
			<!-- container 끝 -->
		</div>
		<!-- 여기까지 컨텐츠입니다 -->
		<br>
		
		<div class="togetherEdit">
					<h1 style="font-size: 25px; font-weight: bold; text-align: center;">Together</h1>
<!-- 					<img id="bgImg" alt="" src="imgs/write.jpg"> <br> <br> -->
<!-- 					<p style="text-align: center;">T signer</p>
					<p style="text-align: center;">여행 숙박 공연 정보를 공유 하고</p>
					<p style="text-align: center;">함께 여행하자</p> -->
					<form action="togetherUpdate" method="post"
						enctype="multipart/form-data" style="margin-top: 50px;" onsubmit="return checkForm2();" >
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label for="title">Title</label> <input type="text"
										class="form-control" placeholder="write title"
										name="cmnt_title" value="${bean.cmnt_title }">
								</div>
							</div>
							<input type="hidden" class="form-control"
								placeholder="write name" name="cmnt_writer_id"
								value="${sessionScope.id }" readonly="readonly">
								<input type="hidden" value="${bean.cmnt_seq}" name="cmnt_seq">
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
						
						<script type="text/javascript">
						$(document).ready(function(){
							 $('#summernote').summernote({
					             height: 300
					         });
						});
						</script>
						
						<div class="form-group">
							 <textarea id="summernote" name="cmnt_content" class="summernote"
					              rows="" cols="" style="height: 500px;">
					               ${bean.cmnt_title }        
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
					<!-- together edit 끝 -->
				</div>

		<!-- footer -->
		<div class="jumbotron2">
			<%@ include file="../template/footer.jsp"%>
		</div>
</body>
</html>