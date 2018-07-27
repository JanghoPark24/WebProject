<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<head>
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/theLecture_icon.ico" >
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width"/>
    
   
	<title>타이틀 넣기</title>
</head>
<body>
	
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="navbar"/>
	<div id ="container">
	
		<div id ="content">
		  <tiles:insertAttribute name="body"/>
		  <div id="content_bottom">
			<tiles:insertAttribute name="comment"/>
		  </div>
		</div>
	</div>
	<tiles:insertAttribute name="footer"/>
	
</body>

