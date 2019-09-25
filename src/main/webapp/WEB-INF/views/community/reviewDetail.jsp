<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
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
		//글수정 삭제
		detail();
		levUp();
         $('#summernote').summernote({
             height: 300
         });

         $('button').click(function(){
        	  if($(this).hasClass('btn_unlike')){
        	    $(this).removeClass('btn_unlike');
        	    $('.ani_heart_m').removeClass('hi');
        	    $('.ani_heart_m').addClass('bye');
        	  }
        	  else{
        	    $(this).addClass('btn_unlike');
        	    $('.ani_heart_m').addClass('hi');
        	    $('.ani_heart_m').removeClass('bye');
        	  }
        	});
	});

	function levUp(){
		var levUp=$('#levUp').val();
		if(levUp!="null"){
				alert(levUp);
		}
	}
	
      function detail(){
		$('#reviewDetail').show();
		$('.reviewEdit').hide();
      }

      function edit(){
		$('#reviewDetail').hide();
		$('.reviewEdit').show();
      }
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
      
      function checkReply(){
          var userId=$('#user').val();
          var content=$('#replyContent').val();
          if(userId==""||userId==null){
/*               document.getElementById("replyContent").value="내용을 입력하세요!" */
             alert('로그인이 필요합니다.');
             return false;
          }
          if(content==""){
        	 $('#replyContent').after('<label id="telCheckResult" style="color: red">내용을 입력하세요</label><input id="chTel" type="hidden" value="1"/>');
             return false;
          }
       }
      
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
						location.href="community_reviewDetail?num="+cmnt_seq;
					} else if(data=='msg2') {
						alert('좋아요 취소!');
						location.href="community_reviewDetail?num="+cmnt_seq;
					}
				}
			});
		}
      }
</script>

<style type="text/css">
span.date {
	font-size: 10px;
}
h1 {
	font-size: 22px;
	font-weight: bold;
}

h4 {
	font-weight: bold;
}
.article {
	margin: auto;
	margin-top: 10%;
	margin-left: 10%;
	width: 70%;
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
.reg_date {
	float: right;
}
.title{
	align-content: center;
	text-align: center;
	margin: auto;
	font-style: italic;
}
.reviewEdit {
   width: 50%;
   margin: auto;
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
</head>
<body>

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
			<li role="presentation"><a href="community_planner">플래너</a></li>
         <li role="presentation"><a href="community_bbs">자유게시판</a></li>
         <li role="presentation"><a href="community_together">투게더</a></li>
         <li role="presentation" class="active"><a href="community">여행후기</a></li>
         <li role="presentation"><a href="community_question">질문</a></li>
		</ul>
	</div>

	<!-- 여기서부터 컨텐츠입니다 -->
	<%String hello=request.getParameter("hello"); %>
	<input id="levUp" type="hidden" value="<%=hello%>">
	<div id="content">
		<div class="container">
			<div id="reviewDetail" class="row" style="width: 80%; margin: 0px auto;">
				<br>
				<!-- 수정 삭제 btn -->
				<div id="edBtn">
					<input id="writer" type="hidden" id="writerId" value="${bean.cmnt_writer_id }">
					<input type="hidden" id="user" value="${sessionScope.id }">
					<c:choose>
					<c:when test="${bean.cmnt_writer_id==sessionScope.id }">
						<a href="reviewDelete?num=${bean.cmnt_seq }" class="btn btn-warning" style="float: right; margin-right: 10px;">Delete</a>
							<button id="edit" class="btn btn-success" style="float: right; margin-right: 10px;" onclick="edit();">Edit</button>
					</c:when>
					<c:when test="${'관리자'==sessionScope.id }">
						<a href="reviewDelete?num=${bean.cmnt_seq }" class="btn btn-warning" style="float: right; margin-right: 10px;">Delete</a>
							<button id="edit" class="btn btn-success" style="float: right; margin-right: 10px;" onclick="edit();">Edit</button>
					</c:when>
<%-- 						<c:if test="${bean.cmnt_writer_id==sessionScope.id }">
							<a href="reviewDelete?num=${bean.cmnt_seq }" class="btn btn-warning" style="float: right; margin-right: 10px;">Delete</a>
							<button id="edit" class="btn btn-success" style="float: right; margin-right: 10px;" onclick="edit();">Edit</button>
						</c:if> --%>
					</c:choose>
				</div>
				<!-- 동행 본문 -->
				<c:set var="date" value="${bean.modi_date }"/>
				<div class="article">
				<p class="date">
				<c:set var="day" value="${fn:substring(date,0,4) }"/>
				<c:set var="year" value="${fn:substring(date,8,10) }"/>
				<c:set var="month" value="${fn:substring(date,5,7) }"/>
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
				<span style="float: right;"> <i class="fas fa-heart"></i> ${bean.likeCnt }</span>
				<span style="float: right; margin-right: 10px;"> <i class="fas fa-comment"></i> ${bean.reply_total }</span>
				
					<h1 class="title">${bean.cmnt_title }</h1>
					<p class="date" style="margin-top: 50px; line-height: 30px;">${bean.cmnt_content}</p>
				</div>
				<!-- 동행 본문 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
					<!-- 톰켓 외부경로 지정 -->
<%-- 						<img id="cardImg" style="text-align: center; align-content: center;" alt="" src="<%=root %>/${bean.cmnt_file_path4}${bean.cmnt_filename}"> --%>
					</div>
				</div>
				<br>
				<button type="button" class="btn_like" onclick="like();">
				  <span class="img_emoti">좋아요</span>
				  <span class="ani_heart_m"></span>
				</button>
				<a href="community" class="btn btn-primary btn-sm" style="float: right;">목록</a>
				<div class="jumbotron1"></div>
				
				<!-- 댓글-->
				<div class="card-body">
					<div class="form-group">
						<hr style="color: red; width: 100%;">
						<h2>Are you curious?</h2>
						<input type="hidden" id="seq" name="seq" value="${bean.cmnt_seq }">
						<form action="reviewReply" method="post" onsubmit="return checkReply();">
							<div class="col-sm-11">
								<input type="text" name="reply_content" id="replyContent" class="form-control">
								<input type="hidden" name="cmnt_seq" value="${bean.cmnt_seq }">
								<input type="hidden" name="reply_id" value="${sessionScope.id }">
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
 								<span class="date" style="font-size: 12px;">
 								<c:if test="${empty te2  }"></c:if>
 								<c:if test="${not empty te2  }">
 									(${fn:substring(reply.r_modi_date,0,10) })
 								</c:if>
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
				</div>
			</div>
			<!-- container 끝 -->
		</div>
		<!-- 여기까지 컨텐츠입니다 -->
		<br>
		
		 <div class="reviewEdit">
		     <h1 style="font-size: 25px; font-weight: bold; text-align: center;">Review</h1>
		     <!--                <img id="bgImg" alt="" src="imgs/write.jpg"> <br> <br> -->
		     <br>
		     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">T signer</p>
		     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">여행 숙박 공연 정보를 공유 하고</p>
		     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">함께 여행하자</p> 
		     <form action="community_review/update" method="post" enctype="multipart/form-data" style="margin-top: 50px;"
		        onsubmit="return checkForm();">
		        <div class="row">
		           <div class="col-sm-12">
		              <div class="form-group">
		                 <label for="title">Title</label>
		                 <input id="title" type="text" class="form-control" value="${bean.cmnt_title }" name="cmnt_title">
		              </div>
		           </div>
		           <input type="hidden" name="cmnt_writer_id" value="${sessionScope.id }">
		           <input type="hidden" name="cmnt_seq" value="${bean.cmnt_seq }">
		        </div>
		        <div class="form-group">
		           <textarea id="summernote" name="cmnt_content" class="summernote"
		              rows="" cols="" style="height: 500px;">
		               ${bean.cmnt_title }        
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
	  <div class="jumbotron1"></div>
		  <!-- review insert 끝 -->
	</div>
	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>

</body>
</html>