<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="thelecture.model.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게시판 목록</title>
 <style>


table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}


</style>  
   
</head>

<body>
	<!-- 게시판 리스트 -->
	<div class="container">
	<form action="qna_write.do">
		<h2 align="center">게시판 목록</h2>
		<div >글 개수 : ${listcount}</div>

		<table id="bbslist_t" align="center">
			<tr align="center" >
				<td style="font-family: Tahoma; font-size: 11pt;" width="8%"
					height="26">
					<div align="center">번호</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="47%">
					<div align="center">제목</div>
				</td>
				<!-- <td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">작성자</div>
				</td> -->
				<td style="font-family: Tahoma; font-size: 11pt;" width="17%">
					<div align="center">날짜</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">조회수</div>
				</td>
			</tr>

 <c:set var="num" value="${listcount-(page-1)*10}"/>

<c:forEach var="b" items="${list }">
		<tr>
		<td>					
 			<!-- 번호 출력 부분 -->	
 			<c:out value="${num}"/>			
			<c:set var="num" value="${num-1}"/>	 
		</td>
				
		<td><a href="qna_read.do?qna_num=${b.board_num }&page=${page}&state=read">
		 ${b.subject } </a></td>
			<%-- <td>${b.nickname }</td> --%>
			<td>${b.reg_date }</td>
			<td>${b.view_count }</td>
			
		</tr>	
		</c:forEach>
</table>


<div id="bbslist_paging">			
			<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>
			
			<c:if test="${page > 1 }">
				<a href="qna_list.do?page=${page-1}">[이전]</a>&nbsp;
			</c:if>			

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="qna_list.do?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>			
			
			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="qna_list.do?page=${page+1}">[다음]</a>
			</c:if>			
			
		</div>

<c:if test="${sessionScope.email != null }">
        <div align="right">
        <input type="submit" class="btn btn-primary pull-right" value="글쓰기" >
        </div>
        </c:if>
</form>
	</div>
	
</body>
</html>