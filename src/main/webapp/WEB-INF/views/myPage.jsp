<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Map"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="css/buttons.css" />
<link rel="stylesheet" type="text/css" href="css/tsigner.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<style type="text/css">
	.caroImg{
		width: 150px;
		height: 150px;
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
	
	.strFontChg{
		cursor:pointer;
		font-family: 'Gothic A1', sans-serif;
		font-size: 14px;
		color: black;
		font-weight: lighter;
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
 	
 	#boarderTableDiv{
 		height: 280px;
 	}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		var res = '<%=session.getAttribute("id")%>';
		var pro = '<%=session.getAttribute("profile")%>';
		if(res == 'null'){
			alert('로그인 후 페이지 접근이 가능합니다!');
			window.location.href="/tsigner/";
		}
		$('#editPwResult').hide();

		$('#payBtn').hide();
		$('#payBtn').trigger('click');
		$('#bbsBtn').trigger('click');

		$('#file1').on('change',imgView);
		
	});
	//개인정보 수정 페이지
	function editUser(){
		var id = $('#userId').val();
		var profile = '<%=session.getAttribute("profile")%>';
		var data={};
		data["id"] = $('#userId').val();
		data["name"] = $('#userName').val();
		data["nick"] = $('#userNick').val();
		data["tel"] = $('#userTel').val();
		data["birth"] = $('#userBirth').val();
		var img = $('#file1').val();
		var array = profile.split('/');
		var profile1 = array[0] + '/' + array[1] + '/';
		var profile2 = array[2];
		var check = 0;
		if(img==''){
			if(profile1=='http://'){
				data["path"]=profile;
				data["file"]="";
			}else{
				data["path"]= profile1;
				data["file"] = profile2;
				check=1;
			}
		}else{
			var imgs = img.split('\\');
			var proPath="profile/"+id+"/";
			data["path"] = proPath;
			data["file"] = imgs[2];
		}
		
		$('.err').remove();
		if(data.name.length>10||data.name.length<2){
			$('#userName').after('<span class="err" style="color:red">이름은 2글자 이상 10글자 이하입니다.</span>');
		}
		else if(data.nick.length>10||data.nick.length<2){
			$('#userNick').after('<span class="err" style="color:red">닉네임은 2글자 이상 10글자 이하입니다.</span>');
		}else if(!(data.tel.length==11||data.tel.length==10)){
			$('#userTel').after('<span class="err" style="color:red">번호를 확인해주세요</span>');
		}else if(data.birth.length!=8){
			$('#userBirth').after('<span class="err" style="color:red">ex)19990101</span>');
		}else{
			$.ajax({
			type:'post',
			url:'editUser',
			contentType:'application/json; charset=utf-8',
			data:JSON.stringify(data),
			datatype:'json',
			success:function(res){
				if(check==0){
					imgChange();
				}
				alert(res.message);
				refresh();
			},
			erorr:function(erorr){
				alert(res.message);
			}
			});
		}
	}
	
	//새로고침
	function refresh(){
		window.location.reload();
	}

	//비밀번호 변경 본인인증 버튼 누를 시 이메일과 비밀번호를 가지고 회원인증
	function checkUser(){
		var data={};
		data["id"] = $('#userId').val();
		data["pw"] = $('#checkPw').val();
		data["email"] = $('#checkEmail').val();

		$.ajax({
			type:'post',
			url:'checkUser',
			data:JSON.stringify(data),
			datatype:'json',
			contentType:'application/json; charset=utf-8',
			success:function(data){
				if(data=='success'){
					$('#editPw').hide();
					$('#editPwResult').show();
				}else if(data=='fail'){
					alert('정보를 다시 확인해주세요');
				}
			},
			erorr:function(){
				alert('실패');
			}
		})
	}

	//비밀번호 변경
	function editUserPw(){
		$('.result').remove();
		var id = $('#userId').val();
		var email = $('#checkEmail').val();
		var pw1 = $('#resPw').val();
		var pw2 = $('#checkResPw').val();
		if(pw1.length>5&&pw1.length<22){
			if(pw1==pw2){
				//모든 조건을 만족했기때문에 여기서 ajax통신으로 비밀번호 변경시켜줌
				$.ajax({
					type:'post',
					url:'editPw',
					data:'id='+id+'&email='+email+'&editPw='+pw1,
					datatype:'text',
					success:function(res){
						if(res=='success'){
							alert('정상적으로 변경되었습니다');
							window.location.reload();
						}
					}
				})
			}else{
				$('#checkResPw').after('<span class="result" style="color:red">비밀번호가 일치하지 않습니다</span>');
			}
		}else{
			$('#resPw').after('<span class="result" style="color:red">6글자 이상 21글자 이하로 입력해주세요</span>');
		}
	}

	//탈퇴처리
	function leaveUser(){
		var data={};
		data["id"] = $('#idChecku').val();
		data["pw"] = $('#pwChecku').val();
		var id = $('#idChecku').val();
		
		$.ajax({
			type:'post',
			url:'leaveCheck',
			contentType:'application/json; charset=utf-8',
			data:JSON.stringify(data),
			datatype:'json',
			success:function(res){
				if(res=='success'){
					var conf = confirm('정말로 탈퇴하시겠습니까?');
					if(conf==true){
						$.ajax({
							type:'post',
							url:'leaveUser',
							data:'id='+id,
							success:function(res){
								if(res=='success'){
									alert('정상 탈퇴되셨습니다.');
									window.location.href='/tsigner/';
								}
							}
						})
					}else if(conf==false){
						alert('알수없는 오류');
					}
				}else if(res=='fail'){
					alert('실패');
				}
			}
		})
	}

	//together 게시판 불러오기 메서드
	function togetherList(){
		var id = '<%=session.getAttribute("id")%>';
		$.ajax({
			type:'post',
			url:'togetherList',
			data:'id='+id,
			success:function(data){
				$('.remove').remove();
				if(data.list.length==0){
					$('#listTable').after(
						'<tr class="remove"><td></td><td><h4>작성하신 글이 없습니다</h4></td><td></td><td></td></tr>'
					);
				}else{
					for(var i=0; i<data.list.length; i++){
						var year = new Date(data.list[i].modi_date).getYear();
						var mon = new Date(data.list[i].modi_date).getMonth();
						var day = new Date(data.list[i].modi_date).getDate();
						var date = (year+1900)+'-'+(mon+1)+'-'+day; 
						$('#listTable').after(
							'<tr class="remove"><td>'+data.list[i].cmnt_seq+'</td><td><a href="community_togetherDetail/'+data.list[i].cmnt_seq+'">'+data.list[i].cmnt_title+'</a>&nbsp;&nbsp;&nbsp;</td><td>'+date+'</td><td>'+data.list[i].cmnt_hits+'</td></tr>'
						);
					}
				}
			}
		});
	}
	
	//planner 게시판 불러오기 메서드
	function plannerList(){
		var id = '<%=session.getAttribute("id")%>';
		$.ajax({
			type:'post',
			url:'plannerList',
			data:'id='+id,
			success:function(data){
				$('.remove').remove();
				if(data.list.length==0){
					$('#listTable').after(
						'<tr class="remove"><td></td><td><h4>작성하신 글이 없습니다</h4></td><td></td><td></td></tr>'
					);
				}else{
					for(var i=0; i<data.list.length; i++){
						var year = new Date(data.list[i].modi_date).getYear();
						var mon = new Date(data.list[i].modi_date).getMonth();
						var day = new Date(data.list[i].modi_date).getDate();
						var date = (year+1900)+'-'+(mon+1)+'-'+day; 
						$('#listTable').after(
							'<tr class="remove"><td>'+data.list[i].cmnt_seq+'</td><td><a href="community_plannerDetail?num='+data.list[i].cmnt_seq+'">'+data.list[i].cmnt_title+'</a>&nbsp;&nbsp;&nbsp;</td><td>'+date+'</td><td>'+data.list[i].cmnt_hits+'</td></tr>'
						);
					}
				}
			}
		});
	}

	//자유게시판 불러오는 메서드
	function bbsList(){
		var id = '<%=session.getAttribute("id")%>';
		$.ajax({
			type:'post',
			url:'bbsList',
			data:'id='+id,
			success:function(data){
				$('.remove').remove();
				if(data.list.length==0){
					$('#listTable').after(
							'<tr class="remove"><td></td><td><h4>작성하신 글이 없습니다</h4></td><td></td><td></td></tr>'
					);
				}else{
					for(var i=0; i<data.list.length; i++){
						var year = new Date(data.list[i].modi_date).getYear();
						var mon = new Date(data.list[i].modi_date).getMonth();
						var day = new Date(data.list[i].modi_date).getDate();
						var date = (year+1900)+'-'+(mon+1)+'-'+day; 
						$('#listTable').after(
							'<tr class="remove"><td>'+data.list[i].cmnt_seq+'</td><td><a href="community_bbs">'+data.list[i].cmnt_title+'</a></td><td>'+date+'</td><td>'+data.list[i].cmnt_hits+'</td></tr>'
						);
					}
				}
			}
		});
	}
	
	//후기게시판 불러오는 메서드
	function comList(){
		var id = '<%=session.getAttribute("id")%>';
		$.ajax({
			type:'post',
			url:'comList',
			data:'id='+id,
			success:function(data){
				$('.remove').remove();
				if(data.list.length==0){
					$('#listTable').after(
							'<tr class="remove"><td></td><td><h4>작성하신 글이 없습니다</h4></td><td></td><td></td></tr>'
					);
				}else{
					for(var i=0; i<data.list.length; i++){
						var year = new Date(data.list[i].modi_date).getYear();
						var mon = new Date(data.list[i].modi_date).getMonth();
						var day = new Date(data.list[i].modi_date).getDate();
						var date = (year+1900)+'-'+(mon+1)+'-'+day; 
						$('#listTable').after(
							'<tr class="remove"><td>'+data.list[i].cmnt_seq+'</td><td><a href="community_reviewDetail?num='+data.list[i].cmnt_seq+'">'+data.list[i].cmnt_title+'</a></td><td>'+date+'</td><td>'+data.list[i].cmnt_hits+'</td></tr>'
						);
					}
				}
			}
		});
	}
	
	//질문게시판 불러오는 메서드
	function questionList(){
		var id = '<%=session.getAttribute("id")%>';
		$.ajax({
			type:'post',
			url:'questionList',
			data:'id='+id,
			success:function(data){
				$('.remove').remove();
				if(data.list.length==0){
					$('#listTable').after(
							'<tr class="remove"><td></td><td><h4>작성하신 글이 없습니다</h4></td><td></td><td></td></tr>'
					);
				}else{
					for(var i=0; i<data.list.length; i++){
						var year = new Date(data.list[i].modi_date).getYear();
						var mon = new Date(data.list[i].modi_date).getMonth();
						var day = new Date(data.list[i].modi_date).getDate();
						var date = (year+1900)+'-'+(mon+1)+'-'+day; 
						$('#listTable').after(
							'<tr class="remove"><td>'+data.list[i].cmnt_seq+'</td><td><a href="community_question">'+data.list[i].cmnt_title+'</a></td><td>'+date+'</td><td>'+data.list[i].cmnt_hits+'</td></tr>'
						);
					}
				}
			}
		});
	}

	//결제 내역 리스트를 가져오는 function
	function payList(){
		var id = '<%=session.getAttribute("id")%>';
		var html='';
		$.ajax({
			type:'post',
			url:'payList',
			data:'id='+id,
			success:function(res){
				if(res.length==0){
					html+='<tr>';
					html+='<td>';
					html+='</td>';
					html+='<td>';
					html+='<h4>결제 내역이 없습니다</h4>';
					html+='</td>';
					html+='<td>';
					html+='</td>';
					html+='<td>';
					html+='</td>';
					html+='</tr>';
				}else{
					for(var i=0; i<res.length; i++){
						var year =new Date(res[i].pay_day).getYear();
						var mon = new Date(res[i].pay_day).getMonth();
						var day = new Date(res[i].pay_day).getDate();
						var date = (year+1900)+'-'+(mon+1)+'-'+day; 
						html+='<tr>';
						html+='<td>';
						html+=date;
						html+='</td>';
						html+='<td>';
						html+=res[i].pay_info;
						html+='</td>';
						html+='<td>';
						html+=res[i].pay_checkIn+'~'+res[i].pay_checkOut;
						html+='</td>';
						html+='<td>';
						html+=res[i].pay_cost;
						html+='</td>';
						html+='</tr>';
					}
				}
				$('#payList').after(html);
				
			}
		});
		
		
	}

// 	//이미지 확대
// 	function imgClose(){
// 		var url= "imgPopup";
// 		var name = "img pupup";
// 		var option = "width = 500, height = 600, top = 100, left = 200, location = no";
// 		window.open(url,name,option);
// 	}

// 	//파일 미리보기
// 	function profilePreveal(){
<%-- 		var id = '<%=session.getAttribute("id")%>'; --%>
// 		var formData = new FormData($('#fileForm')[0]);
// 		var img = $('#file1').val();
// 		var imgs = img.split('\\');
// 		var res = imgs[2].split('.');
// 		var result = id + res[0] +'.'+res[1];
// 		$.ajax({
// 			type:'post',
// 			url:'profileUp',
// 			data:formData,
// 			processData:false,
// 			contentType:false,
// 			success:function(res){
// 				$('#profileImg').remove();
// 				$('#imgRefresh').append('<div id="profileImg"><img width="150px" height="150px" src="profileTmp/'+result+'"></div>');
// 			},
// 			error:function(err){
// 				alert('파일 업로드에 실패했습니다');
// 				console.log(err);
// 			}
// 		});
// 	}

	//미리보기
	function imgView(e){
		var sel_file;
		//첨부한 파일을 파일형식으로 읽어오고
		var files = e.target.files;
		//해당 파일을 Array 배열 형식으로 담아내어
		var filesArr = Array.prototype.slice.call(files);

		//배열의 크기만큼 반복시켜
		filesArr.forEach(function(f){
			//만약에 이미지 확장자가 아닐경우 오류
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능");
				return;
			}
			
			sel_file = f;
			// 파일리더를 생성시키고
			var reader = new FileReader();
			//읽기에 성공했을 때 실패했을때는 reader.error
			reader.onload = function(e){
				//읽어온 내용의 결과를 해당 태그에 src값으로 넣어준다.
				$('#proView').attr("src",e.target.result);
			}
			//데이터를 URL형식으로 읽어온다 
			reader.readAsDataURL(f);
		});
	}

	// 개인정보 수정 시 이미지를 해당 경로에 저장하고 디비 내용을 변경해주는 메서드
	function imgChange(){
		var formData = new FormData($('#fileForm')[0]);
		$.ajax({
			type:'post',
			url:'imgChange',
			data:formData,
			processData:false,
			contentType:false,
			success:function(res){
			},
			error:function(err){
				alert('파일 업로드에 실패했습니다');
				console.log(err);
			}
		});
	}
	
	//1:1문의 내역 출력
	function inquiryList(){
		var id = '<%=session.getAttribute("id")%>';
		$.ajax({
			type:'post',
			url:'inquiryList',
			data:'id='+id,
			success:function(data){
				$('.remove').remove();
				if(data.list.length==0){
					$('#listTable').after(
							'<tr class="remove"><td></td><td><h4>작성하신 글이 없습니다</h4></td><td></td><td></td></tr>'
					);
				}else{
					for(var i=0; i<data.list.length; i++){
						var year = new Date(data.list[i].modi_date).getYear();
						var mon = new Date(data.list[i].modi_date).getMonth();
						var day = new Date(data.list[i].modi_date).getDate();
						var date = (year+1900)+'-'+(mon+1)+'-'+day; 
						var total = data.total[i];
						var result = '';
						if(total==0){
							result = '답변대기중';
						}else{
							result = '답변완료';
						}
						$('#listTable').after(
							'<tr class="remove"><td>'+data.list[i].inq_seq+'</td><td><a href="inquiry/detail?idx='+data.list[i].inq_seq+'">'+data.list[i].inq_title+'&nbsp;<span class="badge">'+result+'</span></a></td><td>'+date+'</td><td>'+0+'</td></tr>'
						);
					}
				}
			}
		});
	}
</script>

<style type="text/css">
#btn{
text-align: center;
}
.btnS:hover{
	background-color: rgb(238,238,238);
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="row">
			<br>
			<div id="userInfo" class="col-md-12">
			<%if(request.getParameter("type").equals("info")){ %>
				<!-- 여기서 부터 회원정보 변경 -->
				<div id="info" class="col-md-offset-2 col-md-8 row">
					<ul class="nav nav-pills nav-justified">
						<li role="presentation" class="active"><a href="myPage?id=${id }&type=info" >회원정보 변경</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=pw"  >비밀번호 변경</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=leave" >회원 탈퇴</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=planner" >나의 플래너</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=write">내가 쓴 글</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=pay">결제내역</a></li>
					</ul>
					<div class="row">
						<br>
						<div class="col-md-offset-3 col-md-6">
							<div class="form-group row">
								<label for="" class="col-sm-3 control-label">회원등급</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="userLev"
										readonly="readonly" value="${lev } (${point} pt)">
								</div>
							</div>
							
							<div class="form-group row">
								<label for="" class="col-sm-3 control-label">ID</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="userId"
										readonly="readonly" value="${id }">
								</div>
							</div>

							<div class="form-group row">
								<label for="inputPassword3" class="col-sm-3 control-label">이름</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="userName"
										placeholder="성함을 입력해주세요" value="${name }">
								</div>
							</div>

							<div class="form-group row">
								<label for="" class="col-sm-3 control-label">닉네임</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="userNick"
										placeholder="닉네임을 입력해주세요" value="${nick }">
								</div>
							</div>

							<div class="form-group row">
								<label for="" class="col-sm-3 control-label">Tel</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="userTel"
										placeholder="핸드폰 번호를 입력해주세요" value="${tel }">
								</div>
							</div>

							<div class="form-group row">
								<label for="" class="col-sm-3 control-label">생일</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="userBirth"
										placeholder="ex) 19990101" value="${birth }">
								</div>
							</div>
							
							
							
							<form id="fileForm" method="post" enctype="multipart/form-data" onsubmit="return false;">
							<div class="form-group row">
								<label for="" class="col-sm-3 control-label">프로필</label>
								<div class="col-sm-8">
<!-- 									<input name="fileUp" type="file" id="file1" onchange="imgView();"> -->
									<input name="fileUp" type="file" id="file1" >
								</div>
							</div>
							</form>
							
							<div class="form-group row">
								<label for="" class="col-sm-3 control-label"></label>
								<div id="imgRefresh" class="col-sm-8">
									<%
									String url = request.getContextPath(); 
									%>
									<div id="profileImg"><img id="proView" width="150px" height="150px" src="<%=session.getAttribute("profile")%>" onerror="this.src='<%=url%>/imgs/noProfile.png'"></div>
								</div>
							</div>
						</div>
					</div>
					<div id="btn" class="row">
						<button class="btn btn-primary" onclick="editUser();">수정</button>
						<button class="btn btn-default" onclick="refresh();">취소</button>
					</div>
				</div>
				<!-- 여기까지 회원정보 변경 -->
				<%}else if(request.getParameter("type").equals("pw")){ %>
				<!-- 비밀번호 변경 -->
				<div id="info" class="col-md-offset-2 col-md-8 row">
					<ul class="nav nav-pills nav-justified">
						<li role="presentation" ><a href="myPage?id=${id }&type=info" >회원정보 변경</a></li>
						<li role="presentation" class="active"><a href="myPage?id=${id }&type=pw"  >비밀번호 변경</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=leave" >회원 탈퇴</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=planner" >나의 플래너</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=write">내가 쓴 글</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=pay" >결제내역</a></li>
					</ul>
					<br>
					<div id="editPw" class="row">
						<div class="col-md-offset-3 col-md-6">
							<div class="form-group row">
								<label for="" class="col-sm-3 control-label">ID</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="userId"
										readonly="readonly" value="${id }">
								</div>
							</div>

							<div class="form-group row">
								<label for="" class="col-sm-3 control-label">PW</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="checkPw"/>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="" class="col-sm-3 control-label">이메일</label>
								<div class="col-sm-8">
									<input type="email" class="form-control" id="checkEmail"/>
								</div>
								
							</div>

						</div>
					
						<div id="btn" class="row col-md-12">
							<button class="btn btn-primary" onclick="checkUser();">본인인증</button>
						</div>
					</div>
					<div id="editPwResult">
						<div class="col-md-offset-3 col-md-6">

							<div class="form-group row">
								<label for="" class="col-sm-3 control-label">변경할 Pw</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="resPw"/>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="" class="col-sm-3 control-label">Pw 확인</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="checkResPw"/>
								</div>
							</div>

						</div>
					
						<div id="btn" class="row col-md-12">
							<button type="button" class="btn btn-primary" onclick="editUserPw();">변경</button>
						</div>
					</div>
				</div>
				<!-- 비밀번호 변경 -->
				<%}else if(request.getParameter("type").equals("leave")){ %>
				<!-- 회원탈퇴 -->
				<div id="info" class="col-md-offset-2 col-md-8 row">
					<ul class="nav nav-pills nav-justified">
						<li role="presentation" ><a href="myPage?id=${id }&type=info" >회원정보 변경</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=pw"  >비밀번호 변경</a></li>
						<li role="presentation" class="active"><a href="myPage?id=${id }&type=leave" >회원 탈퇴</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=planner" >나의 플래너</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=write">내가 쓴 글</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=pay">결제내역</a></li>
					</ul>
					<div class="row">
						<br>
						<div class="col-md-offset-3 col-md-6">
							<div class="form-group row">
								<label for="" class="col-sm-3 control-label">ID</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="idChecku"
										readonly="readonly" value="${id }">
								</div>
							</div>
							
							<div class="form-group row">
								<label for="" class="col-sm-3 control-label">Pw</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="pwChecku"/>
								</div>
							</div>
							
						</div>
					</div>
					<div id="btn" class="row">
						<button class="btn btn-danger" onclick="leaveUser();">탈퇴</button>
						<button class="btn btn-default" onclick="refresh();">취소</button>
					</div>
				</div>
				<!-- 회원탈퇴 -->
				<!-- 내가 쓴 글 -->
				<%}else if(request.getParameter("type").equals("write")){%>
				<div id="info" class="col-md-offset-2 col-md-8 row">
					<ul class="nav nav-pills nav-justified">
						<li role="presentation" ><a href="myPage?id=${id }&type=info" >회원정보 변경</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=pw"  >비밀번호 변경</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=leave" >회원 탈퇴</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=planner" >나의 플래너</a></li>
						<li role="presentation" class="active"><a href="myPage?id=${id }&type=write">내가 쓴 글</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=pay" >결제내역</a></li>
					</ul>
					<div class="row">
						<br>
						
						<!-- 여기에 내용 넣으면 됨 -->
						<div class="col-md-3">
								<button class="form-control btn btnS" id="bbsBtn" onclick="plannerList();">플래너</button>
								<button class="form-control btn btnS"  onclick="bbsList();">자유게시판</button>
								<button class="form-control btn btnS"  onclick="togetherList();">투게더</button>
								<button class="form-control btn btnS"  onclick="comList();">여행후기</button>
								<button class="form-control btn btnS"  onclick="questionList();">질문</button>
								<button class="form-control btn btnS"  onclick="inquiryList();">1:1문의</button>
						</div>
						<div class="col-md-9" id="boarderTableDiv">
							<table class="table">
								<tr id="listTable">
									<th width="10%;">번호</th>
									<th width="55%;">제목</th>
									<th width="25%;">날짜</th>
									<th width="10%;">조회수</th>
								</tr>
								
							</table>
						</div>
						
						
					</div>
				</div>
				
				
				<%}else if(request.getParameter("type").equals("pay")){ %>
				<!-- 결제내역 -->
				<div id="info" class="col-md-offset-2 col-md-8 row">
					<ul class="nav nav-pills nav-justified">
						<li role="presentation"><a href="myPage?id=${id }&type=info" >회원정보 변경</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=pw"  >비밀번호 변경</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=leave" >회원 탈퇴</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=planner" >나의 플래너</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=write">내가 쓴 글</a></li>
						<li role="presentation" class="active"><a href="myPage?id=${id }&type=pay">결제내역</a></li>
					</ul>
					<div class="row">
						<br>
						<div class="col-md-12" id="boarderTableDiv">
						<button id="payBtn" onclick="payList();">버튼</button>
							<table class="table">
								<tr id="payList">
									<th width="15%">결제일</th>
									<th width="45%">구매내용</th>
									<th width="25%">체크인 ~ 체크아웃</th>
									<th width="15%">금액</th>
								</tr>
								
							</table>


						</div>
					</div>
				</div>

				<%}else if(request.getParameter("type").equals("planner")){ %>
				<!-- 나의 플래너 -->
				<script type="text/javascript">
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
										tempHtml+='      	<center><label class="strFontChg">'+data[i].PLAN_TITLE+'</label></center>';
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
											tempHtml+='      	<center><label class="strFontChg">'+data[i].PLAN_TITLE+'</label></center>';
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
											tempHtml+='      	<center><label class="strFontChg">'+data[i].PLAN_TITLE+'</label></center>';
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
								location.href='myPage?id=${id }&type=planner';
							});
						}
					}

					//플래너 이동
					function moveMyPlan(planCode,title){
						var cfresult=confirm('"'+title+'" 수정하시겠습니까?');
						
						if(cfresult==true){
							location.href='makeplan?code='+planCode;
						}else if(cfresult==false){
							return false;
						}
						
					}
				</script>
				<div id="info" class="col-md-offset-2 col-md-8 row">
					<ul class="nav nav-pills nav-justified">
						<li role="presentation" ><a href="myPage?id=${id }&type=info" >회원정보 변경</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=pw"  >비밀번호 변경</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=leave" >회원 탈퇴</a></li>
						<li role="presentation" class="active"><a href="myPage?id=${id }&type=planner" >나의 플래너</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=write">내가 쓴 글</a></li>
						<li role="presentation"><a href="myPage?id=${id }&type=pay">결제내역</a></li>
					</ul>
					<div class="row">
						<br>
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
				<%} %>
			</div>
		</div>
	</div>
	<!-- 여기까지 컨텐츠입니다 -->
	<br>
	<div class="jumbotron2">
		<jsp:include page="template/footer.jsp"></jsp:include>
	</div>
</body>
</html>