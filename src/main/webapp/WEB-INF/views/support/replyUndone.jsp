<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.bit.tsigner.model.entity.SupportVo, com.bit.tsigner.model.SupportDao"%>
<%@ page import="java.sql.*, java.util.*"%>
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
<link rel="stylesheet" type="text/css"
	href="../../../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css"
	href="../../../dist/summernote.css" />
<!-- Font Awesome -->

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
		$('#inquiryadd').hide();

		$(document).ready(function() {
			$('#summernote').summernote({
				height : 300
			});
		});

		$('#addBtn>button').click(function() {
			$('#inquirylist').hide();
			$('#inquiryadd').show();

		});

	});

	//원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page) {
		location.href = "replyUndone?curPage=" + page
				+ "&searchOption-${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
</script>

<style type="text/css">
#pageNum {
	text-align: center;
}

#addBtn {
	text-align: center;
	margin-top: 20px;
	margin-bottom:10px;
}

#addBtns {
	text-align: center;
}

#updateBtns {
	text-align: center;
}

#inquiryadd {
	width: 1040px;
	margin: 0px auto;
	margin-bottom: 100px;
}

.detailList {
	display: block;
}

.emptySession {
	margin-top: 100px;
	margin-bottom: 200px;
	text-align: center;
	font-family: "나눔고딕";
	font-size: 16px;
}

.form-control{
	padding-left: 10px;
	margin-bottom: 10px;
}

.inquiry{
	font-size: 25px;
    font-weight: bold;
    color: #337AB7;
    margin: 40px 0px 10px 10px;
}

.inq_radiobox{
	margin-bottom: 10px;
}

.page-header{
	height: 100px;
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

		<div class="page-header">
			<table class="pageHeader">
				<tr>
					<td style="width:110px; height:100px">
						<img src="imgs/inquiry.png" />
					</td>
					<td style="width:200px; height:100px">
						<img src="imgs/inquiry_title.png" />
					</td>
			</table>
		</div>

		<ul class="nav nav-pills nav-justified">
			<li role="presentation"><a href="<%=root%>/faq">FAQ</a></li>
			<li role="presentation" class="active"><a
				href="<%=root%>/inquiry">1:1 문의하기</a></li>
			<li role="presentation"><a href="<%=root%>/terms">이용약관</a></li>
			<li role="presentation"><a href="<%=root%>/privacy">개인정보
					처리방침</a></li>

		</ul>
		<div id="inquirylist">

			<div class="row">
				<br><br>
			</div>

		<c:choose>
				<c:when test="${empty sessionScope.id}">
					<div class="emptySession">
						로그인이 필요한 서비스입니다.<br><br>
						아이디와 비밀번호를 이용하여 로그인하여 주시기 바랍니다.
					</div>
				</c:when>
			<c:otherwise>
				

			<!-- 레코드의 갯수를 출력 -->

			<div class="inquiry_list">
				<table class="table table-hover" style="width: 100%; margin: 0px auto;">
					<tr>
						<th style="width:130px; text-align: center; padding-top: 15px;">카테고리</th>
						<th style="text-align: center; padding-top: 15px;">제목</th>
						
						
						<!-- 상태 버튼 콤보박스 -->
						<th style="width:130px; text-align: center;">
						<div class="btn-group">
						    <!-- 추가 버튼태그 -->
						    <button class="btn btn-default" type="button">
						        상태
						    </button>
						    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
						    <!-- 버튼태그 우측 메뉴출력을 위한 화살표표시
						        (없어도 무관하나 메뉴버튼이라는것을 알려주기 위함) -->
						    <span class="caret"></span>
						    </button>
						    <!--메뉴버튼 클릭시 하단 표출된 리스트 영역  -->
						    <ul class="dropdown-menu">
						        <!-- 메뉴1 -->
						        <li><a href="replyDone">답변완료</a></li>
						        <!-- 메뉴2 -->
						        <li><a href="replyUndone">준비중</a></li>
						    </ul>
						</div>
						</th>
						
						
						<th style="width: 120px; text-align: center; padding-top: 15px;">작성자</th>
						<th style="width: 120px; text-align: center; padding-top: 15px;">작성일</th>
					</tr>

			<c:forEach items="${map.list }" var="bean">
						<tr>
							<td style="width:130px; text-align: center;"><a href="inquiry/detail?idx=${bean.inq_seq }" style="color:#464646;">
								${bean.inq_type }
							</a></td>
							<td><a class="inq_title" href="inquiry/detail?idx=${bean.inq_seq }" style="padding-left:40px; color:#464646;">
								${bean.inq_title }
							</a></td>
							<td style="text-align: center;">
							<c:choose>
								<c:when test="${bean.inq_reply_cnt > 0 }">
									<img src="imgs/inq_comp.png" />
								</c:when>
								<c:otherwise>
									<img src="imgs/inq_incomp.gif" />
								</c:otherwise>
							</c:choose>
							</td>
							<td style="width: 120px; text-align: center;"><a class="detailList"
								href="inquiry/detail?idx=${bean.inq_seq }" style="color:#464646;">${bean.user_id }</a></td>
							<td style="width: 120px; text-align: center;"><a class="detailList"
								href="inquiry/detail?idx=${bean.inq_seq }" style="color:#464646;">${bean.regi_date }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>


			<div id="addBtn">
				<button class="btn btn-default" type="submit">글쓰기</button>
			</div>

			<div id="pageNum">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li>
							<!-- 이전 페이지 블록으로 이동 :현재 페이지 블럭이 1보다 크면 Previous 버튼을 화면에 출력--> <c:if
								test="${map.boardPager.curBlock > 1}">
								<a href="javascript:list('${map.boardPager.prevPage}')"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a>
							</c:if>
						</li>
						</li>

						<!-- 하나의 블럭에서 반복문 수행 시작페이지 부터 끝 페이지까지  -->
						<c:forEach var="num" begin="${map.boardPager.blockBegin}"
							end="${map.boardPager.blockEnd}">
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
						<li><c:if
								test="${map.boardPager.curBlock <= map.boardPager.totBlock }">
								<a href="javascript:list('${map.boardPager.nextPage}')"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>

								</a>
							</c:if></li>
					</ul>
				</nav>

			</div>
		
						</c:otherwise>
		</c:choose>
			
		</div>
		<!-- 자유게시판 리스트 끝-->



		<div id="inquiryadd">
			<!-- 글쓰기 페이지 -->


			<div class="inquiry">문의하기</div>
			<br>
			<form action="inquiry/add" method="post"
				enctype="multipart/form-data">
			<div class="inq_radiobox">
				<!-- 아이디, 이메일, 날짜, 수정날짜 -->
				<label class="radio-inline"> <input type="radio"
					name="inq_type" id="inlineRadio1" value="상품문의" checked="checked">상품문의
				</label> <label class="radio-inline"> <input type="radio"
					name="inq_type" id="inlineRadio2" value="취소/변경/환불"> 취소/변경/환불
					문의
				</label> <label class="radio-inline"> <input type="radio"
					name="inq_type" id="inlineRadio3" value="예약/결제 문의"> 예약/결제 문의
				</label> <label class="radio-inline"> <input type="radio"
					name="inq_type" id="inlineRadio4" value="이용문의"> 이용문의
				</label> <label class="radio-inline"> <input type="radio"
					name="inq_type" id="inlineRadio5" value="계정 관련 문의"> 계정 관련 문의
				</label> <label class="radio-inline"> <input type="radio"
					name="inq_type" id="inlineRadio6" value="기타 문의"> 기타 문의
				</label>
				</div>
				<div>
					<input type="text" name="inq_title" class="form-control"
						placeholder="제목을 입력해주세요">
				</div>
				<div>
					<textarea id="summernote" class="summernote" name="inq_content"
						rows="" cols="" style="height: 500px;"></textarea>
				</div>

				<div id="addBtns">
					<button class="btn btn-primary" type="submit">등록하기</button>
					<button class="btn btn-default" type="reset">취소</button>
				</div>

			</form>

		</div>
		<!-- 글쓰기 페이지 끝-->

	</div>



	<!-- 여기까지 컨텐츠입니다 -->
	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>


</body>
</html>