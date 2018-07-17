<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html>
<head>
<title>비밀번호 재설정</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/stylej01.css" />
</head>
<body>
	<div class="container" id='resetpwbox'>
		<div class="jumbotron">
			<h3 style="text-align: center;">비밀번호 재설정</h3>
			<div class="container text-center">
				혹시 비밀번호를 잊어버리셨나요? <br> 비밀번호를 수신하기 위하여 가입했던 이메일을 입력하세요.
			</div>
			<br>
			<form name="resetform" method="post" action="resetReq.do">
				<div class="form-group">
					<label>이메일</label> <input type="email" class="form-control"
						required="required" placeholder="이메일" name="userEmail"
						maxlength="80" value="spectralfox05@gmail.com">
				</div>
				<input type="button" class="btn btn-primary align-center"
					required="required" value="비밀번호 재설정"> <br> <br>
			</form>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	
</body>