<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="org.springframework.ui.Model"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">

#pageNum{
	text-align: center;
}
#selectV a{
	display: block;
	height: 180px;
}
#siBtn{
text-align: center;
}


.card {
	height: 233px;
	width: 100%;
	max-width:240px;
	border-radius: 5px;
	display: inline-block;
	margin-top: 20px;
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
	height: 170px;
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

#selectRegion{
	width:100%;
}


</style>

	<script type="text/javascript">
		function sigunChg(){
			location.href='reCourseList?region='+$('#selectRegion').val();
		}
	</script>


</head>
<body>
	
	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="row">
			<div class="col-md-12">
			<div class="row">
				<div class="col-md-offset-2 col-md-10">
				<h1>Tour <small> Information</small></h1>
		<!-- 	<form action="reCourseList"> -->
				<div class="col-md-2">
				<select id="selectRegion" class="form-control" name="region" onchange="sigunChg()">
					<option value="서울시전체" >지역을 선택하세요</option>
					<option value="서울시전체" >서울</option>
					<option value="인천시전체" >인천</option>
					<option value="대전시전체" >대전</option>
					<option value="광주시전체">광주</option>
					<option value="부산시전체">부산</option>
					<option value="울산시전체" >울산</option>
					<option value="세종특별시전체">세종시</option>
					<option value="경기도시전체">경기도</option>
					<option value="강원도시전체">강원도</option>
					<option value="충청북도시전체">충청북도</option>
					<option value="충청남도시전체">충청남도</option>
					<option value="경상북도시전체">경상북도</option>
					<option value="경상남도시전체">경상남도</option>
					<option value="전라북도시전체">전라북도</option>
					<option value="전라남도시전체">전라남도</option>
					<option value="제주시전체">제주</option>
				</select>
				</div>
				<div class="col-md-1">
		<!--	<button class="form-control">검색</button>	-->
				</div>
		<!--	</form>	-->
				</div>
			</div>
			<div class="row">
			</div>
				<div class="col-md-offset-1 col-md-1">
				
				</div>
				<!-- 컨텐츠의 내용을 입력하세요 -->
				<div class="col-md-8">
				
				
						<%
							String jsonRoom = (String) request.getAttribute("data");
							//System.out.println(jsonRoom);
							JsonParser jsonParser = new JsonParser();
							JsonObject jsonObject = (JsonObject) jsonParser.parse(jsonRoom);
							JsonObject dataObject = (JsonObject) jsonObject.get("response");
							//System.out.println(dataObject);
							JsonObject dataObject2 = (JsonObject) dataObject.get("body");
							String totalPage=dataObject2.get("totalCount").toString();
							String paperNumber=dataObject2.get("numOfRows").toString();
							//페이지 넘버링을 위한 total
							int paperNum=Integer.parseInt(paperNumber);
							int total=Integer.parseInt(totalPage);
							//System.out.println(paperNum);
							
							JsonObject dataObject3 = (JsonObject) dataObject2.get("items");
							String source = dataObject3.toString();
							//System.out.println(source);
							JsonParser parser = new JsonParser();
							JsonObject item =null;
							try{
							item = (JsonObject) parser.parse(source);
							
							JsonArray arr = (JsonArray) item.get("item");
							//System.out.println(item);							
							for (int i = 0; i < arr.size(); i++) {
								int val=(i+1)*100;
								JsonObject tmp = (JsonObject) arr.get(i);
								String title = (tmp.get("title")).toString();
								String id = (tmp.get("contentid")).toString();
								String type = (tmp.get("contenttypeid")).toString();
								String img = "imgs/no_img.gif";
								if (tmp.has("firstimage")) {
									img = (tmp.get("firstimage")).toString();
									img = img.replace("\"", "");
								}
								// 								System.out.println("tmp="+addr);
								// 								System.out.println(tmp);
								title = title.replace("\"", "");
								title = title.replace("[한국관광 품질인증/Korea Quality]", "");
// 								String title2=title;
// 								if(title.length()>15){
// 									title2=title.substring(0, 14)+"...";
// 								}
						%>
						
						  <div class="col-xs-6 col-md-3">
						    <a href="courseDetail?id=<%=id%>&type=<%=type%>&val=<%=val%>">
							<div class="card">
								<!-- 카드 헤더 -->
								<div class="card-header"
									style="background-image: url('<%=img%>')"></div>
								<!--  카드 바디 -->
								<div class="card-body">
									<!--  카드 바디 헤더 -->
									<div class="card-body-header">
									<p style="overflow: hidden; color: gray;"><%=title%></p>
									</div>
									<p class="card-body-description" style="overflow: hidden;"></p>
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
							}catch(Exception e){
							}
						%>
				</div>
				
				<div class="row">
				<div class="col-md-12">
				<div id="pageNum">
						<nav>
							<ul class="pagination">
							<%
								//total = 리스트의 총 갯수
								//pageNum = 한개의 페이지에서 출력할 리스트의 개수
								//totalPageN= 페이징 넘버
								//start=pageN의 처음 번호
								//endN=pageN왼쪽으로 넘어가는 갯수
								//end2N=pageN오른쪽으로 넘어가는 갯수
							int totalPageN = total/paperNum;
							String param=request.getParameter("idx");
							if(param==null)param="1";
							int pageN=Integer.parseInt(param);
							//System.out.println(pageN);
							
							int start=((pageN-1)/5)*5;
							if(((totalPageN+1)==pageN)){
								
							}else if(pageN%5==0){
								start=start+5;
							}
							
							if(start<1){
								start=0;
							}
							int end=total/paperNum;
							if(total%paperNum!=0){
								if((total-1)%paperNum!=0){
									end++;
								}
							}
							int end2=end;
							if(start+5<end){
								end=start+5;
							}
							int endPage=pageN+1;
							
							int endN=pageN-5;
							if(endN<=0){
								endN=1;
							}
							
							int end2N=pageN+5;
							if(end2N>=totalPageN){
								end2N=totalPageN+1;
							}
							if((total-1)%paperNum==0){
								end2N=totalPageN;
							}
							
							String sigun=request.getParameter("region");
							if(sigun==null){
								sigun="서울시전체";
							}
							%>
							
								<li>
								<a href="bookingCourse?idx=<%=endN%>&region=<%=sigun %>" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								</a>
								</li>
								<%
								for(int i=start; i<end; i++){
								%>
								<li>
								<a href="bookingCourse?idx=<%=i+1%>&region=<%=sigun %>"><%=i+1 %></a>
								</li>
								<%}%>
								<li>
								<a href="bookingCourse?idx=<%=end2N%>&region=<%=sigun %>" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								</a>
								</li>
							</ul>
						</nav>
					</div>
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