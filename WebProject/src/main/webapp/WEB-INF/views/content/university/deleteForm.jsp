<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("form").submit(function(){
			if($("#password").val()==""){
				alert("비번을 입력하세요");
				$("#password").focus();
				return false;
			}
			if($("#password").val() != '${member.password}'){
				alert('${member.password}');
				alert("비밀번호가 일치하지 않습니다.");
				$("#password").val("").focus();
				return false;
			}
		});
	}); 
</script>
</head>
<body>

<form method=post action="delete.do">
	비밀번호 : <input type=text name="password" id="password">
	<input type=submit value="삭제">
</form>

</body>
</html>