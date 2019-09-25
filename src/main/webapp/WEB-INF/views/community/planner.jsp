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
	
	.card-img {
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
	   margin-top: 10px;
	   float: right;
	}
	
	.hashtag {
	   text-align: center;
	}
	.plannerInsert {
	   width: 70%;
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
	
	.mapDiv{
			height:600px;
		
		}
	.dateCh{
		 height:50px;
		}
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
		
	#dateSelect{
		 margin-left:-45px; height: 50px; width: 145px;
		 border-radius: 0px;
		}
	.jumbotron{
		 align-content: center; 
		 height: 170px; 
		 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); 
		 border-radius: 5px;
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
			width: 310px;
		
		}
	.detailDay .jumbotron h4{
		 margin-top: -30px; margin-left:0px; font-size: 16px;
		}
		
		h4 {
			font-weight: bold;
		}
		
		.jumbotron .addr{
		 margin-top: 20px; margin-left:10px; font-size: 12px;
		}
		
		.jumbotron .money{
		 float:right; margin-top: -40px; font-size: 12px; margin-right: 15px;
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
		if($('#sendPlanCode').val()=='' || $('#sendPlanCode').val()==null){
			alert('플래너를 등록해주세요');
			return false;
		}
		var newWindow = window.open('pdfDown');
	
		newWindow.location.href='planner/pdfDown?code='+$('#sendPlanCode').val();
	}
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
         $('.plannerInsert').hide();
      }

      function pageInsert(){
         $('.plannerInsert').show();
         $('#bestList').hide();
         $('#mainList').hide();
      }

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
      
   })
   function checkForm(){
      var check=$('input:checkbox[name="check"]').is(":checked");
      var contentCh=$('#summernote').val();
      var titleCh=$('#title').val();
      var content=contentCh.trim();
      var planCode=$('#sendPlanCode').val();
      
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
       
       var cfresult = confirm('저장하시겠습니까?');

		if(cfresult==false){
			return false;
		}

		var savePlan = new Object();
		var plannerCode=$('#sendPlanCode').val();
		var title=$('#title').val();
		var content=$('#summernote').val();
		var userId='${sessionScope.id }';

		var commPlanArray = new Array();
		var commPlan=new Object();

		commPlan.plannerCode=plannerCode;
		commPlan.title=title;
		commPlan.content=content;
		commPlan.userId=userId;

		commPlanArray.push(commPlan);
		savePlan.commPlan=commPlanArray;
		console.log(savePlan);
		var sJson = JSON.stringify(savePlan);
		
		$.ajax({
			url:"planner/add",
			data:sJson,
			method:"POST",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success: function(data){
				
				$('#cmnt_seq_file').val(data.result[0].result);
				checkOk();
				alert('저장되었습니다');
				location.href='community_plannerDetail?num='+$('#cmnt_seq_file').val();
				
			},
			complete : function() {
				
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
   
   function list(page){
/* 		$('#option option:selected').attr("selected","selected"); */
		var option=$('#option option:selected').val();
		var keyword=$('#keyword').val();
		location.href="community_planner?curPage="+page+"&option="+option+"&keyword"+keyword;
	}

    var plannerDataArr;
	function loadMyPlanner(){

		var dataLen=0;
		var userId='${sessionScope.id }';
		
		$.ajax({
			url:"load/loadPlannerList",
			data:{userId},
			method:"GET",
			dataType:"json"
		}).done(function(data){
			
			plannerDataArr=data;

			console.log(data);	
			if(data.length>0){
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

				//플래너번호로 조건달기
				var options={
						show:true
						};
				$('#loadMyPlannerModal').modal(options);
				
			}else{
				alert('등록할 플래너가 없습니다');
			}
		});

		
	}

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
	
	var dataArray;
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
				console.log(data);

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
				$('#sendPlanCode').val(data.planMgt[0].plan_code);
				$('#popupClose').click();
			}
			
		});
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
            Community Center <small>Planner</small>
         </h1>
      </div>

      <ul class="nav nav-pills nav-justified">
         <li role="presentation" class="active"><a href="community_planner">플래너</a></li>
         <li role="presentation"><a href="community_bbs">자유게시판</a></li>
         <li role="presentation"><a href="community_together">투게더</a></li>
         <li role="presentation"><a href="community">여행후기</a></li>
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
            <button id="submitbtn" class="btn btn-default btn-sm">글쓰기</button>
            <h3 style="font-weight: bold;">Best Planner</h3>
            <hr>
            <!--best num1  -->
                  	<div class="bestImg">
                  		<img id="bestImg" alt="" src="imgs/best.png">
                  	</div>
             <div class="col-md-4 offset-0">
                  <div class="thecard1">
                  <c:forEach items="${bestList }" var="best" begin="0" end="0">
                	<a href="community_plannerDetail?num=${best.cmnt_seq }">
                     <div class="card-img1">
                       <img src="plannerImg/${best.cmnt_filename }">
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
               <a href="community_plannerDetail?num=${best.cmnt_seq }">
                  <div class="thecard">
                     <div class="card-img">
                        <img src="plannerImg/${best.cmnt_file_path1}${best.cmnt_filename}">
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
         <div id="mainList" style="width: 95%; margin: auto;">
            <!-- 검색 -->
            <hr style="font-weight: bold; margin-top: 250px;">
            <h4 style="font-weight: bold; float: left; margin-bottom: -20px; margin-left: 10%;">Planner List</h4>
            <div id="bbs" style="width: 90%; margin: auto;">
               <div class="search">
                  <form class="navbar-form navbar-right" action="community_planner" method="get">

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
                  <c:forEach items="${plannerList }" var="planner">
                  <tr>
					 <td>${planner.cmnt_seq }</td>
                     <td><a href="community_plannerDetail?num=${planner.cmnt_seq }">${planner.cmnt_title }</a></td>
                     <td>${planner.cmnt_writer_id }</td>
                     <c:set var="date" value="${planner.modi_date }"/>
                     <td>${fn:substring(date,0,10)}</td>
                     <td>${planner.cmnt_hits }</td>
                     </tr>
                  </c:forEach>
               </table>
            </div>
         </div>
      </div>
   </div>

   <div class="plannerInsert">
      <h1 style="font-size: 25px; font-weight: bold; text-align: center;">플래너 작성</h1>
      
      <!--                <img id="bgImg" alt="" src="imgs/write.jpg"> <br> <br> -->
      <br>
      <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">T signer</p>
      <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">여행 숙박 공연 정보를 공유 하고</p>
      <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">함께 여행하자</p>
				<p><button type="button" class="btn btn-default" onclick="loadMyPlanner()" style="float: right;">플래너 불러오기</button></p>
      
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
      
         <div class="row">
            <div class="col-sm-12">
            <%String hello=request.getParameter("hello"); %>
		<input id="levUp" type="hidden" value="<%=hello%>">
            <!-- planner 추가 -->
            <div class="planner">
            
            </div>
            
               <div class="form-group">
                  <label for="title">Title</label>
                  <input id="title" type="text" class="form-control" placeholder="write title" name="cmnt_title">
               </div>
            </div>
            <input type="hidden" class="form-control" placeholder="write name" name="cmnt_writer_id" value="${sessionScope.id }" readonly="readonly">
         </div>
         <div class="form-group">
            <textarea id="summernote" name="cmnt_content" class="summernote" rows="" cols="" style="height: 500px;">
                        
             </textarea>
         </div>
         <div class="form-group">
	         <form action="plannerFileUpload" method="post" enctype="multipart/form-data" name="plannerFileUpload">
	            <label for="title">메인 화면 사진선택</label> <input type="file" id="exampleInputFile" name="file2">
	            <input type="hidden" name="cmnt_seq_file" id="cmnt_seq_file">
	         </form>
	         <script>
			      function checkOk(){
			      	//체크완료시 submit
			     	 	document.plannerFileUpload.submit();
			     	 	
					}
			   </script>
         </div>
         <div class="checkbox" style="text-align: center;">
            <label> <input id="check" name="check" type="checkbox" value="0"> Check me out
            </label>
         </div>
         <button type="button" class="btn btn-default" style="float: right;" onclick="checkForm()">Submit</button>
         <input type="hidden" id="sendPlanCode" name="sendPlanCode" value=""/>
   </div>
   
   <!-- paging -->
			<div id="pageNum" style="text-align: center;">
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