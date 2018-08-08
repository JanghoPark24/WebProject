<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고기 먹기 좋은 날~!</title>
</head>
<body>

<table align=center width=500 border=1>
	<caption>상세 페이지</caption>
	<tr><td>번호</td>
		<td>${WriteBean.board_num }</td>
	</tr>
	<tr><td>email</td>
		<td>${WriteBean.email }</td>
	</tr>
	<tr><td>
	<tr><td>제목</td>
		<td>${WriteBean.subject }</td>
	</tr>
	<tr><td>내용</td>
		<td><pre>${WriteBean.content }</pre></td>
	</tr>
	<tr><td>조회수</td>
		<td><pre>${WriteBean.view_count }</pre></td>
	</tr>
	<tr><td colspan=2 align=center>
		<input type=button value="수정" 
			   onClick="location.href='writeUpdateForm.do?board_num=${WriteBean.board_num}'">
		<input type=button value="삭제" 
			   onClick="location.href='writeDelete.do?board_num=${WriteBean.board_num}'">
		</td>
	</tr>
</table>

</body>
</html>