<%@ page contentType="text/html; charset=UTF-8"%>
<style>
/* 네비게이션 바 */
.navbar {
	border-radius: 0px;
	border-color: #182842;
	background-color: #182842;
	box-shadow: 0px 3px 10px 1px black;
}

.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:focus,
	.navbar-inverse .navbar-nav>.open>a:hover {
	color: #fff;
	background-color: #101b2d;
}

.navbar-inverse .navbar-toggle {
	border-color: #101b2d
}

.navbar-inverse .navbar-toggle:focus, .navbar-inverse .navbar-toggle:hover
	{
	background-color: #101b2d
}

</style>



<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="home.do" class="navbar-left" id="logo"> <img
				src="<%=request.getContextPath()%>/images/theLecture2_white.svg"
				style="height: 50px; padding: 10px;">
			</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">The Lecture<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="service_profile.do">서비스 소개</a></li>
						<li><a href="#">개발정보</a></li>
						<li><a href="#">연락처</a></li>
					</ul></li>
				<li><a href="#">평가 게시판</a></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">커뮤니티 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="school_board_master.do">학교별 게시판</a></li>
						<li><a href="#">자유게시판</a></li>
					</ul></li>
				<li><a href="#"><span class="glyphicon glyphicon-phone-alt"></span>
						문 의</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="joinForm.do"><span
						class="glyphicon glyphicon-user"></span> register</a></li>
				<li><a href="loginForm.do"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
	</div>
</nav>