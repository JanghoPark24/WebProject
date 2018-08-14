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
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
    /**
     * 
     */

    
    //id값에 대한 url값 찾기
    function findURLForAutoComplete(input_id){
    	var id = $(input_id).attr('id')
    	if(id=='univ_name')
    		return 'autocomplete_univ.do';
    
    }
   
    function makeAutoComplete(input_id){
    	var tags = []
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
    	$(input_id).autocomplete({
    		source : tags
    	});
    	
    	
    }
    
    // form id에 대한 유효성 검사 확인하기
    function validate(form_id){
    	
    	var frm = $(form_id);
    	var inputs = $(form_id+' input')
    	var iSize = inputs.size();
    	
    	for(var i = 0; i< iSize; i++){
    		
    		var iV = inputs.eq(i)
    		// type이 file인 것을 제외하고 input값을 모두 비교
    		
    		if(iV.val()=="" && iV.attr('type')!='file'){
    			var labelFor = iV.attr('id')
    			var labelVal = $("label[for='"+labelFor+"']").text();
    			
    			alert(labelVal+"을 입력해야 합니다.")
    			return;
    		}
    	}
    	frm.submit();
    	
    	
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
				
				updateOptions("#questions","updateQuestions.do");
			})
			$('#univ_name').on('keydown',function(){
				makeAutoComplete(this);
			})
			
			$("#addUniv_outer").on('click',function(){
				$('#univ_name_d').val($('#univ_name').val())
			})
			$("#addUniv").on('click',function(){
				
				validate('#addUniversity');
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
	                <table id="lectureInfo" >
	                <tr>
						<td>                
	                	  <p>학교:</p>
	                	</td>
	                	<td>
	                	  <input id="univ_name" name='univ_name' type="text" class="form-control ui-autocomplete-input"  />
	                	</td>
	                	<td>
	                	  <a id="addUniv_outer" data-toggle="modal" data-target="#insertUnivModal">학교 추가</a> | 
	                	  <a id="updateUniv_outer" data-toggle="modal" data-target="#updateUnivModal">학교 수정</a> | 
	                	  <a id="deleteUniv_outer" data-toggle="modal" data-target="#schoolModal">학교 삭제</a>
	                	  
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
             	<jsp:include page="insert_school_modal.jsp"></jsp:include>
             	<!-- 학교 수정 Modal -->
             	<jsp:include page="update_school_modal.jsp"></jsp:include>
             	<!-- 질문지 추가 Modal -->
             	<jsp:include page="question_modal.jsp"></jsp:include>
			 </div>
     
</body>
