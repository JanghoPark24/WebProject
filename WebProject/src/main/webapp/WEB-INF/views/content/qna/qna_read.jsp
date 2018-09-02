<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div id="boardcont_wrap">
		<h2 class="boardcont_title" align="center">문의내용</h2>
		<br><br>
		<form method="post" action="qna_delete.do" id="qna_delete" name="qna_delete">
		<table id="boardcont_t" align="center">
			<tr>
				<th>제목</th>
				<td>${qboard.subject}</td>
			</tr>

			<tr>
				<th>글내용</th>
				<td>
					<%--  ${board_cont} --%> 
					<pre>${qboard.content}</pre>
				</td>
			</tr>

			<tr>
				<th>조회수</th>
				<td>${qboard.view_count}</td>
			</tr>			
		</table>

		<br><br><br>
		<div align="center">
			<input type="submit" class="btn btn-primary" value="삭제">
			</div>
	</form>
</div>
</body>
</html>