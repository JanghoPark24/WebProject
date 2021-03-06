<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필(수정)</title>

<script>
	$(function() {
		$("#btnUpdate").click(function() {
			alert(" 회원 정보가 변경 되었습니다.");
			document.form1.action = "memberUpdate.do";

			document.form1.submit();

		})
	})

	$(function() {
		$("#btnUpdate2").click(function() {
			alert(" 회원탈퇴가 완료되었습니다")
			document.form1.action = "memberdelete.do";

			document.form1.submit();

		})
	})

	$(function() {
		//	$("form").submit(function(){  
		$("#profileImg").click(function() {
			//		 alert($('#profileImg').val());

			//		  if ($('#profileImg').val() != "" ){
			$("#upimg").attr("disabled", false);
			//			alert('파일을 선택 하세요');
			//			return false;
			//		  }
		});
	});
</script>

<style>
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: white;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #00BFFF;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox input[type="file"] { /* /파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>


</head>
<body>
	<div class="container">

		<table border=1 align=center width=50 class="table">
			
			
        
			<form method="post" name="form1" action="profileUpload.do"
				enctype="multipart/form-data">
				<h2 align="center">내 프로필</h2>
				<tr>
					<td rowspan="5">
						<article align="center">
							<p id="status"></p>
							<c:if test="${not empty dto.uploadedFile}">
								<img
								src="<%=request.getContextPath()%>/displayFile.do?fileName=${dto.uploadedFile}&directory=profile"
								width=200 height="300">
<%-- 								
 --%>							</c:if>
							<c:if test="${empty dto.uploadedFile}">
								<img src="https://via.placeholder.com/200x300"
									width=200 height="300">
							</c:if>
							<input type="file" id="profileImg" name="profileImg">
							<!--   <input type="submit" name="업로드" value="이미지변경" id="upimg"> -->
							<input type="submit" name="업로드" value="이미지변경" id="upimg"
								disabled="disabled" class="btn btn-primary">

							<!-- </div> -->
							<div id="holder"></div>
						</article>
					</td>
				</tr>
				<tr >
					<td>${dto.email} <input type=text name="univ_name"
						value="${dto.univ_name}" readonly="readonly"></td>
				</tr>
				<tr >
					<td><input type=checkbox id="email">메일 공개</td>
				</tr>
				<tr >
					<td><input type=text value="${dto.nickname}" size=20
						name="nickname"> <input type=text value="${dto.major }"
						size=20 name="major"></td>
				</tr>
				<tr >
					<td><textarea cols=90 rows=10 name="profile">${dto.profile }</textarea></td>
				</tr>

				<tr >
					<td colspan=2 align=center><input type="button"
						value="회원정보 수정" id="btnUpdate" class="btn btn-primary"> <input
						type="button" value="회원 탈퇴" id="btnUpdate2"
						class="btn btn-primary"> <!--  <a href="update.do" class="btn btn-info" role="button" id="p">회원정보 수정</a>
         --> <!--  <a href="profile2.html" class="btn btn-info" role="button" id="p">저장</a>
           --></td>
				</tr>
			</form>
		</table>
	</div>
	
	




</body>
</html>