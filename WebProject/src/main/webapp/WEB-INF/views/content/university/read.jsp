<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table align=center width=500 border=1>
	<caption>상세 페이지</caption>
	<tr><td>번호</td>
		<td>${board.num }</td>
	</tr>
	<tr><td>작성자</td>
		<td>${board.name }</td>
	</tr>
	<tr><td>제목</td>
		<td>${board.subject }</td>
	</tr>
	<tr><td>내용</td>
		<td><pre>${board.content }</pre></td>
	</tr>
	<tr><td colspan=2 align=center>
		<input type=button value="수정" 
			   onClick="location.href='updateForm.do?num=${board.num}'">
		<input type=button value="삭제" 
			   onClick="location.href='delete.do?num=${board.num}'">
		</td>
	</tr>
</table>

</body>
</html>