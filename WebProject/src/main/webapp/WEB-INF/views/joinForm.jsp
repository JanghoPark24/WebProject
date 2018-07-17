<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html>
<head>
<title>회원가입</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/stylej01.css" />
<script src="<%=request.getContextPath()%>/js/validation.js" ></script>

</head>
<body>
<div class="container" id='joinbox'>
		<div class="jumbotron">
			<h3 style="text-align: center;">회원가입</h3>
			<br>
			<form name="joinform" method="post" onsubmit="return validateForm()"
				action="signup.html">
				<div class="form-group">
					<label>이메일</label> <input type="email" class="form-control"
						placeholder="이메일" name="userEmail" maxlength="20"
						required="required" value="TheLecture.corp@gmail.com">
				</div>
				<div class="form-group">
					<label>아이디</label> <input type="text" class="form-control"
						placeholder="아이디" name="userID" maxlength="20" required="required"
						value="TheStudent">
				</div>
				<div class="form-group">
					<label>비밀번호 <span>(8자 이상)</span></label> <span class="err"
						id="isShort"> <br>비밀번호는 적어도 8자 이상이어야 합니다
					</span> <input type="password" class="form-control" placeholder="비밀번호"
						name="userPasswd" maxlength="20" required="required">
				</div>
				<div class="form-group">
					<label>비밀번호 확인</label> <span class="err" id="isntDup"> <br>비밀번호가
						일치하지 않음
					</span> <input type="password" class="form-control" placeholder="비밀번호 확인"
						name="userPasswd2" maxlength="20" required="required">
				</div>
				<div class="checkbox">
					<label><input type="checkbox" checked='checked'
						required="required" id="agree"><a href="tos.html">이용약관</a>
						및 <a href="privacy.html">개인정보처리방침</a>에 동의합니다.</label>
				</div>
				<br> <input type=submit class="btn btn-primary" value="회원 가입"
					id="join">
			</form>
		</div>
	</div>

<%@ include file="footer.jsp"%>
</body>
