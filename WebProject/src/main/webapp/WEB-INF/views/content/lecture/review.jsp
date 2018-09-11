<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath()%>" />

<c:set var="lecture_total_score" value="${0}"/>
<c:set var="question_size" value="${fn:length(rb_list)}"/>


	
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




<!-- jQuery library -->
<!-- Latest compiled JavaScript -->
<!--별점-->
<script src="./js/rating/jquery.rateit.js"></script>
<script src="./js/review.js" charset="utf-8"></script>
<!-- validating -->
<script src="./js/validate_functions.js" charset="utf-8"></script>
<%-- <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/lecture/review.css" /> --%>






<!-- 댓글 작성 -->

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
#content>div {
	display: block;
	overflow: auto;
}

</style>


<div class="container_x text-center" >
	<!-- 평균 점수 ${average}로 불러옴-->
	<div id="title">
		<h3>[${lb.lecture_code}] ${lb.lecture_name}</h3>
	</div>

	<div class="container_x" id="content_middle">
		<%-- lb.total_avg_score+ --%>
		<%-- <h1>${Math.round((1.6373464612*100))/100}</h1> --%>
		
		<h1>${lb.total_avg_score}</h1> 
		<div>총 ${lb.rating_count}명이 평가했습니다.</div>
		<div data-productid="313" class="rateit text-center"
			data-rateit-mode="font"
<%-- 				data-rateit-value="${Math.round((1.6373464612*100))/100}"
 --%>				data-rateit-value="${lb.total_avg_score}"
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
		</div>
		<%-- rb=강의평가빈 --%>
		<%-- <c:forEach var="rb" items="${rb_list}">
				<p>${rb.question_id }</p>
				<p>${rb.avg_score }</p>				
		</c:forEach> --%>
	</div>
</div>
<c:if test="${not empty sessionScope.email && sessionScope.univ == lb.univ_name}">

<div class="container_x">
	<div class="row">
		<div>강의 평가</div>
		<div class="container_x">

			<%-- <c:forEach var="qb" items="${qb_list}">
				<div class="col-sm-6 col-md-4 pade">
					<div>${qb.question_content}</div>
					<div class="bar-container">
						<div class="bar" style="width: ${2.35*20.0}%"></div>
					</div>
				</div>
			</c:forEach> --%>
			<c:forEach var="qb" items="${rb_list}">
				<div class="col-sm-6 col-md-4 pade">
					
					<fmt:formatNumber var="avg_score_byQ"
						  value="${(qb.avg_score)*(5/6)}"
						  maxFractionDigits="1" />
						  
					<c:if test="${empty qb.avg_score}">
						<div>${qb.question_content} : 평균 0/5점</div>
						<div class="bar-container">
							<div class="bar" style="width: 1%"></div>
						</div>
					</c:if>
					<c:if test="${not empty avg_score_byQ}">
						<div>${qb.question_content} : 평균 ${avg_score_byQ}/5점</div>
						<div class="bar-container">
							<div class="bar" style="width: ${(avg_score_byQ)/5*100.0}%"></div>
						</div>
					</c:if>
				</div>
			</c:forEach> 

			<!-- 평가창 -->

		</div>
	</div>
</div>
</c:if>

<div class="container_x">

	<c:if test="${lb.univ_name==sessionScope.univ_name}">
		<c:import url="/WEB-INF/views/content/lecture/rating_sheet.jsp"></c:import>
	</c:if>
	<c:if test="${lb.univ_name!=sessionScope.univ_name}">
		<div style="display:block">해당 학교 학생만 평가가 가능합니다.</div>
	</c:if>
</div>

<!-- 로그인된 아이디가 이 학교 아이디이면  나타남.-->
<%-- <c:if test="${checked== true}">
	<div class="container">
		<%@include file="rating_sheet.jsp"%>
	</div>
</c:if> --%>

<!-- 
</body>
 -->