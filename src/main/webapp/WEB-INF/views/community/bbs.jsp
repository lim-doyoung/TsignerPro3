<%@page import="java.sql.Date"%>
<%@page import="org.springframework.web.bind.annotation.RequestParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../template/header.jsp"></jsp:include>
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="css/summernote.css" />
<link rel="stylesheet" type="text/css" href="../../../dist/summernote.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/summernote.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>


<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<script type="text/javascript">
   $(document).ready(function() {

      $('#summernote').summernote({
          height: 300
      });
      
      var addr = document.getElementById('downFile').value;
      pageList();
      $('#editBtn').hide();

/*       $('#keyword').keyup(function() {
         var k = $(this).val();
         if (k != null) {
            $("#communityBbsTable > tbody > tr").hide();
         }
         var temp = $("#communityBbsTable > tbody > tr > td:nth-child(5n+2):contains('"+ k + "')");
         $(temp).parent().show();
      }); */
   });

	function insert(){
		var user=$('#userId').val();
	    	if(user!=null&&user!=""){ 
	    		 $('.search').hide();
	    	     $('#submitbtn').hide();
		         $('.bbsInsert').show();
 		         $('.bbsDetail').hide();
		         $('#bbsTable').hide();
		         $('.topBtn').hide();
	    	}else{
	    			alert("로그인이 필요 합니다.");
	    }
	}
   
   function pageList() {
      $('#bbsTable').show();
      $('.topBtn').show();
      $('.bbsInsert').hide();
      $('.bbsUpdate').hide();
      $('.bbsDetail').hide();
      $('.search').show();
      $('#submitbtn').show();
      $('#detailPage').html('');

   };

   function pageInsert() {
      $('.bbsInsert').show();
      $('#bbsTable').hide();
      $('.bbsDetail').hide();
	  
   };
   function pageDetail() {
      $('.bbsDetail').show();
      $('#bbsTable').hide();
      $('.bbsInsert').hide();
   };

   function list(page){
      var option=$('#option option:selected').val();
      var keyword=$('#keyword').val()
      var option=$('#option option:selected').val();;
/*       $.ajax({
         type:"get",
         url:"community_bbs",
         data:"num="   +page,
         dataType : "text"
      }); */
      //ajax로 하면 왜 안받아 와짐?
      location.href="community_bbs?num="+page+"&keyword="+keyword+"&option="+option;
   }
   function search(){
		var keyword=$('#keyword').val();
		var option=$('#option option:selected').val();
		var page='';
		if(page==""){
			var page=1;
		} 
		location.href="community_bbs?num="+page+"&keyword="+keyword+"&option="+option;
		
	}
   

   function Delete(){
	      var num=$('#keyVal').val();
	      location.href='communityBbsDelete?cmnt_seq='+num;
	}


   //상세
    $(document).on('click','#bbsTable table tr td>a',function(e) {
      e.preventDefault();
/*       var num=$('#keyVal').val(); */
      $('.bbsDetail').show();
      $('#bbsTable').hide();
       $('.topBtn').hide();
       $('#edBtn').hide();
       $('.search').hide();
       $('#submitbtn').hide();
       var num=$(this).attr('href');
       var idx='idx='+$(this).attr('href');
      $.getJSON('json/obj',idx,function(data) {
                     $('#detailPage').append('<h1 class="title">'+data.cmnt_title+'</h1>');
                     var year=new Date(data.modi_date).getYear()+1900;
                     var month=new Date(data.modi_date).getMonth()+1;
                     var day=new Date(data.modi_date).getDate();
                     $('#detailPage').append('<p style="font-size:12px; float:right;">'+"작성자 "+data.cmnt_writer_id+" ("+ year+"-"+month+"-"+day+")"+'</p>');
                     $('#detailPage').append('<p class="date" style="margin-top: 50px; line-height: 30px;">'+data.cmnt_content+'</p>');
                     $('#downFile').val(data.cmnt_file_path2);
                     $('#writerId').val(data.cmnt_writer_id);
                     $('#keyVal').val(data.cmnt_seq);
                     $('#keyVal2').val(data.cmnt_seq);
                     // 수정 삭제 버튼 나오게 
                     if($('#writerId').val()==$('#userId').val()){
                        $('#edBtn').show();
                     }else{
                        $('#edBtn').hide();
                     }
                     // 다운로드 버튼 
                     var test2=$('#downFile').val();
/*                      if(test2!=""){
                        //경로 변경해야함
                        $('.btmBtm').append('<a style="float:left;" href="/upload/'+data.cmnt_filename+'" id="del" type="button" class="btn btn-default" download>download</a>');
                     }; */
      });  
       
/*       $.getJSON('bbsReplyList',$(this).attr('href'),function(data) {
          var arr=data;
          var userid=$('#cmnt_writer_id').val();
          if(data[0].reply_id!=null){
		  for(var i=0; i<arr.length; i++){
			var date=new Date(arr[i].r_modi_date).toISOString().substring(0,10);
			  $('#test').append('<p style="font-weight:bold; font-size:12px;">'+arr[i].reply_id+"("+date+")"+'</p>')
			  $('#test').append('<p style="font-size:16px;">'+arr[i].reply_content+'</p>');
		  		if(arr[i].reply_id==userid){
		  			$('#test').append('<a href="bbsReplyDelete?reply_seq='+arr[i].reply_seq+'&cmnt_seq='+arr[i].cmnt_seq+'""" class="btn btn-primary btn-sm" style="float: right; margin-top:-50px;">삭제</a>');
			  	}else{

				};
			  $('#test').append('<hr>')
			 } 
          }
      });    */
      replyList(num);
   });

   function replyList(num){
	   $('#test').html('');
/* 		var num=$('#keyVal').val(); */
		var userid=$('#cmnt_writer_id').val();
		var tempList='';
		$.ajax({
			type:"get",
			url: "bbsReplyList",
			data:"idx="+num,
			dataType: "json",
			success : function(data,textStatus,xhr) {
				$('#test').html('');
				 if(data[0].reply_id!=null){
					for(var i=0; i<data.length; i++){
						var date=new Date(data[i].r_modi_date).toISOString().substring(0,10);
						tempList+='<div class="replyAllDiv">';
						tempList+='<p style="font-weight:bold; font-size:12px;">'+data[i].reply_id+"("+date+")"+'</p>';
						tempList+='<p style="font-size:16px;">'+data[i].reply_content+'</p>';
						if(data[i].reply_id==userid){
							tempList+='<button onclick="test('+data[i].cmnt_seq+','+data[i].reply_seq+');" class="btn btn-primary btn-sm" style="float: right; margin-top:-50px;">삭제</button>';
					  	}else{
	
						};
						tempList+='<input class="te1" type="hidden" value="'+data[i].cmnt_seq+'">';
						tempList+='<input class="te2" type="hidden" value="'+data[i].reply_seq+'">';
						tempList+='<hr>';

					}
					$('#test').append(tempList);
				 }
			}
		})
   }

   function test(cmnt_seq,reply_seq){
	   var cmnt_seq=$('#test>div').eq($(this).index()).find('input').eq(0).val();
		var reply_seq=$('#test>div').eq($(this).index()).find('input').eq(1).val();
		$.ajax({
			type:"post",
			url:"bbsReplyDelete",
			data:"cmnt_seq="+cmnt_seq+"&reply_seq="+reply_seq,
			dataType:"text",
			success : function(data,textStatus,xhr) {
				alert('삭제 되었습니다.');
				$('#test').html('');
				replyList(cmnt_seq);
			}	
		})

	}


   //UpdateDetail 불러오기
    $(document).on('click','#edit',function(e) {
      e.preventDefault();
      $('.bbsUpdate').show();
      $('.bbsDetail').hide();
      $('#bbsTable').hide();
      $('.topBtn').hide();
      $('#edBtn').hide();
      var idx=$('#keyVal').val();
       $.getJSON('json/obj','idx='+idx,function(data) {
                     $('.bbsUpdate form input').eq(0).val(data.cmnt_title);
                     $('.bbsUpdate form input').eq(1).val(data.cmnt_writer_id);
                     $('.bbsUpdate form #summernote1').val(data.cmnt_content);
                     $('#keyVal1').val(data.cmnt_seq);
      });    
   });


   function download() {
      location.href = 'community_bbs/download/'
            + document.getElementById('downFile').value;
   };

   function checkForm(){
      var idCheck=$('#cmnt_writer_id').val();
      var contentCheck=$('#summernote').val();
      var titleCheck=$('#title').val();
      if(contentCheck=="                        "||contentCheck==null){
         alert('내용을 입력해 주세요');
         return false;
      }
      if(titleCheck==""||titleCheck==null){
         alert('제목을 입력해 주세요');
         return false;
      }
      if(idCheck==""||idCheck==null){
         alert('이름을 입력해 주세요');
         return false;
      }
   }
   
   function checkReplyForm(){
      var idCheck=$('#cmnt_writer_id').val();
      var titleCheck=$('#replyContent').val();
      var num=$('#keyVal').val();
      if(titleCheck==""||titleCheck==null){
         alert('제목을 입력해 주세요');
         return false;
      }
      if(idCheck==""||idCheck==null){
         alert('이름을 입력해 주세요');
         return false;
      }
      if(idCheck!=null||titleCheck!=''){
          $.ajax({
        		  type:"post",
        	      url:"bbsReply",
        	      data:"reply_id="+idCheck+"&reply_content="+titleCheck+"&cmnt_seq="+num,
        	      dataType : "text",
        	      success : function(data,textStatus,xhr) {
            	      //success 받으려면 controller 에서 리턴해줘야함
            	      $('#test').html('');
            	      replyList(num);
 					}
          })
          $('#replyContent').val('');
         
      }
   }
   
   //수정 체크폼
   function editCheckForm(){
      var contentCheck=$('#summernote1').val();
      var titleCheck=$('#title').val();
      if(contentCheck=="                        "||contentCheck==null){
         alert('내용을 입력해 주세요');
         return false;
      }
      if(titleCheck==""&&titleCheck==null){
         alert('제목을 입력해 주세요');
         return false;
      }
   }

   
</script>

<style type="text/css">
span.date {
   font-size: 10px;
}
.date {
   align-content: center;
   text-align: center;
   margin: auto;
}

.hashtag {
   text-align: center;
}

#hashbtn {
   border-radius: 30px;
}

#submitbtn {
   text-align: right;
   margin-left: 90%;
   margin-top: 50px;
}

.bbsInsert {
   width: 60%;
   margin: auto;
}
.bbsUpdate {
   width: 60%;
   margin: auto;
}

.bbsDetail {
   width: 60%;
   margin: auto;
}

#bgImg {
   width: 100%;
   opacity: 0.5;
   height: 100px;
}

#bottomBtn {
   text-align: right;
}

#div1 {
   width: 300px;
   height: 200px;
   border: 1px solid #ccc;
}

#btn-detail {
   border-radius: 30px;
   height: 30px;
   width: 100px;
   line-height: 5px;
   margin-left: 80%;
}
/* .title{
   align-content: center;
   text-align: center;
   margin: auto;
   font-style: italic;
} */
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <br>
   <!-- 하단 nav -->
   <div class="container">

      <div class="page-header">
         <h1>
            Community Center <small>자유게시판</small>
         </h1>
      </div>

      <ul class="nav nav-pills nav-justified">
         <li role="presentation"><a href="community_planner">플래너</a></li>
         <li role="presentation" class="active"><a href="community_bbs">자유게시판</a></li>
         <li role="presentation"><a href="community_together">투게더</a></li>
         <li role="presentation"><a href="community">여행후기</a></li>
         <li role="presentation"><a href="community_question">질문</a></li>
      </ul>
   </div>

   <!-- 여기서부터 컨텐츠입니다 -->
   <div id="content">
      <div class="container">

         <div class="row">
            <br>
            <div class="topBtn">
              
            </div>
            <div class="search" style="margin-right: 100px;">
<!--              <form class="navbar-form navbar-right"> -->
	               <div class="form-group">
	               <button type="submit" class="btn btn-default btn-sm" onclick="search();" style="float:right; height: 34px;">Submit</button>
	                  <input type="text" id="keyword" class="form-control" placeholder="Search" style="float:right; margin-right: 5px; width:200px; height: 34px;">
					<div class="form-group"
                        style="width: 100px; height: 30px; margin-right: 5px;  float: right;">
                        <select id="option" class="form-control" name="option" style="font-size: 12px;"></br>
                           <!--  onchange="paging();" -->
                           <option value="">선택</option>
                           <option value="modi_date" style="font-size: 12px;"
                              ${param.option eq "modi_date" ? "selected":"" }>작성일</option>
                           <option value="cmnt_hits" style="font-size: 12px;"
                              ${param.option eq "cmnt_hits" ? "selected":"" }>조회수</option>
                        </select>
                     </div>
<!--             </form> -->
            </div>
            </div>
            
            <div class="jumbotron1">
               <form action="">
                  <div id="bbsTable" style="margin-top: 30px;">
                     <table id="communityBbsTable" class="table table-hover"
                        style="width: 80%; margin: auto;">
                        <thead>
                           <tr>
                              <td width="5%">#</td>
                              <td align="left">제목</td>
                              <td width="10%">작성자</td>
                              <td width="10%">작성일</td>
                              <td width="10%">조회수</td>
                           </tr>
                        </thead>

                        <tbody>
                           <c:forEach items="${alist }" var="bean">
                              <tr>
                                 <td><a href="${bean.cmnt_seq }">${bean.cmnt_seq }</a></td>
                                  <td><a href="${bean.cmnt_seq }">${bean.cmnt_title }</a></td>
                                 <td>${bean.cmnt_writer_id }</td>
                                 <!-- 문자열 자르기 -->
                                 <c:set var="TextValue" value="${bean.modi_date }" />
                                 <td>${fn:substring(TextValue,0,10) }</td>
                                 <td>${bean.cmnt_hits }</td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>

					 
                      <!-- paging -->
                  <div id="pageNum" style="text-align: center;">
                     <ul class="pagination" style="text-align: center;">
                        <c:if test="${page.curBlock>1 }">
                           <li><a href="javascript:list('${test.prevPage}')">&laquo;</a></li>
                        </c:if>
                        <c:forEach var="num" begin="${page.blockBegin}" end="${page.blockEnd}">
                                         <!-- 현재페이지면 하이퍼링크 제거 -->
                                         <c:choose>
                                            <c:when test="${num == map.boardPager.curPage}">
                                               <li><span style="color: red">${num }</span></li>&nbsp;
                                            </c:when>
                                            <c:otherwise>
                                               <li><a href="javascript:list('${num}')">${num }</a></li>&nbsp;
                                            </c:otherwise>
                                         </c:choose>
                                      </c:forEach>
                        <c:if test="${page.curBlock <= test.totBlock }">
                           <li><a>&raquo;</a></li>
                        </c:if>
                     </ul>
                  </div><!-- paging끝 -->
                  </div>
               </form>
               <button id="submitbtn" class="btn btn-default btn-sm" onclick="insert();" style="margin-top: -100px;">글쓰기</button>

               <!-- insert form -->
               <div class="bbsInsert">
                   <h1 style="font-size: 25px; font-weight: bold; text-align: center;">Review</h1>
                     <br>
                   <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">T signer</p>
                     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">여행 숙박 공연 정보를 공유 하고</p>
                     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">함께 여행하자</p> 
                  <form action="community_bbs/add" method="post" style="margin-top: 50px;"
                     enctype="multipart/form-data"  onsubmit="return checkForm();">
                     <div class="form-group">
                        <label for="title">Title</label> <input type="text"
                           class="form-control" id="title"
                           placeholder="write title" name="cmnt_title">
                     </div>
                     <div class="form-group">
                        <label for="name">Name</label> <input type="text"
                           class="form-control" id="cmnt_writer_id"
                           placeholder="write name" name="cmnt_writer_id" readonly="readonly"
                           value="${sessionScope.id }">
                     </div>
                     <div class="form-group">
                        <label for="content">Content</label>
                        <textarea id="summernote" name="cmnt_content" class="summernote" rows="" cols=""></textarea>
                     </div>
                     <div class="form-group">
                        <label for="exampleInputFile">File input</label> <input
                           type="file" id="exampleInputFile" name="file2">
                     </div>
                     <button type="submit" class="btn btn-default" style="float: right;">Submit</button>
                  </form>
                  
               </div>
               
               <!-- detail -->
               <div class="bbsDetail" style="width: 60%; margin: 0px auto;">
                  <div id="edBtn">
                     <button class="btn btn-default" style="float: right; margin-right: 10px;" onclick="Delete();">Delete</a>
                     <button id="edit" class="btn btn-success" style="float: right; margin-right: 10px;">Edit</button>
                  </div>
                  <br>
                  <form action="community_bbs/update" method="post" id="detailPage" enctype="multipart/form-data">

                     <div id="upload" class="form-group"></div>
                     
                     
                     <br> <br>
                  </form>
                  <div class="btmBtm" style="margin-top: 300px; margin-bottom: 50px;">
                     <button class="btn btn-primary btn-sm"   style="float: right;" onclick="pageList();">목록</button>
             	  </div>
	                <input type="hidden" id="writerId" name="cmnt_writer_id">
	                <input id="userId" type="hidden" value="${sessionScope.id }">
	                <input type="hidden" id="keyVal" name="cmnt_seq" /> 
	                <input type="hidden" id="downFile" name="file2" />
	                
	             <!--댓글  -->
                 <div class="card-body" style="margin-top: 350px;">
					<div class="form-group">
						<hr style="color: red; width: 100%;">
						<h2>Are you curious?</h2>
						<input type="hidden" id="seq" name="seq" value="${bean.cmnt_seq }">
<!-- 						<form onsubmit="return checkReplyForm();"> -->
							<div class="col-sm-11">
								<input type="text" name="reply_content" id="replyContent" class="form-control">
								<input type="hidden" id="keyVal2" name="cmnt_seq">
								<input type="hidden" name="reply_id" value="${sessionScope.id }">
							</div>
							<div class="col-sm-1">
								<button id="replyAdd" class="btn btn-default" style="float: right;" onclick="checkReplyForm();">Reply</button>
							</div>
<!-- 						</form> -->
						<hr>
						<br>
						<div id="test">
						
						</div>
						
						
						<br><br>
<!-- 						<hr style="color: red; width: 100%;"> -->
					</div>
				</div><!-- 댓글끝 -->
	                
	                
                 </div><!-- detail끝 -->
                 
                 
                 
               
               <!-- update -->
               <div class="bbsUpdate">
                   <h1 style="font-size: 25px; font-weight: bold; text-align: center;">Review 수정</h1>
                     <br>
                   <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">T signer</p>
                     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">여행 숙박 공연 정보를 공유 하고</p>
                     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">함께 여행하자</p> 
                     
                  <form action="communityBbsUpdate" method="get" style="margin-top: 50px;"
                     enctype="multipart/form-data"  onsubmit="return editCheckForm();">
                     <div class="form-group">
                        <label for="title">Title</label> 
                        <input type="text" class="form-control" id="title1" placeholder="write title" name="cmnt_title">
                     </div>
                     <div class="form-group">
                        <label for="name">Name</label> 
                        <input type="text" class="form-control" id="cmnt_writer_id" readonly="readonly"
                           placeholder="write name" name="cmnt_writer_id" value="${sessionScope.id }">
                     </div>
                      <input type="hidden" id="keyVal1" name="cmnt_seq" /> 
                     
                     <script type="text/javascript">
                        $(document).ready(function(){
                           $('#summernote1').summernote({
                               height: 300
                           });
                        })
                     </script>
                     
                     <div class="form-group">
                        <label for="content">Content</label>
                        <textarea id="summernote1" name="cmnt_content" class="summernote" rows="" cols="">
                        </textarea>
                     </div>
                     <div class="form-group">
                        <label for="exampleInputFile">File input</label> <input
                           type="file" id="exampleInputFile1" name="file2">
                     </div>
                     <button type="submit" class="btn btn-default" style="float: right;">Edit</button>
                     <button type="reset" class="btn btn-default" style="float: right; margin-right: 10px;">Cancle</button>
                  </form>
               </div><!-- update 끝 -->
               

            </div><!--jumbo끝 -->
         </div><!-- row끝 -->
      </div><!-- containe끝 -->
   </div><!-- content 끝 -->
   <div class="jumbotron2">
      <%@ include file="../template/footer.jsp"%>
   </div>


</body>
</html>