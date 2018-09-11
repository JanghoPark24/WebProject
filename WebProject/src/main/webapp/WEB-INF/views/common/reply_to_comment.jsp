<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="re-reply" id="reply_of_${comment.reply_num}">
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
								<c:if test="${re_reply.is_deleted=='n'}">
									<c:if test="${not empty re_reply.uploadedFile }">
										<img src="<%=request.getContextPath()%>/displayFile.do?fileName=${re_reply.uploadedFile}&directory=profile"
											width='100%' height="auto">
									</c:if> <c:if test="${empty re_reply.uploadedFile}">
										<img src="https://via.placeholder.com/30x30"
											width='100%' height="auto">
									</c:if>
								
								</c:if>
							</a>
							
						</div>
					</div>
					<div class="reply-body">

						<div class="reply">

							<ul class="list-group" >
							<c:if test="${re_reply.is_deleted=='y'}">

								<li class="list-group-item deleted_comment_content" id="comment_${re_reply.reply_num}"
								style="line-height:4.5vw" >
									댓글이 삭제되었습니다.
								</li>
								
							</c:if>
							<c:if test="${re_reply.is_deleted=='n'}">
								<!-- 댓글 내용 부분 -->
								<li class="list-group-item" id="comment_${re_reply.reply_num}">
									<!-- 내용 -->
									<div class="comment_content">
										<a href="">${re_reply.nickname}</a>
										<p id="content_${re_reply.reply_num}"><c:out value="${re_reply.content}"/></p>
										
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
									<c:if test="${sessionScope.nickname== comment.nickname}">
									<div class="update_delete_container">
										<a onclick="comment_update(${re_reply.reply_num})">댓글 수정</a> &nbsp;
										<form id="delete_comment_${re_reply.reply_num}">
											<input type="hidden" name="reply_num" value="${re_reply.reply_num}">
											<input type="hidden" name="nickname" value="${re_reply.nickname}">
											<a id="delete_comment_anchor_${re_reply.reply_num}" class="delete_comment_anchor">댓글 삭제</a>
										</form>
									</div>
									</c:if>
									
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
									</form>
								</li>
							</c:if>

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
