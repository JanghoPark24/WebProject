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
					<div class="col-sm-4 col-xs-6">이메일</div>
					<div class="col-sm-2 col-xs-6">닉네임</div>
					<div class="col-sm-2 col-xs-6">대학교</div>
					<div class="col-sm-2 col-xs-6">전공</div>
					<div class="col-sm-1 col-xs-12"></div>
				</th>
			</tr>

			<c:forEach var="row" items="${list}">
				<tr>
					<td>
						<div class="col-sm-4 col-xs-6">${row.email}</div>
						<div class="col-sm-2 col-xs-6">${row.nickname}</div>
						<div class="col-sm-2 col-xs-6">${row.univ_name}</div>
						<div class="col-sm-3 col-xs-6">${row.grade}</div> <c:if
							test="${row.grade!='master'}">
							<div class="col-sm-1 col-xs-12">
								<a href="" type="post"> <span style="color: #a68"
									class="glyphicon glyphicon-remove"></span></a>
							</div>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>