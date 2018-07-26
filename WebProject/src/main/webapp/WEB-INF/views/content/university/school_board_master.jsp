<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/sb_style.css" />


<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"> <!-- 반응형 메타 태그 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>여름엔 학원</title>
</head>
	<body>
<%-- 		
		<div class="container" ></div>
		<div name="contents" id="contents" method="post">
			<form  class="jumbotron">
		<div>
			<tr>
				
		<div class="container text-center" padding: 10px;>
	<div class="jumbotron bgim"  style="background-image: url('<%=request.getContextPath()%>/images/kd.jpg');">	
			<h2>운영자 공지모드</h2><br>
				<img id="img1" src="<%=request.getContextPath()%>/images/kd.jpg"style="width:780px; height:150px" ;>
					</div>
			<div id="contents2">
				<td><select id="select" name="select">
					<option value="volvo">전체공지사항</option>
					<option value="saab">학교공지사항</option>
					<option value="opel">게시판공지사항</option>
					</select> <input id="subject" type="text" placeholder="제목을 입력하세요"required="required" maxlength="40"></td>
						</tr>
				<tr><td>
								
					<textarea id="m_subject"name="m_subject"
					 placeholder="내용을 입력해주세요.(2000자 이내)" required="required"
						maxlength="2000"></textarea></td>
						</tr>
					</div>
					<div id="button1" name="button1">
						<tr>
							<td>
								<button class="btn btn-info btn-lg icon" name="icon1" id="icon1"
									type="Reset">
									<i class="glyphicon glyphicon-paperclip"></i>파일 첨부
								</button>
								<button class="btn btn-info btn-lg icon" name="icon2" id="icon2"
									type="Reset">
									<i class="glyphicon glyphicon-picture"></i>이미지 첨부
								</button>
								<button class="btn btn-info btn-lg icon" name="icon3" id="icon3"
									type="Reset">
									<i class="glyphicon glyphicon-facetime-video"></i>동영상 첨부
								</button>
								<button class="btn btn-info btn-lg icon" id="icon4" type="Reset"
									onclick="">
									<i class="glyphicon glyphicon-trash"></i>취소</button>
							</td>
						</tr>
					</div>
					<div id="button2">
						<button name="icon5" type="submit" value="HTML" class="btn btn-info btn-lg button_write">글작성</button>

					</div> --%>
			<!-- 	</form>
			</div>
		</div> -->
		<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" required="required" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="bbscontent" maxlength="2048" required="required" style="height: 350px; "></textarea></td>
					</tr>
					
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
		</div>
	</div>
		
		
		
		
	</body>
<!-- </center> -->

</html>

