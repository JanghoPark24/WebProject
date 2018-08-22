<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>게시판 글쓰기</title>
<script>
$(function(){
	$("#btn2").click(function(){
		history.go(-1);
	})
})

</script>

<script type="text/javascript" src="<c:url value="/resources/se2/js/service/HuskyEZCreator.js"/>" charset="utf-8">
</script>


</head>
<body>

	<div class="container">
		<div class="row">
			<form method="post" action="qna_insert.do">
				
	<textarea name="ir1" id="ir1" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
				</form>
				</div>
			
				<div align="center">
				<input type="submit" class="btn btn-primary" value="글쓰기">
				<input type="button" class="btn btn-primary" value="취소"
				id="btn2">
			
		</div>
	</div>


</body>
<script type="text/javascript">

var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "ir1",

    sSkinURI: "<c:url value="/resources/se2/SmartEditor2Skin.html" />",

    fCreator: "createSEditor2"

});

</script>
</html>