<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
</head>
<body>
<h2>회원목록</h2>
<input type="button">
<table border="1" width="700px">
<tr>
<th>이메일</th>
<th>닉네임</th>
<th>대학교</th>
</tr>

<c:forEach var="row" items="${list}">

<tr>
<td>${row.email}</td>
<td><a href="${path}/profilelist.do?nickname=${nickname}"> ${row.nickname} </a></td>
<td>${row.univ_name}</td>
</tr>

</c:forEach>
</table>
</body>
</html>