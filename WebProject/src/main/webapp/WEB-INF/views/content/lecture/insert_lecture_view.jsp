<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" >
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!--별점-->
    <link rel="stylesheet" href="./css/rating/rateit.css">
    <link rel="stylesheet" href="./css/review.css">
    <link rel="stylesheet" media="screen and (min-device-width: 320px) and (max-device-width: 1100px)" href="./css/review_responsive.css">
    
    
   
    <title>강의 평가</title>

</head>
<body>
    <!-- 평균 점수 ${average}로 불러옴-->
    
            <div id="content_header">
                <h3>강의 평가 만들기</h3>
            </div>
            <div id ="content_top">
                
            </div>
            
            <div id="content_middle">
                <h4>정보</h4>
                <div>
                	학교:
                	<form action="find_existing_info.do">
                		<input id="univ_name" type="text" onkeyup=""/>
                	</form>
                </div>
                <div>
                	전공:<input id="major" type="text" />
                </div>
                <div>
                	학기:<input id="semester" type="text" />
                </div>
                <div>
                	강의코드:<input id="lecture_code" type="text" />
                </div>
                
                <div>
                	강의 이름:<input id="lecture_name" type="text" />
                </div>
                
                <div>
                	교수명:<input id="professor" type="text" />
                </div>
				<div>
					질문지 선택
					<div></div>
				</div>                
             
            </div>
            
  
    <script>
    
    </script>
</body>
