<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){

		var planCode='<%=request.getParameter("code")%>';
		//pdfDown
		location.href='download/pdf?code='+planCode;
		
	});
</script>
</head>
<body>
	
</body>
</html>