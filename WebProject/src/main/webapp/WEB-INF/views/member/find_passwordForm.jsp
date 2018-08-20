<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/stylej01.css" />
</head>
<body>
	<div class="container" id='resetpwbox'>
		<div class="jumbotron">
			<h3 style="text-align: center;">비밀번호 재설정</h3>
			<div class="container text-center">
				혹시 비밀번호를 잊어버리셨나요? <br> 비밀번호를 재설정하기 위하여 가입했던 이메일을 입력하세요.
				<c:if test="${!empty err_msg}">
					<br>
					<span class="errc" style="color: red;"> <br>이메일을 찾을 수
						없습니다.
					</span>
					<br>
				</c:if>
			</div>
			<br>
			<form name="resetform" method="post"
				action="request_reset_password.do">
				<div class="form-group">
					<label>이메일</label> <input type="email" class="form-control"
						required="required" placeholder="이메일" name="email"
						maxlength="80" value="TheLecture.corp@gmail.com"> <br>
						<input
						type="submit" class="btn btn-primary align-center" value="비밀번호 재설정">
				</div>
			</form>
		</div>
	</div>
</body>