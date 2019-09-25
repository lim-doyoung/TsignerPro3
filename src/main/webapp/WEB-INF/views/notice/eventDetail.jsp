<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../template/header.jsp"></jsp:include>
<!-- font -->
<link
	href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../dist/summernote.css" />

<!-- Font Awesome -->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/summernote.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<script type="text/javascript">
$(document).ready(function(){
      $('#eventreply').hide();
      $('#eventdetail').hide();
      
      $(document).ready(function() {
         $('.summernote').summernote({
             height: 300
         });
      });

      //listReply(); // 댓글 목록 불러오기
      listReply2();   // json 리턴 방식

      //답글쓰기 버튼 누를 때
   $('#replyBtn').click(function(){
      $('#eventdetail').hide();
      $('#noticeDetail0').hide();
       $('#eventreply').show();
      return false;
   
    });

   // 수정하기 버튼 누를 때
   $('#upBtn').click(function(){
         $('#noticeDetail0').hide();
         $('#eventdetail').show();

      });

   $('#listBtn').click(function(){
        location.href="/tsigner/event";

   });

   $('#x').click(function(e){
		  e.preventDefault();	// x 클릭 할 때 파일 다운되는거 막기 
		  $('#uploadFile').hide();
	});

   $('#editDeleteBtn').click(function(){
		
		// 2. 파일 삭제
       // alert("삭제하시겠습니까?");
		var newName = $('#event_file_path2').val();
		var idx = $('#idx').val();
		
     //   var that = $(this); // 여기서 this는 클릭한 span태그
        $.ajax({
           url: "upload/deleteFile",
           type: "post",
           // data: "fileName="+$(this).attr("date-src") = {fileName:$(this).attr("data-src")}
           // 태그.attr("속성")
           data: "newName="+newName+"&idx="+idx,  // 파라미터로 데이터 넘기기
           dataType: "text",
           success: function(result){
              if( result == "deleted" ){
           	   
              }
           }
        });
    
  });

   

   $('#noti').click(function(){
       location.href="/tsigner/notice";

  });

  $('#htu').click(function(){
       location.href="/tsigner/howtouse";

  });

  $('#eve').click(function(){
       location.href="/tsigner/event";

  });

  $('#upd').click(function(){
       location.href="/tsigner/update";

  });

   // 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
      $('#replyBtn2').click(function(){
         
         var reply_content = $("#reply_content").val();
         var event_seq ="${eventdetail.event_seq}"
            
         var param = "reply_content="+reply_content+"&event_seq="+event_seq;

         $.ajax({
            type: "post",
            url : "reply/add",
            data: param,
            success : function(){
               alert("댓글이 등록되었습니다.");
               listReply2();
            }
         });      
      });         
      
      // RestController 방식 (Json)
      // 댓글 목록2 (json)
      function listReply2(){
         $.ajax({
               type: "get",
               //contentType: "application/json", --> 생략가능(RestController라서)
               url : "reply/list?event_seq=${eventdetail.event_seq}",
               success : function(result){
                  //responseText가 result에 저장됨
                  console.log(result);
                  var reply_seq = $("#reply_seq").val();
                  var output = "";
                  
                  var img = '';
                  
                  
              if(result.length > 0){
                  var userId='<%=session.getAttribute("id")%>';
                  var src = "";
                     for(var i in result){

                    	function replyWriter(){
                        	var retu='return value';
                              $.ajax({
        						type:'get',
        						url:'getReplyWriter',
        						data:'id='+result[i].reply_id,
        						async:false,
        						success:function(res){
            						var encode = decodeURIComponent(res);
            						retu = encode;
            						retu = retu.replace('+',' ');
            						//alert(retu);

								
                					
            					}
                              });
                              return retu;
                        }

                    	                    	
                    	 var rep = replyWriter();
                         src = '../'+replyWriter();
                          if(rep.startsWith("profile")){
                             src = '../'+replyWriter();    
                          }else{
                             src = replyWriter();
                             var sub = src.substring((src.length-4),src.length);
                             var pro = src.substring(0,(src.length-4));
                             if(sub=='null'){
                                 src=src.replace(src,pro);
                             }
                         }
                    	
                        var onerror = 'this.src="../imgs/noProfile.png"';
                        output += "<div>";
                        output += "<div><table class='table'><h6><strong>";
                        output += "<img width='50px' height='50px' style='margin-left: 0px' id='profile' src='"+src+"' onerror='"+onerror+"'>";
                        output += result[i].reply_id+"</strong>";
                     output += "("+changeDate(result[i].regi_date)+")</h6><br>";
                        output += result[i].reply_content ;
                        output += "<input type='hidden' name='reply_seq' value='"+result[i].reply_seq+"' />";
                        output += "<input type='hidden' name='reply_id' id='reply_id' value='"+result[i].reply_id+"' />";
                                                
                        if(result[i].reply_id == userId || userId == '관리자'){
                           
                           output += "<button type='button' id='btnReplyDelete' class='btn btn-danger btn-sm'  style='float: right;' onclick='replyDelete(this);' value='"+result[i].reply_seq+"'>";
                           output += "삭제</button>";
                       }
                        output += "<tr><td></td></tr>";
                        output += "</table></div>";
                        output += "</div>";
                      } 
               }else {
                      
                  output += "<div>";
                  output += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                  output += "</table></div>";
                  output += "</div>";
                      
                  } 
                  $("#listReply").html(output);
                  
               }
             
               
         });
      }


     
      //날짜 변환 함수 작성
      function changeDate(date){
         date = new Date(parseInt(date));
         year = date.getFullYear();
         month = date.getMonth()+1;
         day = date.getDate();
         hour = date.getHours();
         minute = date.getMinutes();
         second = date.getSeconds();
         strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
         return strDate;
      }

});

   //글 삭제
   function eventDelete(){
      if(confirm("삭제하시겠습니까?")){
         $.ajax({
            type: "post",
            url : "delete",
            data : "idx=${eventdetail.event_seq }",
            success : function(result){
               if(result == "success"){
                  alert("삭제되었습니다.");
                  location.href="/tsigner/event";
               }else{
                  alret("삭제 실패");
               }
            }
         });
      }
   }

 //댓글 삭제 
   function replyDelete(e){
    var seq = e.value;
	 if(confirm("삭제하시겠습니까?")){
          $.ajax({
            
            type: "delete",
            url : "reply/delete/"+seq,
            success : function(result){
               if(result == "success"){
                  alert("삭제되었습니다.");
                  window.location.reload();
               }
            }
               
         });
      }

      
   } 

</script>

<style type="text/css">
#addFile {
	
}

.detailBtns {
	text-align: center;
}

.detailBtns>button {
	background-color: white;
}

.line {
	border: 1px solid #D5D5D5;
}

#noticedetail3 {
	margin: 20px 20px 20px 20px;
}

#noticeTitle {
	font-weight: bold;
	font-size: 15px;
	width: 100%;
}

#writer {
	font-size: 12px;
	font-weight: bold;
}

#detailBtn {
	text-align: center;
}

#detailBtn>button {
	background-color: white;
}

#updateBtn {
	margin: 10px 10px 10px 10px;
}

#editBtn>button {
	background-color: white;
}

#editBtn {
	text-align: center;
}

#x {
	color: red;
	font-size: 18px;
}

#x {
	text-decoration: none;
}

#listReply {
	margin: 10px 10px 10px 10px;
}

#addBtns {
	text-align: center;
}

#addBtns>button {
	background-color: white;
}

#replyBtn2 {
	width: 65px;
	height: 65px;
	background-color: white;
}

#replyform {
	display: block;
}

#noti {
	width: 100%;
	height: 40px;
	border-radius: 8px;
	background: none;
	width: 100%;
	border: none;
	color: #66b5ff;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

#noti:hover {
	width: 100%;
	height: 40px;
	border-radius: 8px;
	background-color: #b3daff;
	width: 100%;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

#htu {
	width: 100%;
	height: 40px;
	border-radius: 8px;
	background: none;
	width: 100%;
	border: none;
	color: #66b5ff;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

#htu:hover {
	width: 100%;
	height: 40px;
	border-radius: 8px;
	background-color: #b3daff;
	width: 100%;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

#eve {
	width: 100%;
	height: 40px;
	border-radius: 8px;
	background-color: #80c1ff;
	width: 100%;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

#upd {
	border-radius: 8px;
	background: none;
	width: 100%;
	height: 40px;
	border: none;
	color: #66b5ff;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

#upd:hover {
	width: 100%;
	height: 40px;
	border-radius: 8px;
	background-color: #b3daff;
	width: 100%;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
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
		<div class="col-md-12">
			<div class="page-header">
				<h1>
					Event <small> 이벤트</small>
				</h1>
			</div>

			<!--       <ul class="nav nav-pills nav-justified">
                  <li role="presentation"><a href="<%=root %>/notice">공지사항</a></li>
                  <li role="presentation"><a href="<%=root %>/howtouse">이용방법</a></li>
                  <li role="presentation" class="active"><a href="<%=root %>/event">이벤트</a></li>
                  <li role="presentation"><a href="<%=root %>/update">업데이트</a></li>
                  
               </ul>  -->

			<div class="col-md-3">
				<button class="button" id="noti">공지사항</button>
			</div>
			<div class="col-md-3">
				<button class="button" id="htu">이용방법</button>
			</div>
			<div class="col-md-3">
				<button class="button" id=eve>이벤트</button>
			</div>
			<div class="col-md-3">
				<button class="button" id="upd">업데이트</button>
			</div>



		</div>
		<div class="col-md-12">
			<div id="eventdetail">
				<!-- 수정 페이지 시작 -->

				<!-- 첨부파일 시작 -->
				<br> <br> <br>
				<form action="update" method="post" enctype="multipart/form-data">
					<div id="addFile">
						<div class="col-md-9"> 
			         	
			         <c:choose>
			         <c:when test="${eventdetail.event_fix == 1 }">
						<label>	
						    <input type="checkbox" name="event_fix" id="event_fix" checked="checked" value="1" >
						    공지 글
						</label>
					</c:when>
					<c:otherwise>
						<label>	
						    <input type="checkbox" name="event_fix" id="event_fix" value="1" >
						    공지 글
						</label>
					</c:otherwise>
					</c:choose>
				</div>	
			<div class="col-md-3"> 
				<label>
					<input type="file" name="upload_files" />
				</label>	
			</div>
					</div>
					<!-- 첨부파일 끝 -->

					<div>
						<input type="hidden" id="idx" name="idx" value="${eventdetail.event_seq }" />
						<input type="hidden" name="event_seq"    value="${eventdetail.event_seq }" />

					</div>
					<div>
						<input type="text" name="sub" class="form-control"
							value="${eventdetail.event_title }">
					</div>
					<!-- 본문 -->
					<textarea id="summernote" class="summernote" name="content" rows=""
						cols="" style="height: 500px;">${eventdetail.event_content }</textarea>

					<div id="uploadFile">
						<c:if test="${eventdetail.event_file_path2 != null }">
							<label id="ifr">첨부파일</label>

							<input type="hidden" id="event_file_path1"  value="${eventdetail.event_file_path1 }" />
							<input type="hidden" id="event_file_path2"  value="${eventdetail.event_file_path2 }" />

							<a
								href="download/${eventdetail.event_file_path2 }/${eventdetail.event_file_path1 }"
								target="_blank">${eventdetail.event_file_path1 } <span
								id="x">&nbsp; x</span>
							</a>
						</c:if>

					</div>

					<c:if test="${sessionScope.id == '관리자'}">
						<div class="detailBtns">
							<!-- 관리자만 글만 수정 , 삭제하기 뜨게 하기  -->

							<button id="editDeleteBtn" type="submit">등록하기</button>
				</form>
				<!--  <form action="delete" method="post">    -->
				<input type="hidden" name="idx" value="${eventdetail.event_seq }">

				<button type="button" onclick="eventDelete();">삭제하기</button>





				</c:if>

			</div>
			<!-- 수정 페이지 끝-->

		</div>
		<!-- col-md-12 끝 -->
		<div id="eventreply">
			<!-- 답글쓰기 페이지 -->
			<!-- 첨부파일 시작 -->
			<br> <br> <br>
			<form action="reply" method="post" enctype="multipart/form-data">
				<div  id="addFile">
					<div class="col-md-9"> 
		           <label>
						<input type="checkbox" name="event_fix" value="1">
							    공지 글
					 </label> 
	       		   </div>  
		          <div class="col-md-3"> 
				         	 <label>
				               <input type="file" name="upload_files" />
				            </label>   
				  </div>

				</div>
				<!-- 첨부파일 끝 -->

				<div>
					<!-- 답글의 원글 or 답글 origin no, group ord, group layer -->
					<input type="hidden" name="event_origin_no"
						value="${eventdetail.event_origin_no }" /> <input type="hidden"
						name="event_group_ord " value="${eventdetail.event_group_ord }" />
					<input type="hidden" name="event_group_layer"
						value="${eventdetail.event_group_layer }" /> <input type="text"
						name="event_title" class="form-control" placeholder="제목을 입력해주세요 ">

				</div>
				<div>
					<textarea id="summernote" class="summernote" name="event_content"
						rows="" cols="" style="height: 500px;"></textarea>
				</div>

				<div id="addBtns">
					<button type="submit">등록하기</button>
					<button type="reset">취소</button>

				</div>

			</form>

		</div>
		<!-- 답글쓰기 페이지 끝-->
		<br> <br> <br> <br>

		<!-- 상세페이지 시작 -->
		<div id="noticeDetail0">
			<div class="row line">
				<div id="noticedetail2">
					<div class="col-md-12">
						<div id="noticedetail3">
							<div class="col-md-10">
								<div class="noticedeta">
									<div>
										<input type="hidden" name="idx" style="display: span"
											value="${eventdetail.event_seq }" />
									</div>

									<div id="noticeTitle">
										<input type="hidden" name="sub" style="display: span"
											value="${eventdetail.event_title }" />
										${eventdetail.event_title }


									</div>

								</div>
							</div>
							<!-- col-md-10 끝  -->

							<div class="col-md-2">
								<div class="noticedeta">
									<span id="date"><fmt:formatDate
											value="${eventdetail.regi_date }" pattern="yyyy-MM-dd HH:mm" /></span>


								</div>
							</div>
							<!-- col-md-2 끝  -->

							<hr style="border: 0.5px dashed #D5D5D5;" width="100%">

							<div id="writer">
								<img width="25px" height="25px"
									style="margin-left: 0px; display: span" id="profile"
									src="<%=root %>/${writer }"
									onerror="this.src='../imgs/noProfile.png'"> <input
									style="display: span;" type="hidden" name="writer"
									value="${eventdetail.event_writer_id }">
								${eventdetail.event_writer_id }
							</div>

							<div>
								<!-- content -->
								<br> <br> <br> ${eventdetail.event_content }
							</div>

							<div class="row2">
								<br> <br>

								<div>
									<c:if test="${eventdetail.event_file_path1 != null }">
										<label id="ifr">첨부파일</label>

										<a
											href="download/${eventdetail.event_file_path2 }/${eventdetail.event_file_path1 }"
											target="_blank"> ${eventdetail.event_file_path1 } </a>
									</c:if>
								</div>


								<div id="updateBtn" class="col-md-12">
									<!-- 관리자만 수정 할 수 있게 -->

									<div id="detailBtn">
										<c:if test="${sessionScope.id == '관리자' }">
											<button id="upBtn">수정하기</button>
											<!-- 관리자만 답글 쓸 수 있음 -->
											<button id="replyBtn">답글쓰기</button>

											<button id="listBtn">목록</button>
										</c:if>
									</div>
								</div>
							</div>

							<!-- 댓글 목록 출력할 위치 -->

							<div id="listReply"></div>
							<!-- 댓글 목록 끝 -->

							<!-- 댓글 쓰기 시작-->



							<!-- 로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
							<c:if test="${sessionScope.id != null}">
								<div class="col-md-12">


									<div class="container">
										<form id="commentForm" name="commentForm" method="post">
											<div>
												<strong>Comments</strong> <span id="cCnt"></span>
											</div>
											<div id="replyform">
												<textarea
													style="width: 85%; height: 65px; vertical-align: middle;"
													id="reply_content" name="reply_content"
													placeholder="댓글을 입력하세요"></textarea>
												<button style="vertical-align: middle;" type="button"
													id="replyBtn2">등록</button>
											</div>
											<br>
										</form>
									</div>



								</div>
							</c:if>

							<!-- 댓글쓰기 끝 -->



						</div>
						<!-- noticedetail3 끝  -->
					</div>
					<!-- col-md-12 끝  -->



				</div>
				<!-- noticedetail2 끝  -->
			</div>
			<!-- row 끝 -->
			<br>
			<br>
			<br>
			<br>
			
			
		</div>
	</div>
	<!-- noticeDetail0 끝 -->
	<!-- 상세페이지 끝 -->




	</div>

	</div>
	<!-- container 끝 -->
	<!-- 여기까지 컨텐츠입니다 -->
	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>

</body>
</html>