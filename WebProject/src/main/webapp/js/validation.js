/* 유효성 검사 */
function validateForm() {
	var passwd = document.forms["joinform"]["userPasswd"].value;
	var passwd2 = document.forms["joinform"]["userPasswd2"].value;
	var permit = true;
	if (passwd.length < 8) { /* 비밀번호 8자 미만일 경우 */
		$("#isShort").show();
		permit = false;
	} else {
		$("#isShort").hide();
	}
	if (passwd != passwd2) { /* 비밀번호&비밀번호 확인 불일치 */
		$("#isntDup").show();
		permit = false;
	} else {
		$("#isntDup").hide();
	}
	permit = false;
	return permit;
}
$(document).ready(function() {
	$("#agree").click(function() {
		var agreec = document.getElementById('agree');
		alert(agreec);
	});
});
/* End 유효성 검사 */