<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>서비스 소개</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cce84c99134512f356e490e1afb23269"></script>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>


	<div class="container">
		<div>
			<h2>The Lecture</h2>
			<h4>청춘의 꽃을 피우는 즐거운 대학생활 The Lecture 가 함께합니다!</h4>
		</div>

		<div align="center">
			<img src="main/../images/theLecture2.svg" style="height: 200px;"
				align="bottom">
		</div>
		<div align="center">
			<p>The Lecture는 여러분의 대학생활을 더욱 더 보람차고 유익하게 보낼 수 있도록 다양한 정보를 제공 하고
				있습니다</p>
			<p>우리 모두가 만들어가는 커뮤니티 사이트 그것이 저희 The Lecture가 꿈꾸는 목표와 방향입니다</p>
			<p>The Lecture는 신뢰를 바탕으로 한 정직하고 확실한 정보를 여러분들에게 제공할 것을 약속드립니다</p>
		</div>

		<table class="table table-bordered">

			<tbody>
				<tr class="info">
					<th>설립연도</th>
					<td>2018-07-18</td>

				</tr>
				<tr class="info">
					<th>본사위치</th>
					<td>서울시 강남구 테헤란로</td>
				</tr>
				<tr class="info">
					<th>주요서비스</th>
					<td>정보공유</td>
				</tr>
				<tr class="info">
					<th>전체인력</th>
					<td>5명</td>
				</tr>
				<tr class="info">
					<th>대표전화</th>
					<td>010-xxxx-xxxx</td>
				</tr>
				<tr class="info">
					<th>대표메일</th>
					<td>xxxx@gmail.com</td>
				</tr>

			</tbody>
		</table>
	</div>
	<div class="container">
		<div class="jumbotron" id="map" style="height: 400px;"></div>
		<script>
			var container = document.getElementById('map');
			var options = {
				center : new daum.maps.LatLng(37.499621, 127.0305114),
				level : 3
			};

			var map = new daum.maps.Map(container, options);
			var markerPosition = new daum.maps.LatLng(37.499621, 127.0305114);
			var marker = new daum.maps.Marker({
				position : markerPosition
			});
			marker.setMap(map);
			var iwContent = '<div style="padding: 5px;">본사 위치</div>', 
			iwPosition = new daum.maps.LatLng(33.450701, 126.570667); 
			var infowindow = new daum.maps.InfoWindow({
				position : iwPosition,
				content : iwContent
			});
			infowindow.open(map, marker);
		</script>
	</div>
</body>
</html>