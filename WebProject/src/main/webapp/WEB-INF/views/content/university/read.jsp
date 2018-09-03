<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고기 먹기 좋은 날~!</title>
</head>
<body>
<script>
	
	$("#r_email").
</script>

<div class="container">
	
	<table align=center width=100%  border=1>
		<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
		<tr><td>${board.board_num }</td><td>${board.subject }</td><td>${board.view_count }</td></tr>
		<tr><td    height=380% colspan="3" >${board.content }</td></tr>
		<tr><td colspan=3 align=center>
		
		
	
    <!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
    <c:if test="${sessionScope.email != null }">
    	
    <input type=button value="수정" 
			 	  onClick="location.href='writeUpdateForm.do?num=${board.board_num}'">
			<input type=button value="삭제" 
			 	  onClick="location.href='delete.do?num=${board.board_num }'">
			<input type=button value="목록" 
			 	  onClick="location.href='wlist.do"> 	  
			 	  
    </c:if>
	
	  
			 	  
			</td>
		</tr> 

		
		
	</table>
</div>
</body>
</html>