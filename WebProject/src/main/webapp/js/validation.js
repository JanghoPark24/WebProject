/* 유효성 검사 */
function validateForm() {
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
	if (!permit) {
		return permit;
	}
}
/* End 유효성 검사 */