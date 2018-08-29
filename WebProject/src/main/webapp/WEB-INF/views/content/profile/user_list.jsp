<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
	<div class="container">
		<h2>회원목록</h2>
		<br>
		<table class="table">
			<tr>
				<th>
					<div class="col-sm-2 col-xs-6">닉네임</div>
					<div class="col-sm-2 hidden-xs">대학교</div>
					<div class="col-sm-2 col-xs-6">등급</div>
					<div class="col-sm-4 col-xs-6">이메일</div>
					<div class="col-sm-2 col-xs-6"></div>
				</th>
			</tr>

			<c:forEach var="row" items="${list}">
				<tr>
					<td>
						<div class="col-sm-2 col-xs-6">${row.nickname}</div>
						<div class="col-sm-2 hidden-xs">${row.univ_name}</div>
						<div class="col-sm-2 col-xs-6">${row.grade}</div>
						<div class="col-sm-4 col-xs-6">${row.email}</div>
						<div class="col-sm-2 col-xs-6">
							<c:if test="${row.grade!='master'}">
								<button type="button" class="btn btn-info btn-xs">수정</button>
							</c:if>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>