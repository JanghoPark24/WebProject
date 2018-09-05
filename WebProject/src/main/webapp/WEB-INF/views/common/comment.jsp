<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<c:set var = "now" value = "<%= new java.util.Date() %>" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today_date" />

<link rel="stylesheet" href="${path}/css/comment.css">
<script>

$(function(){
	
})

</script>
<script>

	/*
		좋아요 기능	
	*/
	function thumbs_up_down(thumbs, reply_num) {
		alert(thumbs)
		$.ajax({
			url : "thumbsUpAndDown.do?thumbs=" + thumbs + "&reply_num="
					+ reply_num,
			dataType : "json",
			success : function(likes) {
				
				if(likes==-3){
					/* 자기 자신을 추천 했을 때*/	
				}else if(likes==-2){
					alert("로그인을 해주십시오")
				}else if(likes==-1){
					alert('좋아요 실패')
				}else if(likes==0){
					document.getElementById('like_of_'+reply_num)
					.innerText = "";
				}else{
					document.getElementById('like_of_'+reply_num)
					.innerText = likes+"명이 좋아합니다.";
				}
			}
		})
	}

	/*
		lecture id에 따라 커멘트 불러옴		
	 */
	function getAllCommentsById(lecture_id) {

		$.ajax({
			url : "getAllCommentsByLectureId.do?",
			dataType : "json",
			type : 'GET',
			data : {
				l_id : lecture_id
			},
			success : function(data, response) {

				var txt2 = JSON.stringify(data);
				alert(txt2)

			}
		})
	}
	function addComment(selectedId) {
		//			var comment_info = $("#submit_comment_form").serialize();

		//선택된 곳에서 가장 가까운  form 태그 선택
		var frm = $("#" + selectedId).closest('form');
		var comment_info = frm.serialize();

		console.log(comment_info);
		$.ajax({
			url : "addandGetLectureComment.do?" + comment_info,
			dataType : "json",
			type : 'GET',
			success : function(data, response) {

				txt1 = JSON.stringify(data)
				//alert(txt1)
				if (data.email == "null") {
					alert('댓글을 작성하려면 로그인이 필요합니다.')
					return;

				}/* else if(data.){
													    				
													    			}
				 */
				location.reload();
			}
		})
	}
	$(function() {
		//댓글 달기
		$("* .submit_comment").on("click", function() {
			addComment(this.id);
		});
		$("* .comment_area").keypress(function(e) {
			if (e.which == 13) {
				addComment(this.id);
				/* var commentButton = $("#"+selectedId).closest('button[type=button]');	
				commentButton. */
			}
		});
		$(".thumbs_up").on("click",function(){
			thumbs_up_down('up',this.id);
		});
		$(".thumbs_down").on("click",function(){
			thumbs_up_down('down',this.id);
		});
	})
</script>
<script>
	
</script>


<input type="hidden" id="comment_level">

<c:if test="${not empty countOfComment}">
			댓글 개수: ${countOfComment}
	</c:if>

<!--댓글로-->
<div class="form-group">
	<form id="submit_comment_form" name="submit_comment_form">

		<input type="hidden" name="lecture_id" value='${lb.lecture_id}'>
		<textarea name="content" id="comment_area"
			class="comment_area form-control" rows="5" class="comment"
			width="100%" placeholder="공개 댓글 추가"></textarea>
		<div class="reply-button-container">

			<c:if test="${sessionScope.email == null}">
				<button id="login_for_comment" type="button" class="button_block"
					onclick="location.href='${path}/loginForm.do'">로그인</button>
			</c:if>
			<button type="reset" class="button_block">취소</button>
			<button id="submit_comment" type="button"
				class="submit_comment button_block">댓글 작성</button>
		</div>
	</form>
</div>
<!-- comment의 내용 개수 -->


<!-- comment 나타내기 -->
<!-- comment 있을 경우-->
<c:choose>
	<c:when test="${empty comment_list}">댓글이 아직 작성되지 않았습니다.</c:when>
	<c:otherwise>
		<div class="reply-container container">

			<div class="reply-cotainer-header">댓글</div>
			<!--container 하나에 하나의 댓글 대댓글이 모두 들어감. -->
			<c:forEach var="comment" items="${comment_list}">
				<div class="reply-container-content">
					<div class="author-thumbnail">
						<div class="author-picture">
							<!--후에 백엔드에서 뽑아서 들어갈 예정-->
							<a href="#"> <img
								src="<%=request.getContextPath()%>/displayFile.do?fileName=${comment.uploadedFile}&directory=profile"
								width='100%' height="auto">
							</a>
						</div>

					</div>
					<div class="reply-body">
						<div class="reply">
							<ul class="list-group">
								<li class="list-group-item">
								<div class="comment_content">
									<a href="">${comment.nickname}</a> 
									${comment.content}
								</div>
								<div class="comment_date">
								
									<!-- 오늘과 작성일자의 며칠 차이인지 구함 -->
									<fmt:parseNumber
								    value="${(now.time - comment.reg_date.time) / (1000*60*60*24) }"
								    integerOnly="true" var="date_difference"/>
								    
								    
									작성일자 
									<fmt:formatDate value="${comment.reg_date}" pattern="yyyy-MM-dd" var="commented_date" />
									
									<!-- 작성일자에 따른 -->
									<c:choose>
										<c:when test="${today_date ==commented_date }">
											<fmt:parseNumber value="${(now.time - comment.reg_date.time) }"
											 integerOnly="true" var="passed_seconds"/>
											 
											 <c:choose>
											 	<c:when test="${(passed_seconds/60) <60 }">
											 		${(passed_seconds/60)}분 전
											 	</c:when>
											 	<c:when test="${(passed_seconds/(60*24)) <12 }">
											 		${(passed_seconds/60/24)}시간 전
											 	</c:when>
											 	<c:otherwise>
													<fmt:formatDate value="${comment.reg_date}" pattern="오늘 aa HH:mm"  />
											 	</c:otherwise>
											 </c:choose>
											 
										</c:when>
										
								
										<c:when test="${(date_difference <2)}">
											어제
										</c:when>
										<c:when test="${(date_difference <10)}">
											${date_difference}일 전
										</c:when>
										
										<c:otherwise>
											<fmt:formatDate value="${comment.reg_date}" pattern="yyyy년 MM월 dd일"  />
										</c:otherwise>
									</c:choose>
								</div>
								</li>
								<li class="list-group-item">
								<!-- 좋아요 기능 -->
									<a id="${comment.reply_num}" class="glyphicon glyphicon-thumbs-up thumbs_up" href="javascript:;">${num}</a>
									<a id="${comment.reply_num}" class="glyphicon glyphicon-thumbs-down thumbs_down" href="javascript:;"></a>&nbsp; 
									<a id="like_of_${comment.reply_num}">
									
									<c:if test="${comment.likes != 0}">
										${comment.likes}명이 좋아합니다.
									</c:if>
									
									</a>
									<a class="re-reply" href="javascript:;"> 답글달기 </a>


									<form class="re-reply-form">
										<!--collapse뒤의 아이디는 jsp에서 불러옴-->
										<div class="form-group collapse" id="collapse1">
											<hr />
											<input type="hidden" name="lecture_id"
												value='${lb.lecture_id}'> <input type="hidden"
												name="depth" value='${comment.depth+1}'> <input
												type="hidden" name="ref" value='${comment.reply_num}'>
											<input type="hidden" name="reply_order"
												value='${comment.reply_order}'>
											<textarea name="content" id="reply_comment_area${comment.reply_num}"
												class="comment_area form-control" rows="5" class="comment"
												width="100%" placeholder="공개 댓글 추가"></textarea>
											<div class="reply-button-container">
												<c:if test="${sessionScope.email == null}">
													<button id="login_for_comment" type="button"
														class="button_block"
														onclick="location.href='${path}/loginForm.do'">로그인</button>
												</c:if>
												<button type="reset" class="button_block">취소</button>
												<button type="button" id="submit_reply_comment${comment.reply_num}"
													class="submit_comment button_block">댓글 작성</button>
											</div>
										</div>
									</form></li>


							</ul>
						</div>
						<!--답글 : 답글이 있으면 개수 fetch해서 불러옴-->

						<c:if test="${not empty re_reply_list}">
							<div class="re-reply">
								<!--답글 보기, 숨기기: 답글이 있으면 답글 보기 있음. 답글 보기 누르면 답글 보여짐-->


								&nbsp;<a class="show-hide-replies" href="javascript:;">답글 보기</a>
								<br /> <br />

								<div class="re-reply-container">

									<!--reply container하나에 댓글에 대한 대댓글이 모두 들어감. -->
									<c:forEach var="re_reply" items="${re_reply_list}">
										<c:if test="${re_reply.ref == comment.reply_num}">
											<div class="reply-container-content">
												<div class="author-thumbnail">
													<div class="author-picture">
														<a href="#"> 
															<c:if test="${not empty re_reply.uploadedFile }">
																<img src="<%=request.getContextPath()%>/displayFile.do?fileName=${re_reply.uploadedFile}&directory=profile"
																	width='100%' height="auto">
															</c:if> <c:if test="${empty re_reply.uploadedFile}">
																<img src="https://via.placeholder.com/30x30"
																	width='100%' height="auto">
															</c:if>
														</a>
													</div>

												</div>
												<div class="reply-body">

													<div class="reply">

														<ul class="list-group">
															<li class="list-group-item">
																
																<div class="comment_content">
																	<a href="">${re_reply.nickname}</a>
																	${re_reply.content}
																</div>
																<div class="comment_date">
																
																	<!-- 오늘과 작성일자의 며칠 차이인지 구함 -->
																	<fmt:parseNumber
																    value="${(now.time - comment.reg_date.time) / (1000*60*60*24) }"
																    integerOnly="true" var="date_difference"/>
																    
																    
																	작성일자 
																	<fmt:formatDate value="${comment.reg_date}" pattern="yyyy-MM-dd" var="commented_date" />
																	
																	<!-- 작성일자에 따른 -->
																	<c:choose>
																		<c:when test="${today_date ==commented_date }">
																			<fmt:formatDate value="${comment.reg_date}" pattern="오늘 HH:mm"  />
																		</c:when>
																		
																		<c:when test="${(0< date_difference)  and (date_difference <10)}">
																			${date_difference}일 전
																		</c:when>
																		
																		<c:otherwise>
																			<fmt:formatDate value="${comment.reg_date}" pattern="yyyy년 MM월 dd일"  />
																		</c:otherwise>
																	</c:choose>
																</div>
								
																
															</li>
																
																
															<li class="list-group-item">
																<!-- 좋아요 기능 -->
																
																
																<a id="${re_reply.reply_num}" class="glyphicon glyphicon-thumbs-up thumbs_up" href="javascript:;">${num}</a>
																<a id="${re_reply.reply_num}" class="glyphicon glyphicon-thumbs-down thumbs_down" href="javascript:;"></a>&nbsp; 
																<a id="like_of_${re_reply.reply_num}">
																	
																	<c:if test="${re_reply.likes!=0}">
																		${re_reply.likes}명이 좋아합니다.
																	</c:if>
																	
																</a>
																<a class="re-reply" href="javascript:;"> 답글달기</a>

																<form class="re-reply-form">
																	<input type="hidden" name="lecture_id"
																		value='${lb.lecture_id}'> <input type="hidden"
																		name="depth" value='${comment.depth+1}'> <input
																		type="hidden" name="ref" value='${comment.reply_num}'>
																	<input type="hidden" name="reply_order"
																		value='${re_reply.reply_order}'>
																	<div class="form-group1">
																		<hr />
																		<textarea class="form-control comment" rows="5" id="reply_comment_area${comment.reply_num}"
																			name="content" width="100%" placeholder="답글쓰기"></textarea>
																		<div class="reply-button-container">
																			<button type="reset" class="button_block">취소</button>
																			<button id="submit_comment${re_reply.reply_num }" type="button"
																				class="submit_comment button_block">댓글 작성</button>
																		</div>
																	</div>
																</form></li>


														</ul>
													</div>
													<!--답글 : 답글이 있으면 개수 fetch해서 불러옴-->
													<div class="re-reply">
														<!--답글 보기, 숨기기: 답글이 있으면 답글 보기 있음. 답글 보기 누르면 답글 보여짐-->

													</div>
												</div>

											</div>
										</c:if>
									</c:forEach>
									<!-- reply container end -->
								</div>


							</div>
						</c:if>
					</div>

				</div>
			</c:forEach>
		</div>

	</c:otherwise>
</c:choose>

<!-- comment 없을 경우-->






