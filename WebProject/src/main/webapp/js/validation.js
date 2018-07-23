/*function validateForm() {
	var password = document.forms["joinform"]["password"].value;
	var password2 = document.forms["joinform"]["password2"].value;
	var permit = true;
	if (password.length < 8) {  비밀번호 8자 미만일 경우 
		$("#isShort").show();
		permit = false;
	} else {
		$("#isShort").hide();
	}
	if (password != password2) {  비밀번호&비밀번호 확인 불일치 
		$("#isDup").show();
		permit = false;
	} else {
		$("#isDup").hide();
	}
	if (!permit) {
		return permit;
	}
}
*/