<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../template/header.jsp"></jsp:include>
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../dist/summernote.css" />
<!-- Font Awesome -->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/summernote.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<script type="text/javascript">
   $(document).ready(function() {

      $('#inquirydetail').hide();
      $('#summernote').summernote({
         height : 300
      });

       listReply2();

       $('#detailBtn>button').click(function() {
         $('#inquirydetail2').hide();
         $('#inquirydetail').show();

      });

      // 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
    $('#replyBtn2').click(function(){
       
       var reply_content = $("#reply_content").val();
       var inq_seq ="${supportdetail.inq_seq}"
          
       var param = "reply_content="+reply_content+"&inq_seq="+inq_seq;

       $.ajax({
          type: "post",
          url : "inq_reply/add",
          data: param,
          success : function(){
             alert("댓글이 등록되었습니다.");
             listReply2();
             $('textarea').val('');
          }
       });      
    });         
    
    // RestController 방식 (Json)
    // 댓글 목록2 (json)
    function listReply2(){
       $.ajax({
             type: "get",
             //contentType: "application/json", --> 생략가능(RestController라서)
             url : "inq_reply/list?inq_seq=${supportdetail.inq_seq}",
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
                            }
                               });
                               return retu;
                         }
                          src = '../'+replyWriter();
                         output += "<div id='reply"+i+"'> <table class='table'><h5><strong>";
                         output += result[i].reply_id+"</strong>";
                           output += "("+changeDate(result[i].regi_date)+")</h5><br>";
                         output += "<div class='reply_content_style' style='background-color: #eeeeee; height:100%; padding:10px 10px 50px 10px; margin: -20px 0px 10px 0px; border-radius: 10px;'>";
                         output += result[i].reply_content ;
                         output += "</div>";
                         output += "<input id='rep"+i+"' type='hidden' class='reply_seq' name='reply_seq' value='"+result[i].reply_seq+"' />";
                         output += "<input type='hidden' class='reply_id' name='reply_id' value='"+result[i].reply_id+"' />";
                         output += "<textarea style='display:none' class='reply_content'>" + result[i].reply_content + "</textarea>";
                         output += "<div class='reply_content_write_div' style='display:none;'>";
                         output += "<textarea id='reReply"+i+"' style='width:100%; height:100px; border-radius:10px; margin-top:10px; padding:10px; resize:none;' class='reply_content_write'>" + result[i].reply_content + "</textarea>";
                         output += "</div>";
                                                 
                         if(result[i].reply_id == userId || userId == '관리자'){
                            output += "<div class='deleteUpdateBtns'>";
                            output += "<button type='button' id='btnReplyDelete' class='btn btn-danger btn-sm'  style='float: right;' value='"+result[i].reply_seq+"'; onclick='replyDelete(this);'>";
                            output += "삭제"+"</button>";
                           //output += "<button type='button' id='btnReplyUpdate' class='btn btn-primary btn-sm'  style='float: right;' value='"+result[i].reply_seq+"'; onclick='replyUpdate(this);'>";
                           output += "<button type='button' id='btnReplyUpdate' class='btn btn-primary btn-sm'  style='float: right;' value='"+result[i].reply_seq+"'; onclick='replyUpdate("+i+");'>";
                            output += "수정"+"</button>";
                            output += "</div>";
                            output += "<table class='saveCancel' style='width: 100px; float:right; margin-top:-15px;'>";
	                         	output += "<tr>";
		                         	output += "<td>";	
			                            output += "<button type='button' style='display:none' class='btn btn-primary btn-sm replyUpdateExec' style='margin-right: 10px;' value='"+result[i].reply_seq+"'; onclick='replyUpdateExec("+i+");'>";
			                            output += "저장"+"</button>";
			                            output += "</td>";
			                            output += "<td>";
			                            output += "<button type='submit' style='display:none' class='btn btn-danger btn-sm replyUpdateExec' onclick='goBack();'>";
			                            output += "취소"+"</button>";
		                            output += "</td>";
	                            output += "</tr>";
                            output += "</table>";
                        }
                         output += "<tr><td></td></tr>";
                         output += "</table></div>";
                    } 
             }else {
                    
                output += "<div>";
                output += "<div class='reply_incomp'><img src='../imgs/inq_reply_icon.png' />";
                output += "</div>";
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
       strDate = year+"-"+month+"-"+day;
       return strDate;
    }

   });

 //댓글 삭제 
 function replyDelete(e){
    var seq = e.value;
    if(confirm("삭제하시겠습니까?")){
        
       $.ajax({
          type: "delete",
          url : "inq_reply/delete/"+seq,
          success : function(result){
             if(result == "success"){
                alert("삭제되었습니다.");
                window.location.reload();
             }
          }
             
       });
    }

    
 }

 
// 수정 버튼 클릭시 실행
 function replyUpdate(index){
    
   var content = $("#reply" + index + " .reply_content").last().html();
   $("#reply" + index + " .reply_content").append(content);
   $("#reply" + index + " .reply_content_write_div").show();
   $("#reply" + index + " .replyUpdateExec").show();
	$('.deleteUpdateBtns').hide();

 }


// 저장 버튼 클릭시 실행
function replyUpdateExec(i){
   
   var idx = $('#rep'+i).val();
   var cont = $('#reReply'+i).val();

   
   var data = { "idx": idx, "content": cont };
   console.log(data);
   $.ajax({
        type:'post',
        url:'inq_reply/inqRepUpdate',
        data: data,
         success:function(e){
        
      }
      , error:function(e){
         alert("실패");
      }
   });
   location.reload();
   
}

function goBack(){
	location.reload();
 }


   
</script>

<style type="text/css">
#addFile {
   text-align: right;
}

.detailBtns {
   text-align: center;
   display: inline;
}

.inqtitle {
   width: 1000px;
}

.inq_title {
	border: none;
	font-size: 25px;
	font-weight: bold;
	color: #4f4f4f;
	margin: 40px 0px 10px 10px;
}

#inquirydetail2 {
	margin: 0px auto;
	width: 1000px;
}

.line{
	border-bottom: 1px solid #EEEEEE;
}


#btnReplyUpdate,
#btnReplyDelete {
	margin-bottom: 4px;
}

#btnReplyDelete {
	margin-left: 3px;
}

#detailBtn {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

.deleteBtn {
	margin-right: -100px;
}

.updateBtn {
	margin-right: 100px;
}

#btns {
	margin: 0px auto;
	margin-top: 50px;
}

.reply_incomp {
	margin: 20px 50px 50px 375px;
}

#reply_content {
	border: 1px solid #EEEEEE;
	border-radius: 10px;
	resize: none;
	margin-bottom: 10px;
	margin-top: 3px;
	padding: 10px;
}

#replyBtn2 {
	margin-bottom: 200px;
}

.inqcontent {
	margin-bottom: 100px;
	padding-left: 20px;
}

.update {
	font-size: 25px;
    font-weight: bold;
    color: #4f4f4f;
    margin: 40px 0px 10px 10px;
}

.inq_radiobox{
	margin-bottom: 10px;
}

#inquirydetail{
	width: 1040px;
	margin: 0px auto;
	margin-bottom: 100px;
}

.form-control{
	padding-left: 10px;
	margin-bottom: 10px;
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
         <h1>
            Inquiry <small> 1:1 문의하기</small>
         </h1>
      </div>

      <ul class="nav nav-pills nav-justified">
         <li role="presentation"><a href="<%=root%>/faq">FAQ</a></li>
         <li role="presentation" class="active"><a
            href="<%=root%>/inquiry">1:1 문의하기</a></li>
         <li role="presentation"><a href="<%=root%>/terms">이용약관</a></li>
         <li role="presentation"><a href="<%=root%>/privacy">개인정보
               처리방침</a></li>

      </ul>
      <!-- 수정 페이지 시작 -->
      <div id="inquirydetail">
      
      	<div class="inq_radiobox">
         <div class="update">수정하기</div><br>
	         <label class="radio-inline"> <input type="radio"
	            name="inq_type" id="inlineRadio1" value="상품문의" checked="checked">상품문의
	         </label> <label class="radio-inline"> <input type="radio"
	            name="inq_type" id="inlineRadio2" value="취소/변경/환불"> 취소/변경/환불
	            문의
	         </label> <label class="radio-inline"> <input type="radio"
	            name="inq_type" id="inlineRadio3" value="예약/결제 문의"> 예약/결제 문의
	         </label> <label class="radio-inline"> <input type="radio"
	            name="inq_type" id="inlineRadio4" value="이용 문의"> 이용문의
	         </label> <label class="radio-inline"> <input type="radio"
	            name="inq_type" id="inlineRadio5" value="계정 관련 문의"> 계정 관련 문의
	         </label> <label class="radio-inline"> <input type="radio"
	            name="inq_type" id="inlineRadio6" value="기타 문의"> 기타 문의
	         </label>
		</div>
		<form action="update" method="post" enctype="multipart/form-data">
            <div>
               <input type="hidden" name="idx" value="${supportdetail.inq_seq }" />
            </div>
            <div>
               <input type="text" name="sub" class="form-control"
                  value="${supportdetail.inq_title }">
            </div>
            <!-- 본문 -->

            <textarea id="summernote" class="summernote" name="content" rows=""
               cols="" style="height: 500px;">${supportdetail.inq_content }</textarea>



	<table id="btns">
         	<tr>
         		<td style="padding-right: 15px;">
			        <div id="detailBtn2">
	                	<button class="btn btn-primary" type="submit">등록하기</button>
	                </div>
			    </td>
			    </form>
			    <td>
				
				            <div class="detailBtns">
				            	<button class="btn btn-danger" type="submit" onclick="goBack();">수정취소</button>
				            </div>
				</td>
			<tr>
		</table>

			


        
      </div>
      <!-- 수정 페이지 끝-->

      <!-- 상세페이지 시작 -->
      <div id="inquirydetail2">

         <div>
            <input type="hidden" name="idx" value="${supportdetail.inq_seq }" />
         </div>
         <div class="inqtitle">
            <input type="text" name="sub" class="inq_title" style="width:100%" value="${supportdetail.inq_title }" readonly>
         </div>
         <div class="line"></div>

         <div class="inqcontent">
            <input type="hidden" name="content" class="form-control" 
               value="${supportdetail.inq_content }">
            <p class="date" style="margin-top: 50px; line-height: 30px;">${supportdetail.inq_content}</p>
         </div>

         <!-- 관리자만 수정, 삭제 할 수 있게 -->

         <table id="btns">
         	<tr>
         		<td style="padding-right: 15px;">
		         <div id="detailBtn">
               		 <button class="btn btn-primary" type="submit">수정하기</button>
				    </div>
			    </td>
			    <td>
			         <form action="delete" method="post">
			            <input type="hidden" name="idx" value="${supportdetail.inq_seq }">
			               <button class="btn btn-danger" type="submit">삭제하기</button>
			         </form>
				</td>
			<tr>
		</table>
         
         
   
         <!-- 댓글 리스트 -->
         <div id="listReply"></div>
         
         <!-- 댓글 시작 -->
         <c:if test="${sessionScope.id == '관리자'}">
            <div class="col-md-12">
               <div class="container">
                  <form id="commentForm" name="commentForm" method="post">
                     <div>
                        <img src="../imgs/reply_submit.png"><span id="cCnt"></span>
                     </div>
                     <div id="replyform">
                        <textarea
                           style="width: 85%; height: 65px; vertical-align: middle;"
                           id="reply_content" name="reply_content" placeholder="댓글을 입력하세요"></textarea><br>
                        <button style="vertical-align: middle;" type="button"
                           id="replyBtn2">등록</button>
                     </div>
                     <br>
                  </form>
               </div>
            </div>
         </c:if>
         <!-- 댓글 끝 -->

      </div>

      <!-- 상세페이지 끝 -->
   </div>



   <!-- 여기까지 컨텐츠입니다 -->
   <div class="jumbotron2">
      <%@ include file="../template/footer.jsp"%>
   </div>

</body>
</html>