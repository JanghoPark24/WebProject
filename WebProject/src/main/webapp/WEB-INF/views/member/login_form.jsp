<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<title>로그인</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/stylej01.css" />
<script src="<%=request.getContextPath()%>/js/validation.js"></script>

</head>

<body>
	<div class="container" id="loginbox">
		<div class="jumbotron">

			<h3 style="text-align: center;">로그인</h3>
			<br>
			<form action="login.do" method="post">
				<div class="form-group">
					<label>이메일</label> <input value="TheLecture.corp@gmail.com"
						required="required" type="email" class="form-control"
						placeholder="이메일" name="email" maxlength="80">
				</div>
				<div class="form-group">
					<label>비밀번호</label> <input value="wnddkd1971" required="required"
						type="password" class="form-control" placeholder="비밀번호"
						name="password" maxlength="80">
				</div>
				<c:if test="${!empty err_msg}">
					<span class="errc" style="color: red;"> <br>이메일과 비밀번호를
						다시 확인해주세요.<br> 사이트에 등록되지 않은 이메일이거나,
						 이메일 또는 비밀번호를 잘못 입력하셨습니다.
					</span><br>
				</c:if>
				<input type="submit" class="btn btn-primary align-center"
					value="로그인"> <br> <br>
			</form>
			<p style="font-size: 1em; font: bold;">
				<a href="joinForm.do" id="signup"><span
					class="glyphicon glyphicon-user"></span> 혹시 아직 회원이 아니신가요? </a>
			</p>

			<p style="font-size: 1em; font: bold;">
				<a href="resetPasswd.do" id="signup"><span
					class="glyphicon glyphicon-question-sign"></span> 비밀번호 재설정 </a>
			</p>
		</div>
	</div>



</body>