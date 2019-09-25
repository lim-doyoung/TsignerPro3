<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Stylish&display=swap" rel="stylesheet">
<style type="text/css">


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

	.dotOverlay{
		position: relative;
		left: 7px;
		bottom:12px;
		display: none;
	}

	
	#viewDistance{
		position: absolute;
		left: 1357px;
    	z-index:10;
		
	}
	
	i{
		background-color: red;
	}
	
	.removeLabel{
		height:18px;
		font-size:8px;
		background-color:white;
		border:solid 0.5px black;
		position:absolute;
		z-index: 15;
	}
	
	.removeLabel span{
		position: relative;
		top: -3px;
	}
	
	.pageDiv{
	}
	
	.costLabel{
		height:18px;
		font-size:8px;
		background-color:white;
		border:solid 0.5px black;
		position:absolute;
		z-index: 15;
	}
	
	.costLabel span{
		position: relative;
		top: -3px;
	}
	
	.detailLabel{
		height:18px;
		font-size:8px;
		background-color:white;
		border:solid 0.5px black;
		position:absolute;
		z-index: 15;
	}
	
	.detailLabel span{
		position: relative;
		top: -3px;
	}
	
	.srcLocLabel{
		height:18px;
		font-size:8px;
		background-color:white;
		border:solid 0.5px black;
		position:absolute;
		z-index: 9999;
	}
	
	.srcLocLabel span{
		position: relative;
		top: -3px;
	}
	
	.editPlanLabel{
		height:18px;
		font-size:8px;
		background-color:white;
		border:solid 0.5px black;
		position:absolute;
		z-index: 9999;
	}
	
	.editPlanLabel span{
		position: relative;
		top: -3px;
	}
	
	.dayRemoveLabel{
		height:18px;
		font-size:8px;
		background-color:white;
		border:solid 0.5px black;
		position:absolute;
		z-index: 9999;
	}
	
	.dayRemoveLabel span{
		position: relative;
		top: -3px;
	}
	
	.srcDetailLabel{
		height:18px;
		font-size:8px;
		background-color:white;
		border:solid 0.5px black;
		position:absolute;
		z-index: 9999;
	}
	
	.srcDetailLabel span{
		position: relative;
		top: -3px;
	}
	
	.resetLabel{
		height:18px;
		font-size:8px;
		background-color:white;
		border:solid 0.5px black;
		position:absolute;
		z-index: 9999;
	}
	
	.resetLabel span{
		position: relative;
		top: -3px;
	}
	
	#txtViewDis{
		display: none;
		position: absolute;
		left: 1282px;
    	z-index:10;
    	top: 110px;
	}

	.modal-title{
		font-family: 'Stylish', sans-serif;
		font-size: 24px;
	}

	.infoWindow{
		width: 150px;
	}

    #content{
        width: 1439px;
    }
    
    #sponsor{
    	position: absolute;
    	top:697px;
    }
    
    #sponsor>img{
    	width: 1439px;
    	height: 240px;
    }
    
    #dayDiv{
    }
    
    #fontTitle {
		font-family: 'Lobster', cursive;
		font-size: 24px;
		color: black;
		margin:5px 0px 0px 0px;
	}
    
    #contentTypeId{
    	margin:2px 0px 0px 4px;
    }
    
    #tabs{
    	margin: 0px 0px 15px 0px;
    }
    
    #pageDiv{
	    width:100%;
	    height:70px;
    }
    
    #pageDiv>div{
    	width: 240px;
    	height: 40px;
    	margin: 0px auto;
    }
    
    #pageDiv>div a{
    	cursor: pointer;
    }
    
    #tabs li,ul{
        background-color: white;
    }
    
    #locResult>div{
    	margin: 10px 0px 0px 5px;
    }
    
    #locResult{
    	height:450px;
   		margin: 14px 0px 0px 0px;
    }
    
    hr{
    	position:relative;
    	top:-60px;
    	margin: -10px 0px -48px 0px;
    }
    
    .removeLoc,.cost,.detailInfo{
    	float:right;
    	width: 20px;
    	cursor: pointer;
    }
    
    #wonLaber{
    }
    
    .removeLoc{
    	margin: 1px 0px 0px 2px;
    }
    
    .detailInfo{
    	margin: 1px 0px 0px 0px;
    }
    
    .cost{
    	margin: 0px 0px 0px 2px;
    }
    
    .col-md-3{
    	margin:16px 0px 0px 0px; 
    }
    
    .col-md-2{
    	margin:16px 0px 0px 0px; 
    }
    
    .col-md-4{
    	margin:16px 0px 0px 0px; 
    }
    
    #col-sm-2Id{
    	margin:0px 0px 20px 0px; 
    	float: right;
    }
    
    #degDiv{
    	margin: 0px 80px 0px 0px;
    }
    
    #wonModal{
    	width: 180px;
    	height:32px;
    }
    
    #savePlan{
    	margin:0px 0px 60px 0px;
    }
    
    #closePlan{
    	margin:0px 5px 60px 3px;
    }
    
    #removePlan{
    	margin:0px 0px 60px 3px;
    }
    
    #buttons{
    	height: 40px;
    	float: right;
    }
    
   #top{
        width: 100%;
        height: 70px;
        background-color: #848484;
        line-height: 70px;
    }    
    
    #dayDivAll{
    	float: left;
        width: 150px;
        height: 627px;
        background-color: #AAAAAA;
    }
    
    .mySpan{
    	width: 270px;
    	height: 70px;
    }
    
    #periodView1{
    	width: 150px;
    	height: 40px;
		border-bottom:solid 1px white;
		background-color: #AAAAAA;
        z-index: 100;
    }
    
    #allPlanView{
    	width: 150px;
    	height: 40px;
		border-bottom:solid 1px white;
		background-color: #AAAAAA;
		cursor: pointer;
    }
    
    #allPlanView label{
    	margin-top:10px;
    	color: white;
    	cursor: pointer;
    }
    
    .locSelect{
    }
    
    .searchDetail,.locPlus{
    	position: relative;
    	top: -38px;
    	left: 130px;
    	width: 22px;
    	cursor: pointer;
    }
    
    .locSelect label{
    	position: relative;
    	top:-50px;
    	left: 105px;
    	display:inline-block;
    	width:170px;
    	font-size: 11px;
    	font-weight: bold;
    	height: 50px;
    }
    
    .locSelect label>a{
    	color: #000000;
    	cursor: pointer;
    }
    
    .locSelect label>a:link{
    	color: #000000;
    }
    .locSelect label>a:visited{
    	color: #000000;
    }
    .locSelect label>a:active{
    	color: #000000;
    }
    .locSelect label>a:hover{
    	color: #000000;
    }
    
    .locSelect img{
    	cursor: pointer;
    }
    
    #selectLoc{
        float: left;
        width: 300px;
        height: 627px;
    }
    
    #searchDiv{
    	width: 300px;
    	height: 76px;
    	background-color: white;
    	z-index: 100;
    }
    
    
    #category{
    	width: 270px;
        position: absolute;
        left: 450px;
        z-index:5;
        display: none;
        background-color: white;
    }
    
    #tabsContent{
        width: 270px;
        height: 527px;
        background-color: white;
    }
    
    #mapDiv{
        width: 1289px;
        height: 627px;
        z-index:4;
        position: absolute;
        left: 150px;
        
    }
    
    #searchPlace{
    }
    
    #keyword{
    	width: 218px;
    	margin: 4px 1px 0px 4px;
    }
    
    #dayDiv div{
        width: 150px;
        height: 70px;
        background-color: #AAAAAA;
        margin: 1px 0px 0px 0px;
        color: white;
        border-bottom: solid 1px white;
        cursor: pointer;
    }
    
    #dayDiv div>label:nth-child(1){
    	position: relative;
    	font-size:17px;
    	left: 15px;
    	top: 10px;
    	cursor: pointer;
    }
    
    #dayDiv div>label:nth-child(2){
    	position: relative;
    	left: -27px;
    	top: 27px;
    	cursor: pointer;
    }
    
    #dayDiv div>label:nth-child(3){
    	position: relative;
    	font-size:12px;
    	left: -13px;
    	top: 7px;
    	cursor: pointer;
    }
    
    #dayDiv div>img{
    	position: relative;
    	left: -10px;
    	top: 8px;
    	cursor: pointer;
    }
    
    .form-control{
    	width: 90px;
    	display:inline-block;
    }
    
    #modalRow1{
    	margin: 10px 0px 0px 0px;
    }
    
    #modalRow2{
    	margin: 10px 0px 0px 0px;
    }
    
    #modalRow2InputG{
    	float:left;
    }
    
    .trvDateModal{
    	width:70px;
    }
    
    #periodView{
    	height:20px;
    	width:150px;
    	margin:10px 0px 0px 0px;
    	font-size: 13px;
    	color:white;
    }
    
    #plannerTitleModal{
    	width: 368px;
    }
    
    #addDayDiv{
    	height:40px;
    	width:150px;
    }
    
    #addDayDiv>div{
	    height:33px;
	    width:80px;
    	margin: 18.5px 0px 0px 32px;
    }
    
    #periodViewDiv{
    	width: 120px;
    	margin: 0px auto;
    }
    
    #imgDiv{
    	float: right;
    	width: 60px;
    	position: relative;
    	top: -33px;
    	left: 5px;
    }
    
    .plusminus{
    	width: 13px;
    	height: 13px;
    }
    
    #modalRow0{
    	margin: 0px 0px 10px 0px;
    }
    
    #minus{
    	margin: 0px 6px 0px 0px;
    }
    
    #plus{
    	margin: 0px 0px 0px 6px;
    }
    
    #editImg{
    	width: 60px;
    	cursor: pointer;
    }
    
    .locImgModal{
		border-radius: 10px 10px 10px 10px;
	}
    
    #deleteDay{
    	position:relative;
    	height:16px;
    	width: 16px;
    	top: 9px;
    }
    
    #categoryInfo{
    	width: 270px;
    	height: 45px;
    	background-color: #DDDDDD;
    }
    
    #dayAmt{
    	height: 30px;
    	width: 100px;
    }
    
    #dayAmtLabel{
    	height: 30px;
    }
    
    #categoryInfo>div{
    	position:relative;
    	left:50px;
    	top:12px;
    	width:170px;
    	height:25px;
    }
    
    #categoryInfo div>label{
    
    }
    
    #resetImg{
    	width: 20px;
    	height: 20px;
    	cursor: pointer;
    }
    
    #openClose{
    	width: 27px;
    	height: 27px;
    	position: absolute;
    	left: 450px;
    	z-index:10;
    	cursor: pointer;
    	background-color: #AAAAAA;
    }
    
    #openClose>img{
    	margin: 2px 0px 0px 2px;
    }
    
    .myImage{
    	width: 80px;
    	height: 80px;
    }
    
    .myImgDiv{
    	width: 70px;
    	height: 70px;
    }
    
    .locInfo{
    	width:190px;
    	height: 70px;
    }
    
    .mySpan>a{
    	cursor: pointer;
    }
    
    .mySpan label{
    	position: relative;
    	left: 80px;
    	top: -80px;
		width: 165px;
		height: 80px;    	
		line-height: 15px;
		padding-left: 5px;
    }
    
    .mySpan label>a{
    	font-size: 11px;
    	font-family: 나눔고딕;
    	cursor: pointer;
    	color: #000000;
    }
    .mySpan label>a:link{
    	color: #000000;
    }
    .mySpan label>a:visited{
    	color: #000000;
    }
    .mySpan label>a:active{
    	color: #000000;
    }
    .mySpan label>a:hover{
    	color: #000000;
    }
    
    #memoTxtDiv{
    	width: 218px;
    }
    .memoImgClass{
    	width:250px;
    	height: 208px;
    	border-radius: 10px 10px 10px 10px;
    }
</style>

<script type="text/javascript">
	var dataYArray;
    $(document).ready(function(){

		//삭제버튼
		$('#removePlan').click(function(){

			var cfResult=confirm('현재 플래너를 삭제하시겠습니까?');
			
			if(cfResult==true){
				if($('#plannerCode').val()==null || $('#plannerCode').val()==''){
					alert('현재 플래너가 저장되지 않았습니다');
				}else{
					$.ajax({
						url:"delete/planner",
						data:{plannerCode:$('#plannerCode').val()},
						method:"GET",
						dataType:"json"
					}).done(function(data){
						alert('플래너가 삭제되었습니다');
						location.href='planner';
					});
				}
				
			}
		});
    	
		//닫기버튼
		$('#closePlan').click(function(){

			location.href='planner';
		});
		//플래너코드 세팅
		<%
			String codeTemp=request.getParameter("code");
			if(codeTemp!=null){
				%>
				var planCode='<%=codeTemp%>';
				document.getElementById('plannerCode').value=planCode;
				<%		
			}
		%>
		history.replaceState({}, null, location.pathname);

    	//새 플래너
		if($('#plannerCode').val()==null || $('#plannerCode').val()==''){
			$('#selectLoc').removeClass('hide');
			$('#openClose').removeClass('hide');
			$('#category').removeClass('hide');

			$('#mapDiv').offset({left:450});
			$('#mapDiv').width( '989px' );
			planPopup();
		}else{
			// 플래너 불러오기
			var planCode = new Object();
			var planCodeArray = new Array();
			var plannerCode=new Object();
			plannerCode.planCode=document.getElementById('plannerCode').value;
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
					console.log(data);
					var dayDeg=data.planMst.length;
					$('#plannerCode').val(data.planMgt[0].plan_code);
					$('#plannerTitle').val(data.planMgt[0].plan_title);
					$('#totAmt').val(inputNumberWithComma(data.planMgt[0].tot_amt));
					$('#totTranAmt').val(inputNumberWithComma(data.planMgt[0].tot_tran_exp));

					//day박스 생성
					for(var i=0;i<dayDeg;i++){
						var dayMaxNum;
						if($('#dayDiv div').length==0){
							dayMaxNum=0;
						}else{
							dayMaxNum=$('#dayDiv div').eq($('#dayDiv div').length-1).find('input[type=hidden]').eq(0).val();
				    	}
						
						var dayNum=Number(dayMaxNum)+1;
						var length = $('#dayDiv div').length;
	
						var fromDt=new Date(data.planMgt[0].trv_from_date);
						fromDt.setDate(fromDt.getDate()+length);
	
						var yyyy=fromDt.getFullYear();
						var mm=fromDt.getMonth()+1;
						var dd=fromDt.getDate();
	
						//요일구하기
						var week = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
						var dayOfWeek = week[fromDt.getDay()];
						
						if(dd<10) {
						    dd='0'+dd;
						} 
	
						if(mm<10) {
						    mm='0'+mm;
						}
						
						$('#tabsContent').append('<div id="tabsDay'+dayNum+'"><div class="hide"></div><div class="hide"></div><div class="hide"></div><div class="hide"><center><label>추후 업데이트 예정입니다.</label></center></div><div class="hide"></div></div>');
						
						$('#dayDiv').append('<div><label>DAY'+(length+1)+'</label><label>'+mm+'-'+dd+'</label><label>'+dayOfWeek+'</label><i class="fas fa-trash deleteDay" id="deleteDay"/><input type="hidden" id="dayNum" name="dayNum" value="'+dayNum+'"/></div>');

						//상단 여행기간 변경
						var frmDtFull=data.planMgt[0].trv_from_date;
						var frmDt=data.planMgt[0].trv_from_date.substring(5);
						var frmDateDt=new Date(frmDtFull);
	
						var toDateDt=frmDateDt;
						toDateDt.setDate(toDateDt.getDate()+$('#dayDiv div').length-1);
	
						//날짜 변환
						var tomm=toDateDt.getMonth()+1;
						var todd=toDateDt.getDate();
						
						if(todd<10) {
							todd='0'+todd;
						} 
	
						if(tomm<10) {
							tomm='0'+tomm;
						}
	
						$('#periodView').html(frmDt+'~'+tomm+'-'+todd+'<div id="imgDiv"><img src="imgs/editDays.png" id="editImg" class="editImg"/></div>');
	
						document.getElementById('dayDegSet').value=Number(document.getElementById('dayDegSet').value)+1;
						document.getElementById('dayDegSetFix').value=Number(document.getElementById('dayDegSetFix').value)+1;
						$('#dayDegText').text(document.getElementById('dayDegSet').value+'일');
					}

					//디테일 입력
					for(var i=0;i<data.planDtl.length;i++){

						var id,trv_deg,eqNum;
						trv_deg=data.planDtl[i].trv_deg;
						
						if(data.planDtl[i].loc_type=='12'){
							eqNum=0;
						}else if(data.planDtl[i].loc_type=='32'){
							eqNum=1;
						}else if(data.planDtl[i].loc_type=='39'){
							eqNum=2;
						}else{
							eqNum=3;
						}

						var img;
						if(data.planDtl[i].loc_img_url==null || data.planDtl[i].loc_img_url==''){
							img='imgs/no_img.gif';
						}else{
							img=data.planDtl[i].loc_img_url;
						}
						
						var trv_deg_length=$('#tabsDay'+trv_deg+'>div').eq(4).find('span').length;
						id=Number(trv_deg_length)+1;
						
						var temp='<span id="'+id+'" class="mySpan"><a><img src="'+img+'" alt="firstimage" class="myImage" onclick="clickLabel('+data.planDtl[i].position_y+','+data.planDtl[i].position_x+','+data.planDtl[i].loc_type+',\''+data.planDtl[i].loc_name+'\',\''+data.planDtl[i].loc_img_url+'\',\''+data.planDtl[i].loc_addr+'\',\''+data.planDtl[i].loc_post_code+'\',\''+data.planDtl[i].loc_tel+'\')"/></a><br/><label><img alt="removeImg" src="imgs/deleteImg.png" class="removeLoc"/>';
						temp+='<img alt="cost" src="imgs/cost.png" class="cost"/><img alt="detailInfo" src="imgs/detailInfo.png" class="detailInfo" onclick="detailLoc('+data.planDtl[i].content_id+')"/><a onclick="clickLabel('+data.planDtl[i].position_y+','+data.planDtl[i].position_x+','+data.planDtl[i].loc_type+',\''+data.planDtl[i].loc_name+'\',\''+data.planDtl[i].loc_img_url+'\',\''+data.planDtl[i].loc_addr+'\',\''+data.planDtl[i].loc_post_code+'\',\''+data.planDtl[i].loc_tel+'\')"><br/><br/>'+data.planDtl[i].loc_name+'<br/>'+data.planDtl[i].loc_addr+'</a></label>';
		
						
						temp+='<input type="hidden" id="contenttypeid" value="'+data.planDtl[i].loc_type+'"/><input type="hidden" id="mapx" value="'+data.planDtl[i].position_x+'"/>';
						temp+='<input type="hidden" id="mapy" value="'+data.planDtl[i].position_y+'"/><input type="hidden" id="zipcode" value="'+data.planDtl[i].loc_post_code+'"/>'
						temp+='<input type="hidden" id="contentid" value="'+data.planDtl[i].content_id+'"/><input type="hidden" id="firstimage" value="'+img+'"/>'
						temp+='<input type="hidden" id="tel" value="'+data.planDtl[i].loc_tel+'"/><input type="hidden" id="overview" value="'+data.planDtl[i].overview+'"/>';
						temp+='<input type="hidden" id="budget" value="'+data.planDtl[i].loc_bdg+'"/><input type="hidden" id="locMemo" value="'+data.planDtl[i].loc_memo+'"/><hr style="border-color:gray;width:100%"></hr></span>';


						if(data.planDtl[i].loc_type=='12'){
					    	$('#tabsDay'+trv_deg+'>div').eq(0).addClass('hide');
					    	$('#tabsDay'+trv_deg+'>div').eq(1).addClass('hide');
							$('#tabsDay'+trv_deg+'>div').eq(2).addClass('hide');
							$('#tabsDay'+trv_deg+'>div').eq(3).addClass('hide');
		
							$('#tabsDay'+trv_deg+'>div').eq(0).append(temp);
							$('#tabsDay'+trv_deg+'>div').eq(4).append(temp);	//저장용
						}
						//숙소
						else if(data.planDtl[i].loc_type=='32'){
					    	$('#tabsDay'+trv_deg+'>div').eq(1).addClass('hide');
					    	$('#tabsDay'+trv_deg+'>div').eq(0).addClass('hide');
							$('#tabsDay'+trv_deg+'>div').eq(2).addClass('hide');
							$('#tabsDay'+trv_deg+'>div').eq(3).addClass('hide');
		
							$('#tabsDay'+trv_deg+'>div').eq(1).append(temp);
							$('#tabsDay'+trv_deg+'>div').eq(4).append(temp);	//저장용
						}
						//맛집
						else if(data.planDtl[i].loc_type=='39'){
					    	$('#tabsDay'+trv_deg+'>div').eq(2).addClass('hide');
					    	$('#tabsDay'+trv_deg+'>div').eq(0).addClass('hide');
							$('#tabsDay'+trv_deg+'>div').eq(1).addClass('hide');
							$('#tabsDay'+trv_deg+'>div').eq(3).addClass('hide');
		
							$('#tabsDay'+trv_deg+'>div').eq(2).append(temp);
							$('#tabsDay'+trv_deg+'>div').eq(4).append(temp);	//저장용
						}
						//나머지
						else{
					    	$('#tabsDay'+trv_deg+'>div').eq(3).addClass('hide');
					    	$('#tabsDay'+trv_deg+'>div').eq(0).addClass('hide');
							$('#tabsDay'+trv_deg+'>div').eq(1).addClass('hide');
							$('#tabsDay'+trv_deg+'>div').eq(2).addClass('hide');
		
							$('#tabsDay'+trv_deg+'>div').eq(3).append(temp);
							$('#tabsDay'+trv_deg+'>div').eq(4).append(temp);	//저장용
						}
					}
					
					//모달 값입력
					$('#plannerTitleModal').val(data.planMgt[0].plan_title);
					$('#trvFromDateModal').val(data.planMgt[0].trv_from_date);
					$('#dayDegSet').val(dayDeg);
					$('#dayDegSetFix').val(dayDeg);
					$('#dayDegText').text(dayDeg+'일');


					$('#tabs a').eq(0).parent().addClass('active');
					$('#tabs a').eq(1).parent().removeClass('active');
					$('#tabs a').eq(2).parent().removeClass('active');
					$('#tabs a').eq(3).parent().removeClass('active');

					$('#tabsDay1>div').eq(0).removeClass('hide');
			    	$('#tabsDay1>div').eq(1).addClass('hide');
					$('#tabsDay1>div').eq(2).addClass('hide');
					$('#tabsDay1>div').eq(3).addClass('hide');
					$('#tabsDay1>div').eq(4).addClass('hide');
					
					sessionStorage.setItem('day_deg', '0');
					$('#allPlanView').click();

					loadPlanner(data.planDtl);
					
				}
				
			});

		}
    	
		$('#minus').click(function(){
			var dayDeg=Number(document.getElementById('dayDegSet').value);
				
			if(dayDeg==1){
				alert('일정은 최소 1일 이상 등록하시기 바랍니다');
			}else{
				document.getElementById('dayDegSet').value=dayDeg-1;
				$('#dayDegText').text(document.getElementById('dayDegSet').value+'일');
			}
		});
		
		$('#plus').click(function(){
			var dayDeg=Number(document.getElementById('dayDegSet').value);

			document.getElementById('dayDegSet').value=dayDeg+1;
			$('#dayDegText').text(document.getElementById('dayDegSet').value+'일');
		});
    	

		//팝업정보 불러오기
		$('#popupSave').click(function(e){

			if(isEmpty($('#plannerTitleModal').val())==true){
				alert('플래너제목을 입력하시기 바랍니다');
				return false;
			}
			
			if(isEmpty($('#trvFromDateModal').val())==true){
				alert('출발일을 입력하시기 바랍니다');
				return false;
			}
			
			document.getElementById('plannerTitle').value=document.getElementById('plannerTitleModal').value;
			var day=Number(document.getElementById('dayDegSet').value);
			var fixDay=Number(document.getElementById('dayDegSetFix').value);
			var frmDt=document.getElementById('trvFromDateModal').value.substring(5);
			var frmDtDate=new Date(document.getElementById('trvFromDateModal').value);

			var toDtDate=frmDtDate;

			toDtDate.setDate(toDtDate.getDate()+(day-1));
			
			var tomm=toDtDate.getMonth()+1;
			var todd=toDtDate.getDate();
			
			if(todd<10) {
			    todd='0'+todd;
			} 

			if(tomm<10) {
			    tomm='0'+tomm;
			}

			var toDt=tomm+'-'+todd;

			if(day>fixDay){
				var dayMaxNum;
				var addDayDiv=day-fixDay
				for(var i=0;i<addDayDiv;i++){
	
					if($('#dayDiv div').length==0){
						dayMaxNum=0;
					}else{
						dayMaxNum=$('#dayDiv div').eq($('#dayDiv div').length-1).find('input[type=hidden]').eq(0).val();
					}
					var dayNum=Number(dayMaxNum)+1;
					var length = $('#dayDiv div').length;

					var fromDt=new Date(document.getElementById('trvFromDateModal').value);
					fromDt.setDate(fromDt.getDate()+length);

					//요일구하기
					var week = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
					var dayOfWeek = week[fromDt.getDay()];
					
					if(dd<10) {
					    dd='0'+dd;
					} 

					if(mm<10) {
					    mm='0'+mm;
					}
					
					var yyyy=fromDt.getFullYear();
					var mm=fromDt.getMonth()+1;
					var dd=fromDt.getDate();
					
					if(dd<10) {
					    dd='0'+dd;
					} 

					if(mm<10) {
					    mm='0'+mm;
					}
					
					$('#tabsContent').append('<div id="tabsDay'+dayNum+'"><div class="hide"></div><div class="hide"></div><div class="hide"></div><div class="hide"><center><label>추후 업데이트 예정입니다.</label></center></div><div class="hide"></div></div>');
					
					$('#dayDiv').append('<div><label>DAY'+(length+1)+'</label><label>'+mm+'-'+dd+'</label><label>'+dayOfWeek+'</label><i class="fas fa-trash deleteDay" id="deleteDay"></i><input type="hidden" id="dayNum" name="dayNum" value="'+dayNum+'"/></div>');
				}
				
				if(fixDay==0){
					$('#dayDiv div').eq(0).css('background-color','#DDDDDD');
					sessionStorage.setItem('day_deg', '1');
				}
				
					
			}else if(day<fixDay){
				alert('날짜별 일정을 직접 삭제하시기 바랍니다');
				document.getElementById('dayDegSet').value=$('#dayDiv div').length;
				document.getElementById('dayDegSetFix').value=$('#dayDiv div').length;
				$('#dayDegText').text(document.getElementById('dayDegSet').value+'일');
				$('#popupClose').click();
				return false;
			}

			//요일 날짜 텍스트 변경
			for(var i=0;i<$('#dayDiv div').length;i++){
				var fromDt=new Date(document.getElementById('trvFromDateModal').value);
				fromDt.setDate(fromDt.getDate()+i);

				//요일구하기
				var week = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
				var dayOfWeek = week[fromDt.getDay()];
				
				if(dd<10) {
				    dd='0'+dd;
				} 

				if(mm<10) {
				    mm='0'+mm;
				}
				
				var yyyy=fromDt.getFullYear();
				var mm=fromDt.getMonth()+1;
				var dd=fromDt.getDate();
				
				if(dd<10) {
				    dd='0'+dd;
				} 

				if(mm<10) {
				    mm='0'+mm;
				}

				var dayNumRe=$('#dayDiv div').eq(i).find('input[type=hidden]').eq(0).val();
				$('#dayDiv div').eq(i).find('label').eq(1).text(mm+'-'+dd);
				$('#dayDiv div').eq(i).find('label').eq(2).text(dayOfWeek);
			}

			
			$('#periodView').html(frmDt+'~'+toDt+'<div id="imgDiv"><img src="imgs/editDays.png" id="editImg" class="editImg"/></div>');
			document.getElementById('dayDegSetFix').value=day;

			var dayDegg=$('#dayDiv div').eq($(this).index()).find('label').eq(0).text();
			var dayDate=$('#dayDiv div').eq($(this).index()).find('label').eq(1).text();
			var dayOfWeek=$('#dayDiv div').eq($(this).index()).find('label').eq(2).text();
			$('#categoryInfo').html('<div><label>'+dayDegg+'</label>&nbsp;|&nbsp;<label>'+dayDate+'</label>&nbsp;<label>('+dayOfWeek+')</label>&nbsp;&nbsp;<img alt="reset" src="imgs/reset.png" id="resetImg"></div>');

			$('#selectLoc').removeClass('hide');
			$('#openClose').removeClass('hide');
			$('#category').removeClass('hide');

			$('#mapDiv').offset({left:450});
			$('#mapDiv').width( '989px' );
			
			$('#popupClose').click();
			
		});

		
		
		//관광지 탭 클릭
		$('#tabs a').eq(0).click(function(e){
			e.preventDefault();
			$('#tabs a').eq(0).parent().addClass('active');
			$('#tabs a').eq(1).parent().removeClass('active');
			$('#tabs a').eq(2).parent().removeClass('active');
			$('#tabs a').eq(3).parent().removeClass('active');
			
			var position=sessionStorage.getItem('day_deg');
			$('#tabsDay'+position+'>div').eq(0).addClass('hide');
			$('#tabsDay'+position+'>div').eq(1).addClass('hide');
			$('#tabsDay'+position+'>div').eq(2).addClass('hide');
			$('#tabsDay'+position+'>div').eq(3).addClass('hide');
			$('#tabsDay'+position+'>div').eq(0).removeClass('hide');


		});

		//숙소 탭 클릭
		$('#tabs a').eq(1).click(function(e){
			e.preventDefault();
			$('#tabs a').eq(1).parent().addClass('active');
			$('#tabs a').eq(0).parent().removeClass('active');
			$('#tabs a').eq(2).parent().removeClass('active');
			$('#tabs a').eq(3).parent().removeClass('active');

			var position=sessionStorage.getItem('day_deg');
			$('#tabsDay'+position+'>div').eq(0).addClass('hide');
			$('#tabsDay'+position+'>div').eq(1).addClass('hide');
			$('#tabsDay'+position+'>div').eq(2).addClass('hide');
			$('#tabsDay'+position+'>div').eq(3).addClass('hide');
			$('#tabsDay'+position+'>div').eq(1).removeClass('hide');
		});

		//맛집 탭 클릭
		$('#tabs a').eq(2).click(function(e){
			e.preventDefault();
			$('#tabs a').eq(2).parent().addClass('active');
			$('#tabs a').eq(0).parent().removeClass('active');
			$('#tabs a').eq(1).parent().removeClass('active');
			$('#tabs a').eq(3).parent().removeClass('active');

			var position=sessionStorage.getItem('day_deg');
			$('#tabsDay'+position+'>div').eq(0).addClass('hide');
			$('#tabsDay'+position+'>div').eq(1).addClass('hide');
			$('#tabsDay'+position+'>div').eq(2).addClass('hide');
			$('#tabsDay'+position+'>div').eq(3).addClass('hide');
			$('#tabsDay'+position+'>div').eq(2).removeClass('hide');
		});

        //교통 탭 클릭
        $('#tabs a').eq(3).click(function(e){
			e.preventDefault();
			$('#tabs a').eq(3).parent().addClass('active');
			$('#tabs a').eq(0).parent().removeClass('active');
			$('#tabs a').eq(1).parent().removeClass('active');
			$('#tabs a').eq(2).parent().removeClass('active');

			var position=sessionStorage.getItem('day_deg');
			$('#tabsDay'+position+'>div').eq(0).addClass('hide');
			$('#tabsDay'+position+'>div').eq(1).addClass('hide');
			$('#tabsDay'+position+'>div').eq(2).addClass('hide');
			$('#tabsDay'+position+'>div').eq(3).addClass('hide');
			$('#tabsDay'+position+'>div').eq(3).removeClass('hide');
		});
        

        $('#openClose').click(function(){
			if($("#category").css("display") == "none"){
				$('#category').show();
				$('#openClose').html('<img alt="openClose" src="imgs/openLeft.png"/>');
				$('#openClose').offset({left:720});
			}else{
				$('#category').hide();
				$('#openClose').html('<img alt="openClose" src="imgs/openRight.png"/>');
				$('#openClose').offset({left:450});
			}
            
        });

  		
        //검색버튼 클릭 이벤트
        $('#searchPlace').click(function(){
			
			if(document.getElementById('contentTypeId').value==null || document.getElementById('contentTypeId').value==''){
				alert('장소의 타입을 선택하시기 바랍니다');
				return false;
			}

			//검색결과 전부 지움
			$('#locResult').empty();
            $('#pageDiv').remove();
            
	        var sKey='';
	        var contentTypeId=document.getElementById('contentTypeId').value;
	        var areaCode=document.getElementById('areaCode').value;
	        var sigunguCode=document.getElementById('sigunguCode').value;
	        var keyword=document.getElementById('keyword').value;
	        var reqUrl;
	        if(keyword==null || keyword==''){
	        	reqUrl='http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey='+sKey+'&contentTypeId='+contentTypeId+'&areaCode='+areaCode+'&sigunguCode='+sigunguCode+'&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=9999&pageNo=1&_type=json';
	        }else{
	        	var encKeyword = encodeURI(keyword);
	        	reqUrl='http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey='+sKey+'&keyword='+encKeyword+'&contentTypeId='+contentTypeId+'&areaCode='+areaCode+'&sigunguCode='+sigunguCode+'&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=999&pageNo=1&_type=json';
		    }
		    
	        $.ajax({
				url:reqUrl,
				type:'get',
				data:'idx=1',
				success:function(data){
					var dataCoObj = new Object();
					var dataCoArr = new Array();
					
					
					
					if(data.response.body.totalCount!=0){

						if(data.response.body.totalCount<2){
							
							var input='';
							
							console.log(data);
								
								if(data.response.body.items.item.firstimage==null){
									
									$('#locResult').html('<center><label>검색결과가 없습니다</label></center>');
									
								}else{
									dataCoArr.push(data.response.body.items.item);
									dataCoObj.item=dataCoArr;
									dataYArray=dataCoObj.item;
									console.log(dataYArray);
		
									var dataSendObj = new Object();
									var dataSendArr = new Array();
									
									$('#locResult').append('<div class="locSelect" style="height: 100px; width: 274px;"><a><img class="ckDivChgCl" width="100" height="100" alt="..." src="'+dataYArray[0].firstimage+'" onclick="clickLabel('+dataYArray[0].mapy+','+dataYArray[0].mapx+','+dataYArray[0].contenttypeid+',\''+dataYArray[0].title+'\',\''+dataYArray[0].firstimage+'\',\''+dataYArray[0].addr1+'\',\''+dataYArray[0].zipcode+'\',\''+dataYArray[0].tel+'\')"/></a><img alt="searchDetail" src="imgs/detailInfo.png" class="searchDetail" onclick="detailLoc('+dataYArray[0].contentid+')"/><img alt="locPlus" src="imgs/locPlus.png" class="locPlus"/><label><a class="ckDivChgCl" onclick="clickLabel('+dataYArray[0].mapy+','+dataYArray[0].mapx+','+dataYArray[0].contenttypeid+',\''+dataYArray[0].title+'\',\''+dataYArray[0].firstimage+'\',\''+dataYArray[0].addr1+'\',\''+dataYArray[0].zipcode+'\',\''+dataYArray[0].tel+'\')">'+dataYArray[0].title+'<br/>'+dataYArray[0].addr1+'</a></label><input type="hidden" id="contenttypeid" value="'+dataYArray[0].contenttypeid+'"/><input type="hidden" id="contentId" value="'+dataYArray[0].contentid+'"/></div>');
		
									var pageTxt='<div id="pageDiv">';
									pageTxt+='	<div><nav aria-label="Page navigation">';
									pageTxt+='		<center><ul id="planpagination" class="pagination planpagination">';
									pageTxt+='			<li><a class="pageIdx">1</a></li>';
									pageTxt+='		</ul></center>';
									pageTxt+='	</nav></div></div>';
									
									$('#selectLoc').append(pageTxt);
									dataSendArr.push(dataYArray[0]);
									dataSendObj.item=dataSendArr;
									var dataSArray=dataSendObj.item;
		
									searchLoc(dataSArray);
		
									$('.planpagination>li').eq(0).addClass('active');
								}
						}else{

							for(var k=0;k<data.response.body.items.item.length;k++){
								
								if(data.response.body.items.item[k].firstimage!=null){
									
									dataCoArr.push(data.response.body.items.item[k]);
									
								}
							}
							dataCoObj.item=dataCoArr;
							dataYArray=dataCoObj.item;
							
							var dataArray=data.response.body.items.item;
							var input='';
							var viewCnt=0;
							if(dataYArray.length<10){
								viewCnt=dataYArray.length;
							}else{
								viewCnt=10;
							}

							var dataSendObj = new Object();
							var dataSendArr = new Array();
							
								for(var i=0;i<viewCnt;i++){
									var img;
									
									if(dataYArray[i].firstimage==null){
										img='imgs/no_img.gif';
									}else{
										img=dataYArray[i].firstimage;
									}
									dataSendArr.push(dataYArray[i]);
									$('#locResult').append('<div class="locSelect" style="height: 100px; width: 274px;"><a><img class="ckDivChgCl" width="100" height="100" alt="..." src="'+img+'" onclick="clickLabel('+dataYArray[i].mapy+','+dataYArray[i].mapx+','+dataYArray[i].contenttypeid+',\''+dataYArray[i].title+'\',\''+dataYArray[i].firstimage+'\',\''+dataYArray[i].addr1+'\',\''+dataYArray[i].zipcode+'\',\''+dataYArray[i].tel+'\')"/></a><img alt="searchDetail" src="imgs/detailInfo.png" class="searchDetail" onclick="detailLoc('+dataYArray[i].contentid+')"/><img alt="locPlus" src="imgs/locPlus.png" class="locPlus"/><label><a class="ckDivChgCl" onclick="clickLabel('+dataYArray[i].mapy+','+dataYArray[i].mapx+','+dataYArray[i].contenttypeid+',\''+dataYArray[i].title+'\',\''+dataYArray[i].firstimage+'\',\''+dataYArray[i].addr1+'\',\''+dataYArray[i].zipcode+'\',\''+dataYArray[i].tel+'\')">'+dataYArray[i].title+'<br/>'+dataYArray[i].addr1+'</a></label><input type="hidden" id="contenttypeid" value="'+dataYArray[i].contenttypeid+'"/><input type="hidden" id="contentId" value="'+dataYArray[i].contentid+'"/></div>');
									
								}

								dataSendObj.item=dataSendArr;
								var dataSArray=dataSendObj.item;
								
								var pageTxt='<div id="pageDiv">';
								pageTxt+='	<div><nav aria-label="Page navigation">';
								pageTxt+='		<center><ul id="planpagination" class="pagination planpagination">';

								var pageCnt=0;
								if(dataCoArr.length>40){
									pageCnt=4;
								}else{
									pageCnt=Math.ceil(dataCoArr.length/10);
								}

								for(var i=1;i<=pageCnt;i++){
									pageTxt+='			<li><a class="pageIdx">'+i+'</a></li>';
								}

								if(dataCoArr.length>40){
									pageTxt+='			<li><a class="pageIdx" aria-label="Next"><span aria-hidden="true" class="nextPage">&raquo;</span></a></li>';
								}
								
								pageTxt+='		</ul></center>';
								pageTxt+='	</nav></div></div>';
								
								$('#selectLoc').append(pageTxt);
								console.log(dataSArray);
								searchLoc(dataSArray);
								$('.planpagination>li').eq(0).addClass('active');
						}
					}else{
						$('#locResult').html('<center><label>검색결과가 없습니다</label></center>');

					}
					
				}
			});
        });

        //시군구코드 세팅함수
		$('#areaCode').change(function(){

			if(document.getElementById('areaCode').value!=''){
			//시,군,구 코드 세팅
				$.ajax({
					url:"search/areacode",
					data:{areaCode:document.getElementById('areaCode').value},
					method:"GET",
					dataType:"json"
				}).done(function(data){

					var input='<option value="">전체</option>';
					for(var i=0;i<data.length;i++){
						input+='<option value="'+data[i].sigungu_code+'" id="'+data[i].loc_dtl_cd+'">'+data[i].loc_dtl_name+'</option>';
					}
					$('#sigunguCode').html(input);
					
				});
			}else{
				$('#sigunguCode').html('<option value="">전체</option>');
			}	
		});

        //전체일정보기 클릭
        $('#allPlanView').click(function(){

        	removeMarker();
        	
			$('#dayDiv div').css('background-color','#AAAAAA')
        	$('#allPlanView').css('background-color','#DDDDDD');

			$('#selectLoc').addClass('hide');
			$('#openClose').addClass('hide');
			$('#category').addClass('hide');

			$('#mapDiv').offset({left:150});
			$('#mapDiv').width( '1289px' );

			//마커생성
			
			var planDtlArray = new Array();
			
			for(var i=0;i<$('#dayDiv>div').length;i++){
				for(var j=0;j<$('#tabsContent>div').eq(i).find('div').eq(4).find('span').length;j++){
					var planDtl=new Object();

					var locSplit=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('label').eq(0).find('a').html().split('<br>');
					var loc_name=locSplit[2];
					var locAddr=locSplit[3];
					
					planDtl.loc_addr=locAddr;
					planDtl.loc_name=loc_name;
					planDtl.loc_post_code=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(3).val();
					planDtl.loc_img_url=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(5).val();
					planDtl.loc_tel=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(6).val();
					planDtl.loc_type=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(0).val();
					planDtl.position_x=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(1).val();
					planDtl.position_y=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(2).val();
					planDtl.trv_deg=String(i+1);
					planDtlArray.push(planDtl);
				}
			}
				
			//마커추가
			loadPlanner(planDtlArray);
        	
        });
	});

    //장소선택 디바이스 클릭 이벤트
    $(document).on("click","#locResult div",function(e){
        
      	if($(e.target).hasClass('locPlus') || $(e.target).hasClass('searchDetail')){
          	
			var idx=$(this).index();
			var contentId=$('#locResult>div').eq(idx).find('input[type=hidden]').eq(1).val();
	
			var sKey='';
	        var reqUrl;
	        reqUrl='http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey='+sKey+'&contentTypeId=&contentId='+contentId+'&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json';
	
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
					var firstimage=dataVal.firstimage;
					var homepageTag=dataVal.homepage;
					var mapx=dataVal.mapx;
					var mapy=dataVal.mapy;
					var overview=dataVal.overview;
					var tel=dataVal.tel;
					var title=dataVal.title;
					var zipcode=dataVal.zipcode;	//우편번호
					
					console.log(contentid);			//히든
					console.log(contenttypeid);		//히든
					console.log(addr1);				//뷰
					console.log(firstimage);		//뷰
					console.log(homepageTag);			//상세정보
					console.log(mapx+','+mapy);		//히든
					console.log(overview);			//상세정보
					console.log(tel);				//뷰
					console.log(title);				//뷰
					console.log(zipcode);			//뷰
	
					if(zipcode==null){
						zipcodeTxt='';
					}else{
						zipcodeTxt='('+zipcode+')';
					}
	
					var img;
					if(firstimage==null){
						img='imgs/no_img.gif';
					}else{
						img=firstimage;
					}
					var position=sessionStorage.getItem('day_deg');
					var eq4Length=$('#tabsDay'+position+'>div').eq(4).find('span').length;
					
					var id,eq4Idx;
					if($('#tabsDay'+position+'>div').eq(4).find('span').length==0){
						eq4Idx=0;
					}else{
						eq4Idx=$('#tabsDay'+position+'>div').eq(4).find('span').eq(eq4Length-1).attr('id');
					}
						id=Number(eq4Idx)+1;
						
					if($(e.target).hasClass('locPlus')){
						var overlap=false;
						for(var i=0;i<eq4Length;i++){
							if(contentid==$('#tabsDay'+position+'>div').eq(4).find('span').eq(i).find('input').eq(4).val()){
								overlap=true;
								break;
							}
						}	

						if(overlap==true){
							alert('이미 추가된 장소입니다');
							return false;
						}


						
						var temp='<span id="'+id+'" class="mySpan"><a><img src="'+img+'" alt="firstimage" class="myImage" onclick="clickLabel('+mapy+','+mapx+','+contenttypeid+',\''+title+'\',\''+firstimage+'\',\''+addr1+'\',\''+zipcode+'\',\''+tel+'\')"/></a><br/><label><img alt="removeImg" src="imgs/deleteImg.png" class="removeLoc"/>';
						temp+='<img alt="cost" src="imgs/cost.png" class="cost"/><img alt="detailInfo" src="imgs/detailInfo.png" class="detailInfo" onclick="detailLoc('+contentid+')"/><a onclick="clickLabel('+mapy+','+mapx+','+contenttypeid+',\''+title+'\',\''+firstimage+'\',\''+addr1+'\',\''+zipcode+'\',\''+tel+'\')"><br/><br/>'+title+'<br/>'+addr1+'</a></label>';
		
						
						temp+='<input type="hidden" id="contenttypeid" value="'+contenttypeid+'"/><input type="hidden" id="mapx" value="'+mapx+'"/>';
						temp+='<input type="hidden" id="mapy" value="'+mapy+'"/><input type="hidden" id="zipcode" value="'+zipcode+'"/>'
						temp+='<input type="hidden" id="contentid" value="'+contentid+'"/><input type="hidden" id="firstimage" value="'+firstimage+'"/>'
						temp+='<input type="hidden" id="tel" value="'+tel+'"/><input type="hidden" id="overview" value="'+overview+'"/>';
						temp+='<input type="hidden" id="budget" value="0"/><input type="hidden" id="locMemo" value=""/><hr style="border-color:gray;width:100%"></hr></span>';
						
						//관광지
						if(contenttypeid==12){
					    	var position=sessionStorage.getItem('day_deg');
					    	$('#tabsDay'+position+'>div').eq(0).removeClass('hide');
					    	$('#tabsDay'+position+'>div').eq(1).addClass('hide');
							$('#tabsDay'+position+'>div').eq(2).addClass('hide');
							$('#tabsDay'+position+'>div').eq(3).addClass('hide');
		
					    	$('#tabs a').eq(0).parent().addClass('active');
							$('#tabs a').eq(1).parent().removeClass('active');
							$('#tabs a').eq(2).parent().removeClass('active');
							$('#tabs a').eq(3).parent().removeClass('active');
		
							$('#tabsDay'+position+'>div').eq(0).append(temp);
							$('#tabsDay'+position+'>div').eq(4).append(temp);	//저장용
						}
						//숙소
						else if(contenttypeid==32){
					    	var position=sessionStorage.getItem('day_deg');
					    	$('#tabsDay'+position+'>div').eq(1).removeClass('hide');
					    	$('#tabsDay'+position+'>div').eq(0).addClass('hide');
							$('#tabsDay'+position+'>div').eq(2).addClass('hide');
							$('#tabsDay'+position+'>div').eq(3).addClass('hide');
		
					    	$('#tabs a').eq(1).parent().addClass('active');
							$('#tabs a').eq(0).parent().removeClass('active');
							$('#tabs a').eq(2).parent().removeClass('active');
							$('#tabs a').eq(3).parent().removeClass('active');
		
							$('#tabsDay'+position+'>div').eq(1).append(temp);
							$('#tabsDay'+position+'>div').eq(4).append(temp);	//저장용
						}
						//맛집
						else if(contenttypeid==39){
					    	var position=sessionStorage.getItem('day_deg');
					    	$('#tabsDay'+position+'>div').eq(2).removeClass('hide');
					    	$('#tabsDay'+position+'>div').eq(0).addClass('hide');
							$('#tabsDay'+position+'>div').eq(1).addClass('hide');
							$('#tabsDay'+position+'>div').eq(3).addClass('hide');
		
					    	$('#tabs a').eq(2).parent().addClass('active');
							$('#tabs a').eq(1).parent().removeClass('active');
							$('#tabs a').eq(0).parent().removeClass('active');
							$('#tabs a').eq(3).parent().removeClass('active');
		
							$('#tabsDay'+position+'>div').eq(2).append(temp);
							$('#tabsDay'+position+'>div').eq(4).append(temp);	//저장용
						}
						//나머지
						else{
					    	var position=sessionStorage.getItem('day_deg');
					    	$('#tabsDay'+position+'>div').eq(3).removeClass('hide');
					    	$('#tabsDay'+position+'>div').eq(0).addClass('hide');
							$('#tabsDay'+position+'>div').eq(1).addClass('hide');
							$('#tabsDay'+position+'>div').eq(2).addClass('hide');
		
					    	$('#tabs a').eq(3).parent().addClass('active');
							$('#tabs a').eq(1).parent().removeClass('active');
							$('#tabs a').eq(2).parent().removeClass('active');
							$('#tabs a').eq(0).parent().removeClass('active');
		
							$('#tabsDay'+position+'>div').eq(3).append(temp);
							$('#tabsDay'+position+'>div').eq(4).append(temp);	//저장용
						}
						//카테고리탭 show
						if($("#category").css("display") == "none"){
							$('#category').show();
							$('#openClose').html('<img alt="openClose" src="imgs/openLeft.png"/>');
							$('#openClose').offset({left:720});
						}
					}	
	
	
					//장소 추가 후 마커 추가할 배열 생성
					var planDtlArray = new Array();
						for(var j=0;j<$('#tabsDay'+position+'>div').eq(4).find('span').length;j++){
							var planDtl=new Object();
	
							var locSplit=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('label').eq(0).find('a').html().split('<br>');
							var loc_name=locSplit[2];
							var locAddr=locSplit[3];
							
							planDtl.loc_addr=locAddr;
							planDtl.loc_name=loc_name;
							planDtl.loc_post_code=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(3).val();
							planDtl.loc_img_url=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(5).val();
							planDtl.loc_tel=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(6).val();
							planDtl.loc_type=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(0).val();
							planDtl.position_x=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(1).val();
							planDtl.position_y=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(2).val();
							planDtl.trv_deg=String(j+1);
							planDtlArray.push(planDtl);
						}
						
					
					//마커추가
					loadPlanner(planDtlArray);
			}
        });

    }
    });
    
	//day div 선택 및 삭제 이벤트
	$(document).on("click","#dayDiv div",function(e){
		//클래스명 deleteDay 영역 안에서만 삭제
		if($(e.target).prop('tagName')=='path'){
			if($('#dayDiv div').length>1){

				var cfresult = confirm('"'+$('#dayDiv>div').eq($(this).index()).find('label').eq(0).text()+'" 삭제하시겠습니까?');

				if(cfresult==false){
					return false;
				}
				

				
				if($('#dayDiv div').eq($(this).index()).find('input[type=hidden]').eq(0).val()==sessionStorage.getItem('day_deg')){
					
					for(var i=$('#dayDiv div').index(this);i<$('#dayDiv div').length;i++){
						var dayNum=$('#dayDiv div').eq(i).find('input[type=hidden]').eq(0).val();
	
						
						var fromDt=new Date(document.getElementById('trvFromDateModal').value);
						fromDt.setDate(fromDt.getDate()+(i-1));
	
						//요일구하기
						var week = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
						var dayOfWeek = week[fromDt.getDay()];
						
						if(dd<10) {
						    dd='0'+dd;
						} 
	
						if(mm<10) {
						    mm='0'+mm;
						}
						
						var yyyy=fromDt.getFullYear();
						var mm=fromDt.getMonth()+1;
						var dd=fromDt.getDate();
						
						if(dd<10) {
						    dd='0'+dd;
						} 
	
						if(mm<10) {
						    mm='0'+mm;
						}
						
						$('#dayDiv div').eq(i).html('<label>DAY'+i+'</label><label>'+mm+'-'+dd+'</label><label>'+dayOfWeek+'</label><i class="fas fa-trash deleteDay" id="deleteDay"></i><input type="hidden" id="dayNum" name="dayNum" value="'+dayNum+'"/></div>');
					}
					
					var dayNum=$('#dayDiv div').eq($(this).index()).find('input[type=hidden]').eq(0).val();
					var viewDiv1=$('#dayDiv div').eq($(this).index()+1).find('input[type=hidden]').eq(0).val();
					var viewDiv2=$('#dayDiv div').eq($(this).index()-1).find('input[type=hidden]').eq(0).val();
					$('#tabsDay'+dayNum).empty();
					$('#tabsDay'+dayNum).remove();
	
					$('#dayDiv div').eq($(this).index()).remove();
			
					//보여줄것
					if(viewDiv1!=null){
						$('#tabsDay'+viewDiv1+'>div').eq(0).removeClass('hide');
						sessionStorage.setItem('day_deg', viewDiv1);
					}else{
						$('#tabsDay'+viewDiv2+'>div').eq(0).removeClass('hide');
						sessionStorage.setItem('day_deg', viewDiv2);
					}
			
					//셀렉트박스 초기화
			/*		$("#contentTypeId option:eq(0)").prop("selected", true);
					$("#areaCode option:eq(0)").prop("selected", true);
					$("#sigunguCode option:eq(0)").prop("selected", true);
					$('#sigunguCode').html('<option selected="selected" value="">전체</option>');
					$('#locResult').empty();*/
			
					//상단 여행기간 변경
					var frmDtFull=document.getElementById('trvFromDateModal').value;
					var frmDt=document.getElementById('trvFromDateModal').value.substring(5);
					var frmDateDt=new Date(frmDtFull);
			
					var toDateDt=frmDateDt;
					toDateDt.setDate(toDateDt.getDate()+$('#dayDiv div').length-1);
			
					//날짜 변환
					var tomm=toDateDt.getMonth()+1;
					var todd=toDateDt.getDate();
					
					if(todd<10) {
						todd='0'+todd;
					} 
			
					if(tomm<10) {
						tomm='0'+tomm;
					}
			
					$('#periodView').html(frmDt+'~'+tomm+'-'+todd+'<div id="imgDiv"><img src="imgs/editDays.png" id="editImg" class="editImg"/></div>');
					document.getElementById('dayDegSet').value=$('#dayDiv div').length;
					document.getElementById('dayDegSetFix').value=$('#dayDiv div').length;
					$('#dayDegText').text(document.getElementById('dayDegSet').value+'일');

				}else{
					for(var i=$('#dayDiv div').index(this);i<$('#dayDiv div').length;i++){
						var dayNum=$('#dayDiv div').eq(i).find('input[type=hidden]').eq(0).val();

						
						var fromDt=new Date(document.getElementById('trvFromDateModal').value);
						fromDt.setDate(fromDt.getDate()+(i-1));

						//요일구하기
						var week = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
						var dayOfWeek = week[fromDt.getDay()];
						
						if(dd<10) {
						    dd='0'+dd;
						} 

						if(mm<10) {
						    mm='0'+mm;
						}
						
						var yyyy=fromDt.getFullYear();
						var mm=fromDt.getMonth()+1;
						var dd=fromDt.getDate();
						
						if(dd<10) {
						    dd='0'+dd;
						} 

						if(mm<10) {
						    mm='0'+mm;
						}
						
						$('#dayDiv div').eq(i).html('<label>DAY'+i+'</label><label>'+mm+'-'+dd+'</label><label>'+dayOfWeek+'</label><i class="fas fa-trash deleteDay" id="deleteDay"></i><input type="hidden" id="dayNum" name="dayNum" value="'+dayNum+'"/></div>');
					}

					var dayNum=$('#dayDiv div').eq($(this).index()).find('input[type=hidden]').eq(0).val();
					var viewDiv1=$('#dayDiv div').eq($(this).index()+1).find('input[type=hidden]').eq(0).val();
					var viewDiv2=$('#dayDiv div').eq($(this).index()-1).find('input[type=hidden]').eq(0).val();
					$('#tabsDay'+dayNum).empty();
					$('#tabsDay'+dayNum).remove();

					$('#dayDiv div').eq($(this).index()).remove();

					//셀렉트박스 초기화
			/*		$("#contentTypeId option:eq(0)").prop("selected", true);
					$("#areaCode option:eq(0)").prop("selected", true);
					$("#sigunguCode option:eq(0)").prop("selected", true);
					$('#sigunguCode').html('<option selected="selected" value="">전체</option>');
					$('#locResult').empty();*/
			
					//상단 여행기간 변경
					var frmDtFull=document.getElementById('trvFromDateModal').value;
					var frmDt=document.getElementById('trvFromDateModal').value.substring(5);
					var frmDateDt=new Date(frmDtFull);
			
					var toDateDt=frmDateDt;
					toDateDt.setDate(toDateDt.getDate()+$('#dayDiv div').length-1);
			
					//날짜 변환
					var tomm=toDateDt.getMonth()+1;
					var todd=toDateDt.getDate();
					
					if(todd<10) {
						todd='0'+todd;
					} 
			
					if(tomm<10) {
						tomm='0'+tomm;
					}
			
					$('#periodView').html(frmDt+'~'+tomm+'-'+todd+'<div id="imgDiv"><img src="imgs/editDays.png" id="editImg" class="editImg"/></div>');
					document.getElementById('dayDegSet').value=$('#dayDiv div').length;
					document.getElementById('dayDegSetFix').value=$('#dayDiv div').length;
					$('#dayDegText').text(document.getElementById('dayDegSet').value+'일');
				}

				//마커 재설정
				var planDtlArray = new Array();

				for(var i=0;i<$('#dayDiv>div').length;i++){
					for(var j=0;j<$('#tabsContent>div').eq(i).find('div').eq(4).find('span').length;j++){
						var planDtl=new Object();

						var locSplit=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('label').eq(0).find('a').html().split('<br>');
						var loc_name=locSplit[2];
						var locAddr=locSplit[3];
						
						planDtl.loc_addr=locAddr;
						planDtl.loc_name=loc_name;
						planDtl.loc_post_code=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(3).val();
						planDtl.loc_img_url=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(5).val();
						planDtl.loc_tel=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(6).val();
						planDtl.loc_type=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(0).val();
						planDtl.position_x=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(1).val();
						planDtl.position_y=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(2).val();
						planDtl.trv_deg=String(i+1);
						planDtlArray.push(planDtl);
					}
				}
					
				
				//마커추가
				loadPlanner(planDtlArray);
				
			}else{
				alert('일정은 최소 1일 이상 등록하시기 바랍니다');
			}

			$('.dayRemoveLabel').addClass('hide');
			
			//메모,예산 재설정
			var costAll=0;
			var daySize=$('#dayDiv div').length
			
			for(var i=0;i<daySize;i++){
				//스판사이즈 측정안됨
				var spanSize=$('#tabsDay'+$('#dayDiv div').eq(i).find('input').val()+ '>div').eq(4).find('span').length;
				for(var j=0;j<spanSize;j++){
					costAll+=Number($('#tabsDay'+$('#dayDiv div').eq(i).find('input').val()+ '>div').eq(4).find('span').eq(j).find('input').eq(8).val());
				}
			}
			costAll+=Number(inputNumberRemoveComma($('#totTranAmt').val()));
			$('#totAmt').val(inputNumberWithComma(costAll));
			
			$('#wonModal').val('');
			$('#memoModal').val('');

			
			return;
		}

		$('#selectLoc').removeClass('hide');
		$('#openClose').removeClass('hide');
		$('#category').removeClass('hide');

		$('#mapDiv').offset({left:450});
		$('#mapDiv').width( '989px' );
		
		var dayNum=$('#dayDiv div').eq($(this).index()).find('input[type=hidden]').eq(0).val();
		sessionStorage.setItem('day_deg', dayNum);
		var position = sessionStorage.getItem('day_deg');

		var lastIdx=$('#dayDiv div').last().find('input[type=hidden]').eq(0).val();
		//모든요소 hide
		for(var i=1;i<=lastIdx;i++){
			$('#tabsDay'+i+'>div').eq(0).addClass('hide');
			$('#tabsDay'+i+'>div').eq(1).addClass('hide');
			$('#tabsDay'+i+'>div').eq(2).addClass('hide');
			$('#tabsDay'+i+'>div').eq(3).addClass('hide');
		}
		
		$('#tabsDay'+position+'>div').eq(0).removeClass('hide');
		$('#tabs a').eq(0).parent().addClass('active');
		$('#tabs a').eq(1).parent().removeClass('active');
		$('#tabs a').eq(2).parent().removeClass('active');
		$('#tabs a').eq(3).parent().removeClass('active');
		var dayView=$('#dayDiv div>label').eq($(this).index()).text();
		$('#dayView').text(dayView);
		
		for(var i=0;i<$('#dayDiv div').length;i++){
			$('#dayDiv div').eq(i).css('background-color','#AAAAAA');
		}
		$('#allPlanView').css('background-color','#AAAAAA');
		$('#dayDiv div').eq($(this).index()).css('background-color','#DDDDDD');

		var dayDegg=$('#dayDiv div').eq($(this).index()).find('label').eq(0).text();
		var dayDate=$('#dayDiv div').eq($(this).index()).find('label').eq(1).text();
		var dayOfWeek=$('#dayDiv div').eq($(this).index()).find('label').eq(2).text();
		
		$('#categoryInfo').html('<div><label>'+dayDegg+'</label>&nbsp;|&nbsp;<label>'+dayDate+'</label>&nbsp;<label>('+dayOfWeek+')</label>&nbsp;&nbsp;<img alt="reset" src="imgs/reset.png" id="resetImg"></div>');

			if($('#tabsDay'+position+'>div').eq(4).find('span').length>0){
		
			var planDtlArray = new Array();
				for(var j=0;j<$('#tabsDay'+position+'>div').eq(4).find('span').length;j++){
					var planDtl=new Object();
	
					var locSplit=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('label').eq(0).find('a').html().split('<br>');
					var loc_name=locSplit[2];
					var locAddr=locSplit[3];
					
					planDtl.loc_addr=locAddr;
					planDtl.loc_name=loc_name;
					planDtl.loc_post_code=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(3).val();
					planDtl.loc_img_url=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(5).val();
					planDtl.loc_tel=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(6).val();
					planDtl.loc_type=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(0).val();
					planDtl.position_x=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(1).val();
					planDtl.position_y=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(2).val();
					planDtl.trv_deg=String(j+1);
					planDtlArray.push(planDtl);
				}
				
			
			//마커추가
			loadPlanner(planDtlArray);
			if($("#category").css("display") == "none"){
				$('#openClose').click();

			}
			
			}else{
				dayClickMarkerE();
			}
	});
    
    //day 추가
	function addDay(){
		var dayMaxNum;
		if($('#dayDiv div').length==0){
			dayMaxNum=0;
		}else{
			dayMaxNum=$('#dayDiv div').eq($('#dayDiv div').length-1).find('input[type=hidden]').eq(0).val();
    	}
		
		var dayNum=Number(dayMaxNum)+1;
		var length = $('#dayDiv div').length;

		var fromDt=new Date(document.getElementById('trvFromDateModal').value);
		fromDt.setDate(fromDt.getDate()+length);

		var yyyy=fromDt.getFullYear();
		var mm=fromDt.getMonth()+1;
		var dd=fromDt.getDate();

		//요일구하기
		var week = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
		var dayOfWeek = week[fromDt.getDay()];
		
		if(dd<10) {
		    dd='0'+dd;
		} 

		if(mm<10) {
		    mm='0'+mm;
		}

		
		$('#tabsContent').append('<div id="tabsDay'+dayNum+'"><div class="hide"></div><div class="hide"></div><div class="hide"></div><div class="hide"><center><label>추후 업데이트 예정입니다.</label></center></div><div class="hide"></div></div>');
		
		$('#dayDiv').append('<div><label>DAY'+(length+1)+'</label><label>'+mm+'-'+dd+'</label><label>'+dayOfWeek+'</label><i class="fas fa-trash deleteDay" id="deleteDay"></i><input type="hidden" id="dayNum" name="dayNum" value="'+dayNum+'"/></div>');

		//상단 여행기간 변경
		var frmDtFull=document.getElementById('trvFromDateModal').value;
		var frmDt=document.getElementById('trvFromDateModal').value.substring(5);
		var frmDateDt=new Date(frmDtFull);

		var toDateDt=frmDateDt;
		toDateDt.setDate(toDateDt.getDate()+$('#dayDiv div').length-1);

		//날짜 변환
		var tomm=toDateDt.getMonth()+1;
		var todd=toDateDt.getDate();
		
		if(todd<10) {
			todd='0'+todd;
		} 

		if(tomm<10) {
			tomm='0'+tomm;
		}

		$('#periodView').html(frmDt+'~'+tomm+'-'+todd+'<div id="imgDiv"><img src="imgs/editDays.png" id="editImg" class="editImg"/></div>');

		document.getElementById('dayDegSet').value=Number(document.getElementById('dayDegSet').value)+1;
		document.getElementById('dayDegSetFix').value=Number(document.getElementById('dayDegSetFix').value)+1;
		$('#dayDegText').text(document.getElementById('dayDegSet').value+'일');
		
	}

	//내 목록에서 span제거 이벤트
	$(document).on("click","#tabsContent>div span",function(e){
		if($(e.target).hasClass('removeLoc')){

			var idx=$(this).index();
			var position=sessionStorage.getItem('day_deg');
			var contentTypeIdx=$('#tabs ul').find('li[class=active]').index();
			

			var locSplit=$('#tabsDay'+position+'>div').eq(contentTypeIdx).find('span').eq(idx).find('label').eq(0).find('a').html().split('<br>');
			var loc_name=locSplit[2];

			
			var cfresult = confirm('"'+loc_name+'" 삭제하시겠습니까?');

			if(cfresult==false){
				return false;
			}
			
			
			var eq4Idv;
			
			eq4Idv=$('#tabsDay'+position+'>div').eq(contentTypeIdx).find('span').eq(idx).attr('id');
			$($('#tabsDay'+position+'>div').eq(contentTypeIdx)).find('span').eq(idx).remove();
			
			var eq4Idx=Number(eq4Idv)-1;
			$('#tabsDay'+position+'>div').eq(4).find('#'+eq4Idv+'').remove();

			var totamt=0;
			for(var i=0;i<$('#tabsContent>div').length;i++){
				for(var j=0;j<$('#tabsContent>div').eq(i).find('div').eq(4).find('span').length;j++){
					totamt+=Number($('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(8).val());
				}
			}
			
			$('#totAmt').val(inputNumberWithComma(totamt));

			//장소 삭제 후 마커 추가할 배열 생성
			var planDtlArray = new Array();
			for(var j=0;j<$('#tabsDay'+position+'>div').eq(4).find('span').length;j++){
				var planDtl=new Object();

				var locSplit=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('label').eq(0).find('a').html().split('<br>');
				var loc_name=locSplit[2];
				var locAddr=locSplit[3];
				
				planDtl.loc_addr=locAddr;
				planDtl.loc_name=loc_name;
				planDtl.loc_post_code=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(3).val();
				planDtl.loc_img_url=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(5).val();
				planDtl.loc_tel=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(6).val();
				planDtl.loc_type=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(0).val();
				planDtl.position_x=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(1).val();
				planDtl.position_y=$('#tabsDay'+position+'>div').eq(4).find('span').eq(j).find('input').eq(2).val();
				planDtl.trv_deg=String(j+1);
				planDtlArray.push(planDtl);
			}
				
			
			//마커재배치
			loadPlanner(planDtlArray);

			$('.removeLabel').addClass('hide');
			
			return;
		}

		//메모&예산팝업
		if($(e.target).hasClass('cost')){
			 var options={
						show:true
						};

			 var position=sessionStorage.getItem('day_deg');
			 var contentTypeIdx=$('#tabs ul').find('li[class=active]').index();
			 var srcUrl=$('#tabsDay'+position+'>div').eq(contentTypeIdx).find('span').eq($(this).index()).find('input[type=hidden]').eq(5).val();

			 $('#day_degModal').val(position);
			 $('#contentTypeIdxModal').val(contentTypeIdx);
			 $('#idxModal').val($(this).index());

			 $('#wonModal').val(inputNumberWithComma($('#tabsDay'+position+'>div').eq(contentTypeIdx).find('span').eq($(this).index()).find('input[type=hidden]').eq(8).val()));	
			 $('#memoModal').val($('#tabsDay'+position+'>div').eq(contentTypeIdx).find('span').eq($(this).index()).find('input[type=hidden]').eq(9).val());	
			 
			 $('#memoImg').html('<img alt="memoImg" src="'+srcUrl+'" class="memoImgClass"/>');
			 $('#bugAmemo').modal(options);

			return;
		}
	});
	
    $(document).on("click","#imgDiv img",function(e){
        planPopup();
    });
        
	//저장
    $(document).on("click","#savePlan",function(e){

    	var cfresult = confirm('저장하시겠습니까?');

		if(cfresult==false){
			return false;
		}
		$('#allPlanView').click();
    	//전송할 전체 데이터
		var savePlan = new Object();
		var plannerCode=document.getElementById('plannerCode').value;
		var plannerTitle=document.getElementById('plannerTitle').value;

		var daySize=$('#dayDiv div').length;
		var trvFromDateFom=document.getElementById('trvFromDateModal').value;

		var trvFromDateD=new Date(trvFromDateFom);
		var trvToDateD=trvFromDateD;
		trvToDateD.setDate(trvToDateD.getDate()+(daySize-1));
		var trvFromDateD=new Date(trvFromDateFom);
		
		//날짜 변환
		var fryyyy=trvFromDateD.getFullYear();
		var frmm=trvFromDateD.getMonth()+1;
		var frdd=trvFromDateD.getDate();
		
		if(frdd<10) {
		    frdd='0'+frdd;
		} 

		if(frmm<10) {
		    frmm='0'+frmm;
		} 
		
		var toyyyy=trvToDateD.getFullYear();
		var tomm=trvToDateD.getMonth()+1;
		var todd=trvToDateD.getDate();
		
		if(todd<10) {
		    todd='0'+todd;
		} 

		if(tomm<10) {
		    tomm='0'+tomm;
		} 

		var trvFromDate=fryyyy+''+frmm+''+frdd;
		var trvToDate=toyyyy+''+tomm+''+todd;

		
		var totAmt=document.getElementById('totAmt').value;
		var totDist='';
		if(plannerCode==null){
			plannerCode='';
		}
		
		var planMgtArray = new Array();
		var planMgt=new Object();
    	
    	//플래너 관리데이터
		planMgt.plan_code=plannerCode;
		planMgt.plan_title=plannerTitle;
		planMgt.user_id='${sessionScope.id }';
		planMgt.tot_amt=inputNumberRemoveComma($('#totAmt').val());
		planMgt.trv_from_date=trvFromDate;
		planMgt.trv_to_date=trvToDate;
		planMgt.tot_dist=totDist;
		planMgt.tot_tran_exp=$('#totTranAmt').val();
		
		
		
		
		var planMstArray = new Array();
		var planDtlArray = new Array();
		var size=$('#dayDiv div').length;

		var tot_room_chg=0;
		var tot_food_exp=0;
		var tot_tran_exp=0;
		
		var trv_deg_lv=1;
		
		var disArray=new Array();
		var disSplit=$('#storeDistance').val().split(',');
		console.log($('#storeDistance').val());
		
		//일차별 거리계산
		var disCnt=0;
		for(var i=0;i<size;i++){
			disArray[i]=0;
			var dayPlanSize=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').length;
			for(var j=0;j<dayPlanSize;j++){
				disArray[i]+=Number(disSplit[disCnt]);
				disCnt++;
			}
		}
		
		console.log(disArray);

		var locCnt=0;
		for(var i=0;i<size;i++){
			var planMstChd=new Object();

			var trvFromDateD=new Date(trvFromDateFom);
			var trvDateAdd=trvFromDateD;
			trvDateAdd.setDate(trvDateAdd.getDate()+i);

			var yyyy=trvDateAdd.getFullYear();
			var mm=trvDateAdd.getMonth()+1;
			var dd=trvDateAdd.getDate();
			
			if(dd<10) {
			    dd='0'+dd;
			} 

			if(mm<10) {
			    mm='0'+mm;
			}

			var trvDate=yyyy+''+mm+''+dd;
			
			planMstChd.plan_code=plannerCode;
			planMstChd.trv_deg=i+1;

			planMstChd.trv_date=trvDate;
			

			var dayPlanSize=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').length;
			
			var loc_cnt=1;
			
			var dayValue=$('#dayDiv div').eq(i).find('input[type=hidden]').val();

			var dayFoodExp=0;
			var dayRoomChg=0;
			var dayAmt=0;
			
			for(var j=0;j<dayPlanSize;j++){
					var planDtlChd = new Object();
				
					var locSplit=$('#tabsDay'+dayValue+'>div').eq(4).find('span').eq(j).find('label').eq(0).find('a').html().split('<br>');
					var loc_name=locSplit[2];
					var locAddr=locSplit[3];
					var contentType=$('#tabsDay'+dayValue+'>div').eq(4).find('span').eq(j).find('input[type=hidden]').eq(0).val();
					var mapx=$('#tabsDay'+dayValue+'>div').eq(4).find('span').eq(j).find('input[type=hidden]').eq(1).val();
					var mapy=$('#tabsDay'+dayValue+'>div').eq(4).find('span').eq(j).find('input[type=hidden]').eq(2).val();
					var zipcode=$('#tabsDay'+dayValue+'>div').eq(4).find('span').eq(j).find('input[type=hidden]').eq(3).val();
					var contentid=$('#tabsDay'+dayValue+'>div').eq(4).find('span').eq(j).find('input[type=hidden]').eq(4).val();
					var fitstimage=$('#tabsDay'+dayValue+'>div').eq(4).find('span').eq(j).find('input[type=hidden]').eq(5).val();
					var tel=$('#tabsDay'+dayValue+'>div').eq(4).find('span').eq(j).find('input[type=hidden]').eq(6).val();
					var overview=$('#tabsDay'+dayValue+'>div').eq(4).find('span').eq(j).find('input[type=hidden]').eq(7).val();
					var locBdg=$('#tabsDay'+dayValue+'>div').eq(4).find('span').eq(j).find('input[type=hidden]').eq(8).val();
					var locMemo=$('#tabsDay'+dayValue+'>div').eq(4).find('span').eq(j).find('input[type=hidden]').eq(9).val();

					if(locBdg==null){
						locBdg='0';
					}
					
					dayAmt+=Number(inputNumberRemoveComma(locBdg));
					
					if(contentType=='32'){
						dayRoomChg+=Number(inputNumberRemoveComma(locBdg));
					}else if(contentType=='39'){
						dayFoodExp+=Number(inputNumberRemoveComma(locBdg));
					}

					var loc_seq=loc_cnt;

					planDtlChd.loc_name=loc_name;
					planDtlChd.loc_addr=locAddr;
					planDtlChd.loc_type=contentType;
					planDtlChd.trv_deg=trv_deg_lv;
					planDtlChd.loc_post_code=zipcode;
					planDtlChd.position_x=mapx;
					planDtlChd.position_y=mapy;
					planDtlChd.loc_img_url=fitstimage;
					planDtlChd.content_id=contentid;
					planDtlChd.loc_tel=tel;
					planDtlChd.overview=overview;
					planDtlChd.loc_seq=loc_seq;
					planDtlChd.loc_bdg=inputNumberRemoveComma(locBdg);
					planDtlChd.loc_memo=locMemo;
					planDtlChd.loc_distance=disSplit[locCnt];
					planDtlArray.push(planDtlChd);

					locCnt++;	
					loc_cnt++;
				}

				var disKm=disArray[i]/1000;
			
				planMstChd.day_dist=disKm.toFixed(2);
				planMstChd.day_amt=dayAmt;
				planMstChd.day_room_chg=dayRoomChg;
				planMstChd.day_food_exp=dayFoodExp;
				planMstChd.day_tran_exp='0';
				planMstArray.push(planMstChd);

				tot_room_chg+=dayRoomChg;
				tot_food_exp+=dayFoodExp;
			//	tot_tran_exp+=dayRoomChg;	//교통비 보류
			
				trv_deg_lv++;
			}

			planMgt.tot_room_chg=tot_room_chg;
			planMgt.tot_food_exp=tot_food_exp;
			planMgtArray.push(planMgt);
		
			savePlan.planMgt=planMgtArray;
			savePlan.planMst=planMstArray;
			savePlan.planDtl=planDtlArray;
		
			var sJson = JSON.stringify(savePlan);
			console.log(savePlan);
			console.log(sJson);
			var result;

			$.ajax({
				url:"save",
				data:sJson,
				method:"POST",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success: function(data){
					//불러온 플래너번호
					var planCode=data.planCode[0].planCode;

					document.getElementById('plannerCode').value=planCode;					
					alert('저장되었습니다');
					}
			});

    });

	function inputNumberAutoComma(obj) {
	        
	        // 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
	        var deleteComma = obj.value.replace(/\,/g, "");
	
	        // 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
	        if(isFinite(deleteComma) == false) {
	            alert("문자는 입력하실 수 없습니다.");
	            obj.value = "";
	            return false;
	        }
	        
	        // 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
	        obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
	    }
	    
	    // 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
	    function inputNumberWithComma(str) {
	
	        str = String(str);
	        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
	    }
	
	    // 콤마( , )가 들어간 값에 콤마를 제거하는 함수
	    function inputNumberRemoveComma(str) {
	
	        str = String(str);
	        return str.replace(/[^\d]+/g, "");
	    }

	    //undefined체크
	    function isEmpty(str){
	         
	        if(typeof str == "undefined" || str == null || str == "")
	            return true;
	        else
	            return false ;
	    }

	    //체크 후 기본 문자열로 반환
	    function nvl(str, defaultStr){
	         
	        if(typeof str == "undefined" || str == null || str == "")
	            str = defaultStr ;
	         
	        return str ;
	    }

	    //플래너 세팅모달 열기
		function planPopup(){
			var options={
					show:true
					};
			$('#planPopup').modal(options);
		}


		//날짜 차이
		function dateDiff(_date1, _date2) {
		    var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
		    var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);
		 
		    diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
		    diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());
		 
		    var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
		    diff = Math.ceil(diff / (1000 * 3600 * 24));
		 
		    return diff;
		}


		//해당 day 초기화
		 $(document).on('click','#resetImg',function(){

			var cfresult = confirm('"'+$('#categoryInfo>div>label').eq(0).text()+'" 초기화 하시겠습니까?');

			if(cfresult==false){
				return false;
			}
			 
			var position=sessionStorage.getItem('day_deg');
			$('#tabsDay'+position+'>div').eq(0).empty();
			$('#tabsDay'+position+'>div').eq(1).empty();
			$('#tabsDay'+position+'>div').eq(2).empty();
			$('#tabsDay'+position+'>div').eq(3).empty();
			$('#tabsDay'+position+'>div').eq(4).empty();

			//마커 재설정
			var planDtlArray = new Array();

			for(var i=0;i<$('#dayDiv>div').length;i++){
				for(var j=0;j<$('#tabsContent>div').eq(i).find('div').eq(4).find('span').length;j++){
					var planDtl=new Object();

					var locSplit=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('label').eq(0).find('a').html().split('<br>');
					var loc_name=locSplit[2];
					var locAddr=locSplit[3];
					
					planDtl.loc_addr=locAddr;
					planDtl.loc_name=loc_name;
					planDtl.loc_post_code=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(3).val();
					planDtl.loc_img_url=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(5).val();
					planDtl.loc_tel=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(6).val();
					planDtl.loc_type=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(0).val();
					planDtl.position_x=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(1).val();
					planDtl.position_y=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').eq(j).find('input').eq(2).val();
					planDtl.trv_deg=String(i+1);
					planDtlArray.push(planDtl);
				}
			}

			//예산 재설정
			var costAll=0;
			var daySize=$('#dayDiv div').length
			
			for(var i=0;i<daySize;i++){
				//스판사이즈 측정안됨
				var spanSize=$('#tabsDay'+$('#dayDiv div').eq(i).find('input').val()+ '>div').eq(4).find('span').length;
				for(var j=0;j<spanSize;j++){
					costAll+=Number($('#tabsDay'+$('#dayDiv div').eq(i).find('input').val()+ '>div').eq(4).find('span').eq(j).find('input').eq(8).val());
				}
			}
			costAll+=Number(inputNumberRemoveComma($('#totTranAmt').val()));
			$('#totAmt').val(inputNumberWithComma(costAll));
			
			$('#wonModal').val('');
			$('#memoModal').val('');
			
			//마커추가
			loadPlanner(planDtlArray);
			
		 });

		 //버튼 mouseover 이벤트 라벨태그달기
		 $(document).on('mouseover',"#tabsContent div span",function(e){

			var contentTypeIdx=$('#tabs ul').find('li[class=active]').index();
			var position=sessionStorage.getItem('day_deg');

			if($(e.target).hasClass('removeLoc')){
				$('.removeLabel').removeClass('hide');
				var p=$('#tabsDay'+position+' div').eq(contentTypeIdx).find('span').eq($(this).index()).find('label').find('img').eq(0).offset();
				var ptop=Number(p.top)-18;
				var pleft=Number(p.left)-14;
				$('.removeLabel').offset({left:pleft});
				$('.removeLabel').offset({top:ptop});
			}
			if($(e.target).hasClass('cost')){
				$('.costLabel').removeClass('hide');
				var p=$('#tabsDay'+position+' div').eq(contentTypeIdx).find('span').eq($(this).index()).find('label').find('img').eq(1).offset();
				var ptop=Number(p.top)-18;
				var pleft=Number(p.left)-16;
				$('.costLabel').offset({left:pleft});
				$('.costLabel').offset({top:ptop});	
			}
			if($(e.target).hasClass('detailInfo')){
				$('.detailLabel').removeClass('hide');
				var p=$('#tabsDay'+position+' div').eq(contentTypeIdx).find('span').eq($(this).index()).find('label').find('img').eq(2).offset();
				var ptop=Number(p.top)-18;
				var pleft=Number(p.left)-16;
				$('.detailLabel').offset({left:pleft});
				$('.detailLabel').offset({top:ptop});
			}
			 
		 });

		//버튼 라벨 hide
		 $(document).on('mouseout',"#tabsContent div span",function(e){
			 $('.removeLabel').addClass('hide');
			 $('.costLabel').addClass('hide');
			 $('.detailLabel').addClass('hide');
		 });

		//장소검색div 버튼 라벨태그달기
		 $(document).on('mouseover',"#locResult>div",function(e){

			if($(e.target).hasClass('locPlus')){
				$('.srcLocLabel').removeClass('hide');
				var p=$('#locResult>div').eq($(this).index()).find('img').eq(2).offset();
				var ptop=Number(p.top)-18;
				var pleft=Number(p.left)-10;
				$('.srcLocLabel').offset({left:pleft});
				$('.srcLocLabel').offset({top:ptop});
			}
			
			if($(e.target).hasClass('searchDetail')){
				$('.srcDetailLabel').removeClass('hide');
				var p=$('#locResult>div').eq($(this).index()).find('img').eq(1).offset();
				var ptop=Number(p.top)-18;
				var pleft=Number(p.left)-10;
				$('.srcDetailLabel').offset({left:pleft});
				$('.srcDetailLabel').offset({top:ptop});
			}
		});

		//버튼 라벨 hide
		 $(document).on('mouseout',"#locResult>div",function(e){
			 $('.srcLocLabel').addClass('hide');
			 $('.srcDetailLabel').addClass('hide');
		 });
	

		//초기화버튼 라벨태그달기
		$(document).on('mouseover',"#resetImg",function(e){
			$('.resetLabel').removeClass('hide');
			var p=$('#resetImg').offset();
			var ptop=Number(p.top)-18;
			var pleft=Number(p.left)-10;
			$('.resetLabel').offset({left:pleft});
			$('.resetLabel').offset({top:ptop});
		});

		//초기화버튼 라벨태그 삭제
		$(document).on('mouseout',"#resetImg",function(e){
			$('.resetLabel').addClass('hide');
		});

		//day삭제버튼 라벨태그 달기
		$(document).on('mouseover',"#dayDiv>div",function(e){
			if($(e.target).prop('tagName')=='path'){
				$('.dayRemoveLabel').removeClass('hide');
				var p=$('#dayDiv>div').eq($(this).index()).find('svg').offset();
				var ptop=Number(p.top)-20;
				var pleft=Number(p.left)-15;
				$('.dayRemoveLabel').offset({left:pleft});
				$('.dayRemoveLabel').offset({top:ptop});
			}
		});

		//day삭제버튼 라벨태그 삭제
		$(document).on('mouseout',"#dayDiv>div",function(e){
			$('.dayRemoveLabel').addClass('hide');
		});

		//플래너편집버튼 라벨태그 달기
		$(document).on('mouseover',".editImg",function(e){
			$('.editPlanLabel').removeClass('hide');
			var p=$('#editImg').offset();
			var ptop=Number(p.top)-8;
			var pleft=Number(p.left);
			$('.editPlanLabel').offset({left:pleft});
			$('.editPlanLabel').offset({top:ptop});
		});

		//플래너편집버튼 라벨태그 삭제
		$(document).on('mouseout',".editImg",function(e){
			$('.editPlanLabel').addClass('hide');
		});
		
		 
		 //예산&메모 모달 저장
		 function saveBdg(){
			$('#tabsDay'+$('#day_degModal').val()+'>div').eq($('#contentTypeIdxModal').val()).find('span').eq($('#idxModal').val()).find('input[type=hidden]').eq(8).val($('#wonModal').val());	
			$('#tabsDay'+$('#day_degModal').val()+'>div').eq($('#contentTypeIdxModal').val()).find('span').eq($('#idxModal').val()).find('input[type=hidden]').eq(9).val($('#memoModal').val());	

			var spanId=$('#tabsDay'+$('#day_degModal').val()+'>div').eq($('#contentTypeIdxModal').val()).find('span').eq($('#idxModal').val()).attr('id');
	
			$('#tabsDay'+$('#day_degModal').val()+'>div').eq(4).find('#'+spanId).find('input').eq(8).val(inputNumberRemoveComma($('#wonModal').val()));		
			$('#tabsDay'+$('#day_degModal').val()+'>div').eq(4).find('#'+spanId).find('input').eq(9).val(inputNumberRemoveComma($('#memoModal').val()));		

			//전체예산 계산
			var costAll=0;
			var daySize=$('#dayDiv div').length
			
			for(var i=0;i<daySize;i++){
				//스판사이즈 측정안됨
				var spanSize=$('#tabsDay'+$('#dayDiv div').eq(i).find('input').val()+ '>div').eq(4).find('span').length;
				for(var j=0;j<spanSize;j++){
					costAll+=Number($('#tabsDay'+$('#dayDiv div').eq(i).find('input').val()+ '>div').eq(4).find('span').eq(j).find('input').eq(8).val());
				}
			}
			costAll+=Number(inputNumberRemoveComma($('#totTranAmt').val()));
			$('#totAmt').val(inputNumberWithComma(costAll));
			
			$('#wonModal').val('');
			$('#memoModal').val('');
			$('#budgeClose').click();
		 }

		 function detailLoc(contentId){
			 	var sKey='';
		        var reqUrl;
		        reqUrl='http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey='+sKey+'&contentTypeId=&contentId='+contentId+'&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json';

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
						
						console.log(contentid);			//히든
						console.log(contenttypeid);		//히든
						console.log(addr1);				//뷰
						console.log(firstimage1);		//뷰
						console.log(firstimage2);		//뷰
						console.log(homepageTag);			//상세정보
						console.log(mapx+','+mapy);		//히든
						console.log(overview);			//상세정보
						console.log(tel);				//뷰
						console.log(title);				//뷰
						console.log(zipcode);			//뷰

						var locImgModal;
						if(firstimage1==null){
							locImgModal='imgs/no_img.gif';
						}else{
							locImgModal=firstimage1;
						}
						$('#modalLocImg1').html('<img class="locImgModal" src="'+locImgModal+'" style="width:250px;height:200px"/>');
						$('#detailTitle').text(title);
					/*	$('#locAddrModal').val(addr1);
						$('#locHomepageModal').val(homepageTag);
						$('#locTelModal').val(tel);*/
						$('#overviewSpan').html('<span>'+overview+'</span>');

						$('#detailModal div').eq(1).find('label').html(addr1+'<br/>'+homepageTag+'<br/>'+tel);
						
					}
		        });
		        var options={
						show:true
						};
				$('#detailLoc').modal(options);
	 	 }

		 function clickLabel(position_y,position_x,contenttype,title,firstimage,addr1,zipcode,tel){
				//중심이동	 
				moveCenter(position_y,position_x);

				clickDiv(position_y,position_x,contenttype,title,firstimage,addr1,zipcode,tel);

	 	 }


	 	 //거리버튼 클릭 이벤트
		$(document).on('click','#viewDistance>button',function(){
			if($(".dotOverlay").css("display") == "none"){
				$('.dotOverlay').show();
				$('#txtViewDis').show();
			}else{
				$('.dotOverlay').hide();
				$('#txtViewDis').hide();
			}
			
		});

	 	 //장소선택 div 클릭시 배경색 변경
	 	 $(document).on('click','#locResult>div',function(e){
	 		if($(e.target).hasClass('ckDivChgCl')){
			 	for(var i=0;i<$('#locResult>div').length;i++){
			 		$('#locResult>div').eq(i).css('background-color','#FFFFFF');
				} 
				
				$('#locResult>div').eq($(this).index()).css('background-color','#DDDDDD');
	 		}
		 });

	 	 //페이지이동
	 	 $(document).on('click','#planpagination>li',function(e){

	 		var idx,npCls;
	 		var liLength=$('#planpagination>li').length;
			if($(e.target).text()==$('#prevSpan').text()){

				idx=Number($('#planpagination>li').eq(1).text())-4;
				npCls='n';
			}else if($(e.target).text()==$('#nextSpan').text()){
				if($('#planpagination>li').length==6){
					idx=Number($('#planpagination>li').eq(4).text())+1;
				}else{
					idx=Number($('#planpagination>li').eq(3).text())+1;
				}
				npCls='p';
			}else{
				idx=Number($(e.target).text());
				npCls='0';
			}				
			
				var input='';

				var dataCoObj = new Object();
				var dataCoArr = new Array();

				var idxEnd;
				if(idx*10>=dataYArray.length){
					idxEnd=dataYArray.length;
				}else{
					idxEnd=idx*10;
				}
				
				for(var i=(idx-1)*10;i<idxEnd;i++){
					dataCoArr.push(dataYArray[i]);
				}

				dataCoObj.item=dataCoArr;
				dataSendArray=dataCoObj.item;

				//검색결과 전부 지움
				$('#locResult').empty();
				$('#pageDiv').remove();
					for(var i=0;i<dataSendArray.length;i++){

						$('#locResult').append('<div class="locSelect" style="height: 100px; width: 274px;"><a><img class="ckDivChgCl" width="100" height="100" alt="..." src="'+dataSendArray[i].firstimage+'" onclick="clickLabel('+dataSendArray[i].mapy+','+dataSendArray[i].mapx+','+dataSendArray[i].contenttypeid+',\''+dataSendArray[i].title+'\',\''+dataSendArray[i].firstimage+'\',\''+dataSendArray[i].addr1+'\',\''+dataSendArray[i].zipcode+'\',\''+dataSendArray[i].tel+'\')"/></a><img alt="searchDetail" src="imgs/detailInfo.png" class="searchDetail" onclick="detailLoc('+dataSendArray[i].contentid+')"/><img alt="locPlus" src="imgs/locPlus.png" class="locPlus"/><label><a class="ckDivChgCl" onclick="clickLabel('+dataSendArray[i].mapy+','+dataSendArray[i].mapx+','+dataSendArray[i].contenttypeid+',\''+dataSendArray[i].title+'\',\''+dataSendArray[i].firstimage+'\',\''+dataSendArray[i].addr1+'\',\''+dataSendArray[i].zipcode+'\',\''+dataSendArray[i].tel+'\')">'+dataSendArray[i].title+'<br/>'+dataSendArray[i].addr1+'</a></label><input type="hidden" id="contenttypeid" value="'+dataSendArray[i].contenttypeid+'"/><input type="hidden" id="contentId" value="'+dataSendArray[i].contentid+'"/></div>');
									
					}
					var startPage,endPage;
					if(idx%4==0){
						startPage=(Math.floor(idx/4)-1)*4+1;
					}else{
						startPage=Math.floor(idx/4)*4+1;
					}
					endPage=0;

						for(var j=1;j<4;j++){
							if(dataYArray.length>(startPage+j-1)*10){
								endPage=j;
							}
						}
					
					var liTxtHtml='';
					liTxtHtml+='<div id="pageDiv">';
					liTxtHtml+='	<div><nav aria-label="Page navigation">';
					liTxtHtml+='		<center><ul id="planpagination" class="pagination planpagination">';

					if(idx>4){
						liTxtHtml+='			<li><a aria-label="Previous" class="pageIdx"><span aria-hidden="true" class="prevPage">&laquo;</span></a></li>';
					}
					
					for(var i=startPage;i<=startPage+endPage;i++){
						liTxtHtml+='			<li><a class="pageIdx">'+i+'</a></li>';
					}
					
					if(dataYArray.length>(startPage+endPage)*10){
						liTxtHtml+='			<li><a aria-label="Next" class="pageIdx"><span aria-hidden="true" class="nextPage">&raquo;</span></a></li>';
					}
					liTxtHtml+='		</ul></center>';					
					liTxtHtml+='	</nav></div>';					
					liTxtHtml+='</div>';					
					
					$('#selectLoc').append(liTxtHtml);
									
					pageMvLoc(dataSendArray);
								
			        for(var i=0;i<$('.planpagination>li').length;i++){
						$('.planpagination>li').eq(i).removeClass('active');
					}

					if(npCls=='p'){
						$('#planpagination>li').eq(1).addClass('active');
					}else if(npCls=='n'){
						$('#planpagination>li').eq(1).addClass('active');
					}else if(npCls=='0'){
							$('#planpagination>li').eq($(this).index()).addClass('active');
					}
					

			
		 });

		 $(document).on('change','#totTranAmt',function(){

			 var costAll=0;
				var daySize=$('#dayDiv div').length
				
				for(var i=0;i<daySize;i++){
					//스판사이즈 측정안됨
					var spanSize=$('#tabsDay'+$('#dayDiv div').eq(i).find('input').val()+ '>div').eq(4).find('span').length;
					for(var j=0;j<spanSize;j++){
						costAll+=Number($('#tabsDay'+$('#dayDiv div').eq(i).find('input').val()+ '>div').eq(4).find('span').eq(j).find('input').eq(8).val());
					}
				}
				costAll+=Number(inputNumberRemoveComma($('#totTranAmt').val()));
				$('#totAmt').val(inputNumberWithComma(costAll));
				
				$('#wonModal').val('');
				$('#memoModal').val('');
				$('#budgeClose').click();
			
		});

</script>

</head>
<body>
	<input type="hidden" id="plannerCode" name="plannerCode" readonly="readonly" placeholder="저장시 자동생성됩니다" class="form-control"/>
    <div id="content">
        <div id="top">
			<div class="row">
				
				<a id="fontTitle" class="navbar-brand">&nbsp;&nbsp;T Signer</a>
			
			  <div class="col-md-3">
			    <div class="input-group">
			      <span class="input-group-addon">
			        <label>플래너제목</label>
			      </span>
			      <input type="text" id="plannerTitle" name="plannerTitle" class="form-control"/>
			      
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			  
			  <div class="col-md-2">
			    <div class="input-group">
			      <span class="input-group-addon">
			        <label>&#8361;</label>
			      </span>
			      <input type="text" id="totAmt" name="totAmt" onchange="inputNumberAutoComma(this)" onKeyup="inputNumberAutoComma(this);" value="0" style="text-align:right;" class="form-control" readonly="readonly"/>
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			  
			  <div class="col-md-2">
			    <div class="input-group">
			      <span class="input-group-addon">
			        <label>교통비</label>
			      </span>
			      <input type="text" id="totTranAmt" name="totTranAmt" onchange="inputNumberAutoComma(this)" onKeyup="inputNumberAutoComma(this);" value="0" style="text-align:right;" class="form-control"/>
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			
			  <div class="col-md-4">
			  </div>
			  
			  <div class="col-sm-2" id="col-sm-2Id">
			    <div class="input-group" id="buttons">
			    	<button type="button" class="btn btn-success" id="savePlan" >저장</button>
			    	<button type="button" class="btn btn-danger" id="removePlan" >삭제</button>
                	<button type="button" class="btn btn-warning" id="closePlan">닫기</button>
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
        
        </div>
        <div id="middle">
	        <div id="dayDivAll" style="overflow:auto;overflow-x:hidden"> 
	        	<div id="periodView1">
	        		<div id="periodViewDiv">
	        			<label id="periodView"><div id="imgDiv"><img src="" id="editImg" class="editImg"/></div></label>
	        		</div>
	            </div>
	            <div id="allPlanView">
					<center><label>전체일정보기</label></center>           	
	            </div>
	            <div id="dayDiv">
	            </div>
	            <div id="addDayDiv">
	            	<div>
	            		<button type="button" class="btn btn-primary" onclick="addDay()">DAY추가</button>
	            	</div>	
	            </div>
            </div>
            <div id="selectLoc">
            	<div id="searchDiv">
                	<!-- 장소구분 -->
                	<select id="contentTypeId" name="contentTypeId" class="form-control">
                    	<option selected="selected" value="">선택</option>
                        <option value="12">관광지</option>
                        <option value="32">숙소</option>
                        <option value="39">맛집</option>
                    </select>
                
               		<!-- 도시코드 - 특별시,광역시,도 -->
                    <select id="areaCode" name="areaCode" class="form-control">
                    	<option selected="selected" value="">전체</option>
                        <option value="32">강원</option>
                        <option value="31">경기</option>
                        <option value="35">경북</option>
                        <option value="36">경남</option>
                        <option value="5">광주</option>
                        <option value="4">대구</option>
                        <option value="3">대전</option>
                        <option value="6">부산</option>
                        <option value="1">서울</option>
                        <option value="8">세종</option>
                        <option value="7">울산</option>
                        <option value="2">인천</option>
                        <option value="37">전북</option>
                        <option value="38">전남</option>
                        <option value="39">제주</option>
                        <option value="33">충북</option>
                        <option value="34">충남</option>
                    </select>
                    
                    <!-- 시,군,구 코드 -->
                    <select id="sigunguCode" name="sigunguCode" class="form-control">
                    	<option selected="selected" value="">전체</option>
                    </select>
                    <br/>
                    <input type="text" id="keyword" name="keyword" class="form-control"/>
                    <button type="button" id="searchPlace" class="btn btn-info">검색</button>
                </div>    
                    <div id="locResult" style="overflow:auto;overflow-x:hidden">
                    
                    </div>    
                
            </div>
            
            <div id="category">
            	<div id="categoryInfo">
            		
            	</div>
                <div id="tabs">
				    <ul class="nav nav-pills">
				        <li role="presentation" class="active"><a href="#">관광지</a></li>
				        <li role="presentation"><a href="#">숙소</a></li>
				        <li role="presentation"><a href="#">맛집</a></li>
				        <li role="presentation"><a href="#">교통</a></li>
				    </ul>
                </div>
                <div id="tabsContent" style="overflow:auto">
                </div> 
            </div>
            <div id="mapDiv">
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

                    //장소검색
					function searchLoc(dataArray){
						if(overlay!=null){
		            		overlay.setMap(null);
						}
						
		            	if(cmarkers.length>0){
		            		overlayL.setMap(null);
		            	}
		            	
			        	for ( var i = 0; i < cmarkers.length; i++ ) {
                            cmarkers[i].setMap(null);
                        }   
                        cmarkers = [];
						
						var fragment = document.createDocumentFragment(), 
					    bounds = new kakao.maps.LatLngBounds(), 
					    listStr = '';
						removeMarker();

						var valX=0;
						var valY=0;
						var cnt=0;
						var breakCnt=0;
						var position=sessionStorage.getItem('day_deg');
						for ( var i=0; i<dataArray.length; i++ ) {
								breakCnt=0;
								for(var k=0;k<$('#tabsDay'+position+'>div').eq(4).find('span').length;k++){
									if(dataArray[i].contentid==$('#tabsDay'+position+'>div').eq(4).find('span').eq(k).find('input').eq(4).val()){
										breakCnt=1;
										cnt++;
										break;
									}
								}
							
							if(breakCnt!=1){
								if(isEmpty(dataArray[i].mapy==true || dataArray[i].mapx)==true){
									dataArray[i].mapy=0;
									dataArray[i].mapx=0;
									cnt++;
								}
	
								valX+=parseFloat(dataArray[i].mapy);
								valY+=parseFloat(dataArray[i].mapx);
								var data=dataArray[i];
								
						        //마커를 생성하고 지도에 표시합니다
						        var placePosition = new kakao.maps.LatLng(dataArray[i].mapy, dataArray[i].mapx),
						            marker = addSearchMarker(placePosition, i,dataArray[i].contenttypeid,data); 
						 		//itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
								marker.setZIndex(6);
						        //검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						        //LatLngBounds 객체에 좌표를 추가합니다
						        bounds.extend(placePosition);
							}
						}
						
						valX=valX/(dataArray.length-cnt);
						valY=valY/(dataArray.length-cnt);
						var placePosition = new kakao.maps.LatLng(valX, valY);
						map.setCenter(placePosition);
						var level = map.getLevel();
					    
					    // 지도의 레벨을 변경합니다
					    map.setLevel(10);
					    
		                    
					}
					//플래너 불러오기
					function loadPlanner(dataArray){
						//저장된 마커삭제
						removesMarker();

						if(overlay!=null){overlay.setMap(null);}
						if(cmarkers.length>0){
		            		overlayL.setMap(null);
		            	}
		            	
			        	for ( var i = 0; i < cmarkers.length; i++ ) {
                            cmarkers[i].setMap(null);
                        }   
                        cmarkers = [];
						
						//커스텀오버레이 초기화
						for(var i=0;i<tempCustom.length;i++){
							tempCustom[i].setMap(null);
							tempPoly[i].setMap(null);
						}
						$('div').remove( '.dotOverlay' );

						var locTotNum=0;
						for(var i=0;i<$('#dayDiv>div').length;i++){
							locTotNum+=$('#tabsContent>div').eq(i).find('div').eq(4).find('span').length;
						}
						if(locTotNum==0){
							return false;
						}
								
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
					        // 마커를 생성하고 지도에 표시합니다
					        var placePosition = new kakao.maps.LatLng(dataArray[i].position_y, dataArray[i].position_x),
					            marker = addMarker(placePosition, dataArray[i].trv_deg,dataArray[i].loc_type,data); 
					  //          itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

					  		marker.setZIndex(10);
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
							displayCircleDot(positions[i].latlng,distance);

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
							distanceOverlay.setZIndex(15);
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
					    customOverlay.setZIndex(10);
					    customOverlay.setMap(map);

						//인포윈도우 생성
						var iwContent = '<div class="infoWindow" style="padding:5px;"><span>'+data.loc_name+'</span></div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						
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
					    	infowindow.setZIndex(15);
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

										var content = '<div class="wrap">' + 
							            '    <div class="info">' + 
							            '        <div class="infotitle">' + 
							            '            '+data.loc_name+'' + 
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
										overlay.setZIndex(15);
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
					    			var content = '<div class="wrap">' + 
						            '    <div class="info">' + 
						            '        <div class="infotitle">' + 
						            '            '+data.loc_name+'' + 
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
										
									overlay.setZIndex(15);
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
					
					//검색,페이징시 마킹
					function addSearchMarker(position, idx, contenttype,data) {
						var sal=2;
						var imgSrc;
						if(contenttype=='12'){
							imgSrc='imgs/searchTour.png';
						}else if(contenttype=='32'){
							imgSrc='imgs/searchHotel.png';
						}else if(contenttype=='39'){
							imgSrc='imgs/searchFood.png';
						}
						
					    var imageSrc = imgSrc, // 마커 이미지 url
					        imageSize = new kakao.maps.Size(24, 35),  // 마커 이미지의 크기
					        imgOptions =  {
					            
					        },
					        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
					            marker = new kakao.maps.Marker({
					            position: position, // 마커의 위치
					            image: markerImage 
					        });

					    marker.setMap(map); // 지도 위에 마커를 표출합니다
					    markers.push(marker);  // 배열에 생성된 마커를 추가합니다


					  	//인포윈도우 생성
						var iwContent = '<div class="infoWindow" style="padding:5px;"><span>'+data.title+'</span></div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						
						// 인포윈도우를 생성하고 지도에 표시합니다
						var infowindow = new kakao.maps.InfoWindow({
						    content : iwContent
						});
					    
					  //마커에 mouseover 이벤트를 등록합니다
					    kakao.maps.event.addListener(marker, 'mouseover', function() {

					        if (!selectedMarker || selectedMarker !== marker) {
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
					        infowindow.setZIndex(15);
					        infowindow.open(map, marker);
					    });

					    
					    //마커에 mouseout 이벤트를 등록합니다
					    kakao.maps.event.addListener(marker, 'mouseout', function() {

					        if (!selectedMarker || selectedMarker !== marker) {
						    	if(contenttype=='12'){
						    		imageSrc='imgs/searchTour.png';
								}else if(contenttype=='32'){
									imageSrc='imgs/searchHotel.png';
								}else if(contenttype=='39'){
									imageSrc='imgs/searchFood.png';
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
					    	
							for(var i=0;i<$('#locResult>div').length;i++){
								if(data.contentid==$('#locResult>div').eq(i).find('input').eq(1).val()){
									$('#locResult>div').eq(i).css('background-color','#DDDDDD');
								}else{
									$('#locResult>div').eq(i).css('background-color','#FFFFFF');
								}	
							}

					    	//이전 마커가 null이 아닐경우 오버레이를 닫고 이전마커를 원래크기로 돌아가게함
				    		if(selectedMarker!==null){
				    			if (selectedMarker !== marker){
				    				closeOverlay(bfcontenttype,selectedMarker,position,bfsal);

				    				var content = '<div class="wrap">' + 
						            '    <div class="info">' + 
						            '        <div class="infotitle">' + 
						            '            '+data.title+'' + 
						            '            <div class="infoclose" onclick="closeOverlay('+contenttype+',marker,'+position+','+sal+')" title="닫기"></div>' + 
						            '        </div>' + 
						            '        <div class="infobody">' + 
						            '            <div class="infoimg">' +
						            '                <img src="'+data.firstimage+'" width="73" height="70">' +
						            '           </div>' + 
						            '            <div class="desc">' + 
						            '                <div class="ellipsis">'+data.addr1+'</div>' + 
						            '                <div class="jibun ellipsis">(우) '+data.zipcode+' (Tel) '+data.tel+'</div>' + 
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
									    overlay.setZIndex(15);
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
				    			var content = '<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="infotitle">' + 
					            '            '+data.title+'' + 
					            '            <div class="infoclose" onclick="closeOverlay('+contenttype+',marker,'+position+','+sal+')" title="닫기"></div>' + 
					            '        </div>' + 
					            '        <div class="infobody">' + 
					            '            <div class="infoimg">' +
					            '                <img src="'+data.firstimage+'" width="73" height="70">' +
					            '           </div>' + 
					            '            <div class="desc">' + 
					            '                <div class="ellipsis">'+data.addr1+'</div>' + 
					            '                <div class="jibun ellipsis">(우) '+data.zipcode+' (Tel) '+data.tel+'</div>' + 
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
									
								overlay.setZIndex(15);
								overlay.setMap(map);
	
								selectedMarker = marker;
								bfcontenttype=contenttype;
								bfsal=sal;
							}
				    		bfposition=position;
					    });

					    return marker;
					}


	                 // 지도 위에 표시되고 있는 마커를 모두 제거합니다
	                    function removeMarker() {
	                        for ( var i = 0; i < markers.length; i++ ) {
	                            markers[i].setMap(null);
	                        }   
	                        markers = [];
	                    }  

	                    function removesMarker() {
	                        for ( var i = 0; i < smarkers.length; i++ ) {
	                            smarkers[i].setMap(null);
	                        }   
	                        smarkers = [];
	                        positions = [];
	                    } 

	                //페이지 이동시 맵함수
	                function pageMvLoc(dataArray){

	                	if(overlay!=null){
		            		overlay.setMap(null);
						}

		            	if(cmarkers.length>0){
		            		overlayL.setMap(null);
		            	}
		            	
			        	for ( var i = 0; i < cmarkers.length; i++ ) {
                            cmarkers[i].setMap(null);
                        }   
                        cmarkers = [];
		                
	                	var fragment = document.createDocumentFragment(), 
					    bounds = new kakao.maps.LatLngBounds(), 
					    listStr = '';
						removeMarker();
						var cnt=0;
						var valX=0;
						var valY=0;

						var breakCnt=0;
						
						for ( var i=0; i<dataArray.length; i++ ) {
							breakCnt=0;
							for(var j=0;j<$('#dayDiv>div').length;j++){
								for(var k=0;k<$('#tabsContent>div').eq(j).find('div').eq(4).find('span').length;k++){
									if(dataArray[i].contentid==$('#tabsContent>div').eq(j).find('div').eq(4).find('span').eq(k).find('input').eq(4).val()){
										breakCnt=1;
										break;
									}
								}
								if(breakCnt==1){
									cnt++;
									break;
								}
							}
							if(breakCnt!=1){
								if(isEmpty(dataArray[i].mapy==true || dataArray[i].mapx)==true){
									dataArray[i].mapy=0;
									dataArray[i].mapx=0;
									cnt++;
								}
								
								valX+=parseFloat(dataArray[i].mapy);
								valY+=parseFloat(dataArray[i].mapx);
								var data=dataArray[i];
								
						        // 마커를 생성하고 지도에 표시합니다
						        var placePosition = new kakao.maps.LatLng(dataArray[i].mapy, dataArray[i].mapx),
						            marker = addSearchMarker(placePosition, i,dataArray[i].contenttypeid,data); 
						  //          itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	
						        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						        // LatLngBounds 객체에 좌표를 추가합니다
						        bounds.extend(placePosition);
							}
						}

						valX=valX/(dataArray.length-cnt);
						valY=valY/(dataArray.length-cnt);
						var placePosition = new kakao.maps.LatLng(valX, valY);
						
						map.setCenter(placePosition);
						
						var level = map.getLevel();
					    
					    // 지도를 1레벨 내립니다 (지도가 확대됩니다)
					    map.setLevel(10);
					    
		            }    

		            //중심이동
		            function moveCenter(mapy,mapx){
		            	 var placePosition = new kakao.maps.LatLng(mapy, mapx);
		            	 map.setCenter(placePosition);
			        }

		            var overlayL;
		            
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

			        	marker.setZIndex(10);
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
							
						overlayL.setZIndex(15);	
						overlayL.setMap(map);

				    }

				    function closeOverlayl(){
				    	overlayL.setMap(null);
				    	for ( var i = 0; i < cmarkers.length; i++ ) {
                            cmarkers[i].setMap(null);
                        }   
                        cmarkers = [];
					}

					function dayClickMarkerE(){
						removesMarker();
						
						//커스텀오버레이 초기화
						
						for(var i=0;i<tempCustom.length;i++){
							tempCustom[i].setMap(null);
							tempPoly[i].setMap(null);
						}
						$('div').remove( '.dotOverlay' );
					}
					
                </script>
            </div>
            
        </div>
    
    </div>
    
    
    <!-- 플래너 설정 모달 -->
    <div class="modal fade" id="planPopup" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">플래너 만들기</h4>
	      </div>
	      <div class="modal-body">
	      	
	      	<div class="row" id="modalRow0">
			  <div class="col-lg-4">
			    <div class="input-group">
			    	<img src="imgs/minus.jpg" class="plusminus" id="minus"/>
					<label id="dayDegText">1일</label>
					<img src="imgs/plus.jpg" class="plusminus" id="plus"/>
					<input type="hidden" id="dayDegSet" value="1"/>
					<input type="hidden" id="dayDegSetFix" value="0"/>
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			</div>
	      	
	      	<div class="row" id="modalRow1">
			  <div class="col-lg-4">
			    <div class="input-group">
			      <span class="input-group-addon">
			        <label class="trvDateModal">플래너제목</label>
			      </span>
			      <input type="text" id="plannerTitleModal" name="plannerTitleModal" class="form-control"/>
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			</div>
			
			<div class="row" id="modalRow2">
			  <div class="col-lg-4" id="modalRow2InputG">
				  <div class="input-group">
				  	<span class="input-group-addon">
				        <label class="trvDateModal">출발일</label>
				      </span>
				    <div class="input-group">
				      <input type="date" value="" id="trvFromDateModal" class="form-control"/>
				    </div>
				  </div>
			</div>
	      </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="popupSave">저장</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="popupClose" style="display: none">닫기</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- 메모&예산 모달 -->
	<div class="modal fade" id="bugAmemo" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">예산&메모</h4>
	      </div>
	      <div class="modal-body">
	      	<div class="row">
			  <div class="col-lg-6">
			    <div class="input-group" id="memoImg">
			    	
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			  
			  <div class="col-lg-6">
			    <div class="row">
			    	<div class="input-group">
				      <span class="input-group-addon">
				        <label class="wonLaber">&#8361;</label>
				      </span>
				      <input type="text" onchange="inputNumberAutoComma(this)" onKeyup="inputNumberAutoComma(this);" id="wonModal" name="wonModal" class="form-control"/>
				    </div><!-- /input-group -->
			    </div>
			    <br/>
			    <div class="row">
				    <div class="input-group" id="memoTxtDiv">
				      <textarea class="form-control cols-xs-12" rows="7" id="memoModal" name="memoModal"></textarea>
				    </div><!-- /input-group -->
			    </div>
			  </div><!-- /.col-lg-6 -->
			</div>
			<input type="hidden" id="day_degModal"/>
			<input type="hidden" id="contentTypeIdxModal"/>
			<input type="hidden" id="idxModal"/>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="budgeSave" onclick="saveBdg()">저장</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="budgeClose">닫기</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
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
	
    <div id="openClose">
    	<img alt="openClose" src="imgs/openRight.png"/>
    </div>
    <div id="viewDistance">
    	<button class="btn btn-default" type="button">거리보기</button>
    </div>
    <div id="txtViewDis">
    </div>
    <input type="hidden" id="storeDistance" value=""/>	
    
    						<!-- 라벨태그 모음 -->
    <div class="removeLabel hide" style="padding:5px;"><span>장소삭제</span></div>
    <div class="costLabel hide" style="padding:5px;"><span>비용&메모</span></div>
    <div class="detailLabel hide" style="padding:5px;"><span>상세정보</span></div>
    <div class="srcDetailLabel hide" style="padding:5px;"><span>상세정보</span></div>
    <div class="srcLocLabel hide" style="padding:5px;"><span>장소추가</span></div>
    <div class="srcLocLabel hide" style="padding:5px;"><span>장소추가</span></div>
    <div class="resetLabel hide" style="padding:5px;"><span>초기화</span></div>
    <div class="dayRemoveLabel hide" style="padding:5px;"><span>DAY삭제</span></div>
    <div class="editPlanLabel hide" style="padding:5px;"><span>플래너 편집</span></div>
    <div class="hide">
    	<span id="prevSpan">&laquo;</span>
    </div>
    <div class="hide">
    	<span id="nextSpan">&raquo;</span>
    </div>
    
</body>
</html>