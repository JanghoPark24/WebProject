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
 
	
	<script>
	 /*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
    function autocomplete(arr){
    	
    }
   
	$(function(){	
		

		
		
		 <!-- 질문 불러오기  -->
		//질문지 선택
		function searchFunction(){
			var selectedVersion = $('#qSelect > option:selected').val();
			if(selectedVersion=='질문지를 선택하세요'){
				selectedVersion='';
			}
			
			selectQuestionnaire(selectedVersion);
		}
		/*question에 대한 */
		function selectQuestionnaire(questionVersion){
			
			
			$.post("selectQuetionnaire.do",{"questionVersion":questionVersion},function(questions){
				
				var questionId="";
				var output="";
				
				$.each(questions,function(index,item){
					questionId += "<input type='hidden' value=\'"+item.question_id+"\' />"
					output +="<div>"+"<p>"+(index+1)+"번</p>"+item.question_content+"</div>";
				})
				$("#questions").html(questionId+output);
			})
		}
		
		//질문지 추가하기
		function addQuestion(){
			
			//질문 개수
			var nextElement = $( ".questions > .question" ).length+1;
			//질문 최대 개수
			if(nextElement<11){
				//
				/* $("#questionModal .question[display= none]:eq(0)").show();
				 $("#questionModal i").addClass("fas fa-times-circle x_icon_color");
				 */
				$("#questionModal i").removeClass("fas fa-times-circle x_icon_color");
				$("#makeQuestion_body > .questions")
					.append("<div class='question'>"+nextElement+"번: "+
							"<input type=\'text\' name='questions["+(nextElement-1)+"]' value=\'\' placeholder=\'질문"+nextElement+"\'/> "+
							"<i class='fas fa-times-circle x_icon_color'></i>"+"</div>"); 
							
			}
		}
		
		//질문지 삭제
		function removeQuestion(){
			
			//질문 개수
			var nextElement = $( ".questions > .question" ).length+1;
			console.log(nextElement)
			//질문 최대 개수
			if(nextElement>5){
				$("#questionModal .question").eq(nextElement-2)
					.remove();
				
				$("#questionModal .question i").last()
					.addClass('fas fa-times-circle x_icon_color');
				
			}
		}
		
		
		$("#qSelect").on("change",function(){
			searchFunction();
		})
		
		$(document).on("click","#questionModal #addQuestion",function(){
			
			addQuestion();
		})
		
		$(document).on("click","#questionModal i",function(){
			
			removeQuestion();
		})
	})
		
	</script>
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
                
                <table id="lectureInfo">
                <tr>
					<td>                
                	  <p>학교:</p>
                	</td>
                	<td>
                	  <input id="univ_name" type="text" onkeydown="autocomplete('univ_name')"/>
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
						<select id="qSelect" onChange="searchFunction()">
						  <option>질문지를 선택하세요</option>
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
						<a data-toggle="modal" data-target="#questionModal">질문지 추가하기</a>
					</td>
				  </tr> 
				</table>               
				
			 
             	<!-- 학교 추가 Modal -->
             	<jsp:include page="school_modal.jsp"></jsp:include>
             	<!-- 질문지 추가 Modal -->
             	<jsp:include page="question_modal.jsp"></jsp:include>
			 </div>
     
</body>
