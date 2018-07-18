<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/navbar.jsp"%>
<!DOCTYPE html>
<head>
<!--자동완성기능-->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#search" ).autocomplete({
      source: availableTags
    });
  } );
  </script>
<style >
/* 타이틀이미지 */
@media screen and (min-width:600px) {
	#titleImg {
		width: 470px;
	}
}
</style>
<!-- 개인(김준) css-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/stylej01.css" />
	<title>The Lecture  :: 대학 강의 길라잡이</title>
</head>

<body>
	<div class="container text-center">
		<div class="jumbotron" id="homebox">
			<div class="container" id="titleImg">
				<img src="<%=request.getContextPath()%>/images/theLecture_reverse.svg"style="width:100%">
			</div>
			<br>
			<p>대학 강의 길라잡이</p><br>
			<form class="form-group" action="/action_page.php"
				style="text-align: center;">
				<table class="searchform" style="margin: auto;">
					<tr>
						<td><select class="form-control" style="height: 34px;">
								<option value="all">전체</option>
								<option value="univ">대학</option>
						</select></td>
						<td><input type="text" class="form-control" placeholder="검색"
							id="search" size="100%" style="height: 34px;"></td>
						<td>
							<button class="btn btn-default" type="submit"
								style="height: 34px;">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>



</body>

<%@ include file="../common/footer.jsp"%>
