<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"> <!-- 반응형 메타 태그 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>게시글 목록</title>
<script>
// 모달창을 위한 
var clickTimes;
</script>

<script>
	
	 function send(subject, content,email,board_num,nickname){
		clickTimes= 0;
		$("#subject3").val(subject); 
		$("#content3").text(content); 
		$("#email3").val(email); 
		$("#board_num3").val(board_num); 
		$("#nickname3").val(nickname); 
		$("#nickname_compare").val(nickname);
		
		document.getElementById("board_num3").setAttribute("readonly","readonly");
		document.getElementById("email3").setAttribute("readonly","readonly");
		document.getElementById("subject3").setAttribute("readonly","readonly");
		document.getElementById("content3").setAttribute("readonly","readonly"); 
		
		$("#update_board").removeClass('updating');
		
		compareWithSessionNickName();
	} 
	 function compareWithSessionNickName(){
		 
		 if($("#nickname_compare").val() == '${sessionScope.nickname}'){
			 var buttonsForUpdate_delete="<input id='update_board' type=button value='수정' class='btn btn-default' onClick='update_view()'> "+
				"<input type=button value='삭제' class='btn btn-default' onClick='del()'>";
				$("#button_block_for_up_del").html(buttonsForUpdate_delete);
				
		 }
	 }
	 
	 function update_view(){
		 
		/*  $("#board_num3").prop("readonly","disabled");
		 $("#email3").prop("readonly","disabled");
		 $("#subject3").prop("readonly","disabled");
		 $("#content3").prop("readonly","disabled"); */
		 document.getElementById("board_num3").removeAttribute("readonly");
		 document.getElementById("email3").removeAttribute("readonly");
		 document.getElementById("subject3").removeAttribute("readonly");
		 document.getElementById("content3").removeAttribute("readonly");
		 $("#update_board").addClass("updating");
		 
		 
	 }
	
	 function del(){
		 var board_num = $("#board_num3").val();
		 
		
		 
		 location.href='wdelete.do?board_num='+board_num/* +"&nickname="+nickname */;
		 
		 
	 }
</script>
<script>

$(function(){
	
	$(document).on("click","#update_board",function(){
		clickTimes+=1;
		if( $(this).hasClass('updating') && clickTimes>1){
			var frm =document.getElementById("board_form");
		 	frm.action = 'wupdate.do'
		 	frm.submit();
			
		}
	})

})
</script>

</head>
<body>
	<div class="container">
	<div style="text-align:center">
		<h2>게시글 목록</h2>
		<br>
	</div>	
		

		<table class="table">
			<tr>
			<th>
				
				<div class="col-sm-1 col-xs-6">번호</div>
				<div class="col-sm-4 col-xs-6" style="text-align:center">제목</div>
				<div class="col-sm-2 col-xs-2">닉네임</div>
				<div class="col-sm-2 col-xs-2">등록날짜</div>
				<div class="col-sm-1 col-xs-2" style="text-align:center">조회수</div>
			</th>
		</tr>
		
		
		
		<c:forEach var="b" items="${list}">
		<tr>
			<td>
			<div class="col-sm-1 col-xs-3">	${b.board_num } </div>
			<div class="col-sm-4 col-xs-6" style="text-align:center"><a class="open_modal" data-toggle="modal" data-backdrop="false" href="#readModal"  onClick="send('${b.subject}', '${b.content}','${b.email}','${b.board_num}','${b.nickname}' ) ">${b.subject}</a></div>
			<div class="col-sm-2 col-xs-2">${b.nickname }</div>
			<div class="col-sm-2 col-xs-2">${b.reg_date }</div>
			<div class="col-sm-1 col-xs-2" style="text-align:center">${b.view_count }</div>
			</td>
		</tr>
		</c:forEach>
				
			</table>
		
		</div>
	</div>

<section class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="lectureDivide" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="전공">전공</option>
				<option value="교양">교양</option>
				<option value="기타">기타</option>
			</select> <input type="text" name="search" class="form-control mx-1 mt-2"
				placeholder="내용을 입력해주세요.">
			<button type="submit" class="btn btn-default mx-1 mt-2">검색</button>
			
				<!-- 로그인 사용자만 글쓰기 출력 -->
		<c:if test="${sessionScope.email != null }">	
			<a href="#writeModal" data-toggle="modal" class="btn btn-secondary pull-right">글쓰기</a>
			<a href="#reportModal" data-toggle="modal" class="btn btn-secondary pull-right">신고하기</a>
		</c:if>
		 
		    
		</form>
	</section>


<div class="modal fade" id="writeModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<form method="post" action="write.do">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr><th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th></tr>
				</thead>
				<tbody>
					<tr><td><input type="text" class="form-control" placeholder="글 제목" required="required" name="subject" maxlength="50"></td>	</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" required="required" name="content" maxlength="2048" style="height: 350px; resize: none;"></textarea></td>
					</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-default " value="글쓰기">
					<button type="button" class="btn btn-default pull-right"	data-dismiss="modal">취소</button>
			</form>
				</div>
			</div>
		</div>
	</div>



<div class="modal fade" id="readModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<form method="post" id="board_form" action="write.do">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				
				<tbody>
			
				<tr><td>작성글<input type="hidden" class="form-control" readonly="readonly"  id="board_num3" name="board_num" maxlength="50"></td>	</tr> 
				<tr><td><input type="text" class="form-control" readonly="readonly"  id="nickname3" name="nickname" maxlength="50"></td></tr>
					<div class="col-sm-2 col-xs-2">${b.nickname }</div>
				<input type="hidden" class="form-control" readonly="readonly"  id="email3" name="email3" maxlength="50" />
					<tr><td><input type="text" class="form-control" readonly="readonly"  id="subject3" name="subject" maxlength="50"  ></td></tr>
					<tr>
						<td><textarea class="form-control" readonly="readonly"  id="content3" name="content" maxlength="2048"  style="resize: none; height:350px;"></textarea></td>
					</tr>
					</tbody>
				</table>
				
				 		<input type="hidden" id="nickname_compare"/>
						<c:if test="${sessionScope.email != null }">	
						<div id="button_block_for_up_del">
							<!-- <input type=button value="수정" class="btn btn-primary " onClick="">
							<input type=button value="삭제" class="btn btn-primary " onClick="del()"> -->
						</div>	
						</c:if>
						
						
			</form>
			
				</div>
				
			</div>
		</div>
	</div>










<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<from action="./reportAction.jsp" method="post">
					<div class="form-group">
						<label>신고 제목</label> <input type="text" name="reportTitle"	class="form-control" maxlength="30">
					</div>
					<div class="form-group">
						<label>신고 내용</label>
						<textarea name="reportContent" class="form-control"	maxlength="2048" style="height: 180px;"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"	data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-danger">신고하기</button>
					</div>
					</from>
				</div>
			</div>
		</div>
	</div>



</body>
</html>