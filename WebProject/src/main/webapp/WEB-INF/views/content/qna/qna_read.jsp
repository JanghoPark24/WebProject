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
		<h2 class="boardcont_title">게시물 내용보기</h2>
		<table id="boardcont_t">
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
</div>
</body>
</html>