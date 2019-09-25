<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../template/header.jsp"></jsp:include>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap"	rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-datetimepicker/2.7.1/css/bootstrap-material-datetimepicker.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-datetimepicker/2.7.1/js/bootstrap-material-datetimepicker.min.js"></script>
<style type="text/css">
#searchBar {
	text-align: center;
}

.card {
	max-width: 240px;
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
	width: 242px;
	height: 200px;
	border-radius: 4px 4px 0 0;
	background-size: 240px 242px;
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
	margin: 15px 15px 0 0;
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
<script type="text/javascript">
		function citySelect(province){
// 			alert('변경');
			$.ajax({
				url:'searchCode',
				type:'POST',
				dataType:'json',
				data : {param:province},
				success:function(result){
// 					alert(result);
					//select box 초기화
					$('#region').find('option').remove().end().append('<option value="">지역을 선택</option>');
					//option 추가
					$.each(result, function(i){
						$('#region').append('<option value="'+result[i]+'">'+result[i]+'</option>');
					});
				},
				erro:function(jqXHR, textStatus, errorThrown){
					alert('오류가 발생했습니다');
				}
			});
		}

</script>
</head>
<body>


	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="row">
			<div class="col-md-12">

				<!-- 컨텐츠의 내용을 입력하세요 -->
				<div class="col-md-offset-2 col-md-8">
					<h1>Hotel <small> 예약</small></h1>
					<div id="searchBar" class="row">
						<form action="searchRoom" class="form-inline">
							<div class="form-group">
								<select style="width: 120px" id="province" name="province"
									onchange="citySelect(this.value);" class="form-control">
									<option value="">지역</option>
									<option value="seoul">서울</option>
									<option value="busan">부산</option>
									<option value="jeju">제주</option>
									<option value="gangwon">강원</option>
									<option value="geunggi">경기</option>
									<option value="incheon">인천</option>
									<option value="geungsang">경상</option>
									<option value="junla">전라</option>
									<option value="chungcheng">충청</option>
								</select>
								<select style="width: 260px" class="form-control" id="region"
									name="region">
									<option value="">지역을 선택하세요</option>
								</select>


							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<script>
								    $(function () {
								        $('#checkIn').bootstrapMaterialDatePicker({
								        	weekStart : 0,
								            time: false
								        });
								    });
								</script>
								<input style="width: 150px" class="result form-control"
									type="text" id="checkIn" name="checkIn" placeholder="체크인">
							</div>
							<div class="form-group">
								<script>
								    $(function () {
								        $('#checkOut').bootstrapMaterialDatePicker({
								        	weekStart : 0,
								            time: false
								        });
								    });
								</script>
								<input style="width: 150px" class="result form-control"
									type="text" id="checkOut" name="checkOut" placeholder="체크아웃">
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<input style="width: 140px" name="persons" type="number"
									class="form-control" id="checkOut" placeholder="인원수(성인)">
							</div>
							<button type="submit" class="btn btn-primary">검색</button>
						</form>


					</div>

					<%
		ArrayList<String> priceList = (ArrayList)request.getAttribute("priceList");
		ArrayList<String> titleList = (ArrayList)request.getAttribute("titleList");
		ArrayList<String> imgs = (ArrayList)request.getAttribute("imgs");
		ArrayList<String> idList = (ArrayList)request.getAttribute("idList");
		ArrayList<String> idList2 = (ArrayList)request.getAttribute("idList2");
		ArrayList<String> regionList = (ArrayList)request.getAttribute("regionList");
		String checkInDate = (String)request.getAttribute("checkInDate");
		String checkOutDate = (String)request.getAttribute("checkOutDate");
		
		for(int i=0; i<priceList.size(); i++){
	%>

					<div class="col-xs-6 col-sm-4 col-md-3">
						<a href="booking/hotelDetail?id1=<%=idList.get(i) %>&id2=<%=idList2.get(i) %>&date1=<%=checkInDate %>&date2=<%=checkOutDate %>">
							<div class="card">
								<!-- 카드 헤더 -->
								<div class="card-header"
									style="background-image: url('<%=imgs.get(i)%>')"></div>
								<!--  카드 바디 -->
								<div class="card-body">
									<!--  카드 바디 헤더 -->
									<div class="card-body-header">
									<%
										String title = titleList.get(i);
										if(title.length()>14){
											title=title.substring(0,13)+"...";
										}
									%>
										<p style="color: gray;"><%=title%><p>
										<span class="card-body-hashtag"><%=regionList.get(i)%></span>
										<br>
										<p class="card-body-nickname"><%=priceList.get(i)%></p>
									</div>
									<!--  카드 바디 본문 -->
									<!--  카드 바디 푸터 -->
									<div class="card-body-footer"></div>
								</div>
							</div>
						</a>
					</div>

					<%
					if((i+1)%4==0){
						%>
					<div class="row"></div>
					<%
					}
		}
	%>


				</div>
			</div>
		</div>
	</div>
	<!-- 여기까지 컨텐츠입니다 -->
	<br/><br/>
	<div class="jumbotron2">
	<jsp:include page="../template/footer.jsp"></jsp:include>
	</div>
</body>
</html>