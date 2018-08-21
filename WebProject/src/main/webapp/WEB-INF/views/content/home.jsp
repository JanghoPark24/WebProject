<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<head>
<link
	href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/stylej01.css" />
<script src="<%=request.getContextPath()%>/js/autocomplete.js"></script>


<style>
/* 타이틀이미지 */
@media screen and (min-width:600px) {
	#titleImg {
		width: 470px;
	}
}

h2 {
	font-family: 'Nanum Barun Gothic';
}
</style>



<title>The Lecture :: 대학 강의 길라잡이</title>
</head>

<body>
	<div class="container text-center">
		<div class="jumbotron" id="homebox"
			style="	
		background-image: url('<%=request.getContextPath()%>/images/bg-chairs003.png');">
			<div class="container" id="titleImg">
				<img src="<%=request.getContextPath()%>/images/theLecture2.svg"
					style="width: 50%">
			</div>
			<h1
				style="font-family: 'Nanum Barun Gothic'; font-weight: 900; color:">The
				Lecture</h1>
			<br>
			<form class="form-group" style="text-align: center;">
				<table class="searchform" style="margin: auto;">
					<tr>
						<td><select name="category" class="form-control"
							style="height: 34px;" onchange="change_select()">
								<option value="all">전체</option>
								<option value="univ">대학</option>
						</select></td>
						<td><input type="text" class="form-control" placeholder="검색"
							id="search" size="100%" style="height: 34px;"></td>
						<td>
							<button class="btn btn-default" type="submit"
								style="height: 34px;">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-sm-4">
			<h2>강의 평가 서비스</h2>
		</div>
		<div class="col-sm-8">
			<p style="font-size: 1em;">
				The Lecture는 대학생 여러분들의 강의평가 정보들을 수집, 제공하는 사이트입니다.<br> <br>
				또한 대학생 여러분들이 대학생활에 관련하여 서로 간의 연결해주기 위한 온라인 공간입니다.
			</p>
		</div>
	</div>





</body>
