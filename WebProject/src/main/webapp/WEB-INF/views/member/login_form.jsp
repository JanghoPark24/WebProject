<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/navbar.jsp"%>
<!DOCTYPE html>
<head>
<title>회원가입</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/stylej01.css" />
<script src="<%=request.getContextPath()%>/js/validation.js" ></script>

</head>

<body>
  <div class="container" id="loginbox">
    <div class="jumbotron">
      <h3 style="text-align: center;">로그인</h3>
      <br>
      <div class="form-group">
        <label>이메일</label> <input required="required" type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="80">
      </div>
      <div class="form-group">
        <label>비밀번호</label> <input required="required" type="password" class="form-control" placeholder="비밀번호" name="userPasswd" maxlength="80">
      </div>
      <input type="button" class="btn btn-primary align-center" value="로그인"> <br> <br>
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


	<%@ include file="../common/footer.jsp"%>

</body>