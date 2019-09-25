<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../template/header.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
#img {
	width: 100%;
}

#carousel img {
	width: 100%;
}

.card {
	height: 240px;
	width: 100%;
	border-radius: 5px;
	display: inline-block;
	margin-top: 30px;
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
	background-size: 100%;
	background-repeat: no-repeat;
}

.card:hover .card-header {
	opacity: 0.8;
	height: 120px;
}

/*모집중  */
.card-header-is_closed {
	background-color: #EF5A31;
	color: #FFF;
	font-weight: bold;
	text-align: center;
	float: right;
	border-radius: 50%;
	font-weight: bold;
	padding: 10px 10px;
	line-height: 20px;
}

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
	height: 2.4em;
	px; /* 위에서부터 보여주는 높이 */
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
	margin-top: 110p;
	float: right;
}

.hashtag {
	text-align: center;
}
</style>


</head>
<body>


	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="row">
			<div class="col-sm-6 col-md-12">

				<!-- 컨텐츠의 내용을 입력하세요 -->
				<div class="col-md-offset-2 col-sm-6 col-md-8">
					<br>
					<div id="roomInfo">
						<%
							ArrayList<String> thumbList = (ArrayList<String>) request.getAttribute("thumbList");
						%>
						<div class="row">
							<div class="col-md-6">
								<div id="carousel-example-generic" class="carousel slide"
									data-ride="carousel">
									<!-- Indicators -->
									<ol class="carousel-indicators">
										<li data-target="#carousel-example-generic" data-slide-to="0"
											class="active"></li>
										<%
											for (int i = 1; i < thumbList.size(); i++) {
										%>
										<li data-target="#carousel-example-generic"
											data-slide-to="<%=i%>"></li>
										<%
											}
										%>
									</ol>

									<!-- Wrapper for slides -->

									<div id="carousel" class="carousel-inner" role="listbox">
										<div class="item active">
											<img src="<%=thumbList.get(0)%>" alt="이미지">
										</div>
										<%
											for (int i = 1; i < thumbList.size(); i++) {
										%>
										<div class="item">
											<img src="<%=thumbList.get(i)%>" alt="이미지">
										</div>
										<%
											}
										%>
									</div>

									<!-- Controls -->
									<a class="left carousel-control"
										href="#carousel-example-generic" role="button"
										data-slide="prev"> <span
										class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="right carousel-control"
										href="#carousel-example-generic" role="button"
										data-slide="next"> <span
										class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>

							</div>
							<div class="col-md-6">
							<div class="row">
								<!-- 방 정보 오른쪽 부분 -->
								<%
									String hotelTitle = (String) request.getAttribute("hotelTitle");
									String hotelAdd = (String) request.getAttribute("hotelAdd");
									String hotelRate = (String) request.getAttribute("hotelRate");
								%>
								<h2><%=hotelTitle%></h2>
								<p><%=hotelAdd%></p>
							</div>
						<div id="map" class="form-control " style="width: 100%; height: 100%;">
						<%
							String mapy = (String) request.getAttribute("mapy");
							String mapx = (String) request.getAttribute("mapx");
						%>
						<input id="mapx" type="hidden" value="<%=mapx%>"> <input
							id="mapy" type="hidden" value="<%=mapy%>">
						<div id="map" style="width: 100%; height: 250px;"></div>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f5f158f6a04f8c297bf6844e97ae3cf"></script>
						<script>
							var mapx = $('#mapx').val();
							var mapy = $('#mapy').val();
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new kakao.maps.LatLng(mapy, mapx), // 지도의 중심좌표
								level : 2
							// 지도의 확대 레벨
							};

							var map = new kakao.maps.Map(mapContainer,
									mapOption); // 지도를 생성합니다

							// 마커가 표시될 위치입니다 
							var markerPosition = new kakao.maps.LatLng(mapy,
									mapx);

							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								position : markerPosition
							});

							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);

							// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
							// marker.setMap(null);
						</script>
					</div>
							</div>
						</div>
					</div>
					<!-- 방가격 및 정보 -->
					<div id="roomPrice">
						<%
							ArrayList<String> roomTitle = (ArrayList<String>) request.getAttribute("roomTitle");
							ArrayList<String> roomPrice = (ArrayList<String>) request.getAttribute("roomPrice");
							ArrayList<String> roomImgs = (ArrayList<String>) request.getAttribute("roomImgs");
							String root = request.getContextPath();
						%>
						<div class="row">
							<div class="col-sm-6 col-md-12">
								<%
									for (int i = 0; i < roomTitle.size(); i++) {
								%>
									<div class="col-md-6">
											<div class="card">
												<!-- 카드 헤더 -->
												<div class="card-header" style="background-image: url('<%=roomImgs.get(i)%>')"></div>
												<!--  카드 바디 -->
												<div class="card-body">
													<!--  카드 바디 헤더 -->
													<div class="card-body-header">
														<p><%=roomTitle.get(i)%><p>
										<span class="card-body-hashtag"><%=roomPrice.get(i)%></span>
										<c:choose>
											<c:when test="${empty sessionScope.id }">
													<button class="form-control" data-toggle="modal"
														data-target="#myModal">
														<span style="color: red">로그인</span> 후 결제 가능합니다
													</button>
											</c:when>
											<c:otherwise>
												<form action="<%=root%>/pay" method="post">
													<button class="form-control" role="button">결제</button>
													<input type="hidden" name="checkIn" value="<%=request.getParameter("date1")%>">
													<input type="hidden" name="checkOut" value="<%=request.getParameter("date2")%>">
													<input type="hidden" name="payType" value="숙박결제"> 
													<input type="hidden" name="name" value="<%=hotelTitle %><%=roomTitle.get(i)%>">
													<%
														String roomVal = roomPrice.get(i);
														roomVal = roomPrice.get(i).replace("원", "");
														roomVal = roomVal.replace(",", "");
													%>
													<input id="amount" type="hidden" name="amount" value="<%=roomVal%>">
												</form>
											</c:otherwise>
										</c:choose>
										<br>
												</div>
												<!--  카드 바디 본문 -->
												<!--  카드 바디 푸터 -->
												<div class="card-body-footer"></div>
											</div>
											<br>
										</div>
										
										
								</div>
								
								<%
									}
								%>

							</div>
						</div>


					</div>
					<!-- 방가격 및 정보 끝 -->

					<div id="info">
						<%
							ArrayList<String> info1List = (ArrayList<String>) request.getAttribute("info1List");
							ArrayList<String> info2List = (ArrayList<String>) request.getAttribute("info2List");
						%>
						<%
							for (int i = 0; i < info2List.size(); i++) {
						%>
						<table class="table">
							<tr>
								<th><h3><%=info1List.get(i + 1)%></h3></th>
							</tr>
							<tr>
								<td><p><%=info2List.get(i)%></p></td>
							</tr>
						</table>
						<%
							}
						%>


					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 여기까지 컨텐츠입니다 -->
	<div class="jumbotron2">
	<jsp:include page="../template/footer.jsp"></jsp:include>
	</div>

</body>
</html>