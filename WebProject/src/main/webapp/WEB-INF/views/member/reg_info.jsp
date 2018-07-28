<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/stylej01.css" />
</head>
<body>
	<div id="homebox" class="container text-center" style="padding:30px;">
		<div class="jumbotron">
			<h3 style="text-align: center;">이메일 등록</h3>
			<br>
			
				회원님의 이메일로 인증 메세지를 보냈습니다.
				<br>해당 계정에서 확인버튼을 눌러야 가입이 완료됩니다.
			
			<br><br>
			<form action="home.do">
				<input type="submit" class="btn btn-primary align-center"
					value="홈으로 되돌아가기">
			</form>
			<form action="home.do">
				<input type="submit" class="btn btn-primary align-center"
					value="인증메일 재발송">
			</form>
			<br>
		</div>
	</div>

</body>