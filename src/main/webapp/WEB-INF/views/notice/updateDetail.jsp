<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$('#updatedetail').hide();
		
		$('#summernote').summernote({
			 height: 300
		});

		$('#upBtn').click(function(){
		      $('#updateDetail0 ').hide();
		      $('#updatedetail').show();

		});

		$('#listBtn').click(function(){
		     location.href="/tsigner/update";

		});

		$('#x').click(function(e){
			  e.preventDefault();	// x 클릭 할 때 파일 다운되는거 막기 
			  $('#uploadFile').hide();
			  
		});
		
		$('#editDeleteBtn').click(function(){
		
			// 2. 파일 삭제
	        // alert("삭제하시겠습니까?");
			var newName = $('#update_file_path2').val();
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

		

		
	});

	//삭제
	function updateDelete(){

		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				type: "post",
				url : "delete",
				data : "idx=${updatedetail.update_seq }",
				success : function(result){
					if(result == "success"){
						alert("삭제되었습니다.");
						location.href="/tsigner/update";
					}else{
						alert("삭제 실패");
					}
				}
			});
		}
	}

	
	

	

	
</script>

<style type="text/css">
	#addFile {
			text-align: right;
		}
		
	.detailBtns{
	
		text-align: center;
		
	}
	
	.row {
			border :1px solid #D5D5D5;	
	
	}
	
	#updatedetail3 {
         
         margin   : 20px 20px 20px 20px;

   }
	
	
	
	#updateTitle{
		font-weight: bold;
		font-size: 15px;
		width: 100%;
	}
	
	#writer{
		font-size: 12px;
		font-weight: bold;
	}
	
	#detailBtn{
		text-align: center;
	
	}
	
	#detailBtn>button{
		
		background-color: white;
	}
	
	#updateBtn{
		margin: 10px 10px 10px 10px;
	}
	
	#editBtn>button{
		
		background-color: white;
	}
	
	#editBtn{
		text-align: center;
		
	}
	#x{
		color: red;
		font-size: 18px;
	}
	#x{
		text-decoration: none;
	}
	
	.button {
  
  transition-duration: 0.2s;
  cursor: pointer;
}
      
      #noti{
          width: 100%;
         height: 40px;
       border-radius: 8px;
         background:none ; 
       width: 100%;
         border: none;
        color: #66b5ff;
        text-align: center;
        text-decoration: none;
        display: inline-block;
      }
      
      #noti:hover{
         width: 100%;
         height: 40px;
       border-radius: 8px;
         background-color:#b3daff; 

       width: 100%;
         
         border: none;
        color: white;
       
        text-align: center;
        text-decoration: none;
        display: inline-block;
        
      }
       #htu{
         width: 100%;
         height: 40px;
       border-radius: 8px;
         background:none ; 
       width: 100%;
         
         border: none;
        color: #66b5ff;
       
        text-align: center;
        text-decoration: none;
        display: inline-block;
        
      }
      #htu:hover{
         width: 100%;
         height: 40px;
       border-radius: 8px;
         background-color:#b3daff; 

       width: 100%;
         
         border: none;
        color: white;
       
        text-align: center;
        text-decoration: none;
        display: inline-block;
        
      }
      
      
       #eve{
         width: 100%;
         height: 40px;
          border-radius: 8px;
        background:none ; 
       width: 100%;
         
         border: none;
        color: #66b5ff;
       
        text-align: center;
        text-decoration: none;
        display: inline-block;
      }
      #eve:hover{
         width: 100%;
         height: 40px;
       border-radius: 8px;
         background-color:#b3daff; 

       width: 100%;
         
         border: none;
        color: white;
       
        text-align: center;
        text-decoration: none;
        display: inline-block;
        
      }
       #upd{
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
							Update <small> 업데이트</small>
						</h1>
					</div>
			
					<!--        <ul class="nav nav-pills nav-justified">
                  <li role="presentation" class="active"><a href="<%=root %>/notice">공지사항</a></li>
                  <li role="presentation"><a href="<%=root %>/howtouse">이용방법</a></li>
                <li role="presentation"><a href="<%=root %>/event">이벤트</a></li>
                <li role="presentation"><a href="<%=root %>/update">업데이트</a></li>
               </ul>          -->
      
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
          
<!-- 수정 페이지 시작 -->
<div class="col-md-12"> 

	<div id="updatedetail">	
			
	<!-- 첨부파일 시작 -->	
		<br>
		<br>
		<br>
	<form action="update" method="post" enctype="multipart/form-data">	
		<div id="addFile">
				<label>
					<input type="file" name="upload_files" />
				</label>	
		</div>
	<!-- 첨부파일 끝 -->
	
				
				<div>
					<input type="hidden" name="idx" id="idx" value="${updatedetail.update_seq }" />
					<input type="hidden" name="writer"  value="${updatedetail.update_writer_id }" />
						
				</div>
					<div>
					
						<input type="text" name="sub" class="form-control" value="${updatedetail.update_title }" >
					</div>
	<!-- 본문 -->				
				
				 <textarea id="summernote" class="summernote" name="content"  rows="" cols="" style="height: 500px;">${updatedetail.update_content }</textarea>
		
		
		<div id="uploadFile">
		
		<c:if test="${updatedetail.update_file_path2 != null }">
			<label id="ifr">첨부파일</label>
			
			<input type="hidden" id="update_file_path1" value="${updatedetail.update_file_path1 }" /> <!-- name은 form , id는 ajax -->
			<input type="hidden" id="update_file_path2" value="${updatedetail.update_file_path2 }" />
			
			<a href="download/${updatedetail.update_file_path2 }/${updatedetail.update_file_path1 }" target="_blank">${updatedetail.update_file_path1 }
				<span id="x">&nbsp; x</span>
			</a>
			
		</c:if>
			
		</div>
			<!-- 관리자만 수정, 삭제 할 수 있게 -->
		<c:if test="${sessionScope.id == '관리자' }">	
			<div id="editBtn"> <!-- editBtn 시작 -->
					<button id="editDeleteBtn" type="submit">등록하기</button> 
				
		</form>	<!-- update form 끝 -->
			
			<!-- <form action="delete" method="post">	 -->
				<input type="hidden" name="idx"  value="${updatedetail.update_seq }" >
				
					<button  type="button" onclick="updateDelete();">삭제하기</button> 
					
			</div>	<!-- editBtn 끝 -->
			
			
		
			</c:if>
		</div>  <!-- col-md-12 끝 -->


		<!-- 수정 페이지 끝-->
		<br>
		<br>
		<br>
		<br>
		<!-- 상세페이지 시작 -->
<div id="updateDetail0">		
		<div class="row">
			<div id="updatedetail2">
				<div class="col-md-12">
					<div id="updatedetail3">		
					  <div class="col-md-10">
							<div class= "updatedeta">
								<div><input type="hidden" name="idx"  style="display: span " value="${updatedetail.update_seq }" /></div>
			                     
			                     <div id ="updateTitle">
			                        <input type="hidden" name="sub"  style="display: span " value="${updatedetail.update_title }" />
			                        ${updatedetail.update_title }
			                        
			                        
			                     </div>
							</div>
					  </div><!-- col-md-10 끝  -->
					  
					  <div class="col-md-2">
							<div class="updatedate">
								 <span id="date"><fmt:formatDate value="${updatedetail.regi_date }" pattern="yyyy-MM-dd HH:mm"/></span> 
							</div>
					  </div><!-- col-md-2 끝  -->
					  
					  <hr style="border:0.5px dashed #D5D5D5;" width="100%">
					  
					  <div id="writer">
		               <img width="25px" height="25px" style="margin-left: 0px ; display: span " id="profile"  src="<%=root %>/${writer} " onerror="this.src='../imgs/noProfile.png'">
		               <input style=" display: span ; " type="hidden" name="writer"  value="${updatedetail.update_writer_id }" >
		               ${updatedetail.update_writer_id }
		            </div>
		            
		            <div>	<!-- content -->
		            	<br>
		            	<br>
		            	<br>
		            		 ${updatedetail.update_content }
		            		 
		            </div>
		            
		            
		            
				  </div>	<!-- updatedetail3 끝  -->
				</div>	<!-- col-md-12 끝  -->
			</div>	<!-- updatedetail2 끝  -->
		</div>	<!-- row 끝 -->
		
		
		
		<div class="row2">
		<br>
		
		<div>
		<c:if test="${updatedetail.update_file_path1 != null }">
			<label id="ifr">첨부파일</label>
			
			<a href="download/${updatedetail.update_file_path2 }/${updatedetail.update_file_path1 }" target="_blank">
			${updatedetail.update_file_path1 }
			
			</a>
		</c:if>
		</div>
			
			<div id="updateBtn" class="col-md-12">
				 <!-- 관리자만 수정 할 수 있게 -->
         
		            <div id="detailBtn"> 
		               <c:if test="${sessionScope.id == '관리자' }">   
		                  <button id="upBtn" >수정하기</button> 
		                  <button id="listBtn">목록</button> 
		               </c:if>
		            </div>	
			</div>
		</div>
	</div>	
</div> <!-- updateDetail0 끝 -->
		<!-- 상세페이지 끝 -->
	
</div>   <!-- container 끝 -->	
	<!-- 여기까지 컨텐츠입니다 -->
	<br>
	<br>
	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>
	
</body>
</html>