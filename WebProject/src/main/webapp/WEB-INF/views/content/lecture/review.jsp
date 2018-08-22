<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<style>
.bar-container {
	width: 100%;
	background-color: #f1f1f1;
	text-align: center;
	color: white;
	border: 1px solid #48f;
}

/* Individual bars */
.bar {
	height: 14px;
	background-color: #48f;
}

.pade {
	padding-bottom: 10px;
	padding-top: 10px;
}
</style>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!--별점-->
<link rel="stylesheet" href="./css/rating/rateit.css">
<link rel="stylesheet" href="./css/review.css">
<link rel="stylesheet"
	media="screen and (min-device-width: 320px) and (max-device-width: 1100px)"
	href="./css/review_responsive.css">


<!-- jQuery library -->
<!-- Latest compiled JavaScript -->
<!--별점-->
<script src="./js/rating/jquery.rateit.js"></script>
<script src="./js/review.js" charset="utf-8"></script>
<%-- <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/lecture/review.css" /> --%>

<title>My Chart.js Chart</title>

</head>
<body onload="starting_function()">
	<div class="container text-center">
		<!-- 평균 점수 ${average}로 불러옴-->
		<div id="title">
			<h3>[${lb.lecture_code}] ${lb.lecture_name}</h3>
		</div>
<<<<<<< HEAD
		<div id="content_top"></div>
		<div id="content_middle" >
			<div >
				<canvas id="myChart"></canvas>
=======
		<div class="container" id="content_middle">
			<%-- lb.total_avg_score+ --%>
			<h1>${Math.round((1.6373464612*100))/100}</h1>
			<div data-productid="313" class="rateit text-center"
				data-rateit-mode="font"
				data-rateit-value="${Math.round((1.6373464612*100))/100}"
				data-rateit-readonly="true" style="width: 100%; font-size: 4em"></div>
			<br>
			<div class="row text-left" style="width: 100%">
				<div class="col-xs-12 col-sm-6 col-md-4 ">대학 : ${lb.univ_name}</div>
				<div class="col-xs-12 col-sm-6 col-md-4 ">전공 : ${lb.major}</div>
				<div class="col-xs-12 col-sm-6 col-md-4 ">학년 : ${lb.grade}</div>
				<div class="col-xs-12 col-sm-6 col-md-4 ">학기 : ${lb.semester}</div>
				<div class="col-xs-12 col-sm-6 col-md-4 ">학점 : ${lb.credit}</div>
				<div class="col-xs-12 col-sm-6 col-md-4 ">교수 : ${lb.professor}</div>
				<div class="col-xs-12 col-sm-6 col-md-4 ">전공 : ${lb.major}</div>
>>>>>>> branch 'test' of https://github.com/JanghoPark24/WebProject
			</div>
<<<<<<< HEAD
			<div class="col-sm-2">
				<h5>
					평균 평점 :<span> <%-- ${average} --%></span>
				</h5>
				<div data-productid="313" class="rateit" data-rateit-mode="font"
					data-rateit-value="4.2" data-rateit-readonly="true"
					style="color: lime; width: 100%;"></div>
				<!-- 평가 -->
			</div>
			<div class="col-sm-4" id="lecture_info">
				<div class="col-sm-8">
					<strong>학년</strong> : 1, 2
				</div>
				<div class="col-sm-8">학기 : 2학기</div>
				<div class="col-sm-8">학점 : 3학점</div>
				<div class="col-sm-8">교수 : ㅇㅇㅇ교수</div>
			</div>
			<!-- 로그인된 아이디가 이 학교 아이디이면  나타남.-->
			<c:if test="${checked== true}">
				<div id="write_review_wrapper">
					<button>평가하기</button>
					<%@include file="rating_sheet.jsp"%>
				</div>
			</c:if>
=======
			<%-- rb=강의평가빈 --%>
			<%-- 	<c:forEach var="rb" items="${rb_list}">
					<p>${rb.question_id }</p>
					<p>${rb.avg_score }</p>				
			</c:forEach> --%>
>>>>>>> branch 'test' of https://github.com/JanghoPark24/WebProject
		</div>
<<<<<<< HEAD
		<script>
			//차트 만드는 것 -- 후에 파라미터에 json array

			getChart();
		</script>
		
=======
>>>>>>> branch 'test' of https://github.com/JanghoPark24/WebProject
	</div>
	<div class="container">
		<div class="row">
			<div class="container">
				<c:forEach var="qb" items="${qb_list}">
					<div class="col-sm-6 col-md-4 pade">
						<div>${qb.question_content}</div>
						<%-- <div class="bar-container">
							<div class="bar" style="width: ${2.35*20.0}%"></div>
						</div> --%>
						<div data-productid="313" class="rateit text-center"
							data-rateit-mode="font"
							data-rateit-value="${Math.round((3.24125*100))/100}"
							data-rateit-readonly="true" style="width: 100%; font-size: 1em">
							${Math.round((1.6373464612*100))/100} </div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- 로그인된 아이디가 이 학교 아이디이면  나타남.-->
	<%-- <c:if test="${checked== true}">
		<div class="container">
			<%@include file="rating_sheet.jsp"%>
		</div>
	</c:if> --%>
	
	
</body>
