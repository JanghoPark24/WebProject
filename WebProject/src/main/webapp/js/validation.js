/* 유효성 검사 */
function validateForm() {
	var email = document.join_form.email.value.toUpperCase();
	var nickname = document.join_form.nickname.value.toUpperCase();
	var password = document.join_form.password.value;
	var password2 = document.join_form.password2.value;
	var permit = true;

	if (password.length < 8) { /* 비밀번호 8자 미만일 경우 */
		$("#isShort").show();
		permit = false;
	} else {
		$("#isShort").hide();
	}
	if (password != password2) { /* 비밀번호&비밀번호 확인 불일치 */
		$("#isntDup_password").show();
		permit = false;
	} else {
		$("#isntDup_password").hide();
	}

	/*
	 * $.ajax({ type : "POST", url : "is_dup.do", data : { "email" : email,
	 * "nickname" : nickname }, success : function(data) { alert("data : " +
	 * data); if (data == 0) { // 사용가능함 $("#isDup_email").hide();
	 * $("#isDup_nickname").hide(); } else { permit = false; if (data == 2) { //
	 * 중복 닉네임 $("#isDup_nickname").show(); } else if (data == 1) { // 중복 이메일
	 * $("#isDup_email").show(); } else { // 중복 이메일, 닉네임
	 * $("#isDup_email").show(); $("#isDup_nickname").show(); } alert("permit : " +
	 * permit); return false; } }, error : function(e) { alert("data error" +
	 * e); return false; } });// End $.ajax
	 */if (!permit) {
		return permit;
	}
}
/* End 유효성 검사 */