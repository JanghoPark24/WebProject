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
    	
    	#questions{
    		margin:0 auto;
    		border:1px solid gray;
    	}
    	#question_button > button{
    		
    	}
    	#questionnaire > * {
    		float:right;
    	}
    </style>
    <script>
   
    
    /*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
    function autocomplete(arr){
    	
    }
    

  
   
    
    </script>
	
	<!-- 질문 불러오기  -->
	<script>
	$(function(){	
		
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
				$("#makeQuestion_body > .questions")
					.append("<div class=\'question\'>"+nextElement+"번: "+
							"<input type=\'text\' name=\'"+nextElement+"\' value=\'\' placeholder=\'질문"+nextElement+"\'/></div>")
			}
		}
		
		$("#qSelect").on("change",function(){
			searchFunction();
		})
		
		
		$("#addQuestion").on("click",function(){
			addQuestion();
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
                
                
                <div>
                
                	<p>학교:</p>
                	<input id="univ_name" type="text" onkeydown="autocomplete('univ_name')"/>
                	<a id="add_school" onclick="add_school('univ_name')">학교 추가하기</a>
                </div>
	            
            
                <div>
               		<p>교수명:</p><input id="professor" type="text" />
               	</div>
               
               
              
                <div>
                	<p>전공:</p><input id="major" type="text" />
                </div>
                
                <div>
                	<p>학기:</p><input id="semester" type="text" />
                </div>
                <div>
                	<p>강의코드:</p><input id="lecture_code" type="text" />
                </div>
                
                <div>
                	<p>강의 이름:</p><input id="lecture_name" type="text" />
                </div>
                
                
				<div id='questionnaire' >
					
					<p>질문지 선택</p>
					<div>
					<select id="qSelect"onChange="searchFunction()">
					  <option>질문지를 선택하세요</option>
					  <c:if test="${not empty questionVersions }">
					  	<c:forEach var="questionVersion" items="${questionVersions}">
						<option value="${questionVersion}" >${questionVersion}</option>
						</c:forEach>
					  </c:if>
					</select>
					<div id='questions'>
						
					</div>
					</div>
					<div>				
						<a data-toggle="modal" data-target="#questionModal">질문지 추가하기</a>
					</div>
				</div>                
             	<!-- 질문지 추가 Modal -->
				  <div class="modal fade" id="questionModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">질문지 추가하기</h4>
				        </div>
				        <div id="makeQuestion_body" class="modal-body">
				          <div id="questionTitle">
				          	<h4>질문 제목: </h4><input type="text" name="m" placeholder="질문지 제목"/>
				          </div>
				          
				          <div class="questions">
					          <div class="question">1번: <input type="text" name="1" value="" placeholder="질문1"/></div>
					          <div class="question">2번: <input type="text" name="2" value="" placeholder="질문2"/></div>
					          <div class="question">3번: <input type="text" name="3" value="" placeholder="질문3"/></div>
					          <div class="question">4번: <input type="text" name="4" value="" placeholder="질문4"/></div>
				          </div>
				          <div id="question_button" >
				            <button id="addQuestion" class="btn btn-default">질문추가</button>
				          </div>	
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				      
				    </div>
				  </div>
			 </div>
            
  
    <script>
    
    </script>
</body>
