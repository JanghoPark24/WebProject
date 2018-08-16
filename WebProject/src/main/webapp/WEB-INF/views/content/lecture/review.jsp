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

<style>
textarea {
	resize: none;
}

#container {
	width: 100%;
	margin: 0 auto;
}

#content {
	width: 80%;
	margin: 0 auto;
	border: 1px;
}

#content>div {
	display: inline-block;
	overflow: auto;
}

#content_header {
	width: 100%;
}

#write_review_wrapper {
	border: 1px solid;
	clear: both;
	width: 100%;
	padding: 2%;
}

.reply-button-container>* {
	width: 100%;
	border: 1px;
}

.button_block {
	width: 80px;
	border: none;
	background-color: rgb(35, 107, 190);
	color: white;
	font-size: 13px;
	margin: 10px 0px 10px 10px;
	padding: 10px;
	float: right;
	position: relative;
	cursor: pointer;
	text-align: center;
}

.button_block:hover {
	background-color: #ddd;
	color: black;
}

div.reply-container {
	clear: both;
	margin-top: 40px;
}

.reply-button-container:after {
	content: "";
	display: block;
	clear: both;
}

.form-group {
	margin-bottom: 0px;
}

.collapse {
	display: none;
}

.reply-container div {
	display: block;
}

.reply-cotainer-header {
	border-bottom: 1px solid #ccc;
	margin-bottom: 20px;
}

.reply-container-content>div {
	float: right;
}

.author-thumbnail {
	border-radius: 4px 0px 0px 4px;
}

.author-picture {
	margin: 2px;
	border: 1px solid #ccc;
	border-radius: 50%;
	float: left;
	width: 5vw; /* 7% of the viewport width */
	height: 5vw;
	overflow: hidden;
}

div.author-picture:hover {
	border: 1px solid #777;
}

div.author-picture img {
	width: 100%;
	height: width;
}

.reply-body {
	width: 85%;
	margin-left: 1%;
}

div.desc {
	padding: 15px;
	text-align: center;
}

.circle {
	border-radius: 50%;
}

#content>div {
	border: 1px solid #ccc;
	padding: 20px;
}

#content_top {
	width: 100%;
	margin: 0 auto;
	max-height: 100px;
}

#content_top>* {
	float: right;
}

#content_middle {
	width: 100%;
}

#content_middle>div {
	float: left;
}

#left_chart {
	border: 1px solid #ccc;
}

div.average {
	height: auto;
	padding: 10px;
	text-align: center;
	border: 1px solid #ccc;
}

div.average>div {
	float: clear;
	margin: 0 auto;
}

#content_bottom {
	width: 100%;
	margin: 0 20% 0 0;
	float: clear;
}

#content_bottom>form {
	width: 100%;
}

#content_bottom>form>div {
	width: 100%;
}
</style>

<title>My Chart.js Chart</title>

</head>
<body onload="starting_function()">
	<div class="jumbotron">
		<!-- 평균 점수 ${average}로 불러옴-->
		<div id="content_header">
			<h3>[00000]</h3>${empty d}
		</div>
		<div id="content_top"></div>
		<div id="content_middle">
			<div id="left_chart">
				<canvas id="myChart"></canvas>
			</div>
			<div class="average">
				<h5>
					평균 평점 :<span> <%-- ${average} --%></span>
				</h5>
				<div data-productid="313" class="rateit" data-rateit-mode="font"
					data-rateit-value="" data-rateit-readonly="true"
					style="font-size: 350%; color: lime;"></div>
				<!-- 평가 -->
			</div>
			<div id="lecture_info"
				style="display: 'block'; border: 1px solid black;">
				<div>학년</div>
				<div>학기</div>
				<div>학점</div>
				<div>담당 교수</div>
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
