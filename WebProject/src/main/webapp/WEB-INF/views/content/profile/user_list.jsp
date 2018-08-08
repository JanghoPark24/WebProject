<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
<h2>회원목록</h2>
<table border="1" width="700px">
<tr>
<th>이메일</th>
<th>닉네임</th>
<th>대학교</th>
<th>전공</th>
</tr>

<c:forEach var="row" items="${list}">

<tr>
<td>${row.email}</td>
<td>${row.nickname}</td>
<td>${row.univ_name}</td>
<td>${row.major}</td>
</tr>

</c:forEach>
</table>
</body>
</html>