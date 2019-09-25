<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
		String name = request.getParameter("name");
		String amount = request.getParameter("amount");
		String paytype = request.getParameter("payType");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
%>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#resSuccess').hide();
		var uName = "${name}";
		var uAmount = "${amount}";
		uAmount = (uAmount/100);
		var name = '<%=session.getAttribute("id")%>';		
		var checkIn = '<%=checkIn%>';
		var checkOut = '<%=checkOut%>';
		

		$('#pay').click(function() {
			IMP.init('imp22022612');

			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : uName,
				amount : uAmount, //판매 가격
				buyer_email : 'iamport@siot.do',
				buyer_name : name,
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456'
			}, function(rsp) {
				if (rsp.success) {
					
// 					var msg = '결제가 완료되었습니다.';
// 					msg += '고유ID : ' + rsp.imp_uid;
// 					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
// 					msg += '카드 승인번호 : ' + rsp.apply_num;

					var data={};
					data['user']=name;
					data['pay']=rsp.paid_amount;
					data['title']=uName;
					data['in']=checkIn;
					data['out']=checkOut;
					$.ajax({
						type:'post',
						url:'payDb',
						data:JSON.stringify(data),
						datatype:'json',
						contentType:'application/json; charset=utf-8',
						success:function(data){
							if(data=='success'){
								$('#res').remove();
								$('#resSuccess').show();	
							}

						}
					});					

				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});

		});
	});
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
</script>
<style type="text/css">
#payBtn{
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>

	
	<jsp:include page="template/header.jsp"></jsp:include>
	
	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-2 col-md-8">
				<h1>Pay <small>결제페이지</small></h1>
				</div>

				<!-- 컨텐츠의 내용을 입력하세요 -->
				<div id="res">
				<div class="col-md-offset-4 col-md-4 row">
						<table class="table">
							<tr>
								<th>구매자</th>
								<td><%=session.getAttribute("id")%></td>
							</tr>
							<tr>
								<th>결제종류</th>
								<td><%=paytype %></td>
							</tr>
							<tr>
								<th>상품명</th>
								<td><%=name%></td>
							</tr>
							<tr>
								<th>날짜</th>
								<td><%=checkIn%> ~ <%=checkOut %></td>
							</tr>
							<tr>
								<th>금액</th>
								<td><%=amount %></td>
							</tr>
						</table>
						
				</div>
				<div id="payBtn" class="row col-md-12">
				<button id="pay" class="btn btn-danger btn-lg" >결제</button>
				<br/><br/>
				</div>
				</div>
				
				<div id="resSuccess">
				<div class="col-md-offset-4 col-md-4 row">
					<table class="table">
							<tr>
								<th>구매자</th>
								<td><%=session.getAttribute("id")%></td>
							</tr>
							<tr>
								<th>상품명</th>
								<td><%=name%></td>
							</tr>
							<tr>
								<th>날짜</th>
								<td><%=checkIn%> ~ <%=checkOut %></td>
							</tr>
							<tr>
								<th>금 액</th>
								<td><%=amount %></td>
							</tr>
							<tr>
								<th>결과</th>
								<td style="color: blue">성공</td>
							</tr>
						</table>
						
				</div>
				<div id="payBtn" class="col-md-offset-4 col-md-4 row">
				<form>
				<button class="form-control" formaction="/tsigner/">홈으로</button>
				<br/><br/>
				</form>
				</div>
				</div>
				</div>
			</div>
		</div>
	<!-- 여기까지 컨텐츠입니다 -->
	<div class="jumbotron2">	
		<jsp:include page="template/footer.jsp"></jsp:include>
	</div>
</body>
</html>