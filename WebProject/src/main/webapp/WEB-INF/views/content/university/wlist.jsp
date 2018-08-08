<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>   
<%@ page import="java.io.PrintWriter" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"> <!-- 반응형 메타 태그 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>반도의 여름은 ㅈ같습니다.</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">이메일</th>
						<th style="background-color: #eeeeee; text-align: center;">등록날짜</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tobody>
				<c:forEach var="b" items="${list }">
		<tr><td>${b.board_num }</td>
		<td><a href="read.do?num=${b.board_num }"> ${b.subject } </a></td>
			<td>${b.email }</td>
			<td>${b.reg_date }</td>
			<td>${b.view_count }</td>
			
		</tr>	
		</c:forEach>
					<tr>
					
						
					</tr>
				</tobody>
			</table>
			<a href="write_manager.do" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>

</body>
</html>