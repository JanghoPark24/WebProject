<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<%-- <c:set var="lec_List" value="${sessionScope.lectureList}"></c:set> --%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<link rel="stylesheet" href="${contextPath}/css/lecture/lectureList.css">
<link rel="stylesheet" href="${contextPath}/css/rating/rateit.css">
<link rel="stylesheet" href="${contextPath}/css/review.css">
<script src="${contextPath}/js/rating/jquery.rateit.js"></script>
<script src="${contextPath}/js/review.js" charset="utf-8"></script>


<body>





	<div class="container text-center">
		<h2 align=center>강의 목록</h2>
		<div class="container text-center">
			<!-- 검색 -->
			<form class="form-group" action="lectureList.do"
				style="text-align: center;">
				<input type="hidden" name="currentPage" value="1">

				<table class="searchform" style="margin: auto;">
					<tr>
						<td><select name="keyword" class="form-control"
							style="height: 34px; width: 80 em">
								<option value="all"
									<c:if test="${page_index.keyword=='all' }">selected</c:if>>전체</option>
								<option value="univ"
									<c:if test="${page_index.keyword=='univ' }">selected</c:if>>대학</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="강의검색" id="search" name="search" size="90%"
							style="height: 34px;" value="${page_index.search}"></td>
						<td>
							<button class="btn btn-default" type="submit"
								style="height: 34px;">

								<i class="glyphicon glyphicon-search"></i> 검색
							</button>
						</td>
					</tr>
				</table>
			</form>

			<table class="table" id="" align=center width=800>

				<tr id="lectureList_columns">
					<td>대학/전공</td>

					<td>학년-학기</td>
					<td>강의명[강의코드]</td>

					<td>교수</td>

					<td>평점</td>

				</tr>


				<tr class="lectureList_content">
					<td>대학</td>
					<td><a href="review.do"> 강의명 </a></td>
					<td>수강학기</td>


					<td>강의코드</td>

					<td class="star_rating">
						<div data-productid="313" class="rateit" data-rateit-mode="font"
							data-rateit-value="2.5" data-rateit-readonly="true"
							style="font-size: 100%;"></div>
						<div style="clear: both;">2.5</div>


					</td>

				</tr>
				<c:if test="${empty lectureList  }">
					<tr class="lectureList_content">
						<td colspan="100%">올라온 강의가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty lectureList}">
					<c:forEach items="${lectureList}" var="lecture">
						<tr class="lectureList_content">

							<td>${lecture.univ_name}/${lecture.major}</td>

							<td>${lecture.grade}-${lecture.semester}</td>
							<td><a
								onclick="location.href='review.do?lecture_id=${lecture.lecture_id }'">
									<div>${lecture.lecture_name}</div>
									<p>[${lecture.lecture_code }]</p>
							</a></td>

							<td>${lecture.professor}</td>

							<td class="star_rating" style="text-align: center;">
								<div data-productid="313" class="rateit" data-rateit-mode="font"
									data-rateit-value="${lecture.total_avg_score}"
									data-rateit-readonly="true" style="font-size: 100%;">
									${lecture.total_avg_score}</div>

								<div style="clear: both"></div>

								<div style="color: grey; font-size: 0.8em;">
									(${lecture.rating_count}명이 평가함)</div>
							</td>
							<c:if test="${sessionScope.grade=='master'}">
								<td>
									<form id="form_up_del">
										<input type="hidden" name="lecture_id" value="${lecture.lecture_id}">
										<button onclick="updateLectureView.do?lecture_id=${lecture.lecture_id}">update</button>
										<button onclick="deleteLecture.do?lecture_id=${lecture.lecture_id}">delete</button>
									</form>
								</td>
							</c:if>

						</tr>

					</c:forEach>

				</c:if>
				<tr>
					<td colspan="100%" style="text-align: right;"><c:if
							test="${empty page_index}">0</c:if> <c:if
							test="${not empty page_index}">${page_index.countOfRow}</c:if> 개의
						결과가 검색 되었습니다.</td>


				</tr>


			</table>
		</div>
		<!-- master일 경우에만 보여줌 -->
		<c:if test="${sessionScope.grade=='master' }">
			<div id="buttons_for_write">
				<a href="insertLectureView.do">
					<button type="button" class="btn btn-primary">강의 입력</button>
				</a>
			</div>
		</c:if>
		<div class="container text-center">
			<!-- 페이지 인덱스가 전해져야만 있음. -->
			<c:if test="${not empty page_index}">

				<ul class="pagination">

					<c:if test="${ page_index.currentPage>1}">
						<li><a
							href="lectureList.do?currentPage=1<c:if test='${not empty page_index.keyword}'>&search=${page_index.search}&keyword=${page_index.keyword}</c:if>">맨처음</a></li>
						<li><a
							href="lectureList.do?currentPage=${page_index.firstIndex}<c:if test='${not empty page_index.keyword}'>&search=${page_index.search}&keyword=${page_index.keyword}</c:if>">이전</a></li>
					</c:if>
					<c:forEach varStatus="index" begin="${page_index.firstIndex}"
						end="${page_index.lastIndex}">
						<li><a
							href="lectureList.do?currentPage=${index.count}<c:if test='${not empty page_index.keyword}'>&search=${page_index.search}&keyword=${page_index.keyword}</c:if>">${index.count}</a></li>
					</c:forEach>
					<c:if test="${page_index.currentPage < page_index.totalPage}">
						<li><a
							href="lectureList.do?currentPage=${page_index.lastIndex+1}<c:if test='${not empty page_index.keyword}'>&search=${page_index.search}&keyword=${page_index.keyword}</c:if>">다음</a></li>
						<li><a
							href="lectureList.do?currentPage=${page_index.totalPage}<c:if test='${not empty page_index.keyword}'>&search=${page_index.search}&keyword=${page_index.keyword}</c:if>">맨끝</a></li>
					</c:if>

				</ul>
			</c:if>
		</div>

	</div>

</body>
</html>