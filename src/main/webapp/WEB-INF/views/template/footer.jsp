<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path= request.getContextPath();
	System.out.println("foot root:"+path);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
	.list-unstyled>li>a{
		color: white;
	}
</style>

<div class="container">
			<!-- Footer -->
			<footer>
				<div class="container">
					<div class="col-md-12"> 
						<div class="col-md-6"> 
							<br>
		                     <p style="font-size: 40px; text-align:left; margin-top: -30px;" id="fontTitle">T Signer</p>
		               
							티자이너 대표 : 여행하시조 / 사업자등록번호 : 635-81-01124 <br>
						    운영시간(한국) : 11시~19시(주말/공휴일 휴무)			 <br>	
							주소 : 서울특별시 관악구 남부순환로 1837 샤론빌딩 402 	 <br>
							자사는 서울특별시관광협회 공제영업보증보험에 가입되어 있습니다. <br>
							티자이너는 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
							따라서 티자이너는 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.
                    
						</div>
						
						<div class="col-md-2"> 
							<h4 class="text-uppercase">고객센터</h4>
							<hr>
		                     <ul class="list-unstyled">
		                        <li><a href="<%=path %>/faq">FAQ</a></li>
		                     <c:choose>
		                        <c:when test="${empty sessionScope.id}">
		                           <li><a href="#" data-toggle="modal"
		                                    data-target="#myModal">1:1 문의하기</a></li>
		                        </c:when>
		                        <c:otherwise>
		                           <li><a href="<%=path %>/inquiry">1:1 문의하기</a></li>
		                        </c:otherwise>
		                     </c:choose>
		                        <li><a href="<%=path %>/terms">이용약관</a></li>
		                        <li><a href="<%=path %>/privacy">개인정보 처리방침</a></li>
		                     </ul>
						</div>
						
						<div class="col-md-3"> 
								<h4 class="text-uppercase">Contact Us</h4>
								<hr>
		                     <ul class="list-unstyled">
		                        <li style="float:left;"><img width="18px" class="icon" src="<%=path %>/imgs/call-answer.png"><a
		                     href="02-3486-9600">&nbsp +82 02-3486-9600</span></li>
		                        <li style="float:left;"><img width="18px" class="icon" src="<%=path %>/imgs/close-envelope.png"><a href="mailto:ililil9482@naver.com"> &nbsp
		                     메일로 문의하기</a></li>
		                     </ul>
						</div>
						
					</div> <!-- col-md-12 끝 -->
						
					<div class="col-md-12"> 
						<hr>
						<!-- Copyright -->
						<div class="footer-copyright text-center py-3">
							Copyright © 2018 Tsigner.com All Rights Reserved.
						</div><!-- Copyright -->
						</div> <!-- col-md-12 끝 -->
					
				</div>
			</footer><!-- Footer -->
		</div>
		
		