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
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="dist/summernote.css" />
<!-- Font Awesome -->

<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/summernote.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>


<script type="text/javascript">

$(document).ready(function(){
   $('#noticeadd').hide();

   $(document).ready(function() {
      $('#summernote').summernote({
          height: 300
      });
   });

   $('#addBtn>button').click(function(){
      $('#noticelist').hide();
      $('#noticeadd').show();

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

//원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
function list(page){
   location.href="notice?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
}
</script>

<script>
   $(document).ready(function() {

	}
      
</script>

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
       #addBtns>button {
        background-color: white;
      }
      
      #updateBtns {
         text-align: center;
      }
      
      
      #addFile {
         text-align: right;
      }
      .detailList{
         display: block;
         color: #595959;
      }
      
      iframe {
         width: 100%;
         height:100px;
         border:1px;
         border-style: solid;
         border-color: #D5D5D5;
      }
      
     
      
      .th{
         text-align: center;
      }
      .td{
         text-align: center;
         color: gray;
      }
      
      #noticeMenu{
         
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
        background-color: #80c1ff; 

       width: 100%;
      
         border: none;
        color: white;
       
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
       border-radius: 8px;
         background:none ; 
       width: 100%;
         height: 40px;
         border: none;
        color: #66b5ff;
       text-align: center;
        text-decoration: none;
        display: inline-block;
        
      }
      #upd:hover{
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
      
       a:hover {
		text-decoration: none;
	}
	
	#main{
		width: 100%;
	}
	.howtouse{
		width: 80%;
		margin: 0 auto; display: block;
	}
     
     
      
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
   
   <br>
   <% String root = request.getContextPath(); %>
   <!-- 여기서부터 컨텐츠입니다 -->
   <div class="container">
         <!-- 컨텐츠의 내용을 입력하세요 -->
           <div class="col-md-12"> 
               <div class="page-header">
                  <h1>
                     How To Use <small>이용 방법</small>
                  </h1>
               </div>

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
            <br><br><br><br><br><br>
            <div >
              <img id="main" src="imgs/howtouse2.png"/>
            </div>
             <br><br><br><br>
            <div class="howtouse">
              <img id="main" src="imgs/11.png"/>
              <br><br><hr>
            </div>
            <br><br><br><br>
            <div class="howtouse">
              <img id="main" src="imgs/22.png"/>
              <br><br><hr>
            </div >
            <div class="howtouse">
              <img id="main" src="imgs/33.png"/>
               <br><br> <br><br><br><br><hr>
            </div>
             <div class="howtouse">
              <img id="main" src="imgs/44.png"/>
             	<br><br><br><hr>
            </div>
            
              
               
          </div>    
       </div>	<!-- container 끝 -->
        
            <br>
   <!-- 여기까지 컨텐츠입니다 -->
   <div class="jumbotron2">
   
      <%@ include file="../template/footer.jsp"%>
   </div>


</body>
</html>