<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<meta charset="utf-8">
<head>

	<div>
		<div>당신은 ${lb.univ_name}의 학생입니다</div>
		<form id="question_form" action="answerQuestion.do">
			<input type="hidden" name="univ_name" value="${lb.univ_name}"/>
			<input type="hidden" name="question_version" value="${lb.question_version}"/>
			
			<input type="hidden" name="lecture_id" value="${lb.lecture_id}"/>
			<c:forEach var="qb" items="${qb_list}" varStatus="loop">
					
			<br>	
			<div class="" style="padding-top: 20px;">
				질문  ${loop.index+1}) <label for="question_value${loop.index}">${qb.question_content}</label></div>
				<input name="question_content" id="question_content${loop.index}" type="hidden" value="${qb.question_content}"/>
				<input name="question_value" id="question_value${loop.index}" type="hidden" value=""/>
				
				<div id="rating_${loop.index}"
				style="width: 100%; font-size: 2em"
				data-rateit-min="0" data-rateit-max="6"
				data-rateit-resetable="false"
				>
				</div>
				
			</c:forEach>
			
			<div id="button_block">
				<div align="center">
					<button type="button" class="btn btn-primary" id="answerQuestion">완료</button>
				</div>
			</div>
		</form>
	</div>
<script type="text/javascript">
	$(function() {
		<c:forEach var="qb" items="${qb_list}" varStatus="loop">

		$('#rating_${loop.index}').rateit({
			step : 1,
			mode : 'font',
			backingfld : '#question_value${loop.index}'
		});

		</c:forEach>
	});
</script>


