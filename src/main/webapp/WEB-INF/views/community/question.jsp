<%@page import="java.sql.Date"%>
<%@page import="org.springframework.web.bind.annotation.RequestParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../template/header.jsp"></jsp:include>
<!-- font -->
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
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
<style type="text/css">
	
</style>
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
            $("#communityQnaTable > tbody > tr").hide();
         }
         var temp = $("#communityQnaTable > tbody > tr > td:nth-child(5n+2):contains('"+ k + "')");
         $(temp).parent().show();
      }); */
   });

	function insert(){
		var user=$('#userId').val();
	    	if(user!=null&&user!=""){ 
	    		 $('.search').hide();
	    	     $('#submitbtn').hide();
		         $('.QnaInsert').show();
 		         $('.QnaDetail').hide();
		         $('#QnaTable').hide();
		         $('.topBtn').hide();
	    	}else{
	    			alert("로그인이 필요 합니다.");
	    }
	}
   
   function pageList() {
      $('#QnaTable').show();
      $('.topBtn').show();
      $('.QnaInsert').hide();
      $('.QnaUpdate').hide();
      $('.QnaDetail').hide();
      $('.search').show();
      $('#submitbtn').show();
      $('#detailPage').html('');

   };

   function pageInsert() {
      $('.QnaInsert').show();
      $('#QnaTable').hide();
      $('.QnaDetail').hide();
	  
   };
   function pageDetail() {
      $('.QnaDetail').show();
      $('#QnaTable').hide();
      $('.QnaInsert').hide();
   };

   function list(page,keyword){
      var option=$('#option option:selected').val();
      var keyword=$('#keyword').val();
      var option=$('#option option:selected').val();
      //ajax로 하면 왜 안받아 와짐?
      location.href="community_question?num="+page+"&keyword="+keyword+"&option="+option;
   }
   


   //상세
    $(document).on('click','#QnaTable table tr td>a',function(e) {
      e.preventDefault();
      $('.QnaDetail').show();
      $('#QnaTable').hide();
       $('.topBtn').hide();
       $('#edBtn').hide();
       $('.search').hide();
       $('#submitbtn').hide();
       var num=$(this).attr('href');
       var idx='idx='+$(this).attr('href');
      $.getJSON('json/Qobj',idx,function(data) {
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
                        $('.btmBtm').append('<a style="float:left;" href="'data.cmnt_file_path2+data.cmnt_filename+'" id="del" type="button" class="btn btn-default" download>download</a>');
                     }; */
      });  
       
      $.getJSON('qnaReplyList',idx,function(data) {

          var tempHtml='';
          var arr=data;
          var replyTemp="";
          var btn='<button id="re" class="btn btn-default btn-sm submitReply" style="float: right;" onclick="checkRe();">re-Reply</button>';
          var insert='<input type="text" class="form-control" id="R_reply_content" placeholder="write title" name="R_reply_content" style="height:29px; width: 300px; float: right;">';
          var userid=$('#cmnt_writer_id').val();

          if(arr[0].reply_id!=null){
		  for(var i=0; i<arr.length; i++){
			var date=new Date(arr[i].r_modi_date).toISOString().substring(0,10);
			var t=arr[i].reply_seq;
 			 tempHtml+='<div class="replyAllDiv"><div><p style="font-weight:bold; font-size:12px; position:relative;">'+arr[i].reply_id+"("+date+")"+'</p>';
			 tempHtml+='<p style="font-size:16px; position:relative;">'+arr[i].reply_content+'</p>';
			 tempHtml+='<input id="num" type="hidden" value='+t+'>'; 
			 
			 if(arr[i].reply_id==userid){
			 	tempHtml+='<button class="btn btn-primary btn-sm" style="float: right; margin-top:-70px; position:relative;" onclick="test('+data[i].cmnt_seq+','+data[i].reply_seq+');">삭제</button>';
			 }

			 tempHtml+='<a data-toggle="collapse" aria-expanded="false" aria-controls="collapseExample" class="answer" id="answer" style="float: right;  margin-top:-25px; margin-right:30px;">답글<a id="answerList" style="float: right; position:relative;  margin-top:-25px; margin-right:15px;"><i class="fas fa-chevron-down answer"></i></a></a>';
			 tempHtml+='</div><div class="hide replyDiv" id="collapseExample'+t+'"><div>'+btn+insert+'</div><div></div></div>';
			 tempHtml+='<hr style="margin-bottom: 30px; position:relative;"></div>';

			 }
          }	 
		  $('#test').html(tempHtml);
		  
      });   
   });
   var temp1='';
   //답글div 클릭
	var tempList='';
   $(document).on('click','.replyAllDiv',function(e){
	var userid=$('#cmnt_writer_id').val();
	var inputNum='';
	inputNum=$('#test>div').eq($(this).index()).find('input').eq(0).val();
	reList(inputNum);
	
	   //답글버튼 눌렀을경우
	   if($(e.target).hasClass('answer')){

		   if($('#test>div').eq($(this).index()).find('div').eq(1).css("display") == "none"){
			   $('#test>div').eq($(this).index()).find('div').eq(1).removeClass('hide');
			   var temp='<div class="reList">'+tempList+'</div>';
				$('#test>div').eq($(this).index()).find('div').eq(1).find('div').eq(1).append(temp);
				   
		   }else{
			   $('#test>div').eq($(this).index()).find('div').eq(1).addClass('hide');
			   $('.reList').html('');
			   tempList='';
			}

		   //답글등록버튼후 이벤트는 여기서 실행
		}else if($(e.target).hasClass('submitReply')){
			
			 //답글추가할때마다 $('#test>div').eq($(this).index()).find('div').eq(1).find('div').eq(1)에 답글목록 append하고 저장하면됨
			 //대댓글 div 양식만들고, 비어있는지 체크해주고 db에 연동하면됨
			
			//input값 - text
			var inputVal='';
			inputVal=$('#test>div').eq($(this).index()).find('div').eq(1).find('div').eq(0).find('input').eq(0).val();
			var inputNum='';
			inputNum=$('#test>div').eq($(this).index()).find('input').eq(0).val();
			var userId=$('#cmnt_writer_id').val();

			console.log('content:'+inputVal);
			console.log('num:'+inputNum);
			console.log('id:'+userId);
/* 			var temp='<div>'+inputVal+'</div>';
			$('#test>div').eq($(this).index()).find('div').eq(1).find('div').eq(1).append(temp); */


			///////////////////////ajax통신할 부분/////////////////////
			 $.ajax({
		         type:"post",
		         url:"qanRe_reply",
		         data:"reply_seq="+inputNum+"&re_reply_content="+inputVal+"&re_reply_id="+userId,
		         dataType : "text",
		         success:function(data){
		        	 reList(inputNum);
			     }
			 })

			///////////////////////////////////////////////////////////
			
			$('#test>div').eq($(this).index()).find('div').eq(1).find('div').eq(0).find('input').val('');
			inputVal='';
			
		}
	});

   function replyList(num){
	   $('#test').html('');
	   var tempHtml='';
       
       var btn='<button id="re" class="btn btn-default btn-sm submitReply" style="float: right;" onclick="checkRe();">re-Reply</button>';
       var insert='<input type="text" class="form-control" id="R_reply_content" placeholder="write title" name="R_reply_content" style="height:29px; width: 300px; float: right;">';
       var userid=$('#cmnt_writer_id').val();

		$.ajax({
			type:"get",
			url: "qnaReplyList",
			data:"idx="+num,
			dataType: "json",
			success : function(data,textStatus,xhr) {
				$('#test').html('');
				var arr=data;
				console.log(data[0].reply_id+",");
				 if(arr[0].reply_id!=null){
					 for(var i=0; i<arr.length; i++){
						var date=new Date(arr[i].r_modi_date).toISOString().substring(0,10);
						var t=arr[i].reply_seq;
			 			 tempHtml+='<div class="replyAllDiv"><div><p style="font-weight:bold; font-size:12px; position:relative;">'+arr[i].reply_id+"("+date+")"+'</p>';
						 tempHtml+='<p style="font-size:16px; position:relative;">'+arr[i].reply_content+'</p>';
						 tempHtml+='<input id="num" type="hidden" value='+t+'>'; 
						 
						 if(arr[i].reply_id==userid){
						 	tempHtml+='<button class="btn btn-primary btn-sm" style="float: right; margin-top:-70px; position:relative;" onclick="test('+data[i].cmnt_seq+','+data[i].reply_seq+');">삭제</button>';
						 }

						 tempHtml+='<a data-toggle="collapse" aria-expanded="false" aria-controls="collapseExample" class="answer" id="answer" style="float: right;  margin-top:-25px; margin-right:30px;">답글<a id="answerList" style="float: right; position:relative;  margin-top:-25px; margin-right:15px;"><i class="fas fa-chevron-down answer"></i></a></a>';
						 tempHtml+='</div><div class="hide replyDiv" id="collapseExample'+t+'"><div>'+btn+insert+'</div><div></div></div>';
						 tempHtml+='<hr style="margin-bottom: 30px; position:relative;"></div>';

						 }
						 
					  $('#test').html(tempHtml);
					$('#test').append(tempList);
				 }
			}
		})
   }
	
   function reList(inputNum){
	   
		var userid=$('#cmnt_writer_id').val();
		$.ajax({
	         type:"get",
	         url:"qanRe_replyList",
	         data:"reply_seq="+inputNum,
	         dataType : "json",
	         success:function(data){
		         console.log('대댓글 호출');
			         for(var i=0 ; i<data.length;i++){
						var year=new Date(data[i].re_modi_date).getYear()+1900;
	                   var month=new Date(data[i].re_modi_date).getMonth()+1;
	                   var day=new Date(data[i].re_modi_date).getDate();
						var date=year+'-'+month+'-'+day; 
						tempList+='<div>'
						tempList+='<span style="font-size:10px;">'+data[i].re_reply_id;
						if(data[i].re_reply_id==userid){
							tempList+='<button role="button" style="float:right;" onclick="reDelete('+data[i].re_reply_seq+','+data[i].reply_seq+');">삭제</button>';
						}
						tempList+='<span style="font-size:10px;">('+date+')</span>'; 
						tempList+='<p style="font-size:10px;">'+data[i].re_reply_content+'</p>';
						tempList+='</span></div><br>';
				     }
				     console.log("1"+tempList);
/* 			         $('#test>div').eq($(this).index()).find('div').eq(1).find('div').eq(1).append('<div>123123</div>');  */
		     }
		      
		})
		
	}
     


	

	 function test(cmnt_seq,reply_seq){
			console.log(cmnt_seq);
			console.log(reply_seq);
			$.ajax({
				type:"get",
				url:"qnaReplyDelete",
				data:"cmnt_seq="+cmnt_seq+"&reply_seq="+reply_seq,
				dataType:"text",
				success : function(data,textStatus,xhr) {
					alert('삭제 되었습니다.');
					$('#test').html('');
					replyList(cmnt_seq);
				}	
			})

	}

	function reDelete(num,reply_seq){
		console.log(tempList);
 		 $.ajax({
	         type:"get",
	         url:"ReReplyDelete",
	         data:"reply_seq="+num,
	         dataType : "text",
	         success:function(data){
				console.log('삭제후 리스트 호출');
				console.log(reply_seq)
				reList(reply_seq);
		     }
		 })
	}

	//대댓글 양식 체크
	function checkRe(){
		var content=$('#R_reply_content').val();
		var userid=$('#cmnt_writer_id').val();
	      if(userid==""){
	         alert('로그인이 필요합니다.');
	         return false;
	      }
	}
	

   //UpdateDetail 불러오기
    $(document).on('click','#edit',function(e) {
      e.preventDefault();
      $('.QnaUpdate').show();
      $('.QnaDetail').hide();
      $('#QnaTable').hide();
      $('.topBtn').hide();
      $('#edBtn').hide();
      var idx=$('#keyVal').val();
       $.getJSON('json/Qobj','idx='+idx,function(data) {
                     $('.QnaUpdate form input').eq(0).val(data.cmnt_title);
                     $('.QnaUpdate form input').eq(1).val(data.cmnt_writer_id);
                     $('#summernote1').val(data.cmnt_content);
                     $('#keyVal1').val(data.cmnt_seq);
      });    
   });


   function download() {
      location.href = 'community_Qna/download/'
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
    	  $('#replyContent').after('<label id="telCheckResult" style="color: red">내용을 입력하세요</label><input id="chTel" type="hidden" value="1"/>');
         return false;
      }
      if(idCheck==""||idCheck==null){
         alert('이름을 입력해 주세요');
         return false;
      }
      if(idCheck!=null||titleCheck!=''){
          $.ajax({
        		  type:"post",
        	      url:"qnaReply",
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

   function Delete(){
      var num=$('#keyVal').val();
      location.href='communityQnaDelete?cmnt_seq='+num;
   }
   function search(){
		var keyword=$('#keyword').val();
		var option=$('#option option:selected').val();
		var page='';
		if(page==""){
			var page=1;
		} 
		location.href="community_question?num="+page+"&keyword="+keyword+"&option="+option;
		
	}
   
   
</script>

<style type="text/css">

	.answer{
		cursor: pointer;
	}

	.replyDiv>div:nth-child(1){
			 width:100%;
			 height:50px;
	}

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

.QnaInsert {
   width: 60%;
   margin: auto;
}
.QnaUpdate {
   width: 60%;
   margin: auto;
}

.QnaDetail {
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
a{
	text-decoration: none;
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
            Community Center <small>Q&A</small>
         </h1>
      </div>

      <ul class="nav nav-pills nav-justified">
         <li role="presentation"><a href="community_planner">플래너</a></li>
         <li role="presentation"><a href="community_bbs">자유게시판</a></li>
         <li role="presentation"><a href="community_together">투게더</a></li>
         <li role="presentation"><a href="community">여행후기</a></li>
         <li role="presentation" class="active"><a href="community_question">Q&A</a></li>
      </ul>
   </div>

   <!-- 여기서부터 컨텐츠입니다 -->
   <div id="content">
      <div class="container">

         <div class="row">
            <br>
            <div class="topBtn">
<!--                <div class="hashtag">
                  <button id="hashbtn" type="button" class="btn btn-default btn-sm"
                     value="Title1">#여행</button>
                  <button id="hashbtn" type="button" class="btn btn-default btn-sm"
                     value="tester1">#제주</button>
                  <button id="hashbtn" type="button" class="btn btn-default btn-sm"
                     value="Title3">#서울</button>
               </div> -->
              
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
                  <div id="QnaTable" style="margin-top: 30px;">
                     <table id="communityQnaTable" class="table table-hover"
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
               <div class="QnaInsert">
                   <h1 style="font-size: 25px; font-weight: bold; text-align: center;">Q&A</h1>
                     <br>
                   <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">T signer</p>
                     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">여행 숙박 공연 정보를 공유 하고</p>
                     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">함께 여행하자</p> 
                  <form action="community_Qna/add" method="post" style="margin-top: 50px;"
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
                        <textarea id="summernote" name="cmnt_content" class="summernote" rows="" cols="">
                        </textarea>
                     </div>
                     <div class="form-group">
                        <label for="exampleInputFile">File input</label> <input
                           type="file" id="exampleInputFile" name="file2">
                     </div>
                     <button type="submit" class="btn btn-default" style="float: right;">Submit</button>
                  </form>
               </div>
               
               <!-- detail -->
               <div class="QnaDetail" style="width: 60%; margin: 0px auto;">
                  <div id="edBtn">
                     <button class="btn btn-default" style="float: right; margin-right: 10px;" onclick="Delete();">Delete</a>
                     <button id="edit" class="btn btn-success" style="float: right; margin-right: 10px;">Edit</button>
                  </div>
                  <br>
                  <form action="community_Qna/update" method="post" id="detailPage" enctype="multipart/form-data">

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
<!-- 						<form action="qnaReply" method="get" onsubmit="return checkReplyForm();"> -->
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
               <div class="QnaUpdate">
                   <h1 style="font-size: 25px; font-weight: bold; text-align: center;">Q&A 수정</h1>
                     <br>
                   <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">T signer</p>
                     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">여행 숙박 공연 정보를 공유 하고</p>
                     <p style="text-align: center; font-family:'Nanum Pen Script'; font-size: 15px;">함께 여행하자</p> 
                     
                  <form action="communityQnaUpdate" method="get" style="margin-top: 50px;"
                     enctype="multipart/form-data"  onsubmit="return editCheckForm();">
                     <div class="form-group">
                        <label for="title">Title</label> 
                        <input type="text" class="form-control" id="title1" placeholder="write title" name="cmnt_title">
                     </div>
                     <div class="form-group">
                        <label for="name">Name</label> <input type="text" class="form-control" id="cmnt_writer_id" readonly="readonly"
                           placeholder="write name" name="cmnt_writer_id"
                           value="${sessionScope.id }">
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