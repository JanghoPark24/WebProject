<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


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

<!-- vue.js cdn
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="js/review.vue"></script> -->

<!--차트-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"
	charset="utf-8"></script>
<!--차트-->
<script src="./js/data_chart.js" charset="utf-8"></script>

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
	<div class="container" style="background-color: #ddd">
		<!-- 평균 점수 ${average}로 불러옴-->
		<div id="content_header">
			<h3>[00000]</h3>${d}
		</div>
		<div id="content_top"></div>
		<div id="content_middle">
			<div class="col-sm-6">
				<canvas id="myChart"></canvas>
			</div>
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
				<div class="col-sm-6">
					<strong>학년</strong> : 1, 2
				</div>
				<div class="col-sm-6">학기 : 2학기</div>
				<div class="col-sm-6">학점 : 3학점</div>
				<div class="col-sm-6">교수 : ㅇㅇㅇ교수</div>
			</div>
			<!-- 로그인된 아이디가 이 학교 아이디이면  나타남.-->
			<c:if test="${checked== true}">
				<div id="write_review_wrapper">
					<button>평가하기</button>
					<%@include file="rating_sheet.jsp"%>
				</div>
			</c:if>
		</div>
		<script>
			//차트 만드는 것 -- 후에 파라미터에 json array

			getChart();
		</script>
	</div>
</body>
