<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../template/header.jsp"></jsp:include>
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gothic A1&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gothic+A1&display=swap" rel="stylesheet">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">

	<!--카드레이아웃-->
	
		.card {
			cursor:pointer;
			height: 200px;
			width: 100%;
			border-radius: 10px 10px 10px 10px;
			display: inline-block;
			margin-top: 30px;
			margin-bottom: 50px;
			position: relative;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			overflow: hidden;
		}
		
		.card-header {
			cursor:pointer;
			-webkit-transition: 0.5s; /*사파리 & 크롬*/
		    -moz-transition: 0.5s;  /*파이어폭스*/
		    -ms-transition: 0.5s;	/*인터넷 익스플로러*/
		    -o-transition: 0.5s;  /*오페라*/
		    transition: 0.5s;
			width: 100%;
			height: 150px;
			border-radius: 15px 15px 0 0;
			background-size: 100% 280px;
			background-repeat: no-repeat;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.29);
		}

		.card-body {
			cursor:pointer;
			height:60px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.29);
			border-radius: 0px 0px 10px 10px;
		}
		
		.card-body-header{
			cursor:pointer;
			line-height: 15px;
			margin: 0px 0px 0px 0px;
		}
		
		.card-body-hashtag {
			margin:6px 0px 0px 0px;
			cursor:pointer;
			color: #2478FF;
			font-style: italic;
		}
		
		.card-footer{
			cursor:pointer;
			width: 100%;
			height: 20px;
		}

	<!---->
	
	#content{
		margin:0px auto;
		margin-top:40px;
		width:1440px;
	}
	
	.page-header{
		width: 1120px;
		margin: 0px auto;
	}
	
	#plannerSp{
		width:1000px;
		margin: 0px auto;
		height: 370px;
		margin-bottom: 100px;
	}
	
	#plannerSp>div>ul>li:nth-child(3){
		float: right;
		margin: 3px 0px 0px 0px;
	}
	
	.caroImg{
		width: 180px;
		height: 180px;
		border-radius: 10px 10px 10px 10px;
	}
	
	#carouselBox>div{
		cursor: pointer;
	}
	
	#carouselBox>div>div>div{
		display: inline-block;
		margin: 0px auto;
		margin: 50px 31px 10px 31px;
	}
	
	#carouselBox>div>div>div>a>div:nth-child(1){
		margin: 0px 0px 15px 0px;
	}
	
	#carouselBox>div>div>div>a>div:nth-child(2){
	}
	
	#carouselBox{
		width: 100%;
		height: 327px;
	}
	
	#carouselBox>div{
		width: 100%;
		height: 357px;
	}
	
	#carouselBox>div>div{
		width: 75%;
		height: 357px;
		margin: 0px auto;
	}
	
	#carouselMyPlanner>div>div>div{
		display: inline-block;
		margin: 0px auto;
		margin: 50px 31px 10px 31px;
	}
	
	#carouselMyPlanner>div>div>div>a>div:nth-child(1){
		margin: 0px 0px 15px 0px;
	}
	
	#carouselMyPlanner{
		width: 100%;
		height: 327px;
	}
	
	#carouselMyPlanner>div{
		cursor:pointer;
		width: 100%;
		height: 357px;
	}
	
	#carouselMyPlanner>div>div{
		width: 75%;
		height: 357px;
		margin: 0px auto;
	}
	
	#hotPlaceDiv{
		width: 100%;
		margin-bottom: 100px;
	}
	
	#hotPlaceDiv>div:nth-child(1) {
		width: 1200px;
		height: 100px;
		margin: 0px auto;
		margin-bottom: 50px;
	}
	
	#hotPlaceDiv>div:nth-child(1)>a{
		font-size: 45px;
		color: black;
		margin:18px 0px 0px 470px;
	}
	
	#hotPlaceDiv>div:nth-child(2) {
		width: 1200px;
		height: 250px;
		margin: 0px auto;
		margin-bottom: 40px;
	}
	
	.hotpImgs{
		width: 175px;
		height: 150px;
		border-radius: 10px 10px 0px 0px;
		border
		margin-bottom: 10px;
	}
	
	#hotPlaceDiv>div:nth-child(2)>div>div{
		display: inline-block;
		float: left;
		margin: 5px 0px 10px 33px;
	}
	
	.hotpLabel{
		width: 120px;
		height: 63px;
	}
	
	.hotpA{
		font-family: 'Gothic A1', sans-serif;
		font-size: 15px;
		color: black;
		font-weight: lighter;
	}
	
	.locImgModal{
		border-radius: 10px 10px 10px 10px;
	}
	
	#noneLabel{
		font-family: 'Gothic A1', sans-serif;
		font-size: 28px;
		color: black;
		font-weight: lighter;
		margin: 140px 0px 0px 0px;
	}
	
	.strFontChg{
		cursor:pointer;
		font-family: 'Gothic A1', sans-serif;
		font-size: 15px;
		color: black;
		font-weight: lighter;
	}
	
	#fontLavel{
		width: 180px;
	
	}
	
	.removePlan{
		color: red;
	}
	.removePlan:link { 
		color: red; text-decoration: none;
	}
 	.removePlan:visited { 
 		color: red; text-decoration: none;
 	}
 	.removePlan:hover { 
 		color: red; text-decoration: underline;
 	}
	
</style>

<script type="text/javascript">
	var myPlannerCnt;

	//플래너 삭제
	function removePlan(plannerCode,title){
		var cfResult=confirm('"'+title+'" 플래너를 삭제하시겠습니까?');

		if(cfResult==true){
			$.ajax({
				url:"delete/planner",
				data:{plannerCode:plannerCode},
				method:"GET",
				dataType:"json"
			}).done(function(data){
				alert('플래너가 삭제되었습니다');
				location.href='planner';
			});
		}
	}
	
	$(document).ready(function(){
		$('#makePlan').click(function(e){

			var memLevelNm='';
			if(Number('${sessionScope.userMemLvl }')==0){
				memLevelNm='T baby';
			}else if(Number('${sessionScope.userMemLvl }')==1){
				memLevelNm='T beignner';
			}else if(Number('${sessionScope.userMemLvl }')==2){
				memLevelNm='T Expert';
			}else if(Number('${sessionScope.userMemLvl }')==3){
				memLevelNm='T Guide';
			}else if(Number('${sessionScope.userMemLvl }')==4){
				memLevelNm='T Signer';
			}else{
				memLevelNm='T Master';
			}
			
			if('${sessionScope.id }'==''){
				alert('로그인이 필요합니다');
			}else if(Number('${sessionScope.userMemLvl }')==1 || Number('${sessionScope.userMemLvl }')==0 ){
				if(myPlannerCnt>=3){
					alert(memLevelNm+'등급 회원은 플래너를 최대 3개까지 생성할 수 있습니다');
				}else{
					location.href='makeplan';
					}
			}else if(Number('${sessionScope.userMemLvl }')==2){
				if(myPlannerCnt>=4){
					alert(memLevelNm+'등급 회원은 플래너를 최대 4개까지 생성할 수 있습니다');
				}else{
					location.href='makeplan';
					}
			}else if(Number('${sessionScope.userMemLvl }')==3){
				if(myPlannerCnt>=5){
					alert(memLevelNm+'등급 회원은 플래너를 최대 5개까지 생성할 수 있습니다');
				}else{
					location.href='makeplan';
					}
			}else if(Number('${sessionScope.userMemLvl }')==4){
				if(myPlannerCnt>=6){
					alert(memLevelNm+'등급 회원은 플래너를 최대 6개까지 생성할 수 있습니다');
				}else{
					location.href='makeplan';
					}
			}else{
				location.href='makeplan';
			}
		});

		//핫플레이스 불러오기
		$.ajax({
			url:"load/hotplace",
			method:"GET",
			dataType:"json"
		}).done(function(data){

			for(var i=0;i<data.length;i++){

				var img='';
				var addrArray=data[i].LOC_ADDR.split('\u0020');

				var hashTagArr=new Array();
				var hashStr='';
				var cnt;
				
				if(addrArray.length>=3){
					cnt=3;
				}else{
					cnt=addrArray.length;
				}
				
				for(var j=0;j<cnt;j++){
					hashTagArr[j]=addrArray[j];

					hashStr+='#'+hashTagArr[j]+'&nbsp;&nbsp;';
				}
				
				if(data[i].LOC_IMG_URL==null || data[i].LOC_IMG_URL==''){
					img='imgs/no_img.gif';
				}else{
					img=data[i].LOC_IMG_URL;
				}

				var nameSplit=data[i].LOC_NAME.split('[');
				
				var textHtml='<div class="col-sm-2"><a onclick="viewDetail('+data[i].CONTENT_ID+')" class="aTagHotp"><div class="card"><div class="card-header" ><img src="'+img+'" class="hotpImgs"></div><div class="card-body"><div class="card-body-header"><a class="hotpA" class="navbar-brand"><br/><center>'+nameSplit[0]+'</center></a></div></div><div class="card-footer"><p class="card-body-hashtag">'+hashStr+'</p></div></div></a></div>';
				$('#hotPlaceDiv>div').eq(1).find('div').eq(0).append(textHtml);
			}
			
		});

		//인기플래너 불러오기
		$.ajax({
			url:"load/purPlanner",
			method:"GET",
			dataType:"json"
		}).done(function(data){
				console.log(data);

				var iCnt;

				if(data.length==0){

					$('#carouselBox').html('<center><label id="noneLabel">인기플래너가 존재하지 않습니다</label></center>');

				}else{

					if(data.length<3){
						iCnt=data.length;
					}else{
						iCnt=3;
					}
					
					var tempHtml='<div class="item active">';
						tempHtml+='    <div class="row">';
						
						for(var i=0;i<iCnt;i++){
							var fileImg;
							if(data[i].CMNT_FILENAME=='dafault.jpg'){
								fileImg='imgs/sampleImg.jpg';
							}else{
								fileImg='plannerImg/'+data[i].CMNT_FILENAME;
							}
						
							tempHtml+='<div>';
							tempHtml+='<a onclick="movePlan(\''+data[i].CMNT_SEQ+'\',\''+data[i].CMNT_WRITER_ID+'\')">';
							tempHtml+='	<div>';
							tempHtml+='  		<img src="'+fileImg+'" alt="" class="caroImg">';
							tempHtml+='  	</div>';
							tempHtml+='    <div>';
							tempHtml+='      	<center><label class="strFontChg" id="fontLavel">'+data[i].CMNT_TITLE+'</label></center>';
							tempHtml+='      	<center><label class="strFontChg">'+data[i].TRV_FROM_DATE+' ~ '+data[i].TRV_TO_DATE+'</label></center>';
							tempHtml+='    </div>';
							tempHtml+='</a>';    
							tempHtml+='</div>';
							
						}
						
						tempHtml+='</div>';
						tempHtml+=' </div>';

						if(data.length>3){
							if(data.length>6){
								iCnt=6;
							}else{
								iCnt=data.length;
							}

							tempHtml+='<div class="item">';
							tempHtml+='    <div class="row">';
							
							for(var i=3;i<iCnt;i++){
								var fileImg;
								if(data[i].CMNT_FILENAME=='dafault.jpg'){
									fileImg='imgs/sampleImg.jpg';
								}else{
									fileImg='plannerImg/'+data[i].CMNT_FILENAME;
								}
								
								tempHtml+='<div>';
								tempHtml+='<a onclick="movePlan(\''+data[i].CMNT_SEQ+'\',\''+data[i].CMNT_WRITER_ID+'\')">';
								tempHtml+='	<div>';
								tempHtml+='  		<img src="'+fileImg+'" alt="" class="caroImg">';
								tempHtml+='  	</div>';
								tempHtml+='    <div>';
								tempHtml+='      	<center><label class="strFontChg" id="fontLavel">'+data[i].CMNT_TITLE+'</label></center>';
								tempHtml+='      	<center><label class="strFontChg">'+data[i].TRV_FROM_DATE+' ~ '+data[i].TRV_TO_DATE+'</label></center>';
								tempHtml+='    </div>';
								tempHtml+='</a>';    
								tempHtml+='</div>';
								
							}
							
							tempHtml+='</div>';
							tempHtml+=' </div>';
						}

						if(data.length>6){
							if(data.length<9){
								iCnt=data.length;
							}else{
								iCnt=9;
							}
							tempHtml+='<div class="item">';
							tempHtml+='    <div class="row">';
							
							for(var i=6;i<iCnt;i++){
								var fileImg;
								if(data[i].CMNT_FILENAME=='dafault.jpg'){
									fileImg='imgs/sampleImg.jpg';
								}else{
									fileImg='plannerImg/'+data[i].CMNT_FILENAME;
								}
								
								tempHtml+='<div>';
								tempHtml+='<a onclick="movePlan(\''+data[i].CMNT_SEQ+'\',\''+data[i].CMNT_WRITER_ID+'\')">';
								tempHtml+='	<div>';
								tempHtml+='  		<img src="'+fileImg+'" alt="" class="caroImg">';
								tempHtml+='  	</div>';
								tempHtml+='    <div>';
								tempHtml+='      	<center><label class="strFontChg" id="fontLavel">'+data[i].CMNT_TITLE+'</label></center>';
								tempHtml+='      	<center><label class="strFontChg">'+data[i].TRV_FROM_DATE+' ~ '+data[i].TRV_TO_DATE+'</label></center>';
								tempHtml+='    </div>';
								tempHtml+='</a>';    
								tempHtml+='</div>';
								
							}
							
							tempHtml+='</div>';
							tempHtml+=' </div>';
							
						}
					$('#carouselBox').html(tempHtml);
				}


				
		});

		//나의플래너
		if('${sessionScope.id}'!=''){
			$.ajax({
				url:"load/myPlanner",
				data:{userId:'${sessionScope.id}'},
				method:"GET",
				dataType:"json"
			}).done(function(data){
					console.log(data);
					myPlannerCnt=data.length;
					var iCnt;

					if(data.length==0){

						$('#carouselMyPlanner').html('<center><label id="noneLabel">나의 플래너가 없습니다</label></center>');

					}else{

						if(data.length<3){
							iCnt=data.length;
						}else{
							iCnt=3;
						}
						
						var tempHtml='<div class="item active">';
							tempHtml+='    <div class="row">';
							
							for(var i=0;i<iCnt;i++){
								var fileImg;
								if(data[i].LOC_IMG_URL==''){
									fileImg='imgs/sampleImg.jpg';
								}else{
									fileImg=data[i].LOC_IMG_URL;
								}
							
								tempHtml+='<div>';
								tempHtml+='<a onclick="moveMyPlan(\''+data[i].PLAN_CODE+'\',\''+data[i].PLAN_TITLE+'\')">';
								tempHtml+='	<div>';
								tempHtml+='  		<img src="'+fileImg+'" alt="" class="caroImg">';
								tempHtml+='  	</div>';
								tempHtml+='    <div>';
								tempHtml+='      	<center><label class="strFontChg" id="fontLavel">'+data[i].PLAN_TITLE+'</label></center>';
								tempHtml+='      	<center><label class="strFontChg">'+data[i].TRV_FROM_DATE+' ~ '+data[i].TRV_TO_DATE+'</label></center>';
								tempHtml+='      	<center><a class="removePlan" onclick="removePlan(\''+data[i].PLAN_CODE+'\',\''+data[i].PLAN_TITLE+'\')">삭제</a></center>';
								tempHtml+='    </div>';
								tempHtml+='</a>';    
								tempHtml+='</div>';
								
							}
							
							tempHtml+='</div>';
							tempHtml+=' </div>';

							if(data.length>3){
								if(data.length>6){
									iCnt=6;
								}else{
									iCnt=data.length;
								}

								tempHtml+='<div class="item">';
								tempHtml+='    <div class="row">';
								
								for(var i=3;i<iCnt;i++){
									var fileImg;
									if(data[i].LOC_IMG_URL==''){
										fileImg='imgs/sampleImg.jpg';
									}else{
										fileImg=data[i].LOC_IMG_URL;
									}
									
									tempHtml+='<div>';
									tempHtml+='<a onclick="moveMyPlan(\''+data[i].PLAN_CODE+'\',\''+data[i].PLAN_TITLE+'\')">';
									tempHtml+='	<div>';
									tempHtml+='  		<img src="'+fileImg+'" alt="" class="caroImg">';
									tempHtml+='  	</div>';
									tempHtml+='    <div>';
									tempHtml+='      	<center><label class="strFontChg" id="fontLavel">'+data[i].PLAN_TITLE+'</label></center>';
									tempHtml+='      	<center><label class="strFontChg">'+data[i].TRV_FROM_DATE+' ~ '+data[i].TRV_TO_DATE+'</label></center>';
									tempHtml+='      	<center><a class="removePlan" onclick="removePlan(\''+data[i].PLAN_CODE+'\',\''+data[i].PLAN_TITLE+'\')">삭제</a></center>';
									tempHtml+='    </div>';
									tempHtml+='</a>';    
									tempHtml+='</div>';
									
								}
								
								tempHtml+='</div>';
								tempHtml+=' </div>';
							}

							if(data.length>6){
								if(data.length<9){
									iCnt=data.length;
								}else{
									iCnt=9;
								}
								tempHtml+='<div class="item">';
								tempHtml+='    <div class="row">';
								
								for(var i=6;i<iCnt;i++){
									var fileImg;
									if(data[i].LOC_IMG_URL==''){
										fileImg='imgs/sampleImg.jpg';
									}else{
										fileImg=data[i].LOC_IMG_URL;
									}
									
									tempHtml+='<div>';
									tempHtml+='<a onclick="moveMyPlan(\''+data[i].PLAN_CODE+'\',\''+data[i].PLAN_TITLE+'\')">';
									tempHtml+='	<div>';
									tempHtml+='  		<img src="'+fileImg+'" alt="" class="caroImg">';
									tempHtml+='  	</div>';
									tempHtml+='    <div>';
									tempHtml+='      	<center><label class="strFontChg" id="fontLavel">'+data[i].PLAN_TITLE+'</label></center>';
									tempHtml+='      	<center><label class="strFontChg">'+data[i].TRV_FROM_DATE+' ~ '+data[i].TRV_TO_DATE+'</label></center>';
									tempHtml+='      	<center><a class="removePlan" onclick="removePlan(\''+data[i].PLAN_CODE+'\',\''+data[i].PLAN_TITLE+'\')">삭제</a></center>';
									tempHtml+='    </div>';
									tempHtml+='</a>';    
									tempHtml+='</div>';
									
								}
								
								tempHtml+='</div>';
								tempHtml+=' </div>';
								
							}
					}


						$('#carouselMyPlanner').html(tempHtml);
					
			});

		}else{
			$('#carouselMyPlanner').html('<center><label id="noneLabel">나의 플래너가 없습니다</label></center>');
		}
		
	});

	//상세보기 모달열기
	function viewDetail(contentid){

		var sKey='';
        var reqUrl;
        reqUrl='http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey='+sKey+'&contentTypeId=&contentId='+contentid+'&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json';

        $.ajax({
			url:reqUrl,
			type:'get',
			data:'idx=1',
			success:function(data){
				console.log(data);
				var dataVal=data.response.body.items.item;
				var contenttypeid=dataVal.contenttypeid;
				var addr1=dataVal.addr1;
				var contentid=dataVal.contentid;
				var firstimage1=dataVal.firstimage;
				var firstimage2=dataVal.firstimage2;
				var homepageTag;
				if(dataVal.homepage==null){
					homepageTag='';
				}else{
					homepageTag=dataVal.homepage;
				}
				var mapx=dataVal.mapx;
				var mapy=dataVal.mapy;
				var overview=dataVal.overview;
				var tel;
				if(dataVal.tel==null){
					tel='';
				}else{
					tel='TEL. '+dataVal.tel;
				}
				var title=dataVal.title;
				var zipcode=dataVal.zipcode;	//우편번호

				var locImgModal;
				if(firstimage1==null){
					locImgModal='imgs/no_img.gif';
				}else{
					locImgModal=firstimage1;
				}

			
				
				$('#modalLocImg1').html('<img class="locImgModal" src="'+locImgModal+'" style="width:250px;height:200px"/>');
				$('#detailTitle').text(title);
				$('#overviewSpan').html('<span>'+overview+'</span>');

				$('#detailModal div').eq(1).find('label').html(addr1+'<br/>'+homepageTag+'<br/>'+tel);
			}
        });

		var options={
				show:true
				};
		$('#detailLoc').modal(options);	

	}

	function movePlan(seq,userId){
		location.href='community_plannerDetail?num='+seq;		
	}
	
	function moveMyPlan(planCode,title){
		var cfresult=confirm('"'+title+'" 수정하시겠습니까?');
		
		if(cfresult==true){
			location.href='makeplan?code='+planCode;
		}else if(cfresult==false){
			return false;
		}
		
	}
		
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
	<div class="page-header">
         <h1>
            Planner
         </h1>
      </div>
	<!-- 핫플레이스 -->
		<div id="hotPlaceDiv">
			<div>
				<a id="" class="navbar-brand">HOT&nbsp;&nbsp;PLACE</a>
			</div>
			<div>
				<div class="row" id="hotPlacesDiv">
				
				</div>
			</div>
		</div>
	
		<!-- 인기플래너,나의 플래너 -->
		<div id="plannerSp">
			<div>
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" role="tablist">
			    <li role="presentation" class="active"><a href="#hotPlanner" aria-controls="hotPlanner" role="tab" data-toggle="tab">인기플래너</a></li>
			    <li role="presentation"><a href="#myPlanner" aria-controls="myPlanner" role="tab" data-toggle="tab">나의플래너</a></li>
			    <li role="presentation"><button type="button" class="btn btn-success" id="makePlan">플랜만들기</button></li>
			  </ul>
			
			  <!-- Tab panes -->
			  <div class="tab-content">
			  <!-- 인기플래너 div -->
			    <div role="tabpanel" class="tab-pane active" id="hotPlanner">
			    	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					
					  <!-- Wrapper for slides -->
					  <div class="carousel-inner" role="listbox" id="carouselBox">
					  </div>
					
					  <!-- Controls -->
					  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
			    </div>
			    
			     <!-- 나의플래너 div -->
			    <div role="tabpanel" class="tab-pane" id="myPlanner">
			    	<div id="carousel-example-generic1" class="carousel slide" data-ride="carousel">
					
					  <!-- Wrapper for slides -->
					  <div class="carousel-inner" role="listbox" id="carouselMyPlanner">
					  </div>
					
					  <!-- Controls -->
					  <a class="left carousel-control" href="#carousel-example-generic1" role="button" data-slide="prev">
					    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="right carousel-control" href="#carousel-example-generic1" role="button" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
			    </div>
			  </div>
			
			</div>
		</div>
	
	</div>
	<!-- 여기까지 컨텐츠입니다 -->

	<!-- 상세보기 모달 -->
	    <div class="modal fade" id="detailLoc" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="detailTitle"></h4>
		      </div>
		      <div class="modal-body">
		      	
		      	<!-- 이미지 -->
		       	<div class="row" id="detailModal">
				    <div class="col-lg-6" id="modalLocImg1">
				    </div><!-- /input-group -->
				    <div class="col-lg-6">
					  <label>
					  	
					  </label>
				    </div>
				  </div><!-- row -->
				  
				<br/>
		      <div class="row">
		      	<div class="col-lg-12">
		      		<div class="input-group" id="overviewSpan">
		      		</div>
		      	</div>
		      </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal" id="popupClose">닫기</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->


	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>


</body>
</html>