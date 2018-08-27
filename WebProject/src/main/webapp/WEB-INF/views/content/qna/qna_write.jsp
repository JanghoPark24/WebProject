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
			<form method="post" action="qna_insert.do" id="fm" name="fm">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				
			<tr>
				<th style=" text-align: center;">문의 게시판</th>
			</tr>
			<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" 
						name="subject" id="subject" maxlength="50" required="required"></td>
					</tr>
			<tr>	
			<td>	
	<textarea name="content" id="content" rows="12" cols="132" required="required">^ㅡ^</textarea>
				</td>
				</tr>
			</table>
				<div align="center">
				<input type="submit" class="btn btn-primary" id="insert" value="글쓰기">
				<input type="button" class="btn btn-primary" value="취소"
				id="btn2">
				</div>
				</form>
				
		</div>
	</div>


</body>
<script type="text/javascript">

var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "<c:url value="/resources/se2/SmartEditor2Skin.html" />",

    fCreator: "createSEditor2"

});

</script>
 <script>
 $("#insert").click(function(){ 
	 if ($('#subject').val() & $('#content').val() != ""){
	 oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); $("#fm").submit(); 
	 }
	 })

    </script> 
</html>