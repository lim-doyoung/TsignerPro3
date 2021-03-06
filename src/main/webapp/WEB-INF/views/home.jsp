<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.net.URLEncoder, java.security.SecureRandom, java.math.BigInteger"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="css/buttons.css" />
<link rel="stylesheet" type="text/css" href="css/tsigner.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- kakaotalk library -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="http://vjs.zencdn.net/5.4.4/video-js.css" rel="stylesheet">
<script src="http://vjs.zencdn.net/5.4.4/video.js"></script>

<!-- header에 넣을 부분 -->

<!-- 네이버 로그인 -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 회원가입 / 로그인 모달 -->
<script type="text/javascript">
	//플래너게시물로 이동
	function movePlan(seq,userId){
		location.href='community_plannerDetail?num='+seq;		
	}
$(window).on('scroll',function(){
	
	
	var video = $('#videobg').height();
	video=video-30;
	if($(window).scrollTop()>video){
		$('.dropdown-menu').addClass('dropbg');
		$('.dropdown-menu a').addClass('drop');
		$('.dropdown-menu>li').addClass('drop');
		$('#navi').addClass('bg');
		$('#profile').fadeIn(1000);
	}else{
		$('.dropdown-menu').removeClass('dropbg');
		$('.dropdown-menu a').removeClass('drop');
		$('.dropdown-menu>li').removeClass('drop');
		$('#navi').removeClass('bg');
		$('#profile').fadeOut(1000);
	}
});

window.onbeforeunload=function(){
	$('#loading').show();
}

$(document).ready(function() {


	//인기플래너 TOP9 불러오기 캐러셀

	$.ajax({
			url:"load/purPlanner",
			method:"GET",
			dataType:"json"
		}).done(function(data){
			console.log(data);

			//인기플래너 TOP3
			var tempHtml3='';

			for(var i=0;i<3;i++){

				var fileImg;
				if(data[i].CMNT_FILENAME=='default.jpg'){
					fileImg='imgs/sampleImg.jpg';
				}else{
					fileImg='plannerImg/'+data[i].CMNT_FILENAME;
				}

				if(i==0){
					tempHtml3+='<div class="item active" >';
				}else{
					tempHtml3+='<div class="item" >';
				}
				
				tempHtml3+='	<a onclick="movePlan(\''+data[i].CMNT_SEQ+'\',\''+data[i].CMNT_WRITER_ID+'\')">';
				tempHtml3+='		<img width="100%" height="100%" src="'+fileImg+'" alt="...">';
				tempHtml3+='		<div class="carousel-caption">';
				tempHtml3+='			<center><label class="strFontChg" id="strFontChg3">'+data[i].CMNT_TITLE+'</label></center>';
				tempHtml3+='		</div>';
				tempHtml3+='	</a>';
				tempHtml3+='</div>';
				
			}
			
			$('#plannerBest3').html(tempHtml3);

			//인기플래너 TOP6
			var tempHtml6='';

			for(var i=3;i<6;i++){

				var fileImg;
				if(data[i].CMNT_FILENAME=='default.jpg'){
					fileImg='imgs/sampleImg.jpg';
				}else{
					fileImg='plannerImg/'+data[i].CMNT_FILENAME;
				}

				if(i==3){
					tempHtml6+='<div class="item active" >';
				}else{
					tempHtml6+='<div class="item" >';
				}
				
				tempHtml6+='	<a onclick="movePlan(\''+data[i].CMNT_SEQ+'\',\''+data[i].CMNT_WRITER_ID+'\')">';
				tempHtml6+='		<img width="100%" height="100%" src="'+fileImg+'" alt="...">';
				tempHtml6+='		<div class="carousel-caption">';
				tempHtml6+='			<center><label class="strFontChg" id="strFontChg6">'+data[i].CMNT_TITLE+'</label></center>';
				tempHtml6+='		</div>';
				tempHtml6+='	</a>';
				tempHtml6+='</div>';
				
			}
			
			$('#plannerBest6').html(tempHtml6);

			//인기플래너 TOP9
			var tempHtml9='';

			for(var i=6;i<9;i++){

				var fileImg;
				if(data[i].CMNT_FILENAME=='default.jpg'){
					fileImg='imgs/sampleImg.jpg';
				}else{
					fileImg='plannerImg/'+data[i].CMNT_FILENAME;
				}

				if(i==6){
					tempHtml9+='<div class="item active" >';
				}else{
					tempHtml9+='<div class="item" >';
				}
				
				tempHtml9+='	<a onclick="movePlan(\''+data[i].CMNT_SEQ+'\',\''+data[i].CMNT_WRITER_ID+'\')">';
				tempHtml9+='		<img width="100%" height="100%" src="'+fileImg+'" alt="...">';
				tempHtml9+='		<div class="carousel-caption">';
				tempHtml9+='			<center><label class="strFontChg" id="strFontChg9">'+data[i].CMNT_TITLE+'</label></center>';
				tempHtml9+='		</div>';
				tempHtml9+='	</a>';
				tempHtml9+='</div>';
				
			}
			
			$('#plannerBest9').html(tempHtml9);
				
		});

//인기플래너 불러오기 종료
	
	
	$('#loading').hide();
	$('#profile').hide();

//공지사항 눌렀을 때 페이지 이동
 $('#btn-detail1').click(function(){
	 location.href="/tsigner/notice";

   });

 //이벤트 눌렀을 때 페이지 이동
 $('#btn-detail2').click(function(){
	 location.href="/tsigner/event";

   });
	
// 		$('#snsBtn').hide();
		
<%-- 		var sns = '<%=session.getAttribute("sns")%>'; --%>
// 		if(sns=='sns'){
// 			$('#snsBtn').trigger('click');
<%-- 			<% --%>
// 			session.removeAttribute("sns");
<%-- 			%> --%>
// 		}else if(sns=='none'){
// 			alert('이미 가입된 계정이 존재합니다.');
<%-- 			<% --%>
// 			session.removeAttribute("sns");
<%-- 			%> --%>
// 		}
	//id에서 엔터 눌렀을 때 로그인 눌리게 하기
	$('#id').keypress(function(e){
		if(e.which==13){
			$('#login').click();
		}
	});
	//pw에서 엔터 눌렀을 때 로그인 눌리게 하기
	$('#pw').keypress(function(e){
		if(e.which==13){
			$('#login').click();
		}
	});
	
	//회원가입 도중 비밀번호 체크해주기
	$('#joinPw').keyup(function(e) {
		$('#chPw').remove();
		$('#pwCheckResult').remove();
		var pw1 = $('#joinPw').val();
		var pw2 = $('#joinPwCheck').val();
		if (pw1 == pw2) {
			$('#pwCheckResult').remove();
		} else if (pw1 != pw2) {
			$('#joinPwCheck').after('<label id="pwCheckResult" style="color: red">비밀번호가 다릅니다</label><input id="chPw" type="hidden" value="1"/>');
		}
	});
		$('#nPw').keyup(function(e) {
			$('#chnPw').remove();
			$('#pwnCheckResult').remove();
			var pw1 = $('#nPw').val();
			var pw2 = $('#nPwCheck').val();
			if (pw1 == pw2) {
				$('#pwnCheckResult').remove();
			} else if (pw1 != pw2) {
				$('#nPwCheck').after('<label id="pwnCheckResult" style="color: red">비밀번호가 다릅니다</label><input id="chnPw" type="hidden" value="1"/>');
			}
		});

		//아이디에 한글이나 특수문자 입력하지 못하게 방지하기
		$("#nId").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
				}
		});
		$("#joinId").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
			}
		});
		
		$('#signT').click(function() {
			$('#myModal').modal("hide");
		});

		
		$("#myModal").on('shown.bs.modal', function(){
		    alert('The modal is fully shown.');
		});
	
		$('#signUp').on('shown.bs.modal', function() {
			$('#myInput').focus();
		});
		
});

	//로그인
	function login() {
		var id = $('#id').val();
		var pw = $('#pw').val();

		var page = window.location.pathname;
		$.ajax({
			type : "post",
			url : "loginUser",
			data : "id=" + id + "&pw=" + pw,
			dataType : "text",
			success : function(data, textStatus, xhr) {
				if (data == 'logFail') {
					alert('로그인에 실패하셨습니다.');
				} else {
					window.location.href = page;
				}
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "error" + error);
			}
		})
	}
	
	//번호 길이 체크
	function telCheck() {
		$('#chTel').remove();
		$('#telCheckResult').remove();
		var tel = $('#joinTel').val();
		var telLength = tel.length;
		if (telLength > 11) {
			$('#joinTel')
					.after(
							'<label id="telCheckResult" style="color: red">번호가 너무 깁니다</label><input id="chTel" type="hidden" value="1"/>');
		} else if (telLength < 8) {
			$('#joinTel')
					.after(
							'<label id="telCheckResult" style="color: red">번호가 너무 짧습니다</label><input id="chTel" type="hidden" value="1"/>');
		}
	}

	//로그아웃
	function logout() {
		var page = window.location.pathname;

		$.ajax({
			type : 'post',
			url : 'logoutUser',
			success : function(data) {
				if (data == 'logoutSuccess') {
					alert('정상적으로 로그아웃 되셨습니다');
					window.location.href = "http://192.168.1.8:8080/tsigner/";
				} else if (data == 'kakaoLogout') {
					alert('정상적으로 로그아웃 되셨습니다');
					window.location.href = "http://192.168.1.8:8080/tsigner/";
				} else {
					alert('로그아웃 실패');
				}
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "error" + error);
			}
		})
	}

	//회원가입
	function join() {
		//체크할 리스트
		var check1 = $('#chId').val();
		var check2 = $('#chPw').val();
		var check3 = $('#chEmail').val();
		var check4 = $('#chName').val();
		var check5 = $('#chNick').val();
		var check6 = $('#chBirth').val();
		var check7 = $('#chPwLength').val();
		var check8 = $('#chTel').val();

		var page = window.location.pathname;

		var id = $('#joinId').val();
		var pw = $('#joinPw').val();
		var name = $('#joinName').val();
		var nickName = $('#joinNickName').val();
		var tel = $('#joinTel').val();
		var birth = $('#joinBirth').val();
		var email = $('#joinEmail').val();
		var gender = $('.joinGender:checked').val();

		if (check1 != 1 && check2 != 1 && check3 != 1 && check4 != 1
				&& check5 != 1 && check6 != 1 && check7 != 1 && check8 != 1) {
			alert('가입을 축하드립니다~!!!');

			$.ajax({
				type : 'post',
				url : 'joinUser',
				data : "id=" + id + "&pw=" + pw + "&userName=" + name
						+ "&nickName=" + nickName + "&tel=" + tel + "&birth="
						+ birth + "&email=" + email + "&gender=" + gender,
				datatype : "text",
				success : function(data) {
					window.location.href = page;
				}
			})
		} else {
			// 			$('#joinCheck').remove();
			// 			$('#joinUser').after('<label id="joinCheck" style="color:red">모든정보를 입력해주세요</label>');
			alert('모든 정보를 정확히 입력해주세요!');
		}

	}

	//비밀번호 확인 란에서 비밀번호가 같은지 아닌지 확인
	function passwordCheck() {
		$('#chPw').remove();
		$('#pwCheckResult').remove();
		var pw1 = $('#joinPw').val();
		var pw2 = $('#joinPwCheck').val();

		if (pw1 != pw2) {
			$('#joinPwCheck')
					.after(
							'<label id="pwCheckResult" style="color: red">비밀번호가 다릅니다</label><input id="chPw" type="hidden" value="1"/>');
		}
	}

	//아이디 길이와 중복체크
	function idCheck() {
		$('#chId').remove();
		$('#idCheckResult').remove();
		var idCheck = $('#joinId').val();
		var idLength = idCheck.length;

		if (idLength > 3 && idLength < 22) {
			$
					.ajax({
						type : 'post',
						url : 'idCheck',
						data : "id=" + idCheck,
						datatype : "text",
						success : function(data) {
							if (data == 'fail') {
								$('#joinId')
										.after(
												'<label id="idCheckResult" style="color: red">아이디 중복!</label><input id="chId" type="hidden" value="1"/>');

							} else {
								$('#joinId')
										.after(
												'<label id="idCheckResult" style="color: blue">생성가능</label>');
							}
						}
					})
		} else if (idLength < 4) {
			$('#joinId')
					.after(
							'<label id="idCheckResult" style="color: red">아이디는 4글자 이상 영+숫자입니다.</label><input id="chId" type="hidden" value="1"/>');
		} else if (idLength > 21) {
			$('#joinId')
					.after(
							'<label id="idCheckResult" style="color: red">아이디는 21글자 이하 영+숫자입니다.</label><input id="chId" type="hidden" value="1"/>');
		}

	}

	//메일전송하고 확인하기
	function mail() {
		var email = $('#joinEmail').val();

		$.ajax({
			type : 'post',
			url : 'mailCheck',
			data : 'email=' + email,
			datatype : "text",
			success : function(data) {
				if (data == 'success') {
					alert('인증 메일전송 완료');
				} else if (data == 'fail') {
					alert('다시 시도해주세요');
				} else if (data == 'mailDupli') {
					alert('중복되는 이메일입니다.');
				}
			}
		})
	}

	//이메일 인증번호 체크
	function emailCheck() {
		$('#chEmail').remove();
		$('#emailSuccess').remove();
		$('#emailFail').remove();
		var checkEmail = $('#emailCheck').val();
		var email = $('#joinEmail').val();
		$
				.ajax({
					type : 'post',
					url : 'mailResult',
					data : 'checkEmail=' + checkEmail + '&email=' + email,
					datatype : 'text',
					success : function(data) {
						if (data == 'success') {
							$('#emailCheck')
									.after(
											'<label id="emailSuccess" style="color: blue">인증성공</label>');
						} else if (data = 'fail') {
							$('#emailCheck')
									.after(
											'<label id="emailFail" style="color: red">인증실패</label><input id="chEmail" type="hidden" value="1"/>');
						}
					}
				})
	}

	//닉네임,이름 길이 체크
	function nameLength() {
		var name = $('#joinName').val();
		if (name.length<2 || name.length>8) {
			$('#nameCh').remove();
			$('#chName').remove();
			$('#joinName')
					.after(
							'<label id="nameCh" style="color:red">성함을 정확히 기입해주세요</label><input type="hidden" id="chName" value="1"/>');
		} else {
			$('#chName').remove();
			$('#nameCh').remove();
		}
	}
	function nickLength() {
		var nick = $('#joinNickName').val();
		if (nick.length<2 || nick.length>10) {
			$('#chNick').remove();
			$('#nickCh').remove();
			$('#joinNickName')
					.after(
							'<label id="nickCh" style="color:red">닉네임은 2글자 이상 10글자 이하입니다</label><input type="hidden" id="chNick" value="1"/> ');
		} else {
			$('#nickCh').remove();
			$('#chNick').remove();
		}
	}
	
	//생년월일 길이 체크
	function birthLength() {
		var birth = $('#joinBirth').val();
		$('#birthCh').remove();
		$('#chBirth').remove();
		if (birth.length != 8) {
			$('#birthCh').remove();
			$('#chBirth').remove();
			$('#joinBirth')
					.after(
							'<label id="birthCh" style="color:red">ex)19990101</label><input type="hidden" id="chBirth" value="1"/>');
		} else {
			$('#birthCh').remove();
			$('#chBirth').remove();
		}
	}

	//비밀번호 길이 체크
	function pwLength() {
		var pw = $('#joinPw').val();
		if (pw.length<5||pw.length>12) {
			$('#pwCh').remove();
			$('#chPwLength').remove();
			$('#joinPw')
					.after(
							'<label id="pwCh" style="color:red">패스워드는 6글자이상 12글자 이하입니다.</label><input type="hidden" id="chPwLength" value="1"/>');
		} else {
			$('#pwCh').remove();
			$('#chPwLength').remove();
		}
	}

	//id 찾기
	function searchFid() {
		var name = $('#nameSearch').val();
		var email = $('#emailSearch').val();

		$.ajax({
			type : 'post',
			url : 'searchId',
			data : 'name=' + name + '&email=' + email,
			datatype : 'text',
			success : function(e) {
				$('#Fid').attr("value", e);
			},
			error : function() {
				$('#Fid').attr("value", "검색된 계정이 없습니다!!!");
			}
		})
	}

	//비밀번호 찾기 및 변경
	function searchFpw() {
		var id = $('#idFpw').val();
		var email = $('#emailFpw').val();
		$('#newForm').remove();
		$
				.ajax({
					type : 'post',
					url : 'searchPw',
					data : 'id=' + id + '&email=' + email,
					datatype : 'text',
					success : function() {
						$('#pwNext')
								.after(
										'<div id="newForm"><div class="form-group row"><label for="sub" class="col-sm-2 control-label">변경할 pw</label><div class="col-sm-7"><input type="password" class="form-control" id="rePw" placeholder="변경할 비밀번호"></div></div><div class="form-group row"><label for="sub" class="col-sm-2 control-label">pw 확인</label><div class="col-sm-7"><input type="password" class="form-control" id="rePwCheck" placeholder="비밀번호 확인"></div><div class="col-sm-2"><button class="btn btn-default" onclick="editPw();">변경하기</button></div></div></div>');
					},
					error : function() {
						alert('검색된 내용이 없습니다');
					}
				})
	}

	//비밀번호 변경
	function editPw() {
		var id = $('#idFpw').val();
		var email = $('#emailFpw').val();

		var pw = $('#rePw').val();
		var pw1 = $('#rePwCheck').val();

		var page = window.location.pathname;
		$('#pwCheck').remove();
		$('#pwCheck2').remove();
		if (pw.length<6||pw.length>12) {
			$('#pwCheck').remove();
			$('#rePw')
					.after(
							'<label id="pwCheck" style="color:red">비밀번호는 6자리이상 12자리 이하로 설정해주세요.</label>');

		} else if (pw != pw1) {
			$('#pwCheck2').remove();
			$('#rePwCheck')
					.after(
							'<label id="pwCheck2" style="color:red">비밀번호가 같지 않습니다</label>');
		} else {
			$.ajax({
				type : 'post',
				url : 'editPw',
				data : 'id=' + id + '&email=' + email + '&editPw=' + pw,
				datatype : 'text',
				success : function() {
					alert('비밀번호 변경완료');
					window.location.href = page;
				},
				error : function() {
					alert('다시 시도해주세요');
				}
			})
		}

	}

	//간편회원가입
	function joinN(){
		var id = $('#nId').val();
		var pw = $('#nPw').val();
		var pwCheck = $('#chnPw').val();
		var name = $('#nName').val();
		var nickName = $('#nNickName').val();
		var email = '<%=session.getAttribute("emailN")%>';
		var snsId = '<%=session.getAttribute("idN")%>';
		var snsType = '<%=session.getAttribute("type")%>';
		
		
		var check1 = $('#chNId').val();
		var check2 = $('#chnPw').val();
		var check3 = $('#chnPwLength').val();

		var page = window.location.pathname;

		if(email==''){
			alert('SNS 계정에 등록된 Email이 없습니다! 일반 회원가입으로 진행해주세요!');
			window.location.href = "/";
		}
			
		if (check1 != 1 && check2 != 1 && check3 != 1 && name.length>1 && nickName.length>1) {
			alert('가입을 축하드립니다~!!!');

		$.ajax({
				type : 'post',
				url : 'easyJoin',
				data : "id=" + id + "&pw=" + pw + "&userName=" + name
						+ "&nickName=" + nickName + "&email=" + email+ "&snsId=" + snsId+ "&snsType=" + snsType,
				datatype : "text",
				success : function(data) {
					window.location.href = page;
				}
			})
		} else {
			alert('모든 정보를 정확히 입력해주세요!');
		}
	}
	
// 	//간편 아이디 중복체크 및 길이 체크
// 	function nidCheck() {
// 		$('#chNId').remove();
// 		$('#nidCheckResult').remove();
// 		var idCheck = $('#nId').val();
// 		var idLength = idCheck.length;

// 		if (idLength > 3 && idLength < 22) {
// 			$
// 					.ajax({
// 						type : 'post',
// 						url : 'idCheck',
// 						data : "id=" + idCheck,
// 						datatype : "text",
// 						success : function(data) {
// 							if (data == 'fail') {
// 								$('#nId')
// 										.after(
// 												'<label id="nidCheckResult" style="color: red">아이디 중복!</label><input id="chNId" type="hidden" value="1"/>');

// 							} else {
// 								$('#nId')
// 										.after(
// 												'<label id="nidCheckResult" style="color: blue">생성가능</label>');
// 							}
// 						}
// 					})
// 		} else if (idLength < 4) {
// 			$('#nId')
// 					.after(
// 							'<label id="nidCheckResult" style="color: red">아이디는 4글자 이상 영+숫자입니다.</label><input id="chNId" type="hidden" value="1"/>');
// 		} else if (idLength > 21) {
// 			$('#nId')
// 					.after(
// 							'<label id="nidCheckResult" style="color: red">아이디는 21글자 이하 영+숫자입니다.</label><input id="chNId" type="hidden" value="1"/>');
// 		}

// 	}

// 	function npwLength() {
// 		var pw = $('#nPw').val();
// 		if (pw.length<5||pw.length>12) {
// 			$('#pwNCh').remove();
// 			$('#chNPwLength').remove();
// 			$('#nPw')
// 					.after(
// 							'<label id="pwNCh" style="color:red">패스워드는 6글자이상 12글자 이하입니다.</label><input type="hidden" id="chNPwLength" value="1"/>');
// 		} else {
// 			$('#pwNCh').remove();
// 			$('#chNPwLength').remove();
// 		}
// 	}

// 	//비밀번호 확인 란에서 비밀번호가 같은지 아닌지 확인
// 	function pwNCheck() {
// 		$('#chnPw').remove();
// 		$('#pwnCheckResult').remove();
// 		var pw1 = $('#nPw').val();
// 		var pw2 = $('#nPwCheck').val();

// 		if (pw1 != pw2) {
// 			$('#nPwCheck')
// 					.after(
// 							'<label id="pwnCheckResult" style="color: red">비밀번호가 다릅니다</label><input id="chnPw" type="hidden" value="1"/>');
// 		}
// 	}

// 	function nnameLength() {
// 		var name = $('#nName').val();
// 		if (name.length<2 || name.length>8) {
// 			$('#nnameCh').remove();
// 			$('#chnName').remove();
// 			$('#nName')
// 					.after(
// 							'<label id="nnameCh" style="color:red">성함을 정확히 기입해주세요</label><input type="hidden" id="chnName" value="1"/>');
// 		} else {
// 			$('#chnName').remove();
// 			$('#nnameCh').remove();
// 		}
// 	}
// 	function nnickLength() {
// 		var nick = $('#nNickName').val();
// 		if (nick.length<2 || nick.length>10) {
// 			$('#chnNick').remove();
// 			$('#nnickCh').remove();
// 			$('#nNickName')
// 					.after(
// 							'<label id="nnickCh" style="color:red">닉네임은 2글자 이상 10글자 이하입니다</label><input type="hidden" id="chnNick" value="1"/> ');
// 		} else {
// 			$('#nnickCh').remove();
// 			$('#chnNick').remove();
// 		}
// 	}
	
</script>
<style type="text/css">


.dropbg{
	box-shadow: 0px 0px 0px 0px;
}

.drop{
	transition:.3s ease-in-out;
/* 	background-color: rgba(51,122,183,0.3); */
 	background-color: rgba(0,0,0,0.3); 
	 
}

.bg{
 	box-shadow: 1px 1px 5px rgba(0,0,0,0.6); 
	background-color: rgba(0,0,0,0.6); 
	transition:.3s ease-in-out;
}

#videobg>video {
	max-width: 100%;
	max-height: 100%;
	width: 100%;
	height: auto;
	overflow: hidden;
	z-index: -1000;
}

.edit {
	color: white;
}

.edit:hover {
	color: gray;
}
.edit:focus {
	background-color: rgba(0, 0, 0, 0);
}

.nav>li>a:hover {
	background: rgba(0, 0, 0, 0);
}

.nav>li>a:active {
	background-color: rgba(0, 0, 0, 0);
}

.icon-bar {
	background: white;
}

#box {
	height: 100%;
}

.carousel-inner img {
	width: 100%;
}

.hr1 {
	height: 4px;
}

#hrText {
	line-height: 50px;
	font-weight: bold;
	font-size: 15px;
	text-align: center;
}

#btn-detail1 {
	margin-left: 18%;
	margin-right: 60%;
}
#btn-detail2 {
	margin-left: 18%;
	margin-right: 60%;
}

#loginApi {
	text-align: right;
}

.nav .open > a, .nav .open > a:focus, .nav .open > a:hover {
    background-color: rgba(0, 0, 0, 0);
    color:gray;
}
.nav > li > a:focus, .nav > li > a:hover {
    background-color: rgba(0, 0, 0, 0);
}
ul.dropdown-menu {
  background-color: rgba(0, 0, 0, 0);
}
ul.dropdown-menu:hover {
  background-color: rgba(0, 0, 0, 0);
}
ul.dropdown-menu a{
  color:white;
}
ul.dropdown-menu a:hover{
	color:gray;
}

.dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus {
            background-image:none !important;
 }
 .dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus {
            background-color:rgba(0, 0, 0, 0);
 }
 
 .dropdown-menu{
 	border: solid 0px rgba(0, 0, 0, 0);
 	
 }
 
#profile{
 border-radius: 20px;
}
 #loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 99;  
 text-align: center; } 
  
#loading-image {  
 position: absolute;  
 top: 40%;  
 left: 45%; 
 z-index: 100; }
 
 #myModal{
 }
 
 body{
 		font-family: 'Gothic A1', sans-serif;
		font-family: 'Do Hyeon', sans-serif;
		font-family: 'Noto Sans KR', sans-serif;
 }
 
 #plannerBest3{
 	height: 475px;
 	cursor: pointer;
 }
 
 #plannerBest6,#plannerBest9{
 	height: 237.5px;
 	cursor: pointer;
 }
 
 #strFontChg6,#strFontChg9{
		cursor:pointer;
	}
	
	#strFontChg3{
		position:relative;
		bottom: 30px;
	}
 
  
 
</style>
<title>T signer</title>
</head>
<body>
<%
		String root = request.getContextPath();
	%>
<div id="loading"><img id="loading-image" src="<%=root%>/imgs/loading2.gif" alt="Loading..." /></div>
	<!-- header에 넣을 부분 -->
	<!--Login Modal 111111111111111111111111-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" data-backdrop="static">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header" style="text-align: center;">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="fontTitle" style="font-size: 30px">T Signer</h4>
				</div>
				<!--login content -->
				<div class="modal-body">
					<div class="row">
					<div class="form-group">
						<div class="col-sm-12">
							<input type="text" class="form-control input-sm" name="id" id="id" placeholder="아이디" style="border-radius: 0px;">
						</div>
					</div>
					<label></label>
					<div class="form-group">
						<div class="col-sm-12">
							<input type="password" class="form-control" name="pw" id="pw" placeholder="패스워드" style="border-radius: 0px;">
						</div>
					</div>
					<br><br>
						<div class="col-sm-12" style="text-align: center;" >
							<button id="login" type="button" class="form-control" onclick="login();" style="background-color: #3385ff; color: white; border: none; border-radius: 0px;">로그인</button>
						</div>
					<br><br>
					
					<div class="row">
					<!-- 카카오톡 로그인 -->
					<div id="loginApi" class="col-sm-12" style="text-align:center;">
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=337e2a1093fbc87f1c0fa2bea4366df1&redirect_uri=http://192.168.1.8:8080/tsigner/kakao&response_type=code">
								<img height="40" alt="카카오 로그인 버튼" src="imgs/kakaotalklogo.jpg">
							</a>
							&nbsp;
							<!-- 네이버 로그인 -->
							<!-- 네이버아이디로로그인 버튼 노출 영역 -->
							<%
								String clientId = "S1ExXuozTffAz6EJ7ZL2";//애플리케이션 클라이언트 아이디값";
								String redirectURI = URLEncoder.encode("http://192.168.1.8:8080/tsigner/naverLogin", "UTF-8");
								SecureRandom random = new SecureRandom();
								String state = new BigInteger(130, random).toString();
								String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
								apiURL += "&client_id=" + clientId;
								apiURL += "&redirect_uri=" + redirectURI;
								apiURL += "&state=" + state;
								session.setAttribute("state", state);
							%>
							<a href="<%=apiURL%>"><img height="40"
								src="imgs/naverlogopng.png" /></a>
							&nbsp;
							<!-- 페이스북 로그인 무늬만 있음 -->
							<a href="popup();"><img height="40"
								src="imgs/facebooklogo.jpg" /></a>
							<br><br>
					</div>
					</div>
					</div>
					<!--login footer -->
					<div class="modal-footer row">
						<div class="col-sm-12" style="text-align: center;">
							<button style="border-radius: 0px;" class="form-control" data-toggle="modal" data-target="#agreeModal" data-dismiss="modal">회원가입</button>
							<button style="border-radius: 0px;" class="form-control" data-toggle="modal" data-target="#idSearch" data-dismiss="modal">아이디 찾기</button>
							<button style="border-radius: 0px;" class="form-control" data-toggle="modal" data-target="#pwSearch" data-dismiss="modal">비밀번호 찾기</button>
						</div>
						
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- 약관동의 Modal-->
	<div class="modal fade" id="agreeModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" data-backdrop="static">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">약관동의</h4>
				</div>
				<!-- sign up content -->
				<div class="modal-body">
					<div class="form-group row">
						<textarea rows="10" class="form-control">
						제 1 장 총칙
제 1 조 (목적)
1. 본 약관은 기업마당 사이트가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 기업마당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2 조 (약관의 효력과 변경)
1. 기업마당 사이트는 귀하가 본 약관 내용에 동의하는 경우 기업마당 사이트의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.
2. 기업마당 사이트는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 기업마당 사이트 내에 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다.
이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.
제 3 조 (약관 외 준칙)
1. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.
제 4 조 (용어의 정의)
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.

1. 이용자 : 본 약관에 따라 기업마당 사이트가 제공하는 서비스를 받는 자.
2. 가입 : 기업마당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위.
3. 회원 : 기업마당 사이트에 개인 정보를 제공하여 회원 등록을 한 자로서 기업마당 사이트가 제공하는 서비스를 이용할 수 있는 자.
4. 비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합.
5. 탈퇴 : 회원이 이용계약을 종료시키는 행위.
제 2 장 서비스 제공 및 이용
제 5 조 (이용계약의 성립)
1. 이용계약은 신청자가 온라인으로 기업마당 사이트에서 제공하는 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다.
2. 기업마당 사이트는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.
① 다른 사람의 명의를 사용하여 신청하였을 때
② 이용계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때
③ 다른 사람의 기업마당 사이트 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때
④ 기업마당 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우
⑤ 기타 기업마당 사이트가 정한 이용신청요건이 미비 되었을 때
제 6 조 (회원정보 사용에 대한 동의)
1. 회원의 개인정보는 공공기관의 개인정보보호에 관한 법률에 의해 보호됩니다.
2. 기업마당 사이트의 회원 정보는 다음과 같이 사용, 관리, 보호됩니다.
① 개인정보의 사용 : 기업마당 사이트는 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다.
단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 기업마당 사이트에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다.
② 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 귀하의 개인정보를 수정/삭제할 수 있습니다.
③ 개인정보의 보호 : 귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 귀하의 ID와 비밀번호에 의해 관리되고 있습니다.
따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는 안되며, 작업 종료 시에는 반드시 로그아웃 해 주시기 바랍니다.
3. 회원이 본 약관에 따라 이용신청을 하는 것은, 기업마당 사이트가 신청서에 기재된 회원정보를 수집, 이용하는 것에 동의하는 것으로 간주됩니다.
제 7 조 (사용자의 정보 보안)
1. 가입 신청자가 기업마당 사이트 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.
2. ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용 되었다는 사실을 발견한 경우에는 즉시 기업마당 사이트에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다. 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 기업마당 사이트는 책임을 부담하지 아니합니다.
제 8 조 (서비스의 중지)
1. 기업마당 사이트는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지할 수 있습니다.
제 9 조 (서비스의 변경 및 해지)
1. 기업마당 사이트는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다. 의한 손해에 대하여 책임을 부담하지 아니합니다.
제 10 조 (게시물의 저작권)
1. 귀하가 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다.
2. 기업마당 사이트는 게시된 내용을 사전 통지 없이 편집, 이동할 수 있는 권리를 보유하며, 게시판운영 원칙에 따라 사전 통지 없이 삭제할 수 있습니다.
3. 귀하의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야 합니다.
제 3 장 의무 및 책임
제 11 조 (기업마당 사이트의 의무)
1. 기업마당 사이트는 회원의 개인 신상 정보를 본인의 승낙없이 타인에게 누설, 배포하지 않습니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.
제 12 조 (회원의 의무)
1. 회원 가입 시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 귀하에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
2. 회원은 기업마당 사이트의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.
제 4 장 기타
제 13 조 (양도금지)
1. 회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다.
제 14 조 (손해배상)
1. 기업마당 사이트는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 기업마당 사이트가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.
제 15 조 (면책조항)
1. 기업마당 사이트는 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. 기업마당 사이트는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다. 금전적 거래등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.
제 16 조 (재판관할)
1. 기업마당 사이트와 이용자 간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 대한민국의 법원에 제기합니다.
						</textarea>
					</div>
				</div>
				<!--sign up footer -->
				<div class="modal-footer">
					<button type="button" id="cancleBtn" class="btn btn-default"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#signUp" data-dismiss="modal">동의</button>
				</div>
			</div>
		</div>
	</div>

	<!--Sign UP Modal 22222222222222222222222222-->
	<div class="modal fade" id="signUp" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" data-backdrop="static">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">회원가입</h4>
				</div>
				<!-- sign up content -->
				<div class="form">
					<div class="modal-body">
						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">ID</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="id" id="joinId" placeholder="ID를 입력하세요" onblur="idCheck();"> 
									<input id="chId" type="hidden" value="1" />
							</div>
						</div>

						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">PW</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="pw" id="joinPw" placeholder="PassWord를 입력하세요" onblur="pwLength();">
								<input id="chPwLength" type="hidden" value="1" />
							</div>
						</div>
						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">PW 확인</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="joinPwCheck" placeholder="비밀번호 확인" onblur="passwordCheck();" /> 
								<input id="chPw" type="hidden" value="1" />
							</div>
						</div>

						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">이름</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="name"	id="joinName" placeholder="성함" onblur="nameLength();">
								<input type="hidden" id="chName" value="1" />
							</div>
						</div>

						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">닉네임</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="nickName"	id="joinNickName" placeholder="닉네임" onblur="nickLength();">
								<input type="hidden" id="chNick" value="1" />
							</div>
						</div>

						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">전화번호</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="tel" id="joinTel"	placeholder="01012345678" onblur="telCheck();"> 
								<input type="hidden" id="chTel" value="1" />
							</div>
						</div>

						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-7">
								<input type="email" class="form-control" name="email" id="joinEmail" placeholder="example@naver.com">
							</div>
							<div class="col-sm-2">
								<button class="btn btn-default" onclick="mail();">메일인증</button>
							</div>
						</div>

						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">인증번호</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="emailCheck"
									id="emailCheck" placeholder="" onblur="emailCheck();">
								<input id="chEmail" type="hidden" value="1" />
							</div>
						</div>

						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">생년월일</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="birth"
									id="joinBirth" placeholder="19990101" onblur="birthLength();">
								<input type="hidden" id="chBirth" value="1" />
							</div>
						</div>

						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">성별</label>
							<div class="col-sm-7">
								남 <input type="radio" name="gender" class="joinGender" value="1"
									checked="checked"> 여 <input type="radio" name="gender"
									class="joinGender" value="2">
							</div>
						</div>
					</div>
				</div>
				<!--sign up footer -->
				<div class="modal-footer">
					<button type="button" id="cancleBtn" class="btn btn-default"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="joinUser"
						onclick="join();">가입</button>
				</div>
			</div>
		</div>
	</div>

	<!-- id 찾기 -->
	<div class="modal fade" id="idSearch" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" data-backdrop="static">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">아이디 찾기</h4>
				</div>
				<!-- id 찾기 content -->
				<div class="modal-body">
					<div class="form-group row">
						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">&nbsp;이름</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="nameSearch"
									id="nameSearch" placeholder="성명">
							</div>
						</div>
						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">&nbsp;이메일</label>
							<div class="col-sm-7">
								<input type="email" class="form-control" name="emailSearch"
									id="emailSearch" placeholder="email">
							</div>
							<div class="col-sm-2">
								<button class="btn btn-default" onclick="searchFid();">ID찾기</button>
							</div>
						</div>
						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">&nbsp;찾은
								계정</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="Fid"
									placeholder="검색된 아이디입니다" value="" disabled="disabled">
							</div>
						</div>
					</div>

				</div>
				<!--sign up footer -->
				<div class="modal-footer">
					<button type="button" id="cancleBtn" class="btn btn-default"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#myModal" data-dismiss="modal">뒤로</button>
				</div>
			</div>
		</div>
	</div>

	<!-- pw 찾기 -->
	<div class="modal fade" id="pwSearch" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" data-backdrop="static">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">비밀번호 찾기</h4>
				</div>
				<!-- id 찾기 content -->
				<div class="modal-body">
					<div class="form-group row">
						<div class="form-group row">
							<label for="sub" class="col-sm-2 control-label">아이디</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="idFpw"
									placeholder="아이디">
							</div>
						</div>
						<div id="pwNext" class="form-group row">
							<label for="sub" class="col-sm-2 control-label">&nbsp;이메일</label>
							<div class="col-sm-7">
								<input type="email" class="form-control" id="emailFpw"
									placeholder="email">
							</div>
							<div class="col-sm-2">
								<button class="btn btn-default" onclick="searchFpw();">pw찾기</button>
							</div>
						</div>
						<!-- 여기서부터 추가될거임 -->

					</div>

				</div>
				<!--sign up footer -->
				<div class="modal-footer">
					<button type="button" id="cancleBtn" class="btn btn-default"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#myModal" data-dismiss="modal">뒤로</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- <!-- sns 간편회원가입 -->
<!-- 	<div class="modal fade" id="snsJoin" tabindex="-1" role="dialog" -->
<!-- 		aria-labelledby="myModalLabel" data-backdrop="static"> -->
<!-- 		<div class="modal-dialog" role="document"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				header -->
<!-- 				<div class="modal-header"> -->
<!-- 					<button type="button" class="close" data-dismiss="modal" -->
<!-- 						aria-label="Close"> -->
<!-- 						<span aria-hidden="true">&times;</span> -->
<!-- 					</button> -->
<!-- 					<h4 class="modal-title" id="myModalLabel">SNS 간편가입</h4> -->
<!-- 				</div> -->
<!-- 				가입 content -->
<!-- 				<div id="easyJoin" class="modal-body"> -->
<!-- 					<div class="form-group row"> -->
<!-- 						<div class="col-sm-offset-1 form-group row"> -->
<!-- 							<label for="sub" class="col-sm-2 control-label">ID</label> -->
<!-- 							<div class="col-sm-7"> -->
<!-- 								<input type="text" class="form-control" id="nId"	 -->
<!-- 									placeholder="ID를 입력하세요" onblur="nidCheck();"> <input -->
<!-- 									id="chNId" type="hidden" value="1" /> -->

<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="col-sm-offset-1 form-group row"> -->
<!-- 							<label for="sub" class="col-sm-2 control-label">PW</label> -->
<!-- 							<div class="col-sm-7"> -->
<!-- 								<input type="password" class="form-control" -->
<!-- 									id="nPw" placeholder="PassWord를 입력하세요" onblur="npwLength();"> -->
<!-- 								<input id="chNPwLength" type="hidden" value="1" /> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="col-sm-offset-1 form-group row"> -->
<!-- 							<label for="sub" class="col-sm-2 control-label">PW 확인</label> -->
<!-- 							<div class="col-sm-7"> -->
<!-- 								<input type="password" class="form-control" id="nPwCheck" -->
<!-- 									placeholder="비밀번호 확인" onblur="pwNCheck();" /> <input -->
<!-- 									id="chnPw" type="hidden" value="1" /> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="col-sm-offset-1 form-group row"> -->
<!-- 							<label for="sub" class="col-sm-2 control-label">이름</label> -->
<!-- 							<div class="col-sm-7"> -->
<!-- 								<input type="text" class="form-control" -->
<%-- 									id="nName" placeholder="성함" onblur="nnameLength();" value="${sessionScope.nameN }"> --%>
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="col-sm-offset-1 form-group row"> -->
<!-- 							<label for="sub" class="col-sm-2 control-label">닉네임</label> -->
<!-- 							<div class="col-sm-7"> -->
<!-- 								<input type="text" class="form-control" -->
<%-- 									id="nNickName" placeholder="닉네임" onblur="nnickLength();" value="${sessionScope.nickNameN }"> --%>
<!-- 							</div> -->
<!-- 						</div> -->


<!-- 					</div> -->

<!-- 				</div> -->
<!-- 				sign up footer -->
<!-- 				<div class="modal-footer"> -->
<!-- 					<button type="button" id="cancleBtn" class="btn btn-default" -->
<!-- 						data-dismiss="modal">Cancle</button> -->
<!-- 					<button type="button" class="btn btn-primary" id="joinNUser" -->
<!-- 						onclick="joinN();">Submit</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

	<!-- 여기까지 -->

	
	
<%-- 	<input id="snsType" type="hidden" value="${sns }"> --%>
<!-- 	<button id="snsBtn" class="edit" data-toggle="modal" data-target="#snsJoin">간편회원가입</button> -->
	<div class="container-fluid">
		<div class="row">
			<div id="videobg" style="height: auto">
					<video id="video" class="video-js" loop="loop" muted="muted" autoplay="autoplay" data-setup='{"fluid":true}'>
				<source src="video/mainVideo.mp4" type="video/mp4">
			</video>
		</div>
		<div class="col-md-12">
		<div id="outNav">
						<nav class="navbar navbar-fixed-top" id="navi">
							<div class="container-fluid">
								<!-- Brand and toggle get grouped for better mobile display -->
								<div class="navbar-header">
									<button type="button" class="navbar-toggle collapsed"
										data-toggle="collapse"
										data-target="#bs-example-navbar-collapse-1">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
									<a id="fontTitle" class="navbar-brand edit" href="<%=root%>/">T
										Signer</a>
								</div>
	
								<!-- Collect the nav links, forms, and other content for toggling -->
								<div class="collapse navbar-collapse"
									id="bs-example-navbar-collapse-1">
	
									<ul class="nav navbar-nav">
										<li><a class="edit" href="<%=root%>/planner">PLANNER</a></li>
										<li><a href="<%=root%>/community" class="dropdown-toggle edit"
											data-toggle="dropdown" role="button" aria-haspopup="true"
											aria-expanded="false">BOOKING <span class="caret"></span></a>
											<ul class="dropdown-menu">
												<li><a href="<%=root%>/booking">투어 정보</a></li>
												<li><a href="<%=root%>/hotel">호텔 예약</a></li>
											</ul></li>
										<li><a href="<%=root%>/community" class="dropdown-toggle edit"
											data-toggle="dropdown" role="button" aria-haspopup="true"
											aria-expanded="false">COMMUNITY <span class="caret"></span></a>
											<ul class="dropdown-menu">
												<li><a href="<%=root%>/community_planner">플래너</a></li>
												<li><a href="<%=root%>/community_bbs">자유게시판</a></li>
												<li><a href="<%=root%>/community_together">투게더</a></li>
												<li><a href="<%=root%>/community">여행후기</a></li>
												<li><a href="<%=root%>/community_question">질문</a></li>
											</ul></li>
										<li><a href="<%=root%>/notice" class="dropdown-toggle edit"
											data-toggle="dropdown" role="button" aria-haspopup="true"
											aria-expanded="false">NOTICE <span class="caret"></span></a>
											<ul class="dropdown-menu">
												<li><a id="customercenterBtn" href="<%=root%>/notice">공지사항</a></li>
			                                    <li><a id="customercenterBtn" href="<%=root%>/howtouse">이용방법</a></li>
			                                    <li><a id="customercenterBtn" href="<%=root%>/event">이벤트</a></li>
			                                    <li><a id="customercenterBtn" href="<%=root%>/update">업데이트</a></li>
												
											</ul></li>
									</ul>
									<ul class="nav navbar-nav navbar-right">
								<c:choose>
									<c:when test="${empty sessionScope.id}">
										<li><a class="edit" href="#" data-toggle="modal"
											data-target="#myModal" style="color: white">로그인</a></li>
									</c:when>
									<c:otherwise>
									<%
											String profile = (String)session.getAttribute("profile");
											if(profile.startsWith("/profile/")||profile.startsWith("profile/")){
											%>
											<li ><img width="50px" height="50px" style="margin-left: 0px" id="profile" alt="" src="<%=root %>/${sessionScope.profile }" onerror="this.src='<%=root%>/imgs/noProfile.png'"></li>
											
											<%
												}else{
											%>
											<li ><img width="50px" height="50px" style="margin-left: 0px" id="profile" alt="" src="${sessionScope.profile }" onerror="this.src='<%=root%>/imgs/noProfile.png'"></li>													
											<%
												}
											%>
										<li><a href="<%=root%>/myPage?id=<%=session.getAttribute("id") %>&type=info" class="edit">${sessionScope.id }</a></li>
										<li><a href="#" class="edit" onclick="logout();">로그아웃</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
								</div>
								<!-- /.navbar-collapse -->
							</div>
							<!-- /.container-fluid -->
						</nav>
					</div>

					<!-- /.container-fluid -->
			</div>
		</div>
		<div id="box"></div>

		<!--추천 container -->
		<div class="container">
			<div class="jumbotron1">
            <h1 align="center">베스트여행일정</h1>
            <br>
           
            <p align="center" style="color:gray;">다른 여행자들의 일정을 참고해 나만의 여행을 계획해보세요!</p>
            <br>
            <div class="row">
               <div class="col-md-8">
                  <div id="carousel-example-generic1" class="carousel slide" data-ride="carousel">
                     <!-- Indicators -->
                     <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic1" data-slide-to="0"
                           class="active"></li>
                        <li data-target="#carousel-example-generic1" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic1" data-slide-to="2"></li>
                     </ol>

                     <!-- Wrapper for slides -->
                     <div class="carousel-inner" role="listbox" id="plannerBest3">
                     
                     </div>
                     
                  </div>
               </div>
               <div class="col-md-4">	<!-- 두번째 메인 캐러셀 -->
                  <div id="carousel-example-generic2" class="carousel slide" data-ride="carousel">
                     <!-- Indicators -->
                     <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic2" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic2" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic2" data-slide-to="2"></li>
                     </ol>

                     <!-- Wrapper for slides -->
                     <div class="carousel-inner" role="listbox" id="plannerBest6">
                     
                     </div>

                  </div>
                 
               </div>	<!-- 두번째 메인 캐러셀 끝-->
                
               <div class="col-md-4">	<!-- 세번째 메인 캐러셀 -->
                  <div id="carousel-example-generic3" class="carousel slide" data-ride="carousel">
                     <!-- Indicators -->
                     <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic3" data-slide-to="0"
                           class="active"></li>
                        <li data-target="#carousel-example-generic3" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic3" data-slide-to="2"></li>
                     </ol>

                     <!-- Wrapper for slides -->
                     <div class="carousel-inner" role="listbox" id="plannerBest9">
                     
                     </div>
                    
                  </div>
               </div>	<!-- 세번째 메인 캐러셀 끝-->
            </div>
         </div>
		</div>
	</div>
		<!-- 추천 container end -->
		<!-- extra container -->
		<div class="container">
			<div class="jumbotron1">
				<div class="row">
               <h2 style="text-align: center;">여행 정보 확인은 여기서</h2>
               <br> 
               <div class="col-xs-12 col-md-6">
                  <a href="<%=root%>/hotel" class="thumbnail1"> <img src="imgs/hotel.jpg"
                     alt="..."></a>
                  <h3 style="text-align: center; color: gray;">호텔 예약</h3>
                  <br> <br> <br> 
               </div>
               <div class="col-xs-12 col-md-6">
                  <a href="<%=root%>/booking" class="thumbnail1"> <img src="imgs/tour.jpg"
                     alt="..."></a>
                  <h3 style="text-align: center; color: gray;">투어 정보</h3>
                  <br> <br> <br> 
               </div>
             
          

				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<h2 align="center">공지사항</h2>
						
						<button id="btn-detail1"
							class="button button--rayen button--border-thin button--text-thick button--text-upper button--size-s"
							data-text="details →" >
							<span >details →</span>
						</button>
					</div>
					
					<div class="col-md-4">
						<h2 align="center">이벤트</h2>
						
						<button id="btn-detail2"
							class="button button--rayen button--border-thin button--text-thick button--text-upper button--size-s"
							data-text="details →">
							<span>details →</span>
						</button>
					</div>
					
					<div class="col-md-2"></div>
				</div>

			</div>
		</div>

		<!-- 할것 container -->
		<div class="container">
			<div class="jumbotron1">
				<!-- 축제 수평선 -->
				<div class="row">
					<div class="row">
						<div class="col-md-5">
							<hr color="darkgray" class="hr1">
						</div>
						<div class="col-md-2">
							<p id="hrText">Community</p>
						</div>
						<div class="col-md-5">
							<hr color="darkgray" class="hr1">
						</div>
					</div>
				</div>
				 <h2 style="text-align: center; margin-top: 50px;">함께 공유하고 즐기고 </h2>
               <br> 
               <div style="margin-top: 50px;"></div>
               <div class="col-xs-12 col-md-6">
                  <a href="<%=root%>/community" class="thumbnail1"> 
                  <img src="imgs/aaa.jpg" alt="..." style="height: 350px;">
                  </a>
                  <h3 style="text-align: center; color: gray;">여행 후기</h3>
                  <br> <br> <br> 
               </div>
               <div class="col-xs-12 col-md-6">
                  <a href="<%=root%>/community_together" class="thumbnail1"> 
                  <img src="imgs/banniere.jpg" alt="..." style="height: 350px;">
                  </a>
                  <h3 style="text-align: center; color: gray;">투게더</h3>
                  <br> <br> <br> 
               </div>
               
				<!-- <h3>Thing to Do</h3>
				<h1></h1>
				<div class="row">
					<div class="col-xs-6 col-md-3">
						<a href="#" class="thumbnail"> <img src="imgs/a4.jpg"
							alt="...">
						</a>
						<div class="caption">
							<h3>Thumbnail label</h3>
							<p>...</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">Button</a> <a
									href="#" class="btn btn-default" role="button">Button</a>
							</p>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<a href="#" class="thumbnail"> <img src="imgs/a5.jpg"
							alt="...">
						</a>
						<div class="caption">
							<h3>Thumbnail label</h3>
							<p>...</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">Button</a> <a
									href="#" class="btn btn-default" role="button">Button</a>
							</p>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<a href="#" class="thumbnail"> <img src="imgs/a6.jpg"
							alt="...">
						</a>
						<div class="caption">
							<h3>Thumbnail label</h3>
							<p>...</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">Button</a> <a
									href="#" class="btn btn-default" role="button">Button</a>
							</p>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<a href="#" class="thumbnail"> <img src="imgs/a7.jpg"
							alt="...">
						</a>
						<div class="caption">
							<h3>Thumbnail label</h3>
							<p>...</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">Button</a> <a
									href="#" class="btn btn-default" role="button">Button</a>
							</p>
						</div>
					</div>
				</div> -->
			</div>
		</div>
		<!-- 할것 container end -->
	</div>

	<div class="jumbotron2">
		<%@ include file="template/footer.jsp"%>

	</div>

</body>
</html>