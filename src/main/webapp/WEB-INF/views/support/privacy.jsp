<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<style type="text/css">
#pageNum {
	text-align: center;
}

#addBtn {
	text-align: right;
}

#addBtns {
	text-align: center;
}

#updateBtns {
	text-align: center;
}

#addFile {
	text-align: right;
}

#inquiryadd {
	width: 1040px;
	margin: 0px auto;
	margin-bottom: 100px;
}

.detailList {
	display: block;
}



/*개인정보 처리방침*/

.help_content {
    width: 845px;
    height: 100%;
    padding-bottom: 50px;
    margin: 0px auto;
	margin-top: 70px;
}

.help_ctitle {
    font-size: 20px;
    color: #363636;
    font-weight: bold;
}

.help_box .title {
    width: 100%;
    margin-top: 42px;
    border-bottom: 1px solid #c7c7c7;
    font-size: 17px;
    font-family: 'nanum_b';
    height: 27px;
}

.desc {
    width: 100%;
    font-size: 14px;
    color: #555555;
    padding-top: 15px;
    line-height: 22px;
    padding-bottom: 12px;
    text-align: justify;
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
						<img src="imgs/privacy.png">
					</td>
					<td style="width:200px; height:100px">
						<img src="imgs/privacy_title.png">
					</td>
			</table>			 
		</div>

		<ul class="nav nav-pills nav-justified">
			<li role="presentation"><a href="<%=root%>/faq">FAQ</a></li>
			<li role="presentation"><a href="<%=root%>/inquiry">1:1 문의하기</a></li>
			<li role="presentation"><a href="<%=root%>/terms">이용약관</a></li>
			<li role="presentation" class="active"><a
				href="<%=root%>/privacy">개인정보 처리방침</a></li>
		</ul>

		<div class="help_content">
			<div class="help_ctitle">개인정보 처리방침</div>

			<div class="help_box">

				<div class="title">기본사항</div>
				<div class="desc">T Signer는(이하 '회사' 또는 '당사') 귀하가 개인정보를
					중요하게 생각하고 있다는 것을 알고 있으며, 저희도 동일하게 생각합니다. 본 개인정보취급방침은 귀하가 당사의 서비스를
					사용하는 경우 당사가 귀하에 대한 정보를 수집, 사용 및 공유하는 방식과 그 시기를 규정합니다. 귀하는 본 서비스를
					사용함으로써 본 방침에 기재된 귀하에 대한 정보를 수집, 이전, 조작, 보관, 공개 및 기타 사용하는데 동의합니다.
					귀하가 거주하거나 정보를 제공하는 국가가 어디인지를 불문하고 귀하는 당사의 사업을 운영하는 대한민국이나 기타 국가에서
					당사가 귀하의 정보를 사용할 수 있도록 승인합니다.</div>



				<div class="title">개인정보의 수집</div>
				<div class="desc">귀하가 회사에 제공하는 개인정보: 회사는 귀하가 본 서비스를 사용하면서
					입력하거나 그 밖의 방식으로 회사에 제공하는 정보를 수령하고 보관합니다. 수집되는 개인정보의 종류에는 귀하의 이름,
					비밀번호, 이메일 주소, google 및/또는 Facebook 사용자이름, 귀하의 본 서비스 이용에 관한 이용 정보,
					그리고 브라우저 정보가 포함될 수 있습니다. 귀하가 본 서비스를 모바일을 통해 이용할 경우, 맞춤형 정보를 제공하기 위해
					자동적으로 귀하의 위치정보를 받습니다. 귀하가 제공하는 개인정보는 귀하가 서비스를 통해서 다른 사용자들과 상호작용하기
					위해서 사용될 수 있는 사용자 계정과 프로필을 설정하도록 합니다. 회사는 네트워크와 서비스의 효과를 연구하며, 커뮤니티를
					위한 새로운 도구를 개발하기 위해서 이 개인정보를 활용할 수도 있습니다. 자동으로 수집되는 정보: 귀하가 본 서비스를
					사용할 때, 당사는 자동으로 당신의 브라우저나 모바일 플랫폼에서 당신의 위치, IP 주소, 쿠키 정보, 요청한 페이지를
					포함한 정보를 받아 우리의 서버 로그에 저장합니다. 우리는 적용 법률에서 요구하지 않는 한 이 데이터를 비 개인정보로
					취급합니다. 이 개인정보 보호정책에 언급되지 않는 한, 당사는 이 데이터를 오직 누적된 형태로만 사용합니다. 회사는
					파트너들에게 당사의 사용자들이 어떻게 서비스를 사용하는지에 대한 누적된 정보를 제공할 수 있습니다. 당사가 제3자에게
					받는 정보: 어떤 방식으로 서비스와 연계되거나 서비스와 관련하여 당사에게 서비스를 제공하는 제3자로부터 정보를 받아
					저장할 수 있습니다.</div>



				<div class="title">개인정보의 안정성</div>
				<div class="desc">
					귀하의 T Signer 계정 개인정보는 귀하의 개인정보 보호와 보안을 위해 비밀번호로 보호되어 있습니다. 귀하는
					비밀번호를 적절히 선택하고 보호하여 계정 및 개인정보에 허가되지 않은 접근을 막고 귀하의 계정 접근을 끝낸 후
					로그아웃하여 당신의 컴퓨터 및 브라우저의 접근을 제한할 수 있습니다. 공공으로 사용되는 컴퓨터에서는 필수적으로 로그아웃
					하는 것을 권장합니다. 회사는 사용자 계정 정보의 비밀이 유지되도록 사용자 정보를 보호하는 노력을 합니다. 그러나,
					회사는 사용자 계정 정보의 안전을 보장할 수 없습니다. 허가되지 않은 침입이나 사용, 하드웨어나 소프트웨어 실패 및 다른
					것들은 어느 때나 사용자 정보의 안전을 해할 수 있습니다. 본 서비스에는 정보제공 및 상품중개를 위해 다른 사이트의
					링크가 포함되어 있을 수 있습니다. 회사는 다른 사이트의 개인정보 보호정책이나 방침에 대한 책임이 없습니다. 다른
					사이트에 연결할 때 귀하는 그 사이트에 명시된 개인정보 보호정책을 읽어야 합니다. 이 개인정보 보호정책은 본 서비스에서
					수집되는 정보에만 적용됩니다.<br>
					<br> 쿠키<br> 회사는 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을
					운용합니다. 쿠키란 서비스를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터
					또는 휴대폰과 같은 디바이스에 저장됩니다. <br>
					<br> - 쿠키 등 사용 목적 : 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과
					관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스
					제공이 목적입니다. 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써
					모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. <br>
					<br> - 쿠키 설정 거부 방법 : 쿠키 설정을 거부하는 방법으로는 귀하가 사용하는 웹 브라우저의 옵션을
					선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 단,
					귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.
				</div>



				<div class="title">아동에 대한 정책</div>
				<div class="desc">
					당사가 제공하는 서비스는 14세 미만의 아동을 위한 서비스가 아닙니다. 귀하의 자녀가 귀하의 동의 없이 당사에 개인정보를
					제공하였음을 알게 되는 경우 <a href="mailto:help@earthtory.com">help@earthtory.com</a>
					으로 연락하시기 바랍니다. 당사는 고의로 14세 미만 아동으로부터 개인정보를 수집하지 않습니다. 14세 미만의 아동이
					당사에 개인정보를 제공하였음을 알게 되는 경우 당사는 그러한 정보를 삭제하고 해당 아동의 계정을 해지하는 조치를 합니다.
				</div>



				<div class="title">법률준수</div>
				<div class="desc">
					당사는 대한민국의 관련법률을 준수합니다. 원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이
					파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간
					동안 회원정보를 보관합니다.<br>
					<br> - 보존 항목 : ID, 비밀번호, 이메일, 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보 <br>
					- 보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률, 신용정보의 이용 및 보호에 관한 법률<br> -
					보존 기간 : 5년<br> - 표시/광고에 관한 기록 : 6개월 (전자상거래등에서의 소비자보호에 관한 법률)<br>
					- 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)<br> -
					신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년 (신용정보의 이용 및 보호에 관한 법률)
				</div>



				<div class="title">서비스의 게시물</div>
				<div class="desc">
					회사는 고객의 게시물을 소중하게 생각하며 변조, 훼손, 삭제되지 않도록 최선을 다하여 보호합니다. 그러나 다음의 경우
					게시물에 대하여 삭제, 차단, 변경, 삭제, 변경 요구, 경고, 이용정지, 기타 적절한 조치를 취할 수 있습니다.<br>
					<br> 1. 스팸성 게시물(예: 행운의 편지, 8억 메일, 특정사이트의 광고 등)<br> 2. 타인을
					비방할 목적으로 사실 또는 허위 사실을 유포하여 타인의 명예를 훼손하는 글<br> 3. 동의 없는 신상공개,
					초상권 또는 저작권 등 타인의 권리를 침해하는 내용<br> 4. 기타 법령에 반하거나 미풍양속을 저해 또는
					게시판의 주제와 다른 내용의 게시물<br> 5. 회사는 건전한 게시물 문화를 활성화하기 위하여 동의 없는 타인의
					신상공개 시 특정부분을 삭제하거나 기호 등으로 수정하여 게시할 수 있습니다.<br> 6. 그 외의 경우 명시적
					또는 개별적인 경고 후 삭제 조치할 수 있습니다.<br> 7. 원칙적으로 게시물에 관련된 제반 권리와 책임은
					작성자 개인에게 있습니다. 또 게시물을 통해 자발적으로 공개된 정보는 보호받기 어려우므로 정보게시 전에 심사숙고 하기
					바랍니다.
				</div>



				<div class="title">제 3자 정보제공</div>
				<div class="desc">
					1. 회사는 회원에 대하여 보다 더 질 높은 서비스 제공 등을 위해 제 3자에게 귀하의 개인정보를 제공할 수 있습니다.<br>
					<br> - 제공하는 개인정보 항목 : ID, 이메일, 서비스 이용기록, 접속 <br> - 제공정보의
					이용 목적 : 콘텐츠 제공, 서비스 이용에 대한 통계<br>
					<br> 단, 당사는 이들 제3자가 당사 사이트에서 귀하에 대한 개인연락처 (이메일 주소 등) 정보를 수집하도록
					허가하지 아니하며 또는 그들과 귀하의 개인정보를 공유하지 않습니다. 당사는 이들 제3자가 귀하의 관심사에 대한 정보를
					수집하는데 사용하는 쿠키나 기타 기술에 대하여 접근하거나 통제할 수 없으며 이들 제3자의 정보수집행위에는 이
					개인정보취급방침이 적용되지 않음을 유의하시기 바랍니다. 귀하는 제3자의 웹사이트에 게시된 개인정보취급방침을 검토하여
					그들의 개인정보 수집, 사용 및 공개에 관한 절차를 확인할 수 있습니다.<br>
					<br> 2. 당사는 다음과 같은 경우에도 귀하의 정보를 공유할 수 있습니다.<br>
					<br> - 법원명령이나 법적인 문제에 관한 경우 : 소송 방어를 위해 또는 달리 법에 정한 바와 같이 소환장,
					법원명령이나 기타 소송에 응하거나 법적 권리를 정립하거나 행사하기 위한 경우에 귀하의 정보를 제공할 수 있습니다. 이
					경우 법적인 이의제기나 권리행사를 당사가 행할 수도, 포기할 수도 있습니다.<br> - 기업분할, 합병,
					병합이나 자산매매와 같은 회사의 거래 또는 파산의 경우 <br> - 당사의 판단 하에 불법행위 혹은 불법일
					우려가 있는 행위에 관하여 조사, 금지 혹은 조치를 하는데 필요하다고 생각되는 경우 : 당사 회원이나 타인의 권리,
					재산이나 안전을 보호하고 방어하는데 필요하거나, 당사 규정 혹은 기타 계약에 합치된다고 생각되는 경우에 귀하의 정보를
					제공할 수 있습니다. <br>
					<br> 3. 회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 이용자의 불만처리
					및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다. <br>
					<br> 개인정보 보호책임자<br> - 성 명: TSigner<br> - 직 책: (주)TSigner
					CTO<br> - 연략처: 01-2345-6789<br> - 이메일: <a
						href="mailto:help@tsigner.com">help@tsigner.com</a><br> -
					주 소: 서울특별시 (주)TSigner<br>
					<br> 4. 이용자께서는 회사의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해
					구제 등에 관한 사항을 개인정보 보호책임자에게 문의하실 수 있습니다. “회사"는 이용자의 문의에 대해지체 없이 답변 및
					처리해드릴 것입니다.<br>
					<br> 당사는 향후 이 개인정보취급방침을 변경할 수 있습니다. 이 개인정보취급방침의 중대한 변경에 관하여
					회원들에게 통보하며, 귀하가 당사에게 제공한 전자우편주소로 안내 고지를 발송하거나 또는 당사 웹사이트에 고지하여 통보할
					것입니다.<br>
					<br> 귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은
					담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다. 기타
					개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br>
					<br> - 개인정보침해신고센터<br>(<a href="http://www.1336.or.kr"
						target="_blank">www.1336.or.kr</a>/국번없이 118)<br> -
					정보보호마크인증위원회<br>(<a href="http://www.eprivacy.or.kr"
						target="_blank">www.eprivacy.or.kr</a>/02-580-0533~4)<br> -
					대검찰청 과학수사부 사이버수사과<br>(<a href="http://cybercid.spo.go.kr/"
						target="_blank">www.cybercid.spo.go.kr</a>/02-3480-3600)<br>
					- 경찰청 사이버테러대응센터<br>(<a href="http://www.ctrc.go.kr"
						target="_blank">www.ctrc.go.kr</a>/02-392-0330)
				</div>
			</div>
		</div>



	</div>

	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>