<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/stylej01.css" />
</head>
<script src="<%=request.getContextPath()%>/js/validation.js"></script>

<body>
	<div class="container" id='joinbox'>
		<div class="jumbotron">
			<h3 style="text-align: center;">비밀번호 재설정</h3>
		 	<br>
			<form name="join_form" method="post" action="join.do"
				onsubmit="return validateForm(this)">
				<div class="form-group">
					<div class="form-group">
						<label>비밀번호 <span>(8자 이상)</span></label> <span class="err"
							id="isShort"> <br>비밀번호는 적어도 8자 이상이어야 합니다
						</span> <input type="password" class="form-control" placeholder="비밀번호"
							name="password" id="password" maxlength="20" required="required"
							value="wnddkd1971">
					</div>
					<div class="form-group">
						<label>비밀번호 확인</label> <span class="err" id="isntDup_password">
							<br>비밀번호가 일치하지 않음
						</span> <input type="password" class="form-control" placeholder="비밀번호 확인"
							name="password2" id="password2" maxlength="20"
							required="required" value="wnddkd1971">
					</div>
					<input type="submit" class="btn btn-primary" value="비밀번호 재설정">
				</div>
			</form>
		</div>
	</div>
</body>
