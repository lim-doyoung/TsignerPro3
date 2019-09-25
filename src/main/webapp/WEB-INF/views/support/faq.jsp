<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.bit.tsigner.model.entity.FaqVo, com.bit.tsigner.model.SupportDao"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../template/header.jsp"></jsp:include>

<link
	href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../../css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="../../../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css"
	href="../../../dist/summernote.css" />

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/summernote.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#faqadd').hide();
		$('#faqupdate').hide();
		
	      $(document).ready(function() {
	          $('.summernote').summernote({
	              height: 300
	          });
	       });

		$('#addBtn>button').click(function() {
			$('#faqlist').hide();
			$('#faqadd').show();
		});
		
	});

function repUpdate(index){

	$('.editDelete').hide();
	
	var content = $("#list_div_" + index + " .faq_content").last().val();
	var title = $("#list_div_" + index + " .faq_title").last().val();
	var faq_id = $("#list_div_" + index + " .faq_id").last().val();

	var info = '';
	info = "<div id='div_update'>";
		info +='<form action="faq/update" method="post">';
				info +='<input type="hidden" name="idx"  value="'+faq_id+'" />';       
			info +='<div>';    
				info +='<input type="text" name="sub" class="form-control" style="margin-top: 5px;" value="'+title+'" >';    
			info +='</div>';
			info +='<textarea class="updatecontent" name="content"  rows="" cols="" style="resize: none;">'+content+'</textarea>';
			info +='<div class="updateBtns">';
				info +='<button type="submit" class="repupdate">수정하기</button>';
				info +='<button type="submit" class="repcancel" onclick="goBack();">수정취소</button>'
			info +='</div>';
		info +='</form>';
	info +='</div>'; 

	$("#div_update").remove();
	$("#list_div_" + index + " .updateBtn").last().parent().parent().parent().parent().parent().parent().after(info);
}

function goBack(){
    window.history.back();
 }
 
</script>

<style type="text/css">

/*댓글 수정*/

.updatecontent {
	width: 100%;
	height: 100%;
	margin-bottom: -10px;
	padding-left: 10px;
	padding-right: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-family: "나눔고딕";
	font-size: 14px;
	color: #555;
}

.form-control {
	margin-bottom: 10px;
}

.repupdate {
	float: right;
	text-align: center;
}


#menubar {
	font-family: "나눔고딕";
	font-size: 16px;
	margin: 30px;
	padding: 20px;
	line-height: 3em;
}

#pageNum {
	text-align: center;
}

#addBtn {
	text-align: center;
	margin: -40px 60px 100px 0px;
}

#addBtns {
	text-align: center;
}

.updateBtns {
	text-align: right;
}

#faqadd {
	width: 1040px;
	margin: 0px auto;
	margin-bottom: 100px;
}

.detailList {
	display: block;
}

.container h2, .container strong {
	text-family: "나눔고딕";
}

.container h2 {
	font-size: 30px;
	font-weight: bold;
}

.container p {
	font-size: 16px;
	font-weight: normal;
}

.summernote {
	width: 800px;
	height: 500px;
}

.card-header {
	border: 1px solid #dfdfdf;
	padding: 5px;
	padding-left: 15px;
	overflow: hidden;
	-webkit-transition: height .4s ease-out, padding .4s ease-out;
	-moz-transition: height .4s ease-out, padding .4s ease-out;
	-o-transition: height .4s ease-out, padding .4s ease-out;
	-ms-transition: height .4s ease-out, padding .4s ease-out;
	transition: height .4s ease-out, padding .4s ease-out;
}

.editDelete {
	float: right;
}

.repcancel {
	margin-right: 5px;
}

/* accordion */
.accordion {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0 auto;
	font-size: 14px;
	width: 1040px;
	padding: 10px;
	background: #fff;
}

.accordion ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

.accordion li {
	margin: 0;
	padding: 0;
}

.accordion [type=radio], .accordion [type=checkbox] {
	display: none;
}

.accordion label {
	display: block;
	font-size: 15px;
	line-height: 25px;
	background: #ffffff;
	border: 1px solid #ffffff;
	color: #454545;
	font-weight: 500;
	cursor: pointer;
	text-transform: uppercase;
	-webkit-transition: all .2s ease-out;
	-moz-transition: all .2s ease-out;
}

.accordion ul li label:hover, .accordion [type=radio]:checked ~ label,
	.accordion [type=checkbox]:checked ~ label {
	background: #FCAD21;
	color: #FFF;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5)
}

.accordion .content {
	padding-top: 10px;
	padding-left: 15px;
	padding-right: 15px;
	overflow: hidden;
	line-height: 1.8em;
	/* Make the border match the background so it fades in nicely */
	-webkit-transition: all .5s ease-out;
	-moz-transition: all .5s ease-out;
}

.accordion p {
	color: #333;
	margin: 0 0 10px;
	font-size: 14px;
	padding: 10px;
	line-height: 2em;
}

.accordion h3 {
	color: #eeeeee;
	padding: 0;
	margin: 10px 0;
}

/* Vertical */
.vertical ul li {
	overflow: hidden;
	margin: 0 0 1px;
}

.vertical ul li label {
	padding: 10px;
}

.vertical [type=radio]:checked ~ label, .vertical [type=checkbox]:checked 
	~ label {
	border-bottom: 0;
}

.vertical ul li label:hover {
	border: 1px solid #eeeeee;
	/* We don't want the border to disappear on hover */
}

.vertical ul li .content {
	height: 0px;
	border-top: 0;
}

.vertical [type=radio]:checked ~ label ~ .content, .vertical [type=checkbox]:checked 
	~ label ~ .content {
	height: 100px;
	border: 1px solid #eeeeee;
	background-color: #eeeeee;
}

.page-header{
	height: 100px;
}

.updatecontent {
	height: 100px;
	line-height: 1.6em;
}

.faq_write {
	font-size: 25px;
    font-weight: bold;
    color: #337AB7;
    margin: 40px 0px 0px 10px;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<br>
	<%
		String root = request.getContextPath();
	%>
	<!-- 여기서부터 컨텐츠입니다 -->
	<div class="container">
		<div class="page-header">
			<table class="pageHeader">
				<tr>
					<td style="width:110px; height:100px">
						<img src="imgs/faq.png"/>
					</td>
					<td style="width:200px; height:100px">
						<img src="imgs/faq_title.png"/>
					</td>
			</table>				 
		</div>

		<ul class="nav nav-pills nav-justified">
			<li role="presentation" class="active"><a href="<%=root%>/faq">FAQ</a></li>
			<li role="presentation"><a href="<%=root%>/inquiry">1:1 문의하기</a></li>
			<li role="presentation"><a href="<%=root%>/terms">이용약관</a></li>
			<li role="presentation"><a href="<%=root%>/privacy">개인정보 처리방침</a></li>

		</ul>
		<div id="faqlist">
			<div id="menubar">
				<div class="card">
					<%
						int i = 0;
					%>
					<c:forEach items="${list }" var="bean">
						<div id="list_div_<%=i%>" class="accordion vertical" >
							<ul>
								<li>
									<input type="checkbox" id="checkbox-<%=i%>" name="checkbox-accordion" /> 
									<label for="checkbox-<%=i%>"><img src="imgs/faq_icon.png" style="padding-right:5px; padding-bottom:1px"/> ${bean.faq_title } 
										<c:if test="${sessionScope.id == '관리자'}">
											<table class="editDelete">
												<tr>
													<td style="padding-right:5px;">
														<button class="updateBtn" value="${bean.faq_seq }" onclick="javascript:repUpdate('<%=i%>');">수정</button>
															<input type=hidden class="faq_content" value="${bean.faq_content }">
															<input type=hidden class="faq_title" value="${bean.faq_title }">
													</td>
													<td>
														<form action="faq/delete" method="POST">
															<input class="faq_id" type="hidden" name="idx" value="${bean.faq_seq }">
															<button id="DeleteBtn" type="submit">삭제</button>
													</form>
													</td>
												</tr>
											</table>	
										</c:if>
									</label>
									<div class="content">
										${bean.faq_content }
									</div>
								</li>
							</ul>
						</div>
						<div id="section<%=i%>">
						
						</div>
						<%
						i++;
						%>
					</c:forEach>
				</div>
			</div>

			<div id="addBtn">
				<!-- 관리자 로그인만 글쓰기 버튼 활성화 -->
				<c:if test="${sessionScope.id == '관리자'}">
					<button class="btn btn-default" type="submit">글쓰기</button>
				</c:if>
			</div>
		</div>
	</div>
	<div id="faqadd">
		<!-- 글쓰기 페이지 -->
		<div class="faq_write">글쓰기</div>
		<br>
		<form action="faq/add" method="post" enctype="multipart/form-data">
			<div>
				<input type="text" name="faq_title" class="form-control"
					placeholder="제목을 입력해주세요">
			</div>
			<div>
				<textarea id="summernote" class="summernote" name="faq_content"
					rows="" cols="" style="height: 500px;" placeholder="내용을 입력해주세요"></textarea>
			</div>
			<div id="addBtns">
				<button class="btn btn-primary" type="submit">등록하기</button>
				<button class="btn btn-default" type="reset">취소</button>
			</div>
		</form>
	</div> <!-- faqadd -->
	<!-- 여기까지 컨텐츠입니다 -->
	
	
	
  	

	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>


</body>
</html>