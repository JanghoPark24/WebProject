<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" >
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!--별점-->
    <link rel="stylesheet" href="${path}/css/rating/rateit.css">
    <link rel="stylesheet" href="${path}/css/review.css">
    <link rel="stylesheet" media="screen and (min-device-width: 320px) and (max-device-width: 1100px)" href="./css/review_responsive.css">
    
    <script src="${path}/js/lecture/question.js"></script>
   
    <title>강의 평가</title>
    <style>
    	#content_middle div{
    		padding:10px;
    		clear:both;
    	}
    	#content_middle div > p{
    		float:left;
    		width:80px;
    	}
    	
    	/* .questions{
    		margin:0 auto;
    		border:1px solid gray;
    	} */
    	
    	#question_button > button{
    		
    	}
    	#lectureInfo td{
 	   		vertical-align:top;
    	}
    	/*font awsome 색깔*/
    	.x_icon_color {
		  color: #dddddd;
		}
		.x_icon_color:hover {
			color:red;
		}
		    	
    </style>
    <!-- 자동 완성 기능 -->
    <script>
    var tags = []
    
    //id값에 대한 url값 찾기
    function findURLForAutoComplete(input_id){
    	if(input_id=='univ_name') return 'autocomplete_univ.do';
    
    }
    function makeAutoComplete(input_id){
    	
    	$.ajax({
    		url : findURLForAutoComplete(input_id),
    		dataType : "json",
    		success : 
    			function(data, response) {
    			$.each(data, function(index, value) {
    				tags.push(value);
    			});
    		}
    	})
    	$('#'+input_id).autocomplete({
    		source : tags
    	});
    }
    
    
    $(function() {
    	
    	
    });

    </script>

	
	<!-- 클릭 시 -->
	<script>
		$(function(){
			
			//질문 선택지 
			$("#qSelect").on("change",function(){
				searchFunction();
			})
			
			
			$(document).on("click","#questionModal #addQuestion",function(){
				
				addQuestion();
			})
			
			$(document).on("click","#questionModal i",function(){
				
				removeQuestion();
			})
			
			$(document).on("click","#updateQuestions",function(){
				
				updateQuestions();
			})
			
		})
	
	</script>
</head>
<body>
    	
    <!-- 평균 점수 ${average}로 불러옴-->
    	
    		<form id="updateQuestionsForm">
    		</form>
            <div id="content_header">
                <h3>강의 평가 만들기</h3>
            </div>
            <div id ="content_top">
                
            </div>
            
            <div id="content_middle">
               
                <h4>정보</h4>
                <form id="lectureInfo_form" method="post" accept-charset="utf-8">
	                <table id="lectureInfo">
	                <tr>
						<td>                
	                	  <p>학교:</p>
	                	</td>
	                	<td>
	                	  <input id="univ_name" type="text" onkeydown="makeAutoComplete('univ_name')"/>
	                	</td>
	                	<td>
	                	  <a data-toggle="modal" data-target="#schoolModal">학교 추가하기</a>
	                	</td>
	                </tr>
		            
	            
	                <tr>
	                	<td>
	               		 <p>교수명:</p>
	               		</td>
	               		<td>
	               		 <input id="professor" type="text" />
	               		</td>
	               		<td></td>
	               	</tr>
	               
	               
	              
	                <tr>
	                	<td><p>전공:</p></td>
	                	<td>
	                	 <input id="major" type="text" />
	                	</td>
	                	<td></td>
	                </tr>
	                
	                <tr>
	                	<td>
	                	  <p>학기:</p>
	                	</td>
	                	<td>
	                	  <input id="semester" type="text" />
	                	</td>
	                	<td></td>
	                </tr>
	                <tr>
	                	<td><p>강의코드:</p></td>
	                	<td>
	                	 <input id="lecture_code" type="text" />
	                	</td>
	                	<td></td>
	                </tr>
	                
	                <tr>
	                	<td>
	                	 <p>강의 이름:</p>
	                	</td>
	                	<td>
	                	 <input id="lecture_name" type="text" />
	                	</td>
	                	<td></td>
	                </tr>
	                
	                
					<tr id='questionnaire' >
						<td>
						  <p>질문지 선택</p>
						</td>
						<td>
							<select id="qSelect">
							  <option value="0">질문지를 선택하세요</option>
							  <c:if test="${not empty questionVersions }">
							  	<c:forEach var="questionVersion" items="${questionVersions}">
								<option value="${questionVersion}" >${questionVersion}</option>
								</c:forEach>
							  </c:if>
							</select>
							
							<div id='questions'>
								
							</div>
							
							
						</td>
						<td>				
							<a data-toggle="modal" data-target="#questionModal">질문지 추가</a> | 
							<a onclick="check_delete()">질문지 삭제</a>|
							<a onclick="check_update()">질문지 수정</a>
						</td>
					  </tr> 
					</table>               
				</form>
			 
             	<!-- 학교 추가 Modal -->
             	<jsp:include page="school_modal.jsp"></jsp:include>
             	<!-- 질문지 추가 Modal -->
             	<jsp:include page="question_modal.jsp"></jsp:include>
			 </div>
     
</body>
