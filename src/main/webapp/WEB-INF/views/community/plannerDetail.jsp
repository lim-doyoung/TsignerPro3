<%@page import="com.bit.tsigner.model.entity.CommunityVo"%>
<%@page import="com.bit.tsigner.model.entity.PlannerVo"%>
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
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>

<!-- ekeditor -->
<script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>

<script type="text/javascript" src="js/summernote.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>


<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
 -->
 <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>

<style type="text/css">

	.planner{
	}
	
	.mapDiv{
		height:600px;
	
	}
	
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
	
	#detailBb {
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
	
	/*투게더 날짜 */
	.date1 {
	  position: relative;
	  top: 0;
	  left: 0;
	  background-color: #77d7b9;
	  color: #fff;
	  padding: 0.8em;
	  margin-left:-20px; 
	  width:100%; 
	  height: 50px; 
	}
	.date1 span {
	/*   display: block; */
	  text-align: center;
	}
	.date1 .day {
	  font-weight: 700;
	  font-size: 24px;
	  text-shadow: 2px 3px 2px rgba(0, 0, 0, 0.18);
	}
	.date1 .month {
	  text-transform: uppercase;
	  font-weight: 600;
	  font-size: 24px;
	  text-shadow: 2px 3px 2px rgba(0, 0, 0, 0.18);
	}
	
	.date1 .year {
	 font-size: 20px;
	 font-weight: 600;
	 text-shadow: 2px 3px 2px rgba(0, 0, 0, 0.18);
	}
	.planContent {
	 margin: auto;
	 margin-top:70px;  
	 align-content: center;
	}
	.jumbotron{
	 align-content: center; 
	 height: 170px; 
	 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); 
	 border-radius: 5px;
	}
	#mapImg{
	 width:100%; 
	 height:600px; 
	 margin: auto;
	}
	#row{
	 height: 600px;
	}
	#dateSelect{
	 margin-left:-45px; height: 50px; width: 150px;
	 border-radius: 0px;
	}
	.dateCh{
	 height:50px;
	}
	.detailDay{
	 margin-top: 20px; 
	 overflow:scroll; 
	 height: 530px;
	}
	.detailDay .jumbotron{
		background-color:white; ; 
		align-content: center;  
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); 
		border-radius: 3px; 
		height: 50px; 
		width: 335px;
	
	}
	.detailDay .jumbotron h4{
	 margin-top: -30px; margin-left:-20px; font-size: 16px;
	}
	
	.jumbotron .addr{
	 margin-top: 20px; margin-left:-20px; font-size: 12px;
	}
	
	.jumbotron .money{
	 float:right; margin-top: -40px; font-size: 12px; margin-right: -40px;
	}
	
	.infoWindow{
		width: 150px;
	}
	
	.circle {
				background-color:#0B0B3B; height:18px; width:18px;
	            border-radius:9px; -webkit-border-radius:9px; -moz-border-radius:9px;
				text-align:center; line-height:18px; 
				color:#FFF; font-size:9px; font-weight:bold; font-family:verdana;
				position:relative;
				left: 12px;
				bottom: 32px;
		}

	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .infotitle {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 14px;font-weight: bold;}
    .info .infoclose {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .infoclose:hover {cursor: pointer;}
    .info .infobody {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .infoimg {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .infolink {color: #5085BB;}
    
    .locDetailDiv{
    	cursor: pointer;
    }
    .planContent {
		 margin: auto;
		 margin-top:70px;  
		 align-content: center;
		}    	
	
	.loadImg{
		width: 100px;
		height: 100px;
	}
	
	.clickPagingNo{
		cursor: pointer;
	}
	
	#planList{
		height: 400px;
	}
	
	#planList>div:nth-child(1){
		height: 330px;
	}
	
	.tableClick{
		cursor: pointer;
	}
	
	.locDetailDiv{
		cursor: pointer;
	}
    
</style>

<script type="text/javascript">
	//pdf다운로드
	function pdfDown(){
		if($('#editPlannerCode').val()=='' || $('#editPlannerCode').val()==null){
			alert('플래너를 등록해주세요');
			return false;
		}
		var newWindow = window.open('pdfDown');
	
		newWindow.location.href='planner/pdfDown?code='+$('#editPlannerCode').val();
	}
	 var dataArray;
	 var plannerDataArr;

	//페이지이동
		function clickPage(seq){
			
			var tableTxt='';

			//다음,이전페이지 페이징처리
			if(seq=='p'){
				if(Number($('.planpagination').find('li[class=active]').text())==1){
					seq=1;
				}else{
					seq=Number($('.planpagination').find('li[class=active]').text())-1;
				}
			}else if(seq=='n'){
				if(Number($('.planpagination').find('li[class=active]').text())==Math.ceil(plannerDataArr.length/3)){
					seq=Number($('.planpagination').find('li[class=active]').text());
				}else{
					seq=Number($('.planpagination').find('li[class=active]').text())+1;
				}
			}

			var maxCnt=0;
			if(plannerDataArr.length>seq*3){
				maxCnt=seq*3;
			}else{
				maxCnt=plannerDataArr.length
			}

			var startI=0;
			startI=(seq-1)*3;
			
			for(var i=startI;i<maxCnt;i++){
				tableTxt+='<tr class="tableClick" onclick="settingPlanner(\''+plannerDataArr[i].PLAN_CODE+'\')">';
				tableTxt+='<td><img src="'+plannerDataArr[i].LOC_IMG_URL+'" class="loadImg"></td>';
				tableTxt+='<td><p style="margin-top: 40px; font-weight: bold;">'+plannerDataArr[i].PLAN_TITLE+'</p></td>';
				tableTxt+='<td><p style="margin-top: 40px; font-weight: bold;">2019-08-12 ~ 2019-08-15</p>';
				tableTxt+='<input type="hidden" value="'+plannerDataArr[i].PLAN_CODE+'"></td>';
				tableTxt+='</tr>';
			}

			for(var i=0;i<$('.planpagination>li').length-1;i++){
				$('.planpagination>li').eq(i).removeClass('active');
			}
			
			$('.planpagination>li').eq(seq).addClass('active');
			
			$('#planListTable').html(tableTxt);
			
		}
	 
	function settingPlanner(code){
		// 플래너 불러오기
		var planCode = new Object();
		var planCodeArray = new Array();
		var plannerCode=new Object();
		plannerCode.planCode=code;
		planCodeArray.push(plannerCode);
		
		planCode.planCode=planCodeArray;
	
		var planCode = JSON.stringify(planCode);
		
		$.ajax({
			url:"loadPlanner",
			data:planCode,
			method:"post",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success:function(data){
				dataArray=data;
				console.log('새로불러옴'+dataArray);
	
				//타이틀변경
				$('.planContent>div').eq(0).find('h1').eq(0).text(data.planMgt[0].plan_title);
	
				//날짜변경
				var ffDt=new Date(data.planMgt[0].trv_from_date);
				ffDt.setDate(ffDt.getDate()+length);
	
				var ffyyyy=ffDt.getFullYear();
				var ffmm=ffDt.getMonth()+1;
				var ffdd=ffDt.getDate();
	
						
				if(ffdd<10) {
					ffdd='0'+ffdd;
				} 
	
				if(ffmm<10) {
					ffmm='0'+ffmm;
				}
	
				var ttDt=new Date(data.planMgt[0].trv_to_date);
				ttDt.setDate(ttDt.getDate()+length);
	
				var ttyyyy=ttDt.getFullYear();
				var ttmm=ttDt.getMonth()+1;
				var ttdd=ttDt.getDate();
	
						
				if(ttdd<10) {
					ttdd='0'+ttdd;
				} 
	
				if(ttmm<10) {
					ttmm='0'+ttmm;
				}
	
				var dateTxt=ffyyyy+'-'+ffmm+'-'+ffdd+' ~ '+ttyyyy+'-'+ttmm+'-'+ttdd;
						
				$('.planContent>div').eq(0).find('p').eq(0).text(dateTxt);
				
				//day박스 생성
				var dayBoxHtml='<option selected="selected" value="0">전체</option>';
				for(var i=0;i<data.planMst.length;i++){
					dayBoxHtml+='<option value="'+(i+1)+'">DAY'+(i+1)+'</option>';
				}
	
				$('#dateSelect').html(dayBoxHtml);
	
				var locBoxHtml='';
				var totDistance=0;
				var totAmt=0;
				//디테일 입력
				for(var i=0;i<data.planDtl.length;i++){
	
					var img;
					if(data.planDtl[i].loc_img_url==null || data.planDtl[i].loc_img_url==''){
						img='imgs/no_img.gif';
					}else{
						img=data.planDtl[i].loc_img_url;
					}
	
					var nameSplit=data.planDtl[i].loc_name.split('[');
					totDistance+=Number(data.planDtl[i].loc_distance);
					totAmt+=Number(data.planDtl[i].loc_bdg);
					
					locBoxHtml+='<div class="locDetailDiv" onclick="clickLabel('+data.planDtl[i].position_y+','+data.planDtl[i].position_x+','+data.planDtl[i].loc_type+',\''+data.planDtl[i].loc_name+'\',\''+data.planDtl[i].loc_img_url+'\',\''+data.planDtl[i].loc_addr+'\',\''+data.planDtl[i].loc_post_code+'\',\''+data.planDtl[i].loc_tel+'\')">';
					locBoxHtml+='	<div class="jumbotron">';
					locBoxHtml+='		<h4>'+nameSplit[0]+'</h4><p class="money">&#8361;'+inputNumberWithComma(data.planDtl[i].loc_bdg)+'</p>';
					locBoxHtml+='		<p class="addr">'+data.planDtl[i].loc_addr+'</p>';
					locBoxHtml+='		';
					locBoxHtml+='	</div>';
					if(i!=(data.planDtl.length-1)){
						var disKm=data.planDtl[i+1].loc_distance/1000;
						locBoxHtml+='	<p><i class="fas fa-chevron-down" style="margin: auto; text-align: center; align-content: center;"></i> 이동거리 : '+disKm.toFixed(2)+'km</p>';
					}
					locBoxHtml+='<input type="hidden" id="contenttypeid" value="'+data.planDtl[i].loc_type+'"/><input type="hidden" id="mapx" value="'+data.planDtl[i].position_x+'"/>';
					locBoxHtml+='<input type="hidden" id="mapy" value="'+data.planDtl[i].position_y+'"/><input type="hidden" id="zipcode" value="'+data.planDtl[i].loc_post_code+'"/>';
					locBoxHtml+='<input type="hidden" id="contentid" value="'+data.planDtl[i].content_id+'"/><input type="hidden" id="firstimage" value="'+img+'"/>';
					locBoxHtml+='<input type="hidden" id="tel" value="'+data.planDtl[i].loc_tel+'"/><input type="hidden" id="overview" value="'+data.planDtl[i].overview+'"/>';
					locBoxHtml+='<input type="hidden" id="budget" value="'+data.planDtl[i].loc_bdg+'"/><input type="hidden" id="locMemo" value="'+data.planDtl[i].loc_memo+'"/>';
					locBoxHtml+='</div>';
					
				}
				
				var totDistanceKm=totDistance/1000;
				locBoxHtml+='	<p><i class="fas fa-chevron-down" style="margin: auto; text-align: center; align-content: center;"></i> 총 이동거리 : '+totDistanceKm.toFixed(2)+'km</p>';
				locBoxHtml+='<p>&nbsp;&nbsp;&nbsp;&nbsp;총 소모비용 : '+inputNumberWithComma(totAmt)+'원</p>';
	
				$('.detailDay').html(locBoxHtml);
	
				var fromDt=new Date(data.planMgt[0].trv_from_date);
				fromDt.setDate(fromDt.getDate());
	
				var monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN",
					  "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
					];
				
				var yyyy=fromDt.getFullYear();
				
				var mm=monthNames[fromDt.getMonth()];
				var dd=fromDt.getDate();
	
				if(dd<10) {
				    dd='0'+dd;
				} 
	
				if(mm<10) {
				    mm='0'+mm;
				}
	
				
				var dayTxtHtml='';
				
				dayTxtHtml+='<span class="month">'+mm+'';
				dayTxtHtml+='<span class="day">,'+dd+'</span>';
				dayTxtHtml+='<span class="year"> '+yyyy+'</span>';
				dayTxtHtml+='</span>';
				
				$('.date1').html(dayTxtHtml);
				
				loadPlanner(data.planDtl,0);
				$('#editPlannerCode').val(data.planMgt[0].plan_code);
				$('#popupClose').click();
			}
			
		});
	}
	$(document).ready(function(){
		levUp();
	});
	function levUp(){
		var levUp=$('#levUp').val();
		if(levUp!="null"){
				alert(levUp);
		}
	}
	//플래너리스트 불러오기
	function loadMyPlanner(){

		var userId='${sessionScope.id }';
		
		$.ajax({
			url:"load/loadPlannerList",
			data:{userId},
			method:"GET",
			dataType:"json"
		}).done(function(data){
			
			plannerDataArr=data;

			console.log(data);	
			
			var tableTxt='';

			var maxCnt=0;
			if(data.length>3){
				maxCnt=3;
			}else{
				maxCnt=data.length
			}
			
			for(var i=0;i<maxCnt;i++){
				tableTxt+='<tr class="tableClick" onclick="settingPlanner(\''+data[i].PLAN_CODE+'\')">';
				tableTxt+='<td><img src="'+data[i].LOC_IMG_URL+'" class="loadImg"></td>';
				tableTxt+='<td><p style="margin-top: 40px; font-weight: bold;">'+data[i].PLAN_TITLE+'</p></td>';
				tableTxt+='<td><p style="margin-top: 40px; font-weight: bold;">2019-08-12 ~ 2019-08-15</p>';
				tableTxt+='<input type="hidden" value="'+data[i].PLAN_CODE+'"></td>';
				tableTxt+='</tr>';
			}

			$('#planListTable').html(tableTxt);
			
			var paginCnt=Math.ceil(data.length/3);
			var pagingHtml='';
			
			
			pagingHtml+='<center><nav aria-label="Page navigation">';
			pagingHtml+='	<ul class="planpagination pagination">';
			
			if(paginCnt>1){
				pagingHtml+='<li><a aria-label="Previous" class="clickPagingNo" onclick="clickPage(\'p\')"><span aria-hidden="true">&laquo;</span></a></li>';
			}
			
			for(var i=1;i<=paginCnt;i++){
				if(i==1){
					pagingHtml+='    <li class="active"><a class="clickPagingNo" onclick="clickPage('+i+')">'+i+'</a></li>';
				}else{
					pagingHtml+='    <li><a class="clickPagingNo" onclick="clickPage('+i+')">'+i+'</a></li>';
				}
			}

			if(paginCnt>1){
				pagingHtml+='    <li><a aria-label="Next" class="clickPagingNo" onclick="clickPage(\'n\')"><span aria-hidden="true">&raquo;</span></a></li>';
			}
			
			pagingHtml+='</ul>';
			pagingHtml+='</nav></center>';

			$('#planList>div').eq(1).html(pagingHtml);

		});

		//플래너번호로 조건달기
		var options={
				show:true
				};
		$('#loadMyPlannerModal').modal(options);
	}

	//게시물 삭제
	function deleteComm(seq){
		var confmRs=confirm('삭제하시겠습니까');

		if(confmRs==true){
			$.ajax({
				url:"comm/deleteComm",
				data:{cmmmSeq:seq},
				method:"get",
				dataType:"json",
				success:function(data){
					alert('삭제되었습니다');
					location.href='community_planner';
				}
			});
		}
	}

	$(document).ready(function() {

		//플래너불러오기
		<%
		String cmmmSeq=request.getParameter("num");
		if(cmmmSeq!=null){
			%>
			var plannerSeq='<%=cmmmSeq%>';
			$('#cmntSequence').val(plannerSeq);
			<%		
		}
		%>
/* 		history.replaceState({}, null, location.pathname); */

		// 플래너 불러오기
		var planCode = new Object();
		var planCodeArray = new Array();
		var plannerCode=new Object();
		plannerCode.planCode=$('#cmntSequence').val();
		planCodeArray.push(plannerCode);
		
		planCode.planCode=planCodeArray;

		var planCode = JSON.stringify(planCode);
		
		$.ajax({
			url:"comm/loadPlanner",
			data:planCode,
			method:"post",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success:function(data){
				dataArray=data;
				console.log('새로불러옴'+dataArray);
				$('#editPlannerCode').val(data.planMgt[0].plan_code);
				//타이틀변경
				$('.planContent>div').eq(0).find('h1').eq(0).text(data.planMgt[0].plan_title);

				//날짜변경
				var ffDt=new Date(data.planMgt[0].trv_from_date);
				ffDt.setDate(ffDt.getDate()+length);
	
				var ffyyyy=ffDt.getFullYear();
				var ffmm=ffDt.getMonth()+1;
				var ffdd=ffDt.getDate();
	
						
				if(ffdd<10) {
					ffdd='0'+ffdd;
				} 
	
				if(ffmm<10) {
					ffmm='0'+ffmm;
				}

				var ttDt=new Date(data.planMgt[0].trv_to_date);
				ttDt.setDate(ttDt.getDate()+length);
	
				var ttyyyy=ttDt.getFullYear();
				var ttmm=ttDt.getMonth()+1;
				var ttdd=ttDt.getDate();
	
						
				if(ttdd<10) {
					ttdd='0'+ttdd;
				} 
	
				if(ttmm<10) {
					ttmm='0'+ttmm;
				}

				var dateTxt=ffyyyy+'-'+ffmm+'-'+ffdd+' ~ '+ttyyyy+'-'+ttmm+'-'+ttdd;
						
				$('.planContent>div').eq(0).find('p').eq(0).text(dateTxt);
				
				//day박스 생성
				var dayBoxHtml='<option selected="selected" value="0">전체</option>';
				for(var i=0;i<data.planMst.length;i++){
					dayBoxHtml+='<option value="'+(i+1)+'">DAY'+(i+1)+'</option>';
				}

				$('#dateSelect').html(dayBoxHtml);

				var locBoxHtml='';
				var totDistance=0;
				var totAmt=0;
				//디테일 입력
				for(var i=0;i<data.planDtl.length;i++){

					var img;
					if(data.planDtl[i].loc_img_url==null || data.planDtl[i].loc_img_url==''){
						img='imgs/no_img.gif';
					}else{
						img=data.planDtl[i].loc_img_url;
					}

					var nameSplit=data.planDtl[i].loc_name.split('[');
					totDistance+=Number(data.planDtl[i].loc_distance);
					totAmt+=Number(data.planDtl[i].loc_bdg);
					
					locBoxHtml+='<div class="locDetailDiv" onclick="clickLabel('+data.planDtl[i].position_y+','+data.planDtl[i].position_x+','+data.planDtl[i].loc_type+',\''+data.planDtl[i].loc_name+'\',\''+data.planDtl[i].loc_img_url+'\',\''+data.planDtl[i].loc_addr+'\',\''+data.planDtl[i].loc_post_code+'\',\''+data.planDtl[i].loc_tel+'\')">';
					locBoxHtml+='	<div class="jumbotron">';
					locBoxHtml+='		<h4>'+nameSplit[0]+'</h4><p class="money">&#8361;'+inputNumberWithComma(data.planDtl[i].loc_bdg)+'</p>';
					locBoxHtml+='		<p class="addr">'+data.planDtl[i].loc_addr+'</p>';
					locBoxHtml+='		';
					locBoxHtml+='	</div>';
					if(i!=(data.planDtl.length-1)){
						var disKm=data.planDtl[i+1].loc_distance/1000;
						locBoxHtml+='	<p><i class="fas fa-chevron-down" style="margin: auto; text-align: center; align-content: center;"></i> 이동거리 : '+disKm.toFixed(2)+'km</p>';
					}
					locBoxHtml+='<input type="hidden" id="contenttypeid" value="'+data.planDtl[i].loc_type+'"/><input type="hidden" id="mapx" value="'+data.planDtl[i].position_x+'"/>';
					locBoxHtml+='<input type="hidden" id="mapy" value="'+data.planDtl[i].position_y+'"/><input type="hidden" id="zipcode" value="'+data.planDtl[i].loc_post_code+'"/>';
					locBoxHtml+='<input type="hidden" id="contentid" value="'+data.planDtl[i].content_id+'"/><input type="hidden" id="firstimage" value="'+img+'"/>';
					locBoxHtml+='<input type="hidden" id="tel" value="'+data.planDtl[i].loc_tel+'"/><input type="hidden" id="overview" value="'+data.planDtl[i].overview+'"/>';
					locBoxHtml+='<input type="hidden" id="budget" value="'+data.planDtl[i].loc_bdg+'"/><input type="hidden" id="locMemo" value="'+data.planDtl[i].loc_memo+'"/>';
					locBoxHtml+='</div>';
					
				}
				
				var totDistanceKm=totDistance/1000;
				locBoxHtml+='	<p><i class="fas fa-chevron-down" style="margin: auto; text-align: center; align-content: center;"></i> 총 이동거리 : '+totDistanceKm.toFixed(2)+'km</p>';
				locBoxHtml+='<p>&nbsp;&nbsp;&nbsp;&nbsp;총 소모비용 : '+inputNumberWithComma(totAmt)+'원</p>';

				$('.detailDay').html(locBoxHtml);

				var fromDt=new Date(data.planMgt[0].trv_from_date);
				fromDt.setDate(fromDt.getDate());

				var monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN",
					  "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
					];
				
				var yyyy=fromDt.getFullYear();
				
				var mm=monthNames[fromDt.getMonth()];
				var dd=fromDt.getDate();

				if(dd<10) {
				    dd='0'+dd;
				} 

				if(mm<10) {
				    mm='0'+mm;
				}

				
				var dayTxtHtml='';
				
				dayTxtHtml+='<span class="month">'+mm+'';
				dayTxtHtml+='<span class="day">,'+dd+'</span>';
				dayTxtHtml+='<span class="year"> '+yyyy+'</span>';
				dayTxtHtml+='</span>';
				
				$('.date1').html(dayTxtHtml);
				
				loadPlanner(data.planDtl,0);
				
			}
			
		});

		
		//day변경
		$('#dateSelect').change(function(){

			var fromDt=new Date(dataArray.planMgt[0].trv_from_date);
			fromDt.setDate(fromDt.getDate()+Number($('#dateSelect').val())-1);

			var monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN",
				  "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
				];
			
			var yyyy=fromDt.getFullYear();
			
			var mm=monthNames[fromDt.getMonth()];
			var dd=fromDt.getDate();

			if(dd<10) {
			    dd='0'+dd;
			} 

			if(mm<10) {
			    mm='0'+mm;
			}

			var dayTxtHtml='';
			
			dayTxtHtml+='<span class="month">'+mm+'';
			dayTxtHtml+='<span class="day">,'+dd+'</span>';
			dayTxtHtml+='<span class="year"> '+yyyy+'</span>';
			dayTxtHtml+='</span>';
			
			$('.date1').html(dayTxtHtml);
			
			console.log(dataArray);
			var locBoxHtml='';
			var totDistance=0;
			var totAmt=0;
			var daySelectObj = new Object();
			var daySelectArr = new Array();
			if($('#dateSelect').val()>0){
				for(var i=0;i<dataArray.planDtl.length;i++){

					var img;
					if(dataArray.planDtl[i].loc_img_url==null || dataArray.planDtl[i].loc_img_url==''){
						img='imgs/no_img.gif';
					}else{
						img=dataArray.planDtl[i].loc_img_url;
					}
	
					if(dataArray.planDtl[i].trv_deg==$('#dateSelect').val()){

						daySelectArr.push(dataArray.planDtl[i]);
						var nameSplit=dataArray.planDtl[i].loc_name.split('[');
						totDistance+=Number(dataArray.planDtl[i].loc_distance);
						totAmt+=Number(dataArray.planDtl[i].loc_bdg);
						locBoxHtml+='<div class="locDetailDiv" onclick="clickLabel('+dataArray.planDtl[i].position_y+','+dataArray.planDtl[i].position_x+','+dataArray.planDtl[i].loc_type+',\''+dataArray.planDtl[i].loc_name+'\',\''+dataArray.planDtl[i].loc_img_url+'\',\''+dataArray.planDtl[i].loc_addr+'\',\''+dataArray.planDtl[i].loc_post_code+'\',\''+dataArray.planDtl[i].loc_tel+'\')">';
						locBoxHtml+='	<div class="jumbotron">';
						locBoxHtml+='		<h4>'+nameSplit[0]+'</h4><p class="money">&#8361;'+inputNumberWithComma(dataArray.planDtl[i].loc_bdg)+'</p>';
						locBoxHtml+='		<p class="addr">'+dataArray.planDtl[i].loc_addr+'</p>';
						locBoxHtml+='		';
						locBoxHtml+='	</div>';
						if(i!=(dataArray.planDtl.length-1) && dataArray.planDtl[i].trv_deg==dataArray.planDtl[i+1].trv_deg){
							var disKm=dataArray.planDtl[i+1].loc_distance/1000;
							locBoxHtml+='	<p><i class="fas fa-chevron-down" style="margin: auto; text-align: center; align-content: center;"></i> 이동거리 : '+disKm.toFixed(2)+'km</p>';
						}
						locBoxHtml+='<input type="hidden" id="contenttypeid" value="'+dataArray.planDtl[i].loc_type+'"/><input type="hidden" id="mapx" value="'+dataArray.planDtl[i].position_x+'"/>';
						locBoxHtml+='<input type="hidden" id="mapy" value="'+dataArray.planDtl[i].position_y+'"/><input type="hidden" id="zipcode" value="'+dataArray.planDtl[i].loc_post_code+'"/>';
						locBoxHtml+='<input type="hidden" id="contentid" value="'+dataArray.planDtl[i].content_id+'"/><input type="hidden" id="firstimage" value="'+img+'"/>';
						locBoxHtml+='<input type="hidden" id="tel" value="'+dataArray.planDtl[i].loc_tel+'"/><input type="hidden" id="overview" value="'+dataArray.planDtl[i].overview+'"/>';
						locBoxHtml+='<input type="hidden" id="budget" value="'+dataArray.planDtl[i].loc_bdg+'"/><input type="hidden" id="locMemo" value="'+dataArray.planDtl[i].loc_memo+'"/>';
						locBoxHtml+='</div>';
					}
					
				}
					daySelectObj.planDtl=daySelectArr;
				
					var totDistanceKm=totDistance/1000;
					locBoxHtml+='	<p><i class="fas fa-chevron-down" style="margin: auto; text-align: center; align-content: center;"></i> 총 이동거리 : '+totDistanceKm.toFixed(2)+'km</p>';
					locBoxHtml+='<p>&nbsp;&nbsp;&nbsp;&nbsp;총 소모비용 : '+inputNumberWithComma(totAmt)+'원</p>';

					loadPlanner(daySelectObj.planDtl,1);
			}else{
				for(var i=0;i<dataArray.planDtl.length;i++){

					var img;
					if(dataArray.planDtl[i].loc_img_url==null || dataArray.planDtl[i].loc_img_url==''){
						img='imgs/no_img.gif';
					}else{
						img=dataArray.planDtl[i].loc_img_url;
					}
					
					var nameSplit=dataArray.planDtl[i].loc_name.split('[');
					totDistance+=Number(dataArray.planDtl[i].loc_distance);
					totAmt+=Number(dataArray.planDtl[i].loc_bdg);
					
					locBoxHtml+='<div class="locDetailDiv" onclick="clickLabel('+dataArray.planDtl[i].position_y+','+dataArray.planDtl[i].position_x+','+dataArray.planDtl[i].loc_type+',\''+dataArray.planDtl[i].loc_name+'\',\''+dataArray.planDtl[i].loc_img_url+'\',\''+dataArray.planDtl[i].loc_addr+'\',\''+dataArray.planDtl[i].loc_post_code+'\',\''+dataArray.planDtl[i].loc_tel+'\')">';
					locBoxHtml+='	<div class="jumbotron">';
					locBoxHtml+='		<h4>'+nameSplit[0]+'</h4><p class="money">&#8361;'+inputNumberWithComma(dataArray.planDtl[i].loc_bdg)+'</p>';
					locBoxHtml+='		<p class="addr">'+dataArray.planDtl[i].loc_addr+'</p>';
					locBoxHtml+='		';
					locBoxHtml+='	</div>';
					if(i!=(dataArray.planDtl.length-1)){
						var disKm=dataArray.planDtl[i+1].loc_distance/1000;
						locBoxHtml+='	<p><i class="fas fa-chevron-down" style="margin: auto; text-align: center; align-content: center;"></i> 이동거리 : '+disKm.toFixed(2)+'km</p>';
					}
					locBoxHtml+='<input type="hidden" id="contenttypeid" value="'+dataArray.planDtl[i].loc_type+'"/><input type="hidden" id="mapx" value="'+dataArray.planDtl[i].position_x+'"/>';
					locBoxHtml+='<input type="hidden" id="mapy" value="'+dataArray.planDtl[i].position_y+'"/><input type="hidden" id="zipcode" value="'+dataArray.planDtl[i].loc_post_code+'"/>';
					locBoxHtml+='<input type="hidden" id="contentid" value="'+dataArray.planDtl[i].content_id+'"/><input type="hidden" id="firstimage" value="'+img+'"/>';
					locBoxHtml+='<input type="hidden" id="tel" value="'+dataArray.planDtl[i].loc_tel+'"/><input type="hidden" id="overview" value="'+dataArray.planDtl[i].overview+'"/>';
					locBoxHtml+='<input type="hidden" id="budget" value="'+dataArray.planDtl[i].loc_bdg+'"/><input type="hidden" id="locMemo" value="'+dataArray.planDtl[i].loc_memo+'"/>';
					locBoxHtml+='</div>';
					
				}
				var totDistanceKm=totDistance/1000;
				locBoxHtml+='	<p><i class="fas fa-chevron-down" style="margin: auto; text-align: center; align-content: center;"></i> 총 이동거리 : '+totDistanceKm.toFixed(2)+'km</p>';
				locBoxHtml+='<p>&nbsp;&nbsp;&nbsp;&nbsp;총 소모비용 : '+inputNumberWithComma(totAmt)+'원</p>';
				loadPlanner(dataArray.planDtl,0);
			}
					
			$('.detailDay').html(locBoxHtml);

		});
		
		//게시물정보 불러오기
		$.ajax({
			url:"load/commDetail",
			data:{cmmmSeq:$('#cmntSequence').val()},
			method:"post",
			dataType:"json",
			success:function(data){
				console.log(data);
				
				var cmnt_content=data.result[0].cmnt_content;
				var cmnt_seq=data.result[0].cmnt_seq;
				var cmnt_filename=data.result[0].cmnt_filename;
				var cmnt_hits=data.result[0].cmnt_hits;
				var cmnt_recom=data.result[0].likeCnt;
				var cmnt_title=data.result[0].cmnt_title;
				var cmnt_type=data.result[0].cmnt_type;
				var cmnt_writer_id=data.result[0].cmnt_writer_id;
				var modi_date=data.result[0].modi_date;
				var plan_code=data.result[0].plan_code;
				var regi_date=data.result[0].regi_date;
				var reply_total=data.result[0].reply_total;

				var modiDate=new Date(modi_date);
				
				//요일,달 포맷
				var week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
				var dayOfWeek = week[modiDate.getDay()];

				var monthNames = ["January", "February", "March", "April", "May", "June",
					  "July", "August", "September", "October", "November", "December"
					];
				
				var yyyy=modiDate.getFullYear();
				
				var mm=monthNames[modiDate.getMonth()];
				var dd=modiDate.getDate();
				
				var edBtnYn='';
				if('${sessionScope.id }'==cmnt_writer_id){
					edBtnYn+='<input id="writer" type="hidden" id="writerId" value="'+cmnt_writer_id+'">';
					edBtnYn+='<input type="hidden" id="user" value="${sessionScope.id }">';
					edBtnYn+='<a onclick="deleteComm(\''+cmnt_seq+'\')" class="btn btn-warning" style="float: right; margin-right: 10px;">Delete</a>';
					edBtnYn+='<button id="edit" class="btn btn-success" style="float: right; margin-right: 10px;" onclick="edit();">Edit</button>';
				}
				
				$('#edBtn').html(edBtnYn);

				var detailB='';

				detailB+='<div class="article">';
				detailB+='	<p>';
				detailB+='	<center>'+dayOfWeek+', '+mm+' '+yyyy+','+dd+'</center>';
				detailB+='	</p>';
				detailB+='	<span style="float: right;"> <i class="fas fa-heart"></i> '+cmnt_recom+'</span>';
				detailB+='	<span style="float: right; margin-right: 10px;"> <i class="fas fa-comment"></i> '+reply_total+' </span>';
				detailB+='	<h1 class="title">'+cmnt_title+'</h1>';
				detailB+='</div>';

				$('#detailB').html(detailB);
	
				$('#detailBb').html('<p class="date" style="margin-top: 50px; line-height: 30px;">'+cmnt_content+'</p>');

				//edit에 정보 불러오기
				$('#title').val(cmnt_title);
				$('#edit_cmnt_seq').val(cmnt_seq);
				
			}
		});
		
	
		//글수정 삭제
		detail();
		
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
	
      function detail(){
		$('#reviewDetail').show();
		$('.reviewEdit').hide();
      }

      function edit(){

		$('#edBtn').hide();
		$('#detailB').hide();
		$('#detailBb').hide();
		$('.btn_like').hide();
		$('.btn_like').hide();
		$('.plannerListGo').hide();
		$('.replyDiv').hide();

    	$('#plannerEditTxt').removeClass('hide');
    	$('.reviewEdit').show();
          
      }

      //수정
      function checkForm(){
          var check=$('input:checkbox[name="check"]').is(":checked");
          var contentCh=$('#summernote').val();
          var titleCh=$('#title').val();
          var content=contentCh.trim();
          var planCode=$('#editPlannerCode').val();
          
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
           if(planCode==""){
               alert('플래너를 등록해주세요');
               return false;
            }
           var cfresult = confirm('수정하시겠습니까?');

   		if(cfresult==false){
   			return false;
   		}

   		var savePlan = new Object();
		var plannerCode=$('#editPlannerCode').val();
		var title=$('#title').val();
		var content=$('#summernote').val();
		var userId='${sessionScope.id }';
		var cmnt_seq=$('#edit_cmnt_seq').val();

		var commPlanArray = new Array();
		var commPlan=new Object();

		commPlan.plannerCode=plannerCode;
		commPlan.title=title;
		commPlan.content=content;
		commPlan.userId=userId;
		commPlan.cmnt_seq=cmnt_seq;

		commPlanArray.push(commPlan);
		savePlan.commPlan=commPlanArray;
		console.log(savePlan);
		var sJson = JSON.stringify(savePlan);
		
		$.ajax({
			url:"planner/commUpdate",
			data:sJson,
			method:"POST",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success: function(data){
				checkOk();
				alert('수정되었습니다');
				location.href='community_plannerDetail?num='+cmnt_seq;
				
				}
		});
   		
       }
      
      function checkReply(){
          var userId=$('#user').val();
          var content=$('#replyContent').val();
          if(userId==""){
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
  		var user='${sessionScope.id }';
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
  						location.href="community_plannerDetail?num="+cmnt_seq;
  					} else if(data=='msg2') {
  						alert('좋아요 취소!');
  						location.href="community_plannerDetail?num="+cmnt_seq;
  					}
  				}
  			});
  		}
        }

   // 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
	    function inputNumberWithComma(str) {
	
	        str = String(str);
	        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
	    }

	  //undefined체크
	    function isEmpty(str){
	         
	        if(typeof str == "undefined" || str == null || str == "")
	            return true;
	        else
	            return false ;
	    }

	    function clickLabel(position_y,position_x,contenttype,title,firstimage,addr1,zipcode,tel){
			//중심이동	 
			moveCenter(position_y,position_x);

			clickDiv(position_y,position_x,contenttype,title,firstimage,addr1,zipcode,tel);

		 }
		 
</script>

</head>
<body>

<%String hello=request.getParameter("hello"); %>
		<input id="levUp" type="hidden" value="<%=hello%>">
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
			<li role="presentation" class="active"><a href="community_planner">플래너</a></li>
         <li role="presentation"><a href="community_bbs">자유게시판</a></li>
         <li role="presentation"><a href="community_together">투게더</a></li>
         <li role="presentation" ><a href="community">여행후기</a></li>
         <li role="presentation"><a href="community_question">질문</a></li>
		</ul>
	</div>

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="container">
			<div id="plannerDetail" class="row" style="width: 100%; margin: 0px auto;">
				<div id="plannerEditTxt" class="hide">
				<br/>
				     <h1 style="font-size: 25px; font-weight: bold; text-align: center;">Planner</h1>
				     <!--                <img id="bgImg" alt="" src="imgs/write.jpg"> <br> <br> -->
				     <br>
				     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">T signer</p>
				     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">여행 숙박 공연 정보를 공유 하고</p>
				     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">함께 여행하자</p>
				     <p><button type="button" class="btn btn-default" onclick="loadMyPlanner()" style="float: right;">플래너 불러오기</button></p>
			     </div>
				<br>
				<!-- 수정 삭제 btn -->
				<div id="edBtn">
					
				</div>
				
				<div id="detailB">
				
				</div>
				<!-- 플래너 상세 -->			
				
				<br>
				
				<div class="planContent">
					<div class="jumbotron" style="">
					  <h1 style="margin-top: -20px; font-size: 40px;"></h1>
					  <p style="margin-top: 20px;"></p>
					  <a class="btn btn-primary btn-sm" onclick="pdfDown()" role="button" style="margin-left: 85%; margin-top: -30px;">PDF DOWNLOAD</a>
					</div>
				</div>
				
				
				<div class="planner">
					<div class="row">
						<!-- map -->
						<div class="col-sm-8 mapDiv">
							<div id="map" style="width:100%;height:100%;"></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d5e477e33c96b52224f709e9c28161c"></script>
							<script>
								var markers = [];
				                var smarkers = [];
				                var cmarkers = [];
				                var xPosition,yPosition;
				                var selectedMarker = null;
				                var overlay,bfcontenttype,bfsal,bfposition;
								var tempCustom=new Array();
								var tempPoly=new Array();
				                
				                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				                    mapOption = { 
				                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				                        level: 5 // 지도의 확대 레벨
				                    };
	
				                // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				                var map = new kakao.maps.Map(mapContainer, mapOption); 
				                var positions = [];
	
				                    // 마커 이미지의 이미지 주소입니다
				                    var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerstar.png"; 
	
				                    for (var i = 0; i < positions.length; i ++) {
	
				                        // 마커 이미지의 이미지 크기 입니다
				                        var imageSize = new kakao.maps.Size(24, 35); 
	
				                        // 마커 이미지를 생성합니다    
				                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	
				                        // 마커를 생성합니다
				                        var marker = new kakao.maps.Marker({
				                            map: map, // 마커를 표시할 지도
				                            position: positions[i].latlng, // 마커를 표시할 위치
				                            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				                            image : markerImage // 마커 이미지 
				                        });
				                    }

				                  //플래너 불러오기
									function loadPlanner(dataArray,dayYn){
										//저장된 마커삭제
										removesMarker();
										
										//커스텀오버레이 초기화
										
										for(var i=0;i<tempCustom.length;i++){
											tempCustom[i].setMap(null);
											tempPoly[i].setMap(null);
										}
										$('div').remove( '.dotOverlay' );
												
										var positionArr=new Array();
									    var fragment = document.createDocumentFragment(), 
									    bounds = new kakao.maps.LatLngBounds(), 
									    listStr = '';
										var valX=0;
										var valY=0;
										var cnt=0;
										var totDistance=0;
										for ( var i=0; i<dataArray.length; i++ ) {

											if(isEmpty(dataArray[i].position_y==true || dataArray[i].position_x)==true){
												dataArray[i].position_y=0;
												dataArray[i].position_x=0;
												cnt++;
											}
											var data=dataArray[i];
											valX+=parseFloat(dataArray[i].position_y);
											valY+=parseFloat(dataArray[i].position_x);
											var marker;
									        // 마커를 생성하고 지도에 표시합니다
									        var placePosition = new kakao.maps.LatLng(dataArray[i].position_y, dataArray[i].position_x);
									        if(dayYn==0){
									        	marker = addMarker(placePosition, dataArray[i].trv_deg,dataArray[i].loc_type,data); 
									        }else if(dayYn==1){
									        	marker = addMarker(placePosition, i+1,dataArray[i].loc_type,data); 
										    }
									  //          itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

									        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
									        // LatLngBounds 객체에 좌표를 추가합니다
									        bounds.extend(placePosition);


											//position배열에 latlanObj 푸쉬
									        var latlanObj=new Object();
											latlanObj.title=dataArray[i].loc_name;
											latlanObj.latlng=new kakao.maps.LatLng(dataArray[i].position_y, dataArray[i].position_x);
											positions.push(latlanObj);

										}
										
										valX=valX/(dataArray.length-cnt);
										valY=valY/(dataArray.length-cnt);
										var placePosition = new kakao.maps.LatLng(valX, valY);
										map.setCenter(placePosition);
										var level = map.getLevel();
									    // 지도의 레벨을 변경합니다
									    map.setLevel(10);

									    //선긋기
									    var linePath;
									    var lineLine=new kakao.maps.Polyline();
									    var distance;
									    var dayDeg=0;
									    var tempDistance='';
									    for(var i=0;i<positions.length;i++){
											if(i!=0){
												linePath = [ positions[i - 1].latlng, positions[i].latlng ]
												if(dataArray[i-1].trv_deg!=dataArray[i].trv_deg){
													dayDeg++;
												}
											}
											
											lineLine.setPath(linePath);

											var colorCal,color;

											colorCal=(parseInt((0xff0000).toString(10))-parseInt((0x7b85c).toString(10))*dayDeg).toString(16);
											color='#'+colorCal;
											
											var drawLine = new kakao.maps.Polyline({
									            map : map, // 선을 표시할 지도입니다 
									            path : linePath,
									            strokeWeight : 1, // 선의 두께입니다 
									            strokeColor : 'red', // 선의 색깔입니다
									            strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
									            strokeStyle : 'solid' // 선의 스타일입니다
									        });

											tempPoly.push(drawLine);
											
											distance=Math.round(lineLine.getLength());

											totDistance+=parseFloat(distance);


											if(i<positions.length-1){
												tempDistance+=distance+',';
											}else if(positions.length-1==i){
												tempDistance+=distance;
												$('#storeDistance').val(tempDistance);
											}
											
											if(positions.length-1==i){
												var disKm=totDistance/1000;
												$('#txtViewDis').html('<span>총 이동거리 : '+disKm.toFixed(2)+'km</span>');
											}
										}

									    
									}

									//거리계산함수
									function displayCircleDot(position,distance){
										if(distance>0){
											var distanceOverlay=new kakao.maps.CustomOverlay({
												content:'<div class="dotOverlay"><span class="number">'+distance+'</span>m</div>',
												position:position,
												yAnchor:1,
												zIndex:2
											});
											distanceOverlay.setMap(map);
										}
									}
									
									
									// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
									function addMarker(position, idx, contenttype,data) {
										var imgSrc;
										var sal=1;
										
										if(contenttype=='12'){
											imgSrc='imgs/loadTour.png';
										}else if(contenttype=='32'){
											imgSrc='imgs/loadHotel.png';
										}else if(contenttype=='39'){
											imgSrc='imgs/loadFood.png';
										}
									    var imageSrc = imgSrc, // 마커 이미지 url, 스프라이트 이미지를 씁니다
									    	imageSize = new kakao.maps.Size(24, 35),  // 마커 이미지의 크기
									        imgOptions =  {
									        },
									        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
									            marker = new kakao.maps.Marker({
									            position: position, // 마커의 위치
									            image: markerImage 
									        });

									    marker.setMap(map); // 지도 위에 마커를 표출합니다
									    smarkers.push(marker);  // 배열에 생성된 마커를 추가합니다

									    //커스텀오버레이, 숫자표시
									    var content = '<div class="circle">'+idx+'</div>';
									 // 커스텀 오버레이를 생성합니다
									    var customOverlay = new kakao.maps.CustomOverlay({
									        position: position,
									        content: content   
									    });

									    // 커스텀 오버레이를 지도에 표시합니다
									    customOverlay.setMap(map);

										//인포윈도우 생성
										var name=data.loc_name.split('[');
										var iwContent = '<div class="infoWindow" style="padding:5px;"><span>'+name[0]+'</span></div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
										
										// 인포윈도우를 생성하고 지도에 표시합니다
										var infowindow = new kakao.maps.InfoWindow({
										    content : iwContent
										});
										
									    tempCustom.push(customOverlay);
									    //마커에 mouseover 이벤트를 등록합니다
									    kakao.maps.event.addListener(marker, 'mouseover', function() {

									    	if (!selectedMarker || selectedMarker !== marker){
										    	if(contenttype=='12'){
										    		imageSrc='imgs/clickTour.png';
												}else if(contenttype=='32'){
													imageSrc='imgs/clickHotel.png';
												}else if(contenttype=='39'){
													imageSrc='imgs/clickFood.png';
												}
												
										        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
										        // 마커의 이미지를 오버 이미지로 변경합니다
										        marker.setImage(new kakao.maps.MarkerImage(
										            imageSrc, // 스프라이트 마커 이미지 URL
										            new kakao.maps.Size(34, 45), // 마커의 크기
													    {
										            		position: position, // 마커의 위치
													        image: markerImage
													    }
												));
									    	}

									    	//인포윈도우 show
									    	infowindow.open(map, marker);
									    });

									    //마커에 mouseout 이벤트를 등록합니다
									    kakao.maps.event.addListener(marker, 'mouseout', function() {

									    	if (!selectedMarker || selectedMarker !== marker){

										    	if(contenttype=='12'){
										    		imageSrc='imgs/loadTour.png';
												}else if(contenttype=='32'){
													imageSrc='imgs/loadHotel.png';
												}else if(contenttype=='39'){
													imageSrc='imgs/loadFood.png';
												}
										        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
										        // 마커의 이미지를 오버 이미지로 변경합니다
										        marker.setImage(new kakao.maps.MarkerImage(
										            imageSrc, // 스프라이트 마커 이미지 URL
										            new kakao.maps.Size(24, 35), // 마커의 크기
													    {
										            		position: position, // 마커의 위치
													        image: markerImage
													    }
													));
									    	}

									    	//인포윈도우 close
									    	infowindow.close();
									    });

									    //마커 click 이벤트
									    kakao.maps.event.addListener(marker, 'click', function() {

										    	if(cmarkers.length>0){
								            		overlayL.setMap(null);
								            	}
								            	
									        	for ( var i = 0; i < cmarkers.length; i++ ) {
						                            cmarkers[i].setMap(null);
						                        }   
						                        cmarkers = [];

						                        $('#locResult div').css('background-color','#FFFFFF');
									    	
								    			//이전 마커가 null이 아닐경우 오버레이를 닫고 이전마커를 원래크기로 돌아가게함
									    		if(selectedMarker!==null){
									    			if (selectedMarker !== marker){
										    			
									    				closeOverlay(bfcontenttype,selectedMarker,position,bfsal);

									    				var name=data.loc_name.split('[');
									    				
														var content = '<div class="wrap">' + 
											            '    <div class="info">' + 
											            '        <div class="infotitle">' + 
											            '            '+name[0]+'' + 
											            '            <div class="infoclose" onclick="closeOverlay('+contenttype+',marker,'+position+','+sal+')" title="닫기"></div>' + 
											            '        </div>' + 
											            '        <div class="infobody">' + 
											            '            <div class="infoimg">' +
											            '                <img src="'+data.loc_img_url+'" width="73" height="70">' +
											            '           </div>' + 
											            '            <div class="desc">' + 
											            '                <div class="ellipsis">'+data.loc_addr+'</div>' + 
											            '                <div class="jibun ellipsis">(우) '+data.loc_post_code+' (Tel) '+data.loc_tel+'</div>' + 
											            '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="infolink">홈페이지</a></div>' + 
											            '            </div>' + 
											            '        </div>' + 
											            '    </div>' +    
											            '</div>';
							
														    overlay = new kakao.maps.CustomOverlay({
														    content: content,
														    map: map,
														    position: marker.getPosition()       
														});
														overlay.setMap(map);
							
														selectedMarker = marker;
														bfcontenttype=contenttype;
														bfsal=sal;
											    	}else{
											    		closeOverlay(contenttype,marker,position,sal);
												        selectedMarker=null;
												        bfcontenttype=null;
												        bfsal=null;
												    }
										    		
									    		}else{
									    			var name=data.loc_name.split('[');
									    			var content = '<div class="wrap">' + 
										            '    <div class="info">' + 
										            '        <div class="infotitle">' + 
										            '            '+name[0]+'' + 
										            '            <div class="infoclose" onclick="closeOverlay('+contenttype+',marker,'+position+','+sal+')" title="닫기"></div>' + 
										            '        </div>' + 
										            '        <div class="infobody">' + 
										            '            <div class="infoimg">' +
										            '                <img src="'+data.loc_img_url+'" width="73" height="70">' +
										            '           </div>' + 
										            '            <div class="desc">' + 
										            '                <div class="ellipsis">'+data.loc_addr+'</div>' + 
										            '                <div class="jibun ellipsis">(우) '+data.loc_post_code+' (Tel) '+data.loc_tel+'</div>' + 
										            '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="infolink">홈페이지</a></div>' + 
										            '            </div>' + 
										            '        </div>' + 
										            '    </div>' +    
										            '</div>';
						
													    overlay = new kakao.maps.CustomOverlay({
													    content: content,
													    map: map,
													    position: marker.getPosition()       
													});
													overlay.setMap(map);
						
													selectedMarker = marker;
													bfcontenttype=contenttype;
													bfsal=sal;
										    	}

									    		bfposition=position;
									    	
									    });

									    return marker;
									}

									//오버레이 닫기
									function closeOverlay(contenttype,marker,position,sal) {
									    overlay.setMap(null);     
										var imageSrc;
										if(sal==1){
											if(contenttype=='12'){
									    		imageSrc='imgs/loadTour.png';
											}else if(contenttype=='32'){
												imageSrc='imgs/loadHotel.png';
											}else if(contenttype=='39'){
												imageSrc='imgs/loadFood.png';
											}
										}else if(sal==2){
											if(contenttype=='12'){
									    		imageSrc='imgs/searchTour.png';
											}else if(contenttype=='32'){
												imageSrc='imgs/searchHotel.png';
											}else if(contenttype=='39'){
												imageSrc='imgs/searchFood.png';
											}
										}
									    
								        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
								        // 마커의 이미지를 오버 이미지로 변경합니다
								        selectedMarker.setImage(new kakao.maps.MarkerImage(
								            imageSrc, // 스프라이트 마커 이미지 URL
								            new kakao.maps.Size(24, 35), // 마커의 크기
											    {
								            		position: position, // 마커의 위치
											        image: markerImage
											    }
											));
									}

									function removesMarker() {
				                        for ( var i = 0; i < smarkers.length; i++ ) {
				                            smarkers[i].setMap(null);
				                        }   
				                        smarkers = [];
				                        positions = [];
				                    } 

									//글씨 클릭시 마커생성
							        function clickDiv(position_y,position_x,contenttype,title,firstimage,addr1,zipcode,tel){

										if(selectedMarker!=null){
											closeOverlay(bfcontenttype,selectedMarker,bfposition,bfsal);
										}
						            	
						            	if(cmarkers.length>0){
						            		overlayL.setMap(null);
						            	}
						            	
							        	for ( var i = 0; i < cmarkers.length; i++ ) {
				                            cmarkers[i].setMap(null);
				                        }   
				                        cmarkers = [];
						            	
							        	if(contenttype=='12'){
								    		imageSrc='imgs/clickTour.png';
										}else if(contenttype=='32'){
											imageSrc='imgs/clickHotel.png';
										}else if(contenttype=='39'){
											imageSrc='imgs/clickFood.png';
										}

							        	var placePosition = new kakao.maps.LatLng(position_y, position_x);

							        	 var imageSrc = imageSrc, // 마커 이미지 url
									         imageSize = new kakao.maps.Size(34, 45),  // 마커 이미지의 크기
									         imgOptions =  {
									            
									        },
									        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
									            marker = new kakao.maps.Marker({
									            position: placePosition, // 마커의 위치
									            image: markerImage 
									        });

									    marker.setMap(map); // 지도 위에 마커를 표출합니다
									    cmarkers.push(marker);  // 배열에 생성된 마커를 추가합니다


								        kakao.maps.event.addListener(marker, 'click', function() {
								        	overlayL.setMap(null);
								        	for ( var i = 0; i < cmarkers.length; i++ ) {
					                            cmarkers[i].setMap(null);
					                        }   
					                        cmarkers = [];
									    });


					    				var content = '<div class="wrap">' + 
							            '    <div class="info">' + 
							            '        <div class="infotitle">' + 
							            '            '+title+'' + 
							            '            <div class="infoclose" onclick="closeOverlayl()" title="닫기"></div>' + 
							            '        </div>' + 
							            '        <div class="infobody">' + 
							            '            <div class="infoimg">' +
							            '                <img src="'+firstimage+'" width="73" height="70">' +
							            '           </div>' + 
							            '            <div class="desc">' + 
							            '                <div class="ellipsis">'+addr1+'</div>' + 
							            '                <div class="jibun ellipsis">(우) '+zipcode+' (Tel) '+tel+'</div>' + 
							            '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="infolink">홈페이지</a></div>' + 
							            '            </div>' + 
							            '        </div>' + 
							            '    </div>' +    
							            '</div>';

										    overlayL = new kakao.maps.CustomOverlay({
										    content: content,
										    map: map,
										    position: marker.getPosition()       
										});
											
										overlayL.setMap(map);

								    }

							      //중심이동
						            function moveCenter(mapy,mapx){
						            	 var placePosition = new kakao.maps.LatLng(mapy, mapx);
						            	 map.setCenter(placePosition);
							        }

						            var overlayL;

						            function closeOverlayl(){
								    	overlayL.setMap(null);
								    	for ( var i = 0; i < cmarkers.length; i++ ) {
				                            cmarkers[i].setMap(null);
				                        }   
				                        cmarkers = [];
									}
									
							</script>
						</div>
						<!-- date상세 -->
						<div class="col-sm-4" id="detailPlanner">
							<!-- 일정 선택 -->
							<div class="dateCh">
								<div class="col-sm-8"><!-- 날짜 보기 -->
									<div class="date1">
									</div>
								</div><!-- 날짜 보기 -->
								<!-- 일정상세보기 선택 -->
								<div class="col-sm-4">
									<select id="dateSelect" class="form-control">
									</select>
								</div><!-- 일정상세보기 선택 -->
							</div><!-- 일정선택 -->
						
						<!-- 하루일정 -->
							<div class="detailDay">

							</div><!-- 하루 일정상세 -->
						</div><!-- date 상세 -->
						
					
					</div>
				</div>
				
				
				
				
				<div id="detailBb">
				
				</div>
				
				<br>
				<button type="button" class="btn_like" onclick="like();">
				  <span class="img_emoti">좋아요</span>
				  <span class="ani_heart_m"></span>
				</button>
				<a href="community_planner" class="btn btn-primary btn-sm plannerListGo" style="float: right;">목록</a>
				<div class="jumbotron1"></div>
				
				<!-- 댓글-->
				<div class="card-body replyDiv">
					<div class="form-group">
						<hr style="color: red; width: 100%;">
						<h2>Are you curious?</h2>
						<%
						int num=Integer.parseInt(request.getParameter("num"));
						%>
						<input type="hidden" id="seq" name="seq" value="<%=num %>">
						<form action="plannerReply" method="get" onsubmit="return checkReply();">
							<div class="col-sm-11">
								<input type="text" name="reply_content" id="replyContent" class="form-control">
								<input type="hidden" name="cmnt_seq" value="<%=num%>">
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
 								<p id="replyDeleteId" style="font-weight: bold;">${reply.reply_id }</p>
								<c:set var="te2" value="${reply.reply_id }" />
								<c:set var="te1" value="${sessionScope.id }" />
									<c:if test="${te1 eq te2}">
									   <a href="plannerReplyDelete?reply_seq=${reply.reply_seq }&cmnt_seq=${reply.cmnt_seq}" class="btn btn-primary btn-sm" style="float: right;">삭제</a>
									</c:if>
								<p>${reply.reply_content}</p>
								
									<c:set var="day" value="${fn:substring(reply.r_modi_date,8,10) }"/>
									<c:set var="month" value="${fn:substring(reply.r_modi_date,5,7) }"/>
									<span class="date" style="float: right; margin-top: -50px; font-size: 12px;">
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
										${day }
									</span>
								<c:if test="${teq eq null }">
								</c:if>
								<c:if test="${not teq eq null }">
									<p style="font-size:12px; float: right; margin-top: -60px;">${fn:substring(dateForm,0,10) }
								</c:if>
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
		  
		        <div class="row" style="margin-top:50px;">
		           <div class="col-sm-12">
		              <div class="form-group">
		                 <label for="title">Title</label>
		                 <input id="title" type="text" class="form-control" value="" name="cmnt_title">
		              </div>
		           </div>
		           <input type="hidden" name="cmnt_writer_id" value="${sessionScope.id }">
		           <input type="hidden" name="cmnt_seq" id="edit_cmnt_seq" value="">
		        </div>
		        <div class="form-group" id="summernoteDiv">
		        <%
		        	CommunityVo bean = (CommunityVo) request.getAttribute("bean");
		        %>
		           <textarea id="summernote" name="cmnt_content" class="summernote" rows="" cols="" style="height: 500px;"><%=bean.getCmnt_content() %></textarea>
		        </div>
		        <div class="form-group">
		        	<form action="plannerFileUpdate" method="post" enctype="multipart/form-data" name="plannerFileUpload">
		           		<label for="title">메인 화면 사진선택</label> <input type="file" id="exampleInputFile" name="file2">
		           		<input type="hidden" name="cmnt_seq_file" id="cmnt_seq_file">
		           </form>
			       <script>
				      function checkOk(){
				      	//체크완료시 submit
				      		$('#cmnt_seq_file').val($('#edit_cmnt_seq').val());
				     	 	document.plannerFileUpload.submit();
						}
				   </script>
		        </div>
		        <div class="checkbox" style="text-align: center;">
		           <label> 
		           		<input id="check" name="check" type="checkbox" value="0"> Check me out
		           </label>
		        </div>
		        <input type="hidden" id="editPlannerCode" name="editPlannerCode" value="editPlannerCode"/>
		        <button type="button" onclick="checkForm()" class="btn btn-default" style="float: right;">Submit</button>
		  </div>
	  <div class="jumbotron1"></div>
		  <!-- review insert 끝 -->
	</div>
	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>
	<input type="hidden" id="cmntSequence"/>
	
	<!-- 플래너 불러오기 모달 -->
    <div class="modal fade" id="loadMyPlannerModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="loadMyPlannerTitle">플래너 불러오기</h4>
	      </div>
	      <div class="modal-body">
	      	
	      	<!-- 이미지 -->
	       	<div class="row" id="planList">
		       	<div>
		       		<table class="table" id="planListTable">
		       		
					</table>
				</div>
				<div>
					
				</div>
			</div><!-- row -->
			  
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="popupClose">닫기</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
</html>