<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
	<script>
		function reply(){
			
		}
		$(function(){
			$(".button_block").on("click",function(){
				
			})
		})
	</script>






<!--댓글로-->
<form id="top-reply container">
	<div class="form-group">
		<textarea class="form-control" rows="5" class="comment" width="100%"
			placeholder="공개 댓글 추가"></textarea>
		<div class="reply-button-container">
			<button type="reset" class="button_block">취소</button>
			<button class="button_block">댓글 작성</button>
		</div>
	</div>
</form>
<div class="reply-container container">
	<div class="reply-cotainer-header">댓글</div>
	<!--container 하나에 하나의 댓글 대댓글이 모두 들어감. -->
	<div class="reply-container-content">
		<div class="reply-body">
			<div class="reply">
				<ul class="list-group">
					<li class="list-group-item"><a href="">작성자명</a> 댓글 coment
						Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim
						tenetur deserunt necessitatibus suscipit consectetur voluptates
						soluta vitae cupiditate voluptatum. Neque facere sint porro
						incidunt excepturi molestias ratione laboriosam, possimus sunt!</li>
					<li class="list-group-item"><a
						class="glyphicon glyphicon-thumbs-up" href="#">${num}</a> <a
						class="glyphicon glyphicon-thumbs-down" href="#"></a> &nbsp; <a
						class="re-reply" href="javascript:;"> 답글달기 </a>


						<form class="re-reply-form">
							<!--collapse뒤의 아이디는 jsp에서 불러옴-->
							<div class="form-group collapse" id="collapse1">
								<hr />
								<textarea class="form-control" rows="5" width="100%"
									placeholder="답글쓰기"></textarea>
								<div class="reply-button-container">
									<button type="reset" class="button_block">취소</button>
									<button class="button_block">댓글 작성</button>
								</div>
							</div>
						</form></li>


				</ul>
			</div>
			<!--답글 : 답글이 있으면 개수 fetch해서 불러옴-->
			<div class="re-reply">
				<!--답글 보기, 숨기기: 답글이 있으면 답글 보기 있음. 답글 보기 누르면 답글 보여짐-->


				&nbsp;<a class="show-hide-replies" href="javascript:;">답글 보기</a> <br />
				<br />

				<div class="re-reply-container">
					<!--reply container하나에 댓글에 대한 대댓글이 모두 들어감. -->
					<div class="reply-container-content">

						<div class="reply-body">

							<div class="reply">
								<ul class="list-group">
									<li class="list-group-item"><a href="">작성자명</a> 댓글 coment
										Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim
										tenetur deserunt necessitatibus suscipit consectetur
										voluptates soluta vitae cupiditate voluptatum. Neque facere
										sint porro incidunt excepturi molestias ratione laboriosam,
										possimus sunt!</li>
									<li class="list-group-item"><a
										class="glyphicon glyphicon-thumbs-up" href="#">${num}</a> <a
										class="glyphicon glyphicon-thumbs-down" href="#"></a> &nbsp; <a
										class="re-reply" href="javascript:;"> 답글달기 </a>

										<form class="re-reply-form">

											<div class="form-group1">
												<hr />
												<textarea class="form-control" rows="5" class="comment"
													width="100%" placeholder="답글쓰기"></textarea>
												<div class="reply-button-container">
													<button type="reset" class="button_block">취소</button>
													<button class="button_block">댓글 작성</button>
												</div>
											</div>
										</form></li>


								</ul>
							</div>
							<!--답글 : 답글이 있으면 개수 fetch해서 불러옴-->
							<div class="re-reply">
								<!--답글 보기, 숨기기: 답글이 있으면 답글 보기 있음. 답글 보기 누르면 답글 보여짐-->

								&nbsp;<a class="show-hide-replies" href="javascript:;">답글 보기</a>


							</div>
						</div>
						<div class="author-thumbnail">
							<div class="author-picture">
								<!--후에 백엔드에서 뽑아서 들어갈 예정-->
								<a href="#"> <img src="/images/person_example.jpg" />
								</a>
							</div>

						</div>
					</div>
				</div>


			</div>
		</div>
		<div class="author-thumbnail">
			<div class="author-picture">
				<!--후에 백엔드에서 뽑아서 들어갈 예정-->
				<a href="#"> <img src="/images/person_example.jpg" />
				</a>
			</div>

		</div>
	</div>

</div>



