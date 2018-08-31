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
    <script src="${path}/js/validate_functions.js"></script>
    
   	
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
    <!-- 수정시 -->
    <c:if test="${state=='update'}">
    <script>
    	function addValuesWhenUpdate(){
	    	$("#o_univ_name").val("${lecture.univ_name}");
	    	$("#major").val("${lecture.major}");
	    	$("#professor").val("${lecture.professor}");
	    	$("#grade").val("${lecture.grade}");
	    	$("#semester").val("${lecture.semester}");
	    	$("#credit").val("${lecture.credit}");
	    	$("#lecture_code").val("${lecture.lecture_code}");
	    	$("#lecture_name").val("${lecture.lecture_name}");
	    	$("#qSelect option[value='${lecture.question_version}']")
	    		.attr("selected", true)
	    	    	
	    	
    	}
    </script>
    </c:if>
	<!-- 로드 시 실행할 것 -->
    <script>
    	
 		function executeWhenOnLoadLecture(){
 			<c:if test="${state=='update'}">
 				addValuesWhenUpdate();
 			</c:if>
 			
 		}
 			
 		   
 		
		window.onload = executeWhenOnLoadLecture;
    </script>
    
    <!-- 자동 완성 기능, 유효성 검사 -->
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
   
    //자동완성 기능
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
    function validateEmptinessWithLabel(frm){
       
        var form_id = frm.id;
        var inputs = frm.getElementsByTagName('input')
       
        var iSize = inputs.length;
        

        for(var i = 0;i<iSize; i++){
        	
            //input 
            let inputE = inputs[i]
            
    		
        	let inputVal = inputE.value.trim();
           
            //label Value for input id
            //let labelVal = $("label[for='"+inputE.id+"']").text();
            let labelVal = document.querySelector("label[for=" + (inputE.id)+ "]").innerText;
            
            // 값이 없을 경우 리턴
            if(inputVal==""){
                alert(labelVal+"을/를 입력해야 합니다.")
                return false;
            }
            
        }
        return true;
        
        
    }
    function validateSelectWithLabel(frm){
    	 var sel = frm.getElementsByClassName('select_class');
    	 
    	 let labelVal = document.querySelector("label[for=" + (sel[0].id)+ "]").innerText;
         
         // 값이 없을 경우 리턴
         if(sel[0].value==""){
             alert(labelVal+"을 해야 합니다.")
             return false;
         }
         return true;
    }
 
 
    function validateGeneralRules(frm){
        
        var form_id = "#"+frm.id;
        var inputs = frm.getElementsByTagName('input')
        
        var iSize = inputs.length;
        
        for(var i = 0;i<iSize; i++){
        	
            //input 
            let inputE = inputs[i]
        	let inputVal = inputE.value;
            let labelVal = document.querySelector("label[for=" + (inputE.id)+ "]").innerText;
            
            //전송되는 name
            let iName = inputE.name;
            let className = inputE.className;
            
			console.log(inputE.id);            
            //이메일일 경우
			
            if(className =="email_domain" &&
            	isValidEmailDomain(inputVal)==false	){
                
                alert("이메일 형식이 올바르지 않습니다.");
               	return;
            
            //이미지 파일인지 확인
            }else if(className =="image_file" &&
            	isValidImg(inputVal)==false){
            	
            	alert("첨부한 파일이 이미지가 아닙니다.")
            	return;
            }
        }
        
        frm.submit();
      	
    }
 	
	function getAndSetUniv(){
		var univ_name = document.getElementById("o_univ_name").value;
		
		$.ajax({
    		url : "getUnivByName.do" ,
    		dataType : "json",
    		data:{"name": univ_name},
    		success : 
    			function(data, response) {
    				
    				$("#u_univ_name_d").val(data.univ_name);
    				$("#u_univ_url_d").val(data.univ_url);
    				$("#u_univ_domain_d").val(data.univ_domain);
    			
    			}
    	})
	}
	function checkUniv(){
		var univ_name = document.getElementById("o_univ_name").value;
		console.log()
		$.ajax({
    		url : "getUnivByName.do" ,
    		dataType : "json",
    		data:{"name": univ_name},
    		success : 
    			function(data, response) {
	    			
    				console.log(data.univ_name)
    				$("#is_univ_exist").text(univ_name+"는 있는 대학입니다").css("color",'black')
    				$("#is_univ_okay").val(true);
    			},
    		error:
    			function(){
	    			$("#is_univ_exist").text(univ_name+"는 존재하지 않는 대학입니다. 새로 추가해주십시오.").css("color",'red')
	    			$("#is_univ_okay").val(false);
    			}
    	})
	}
	
	function deleteUniv(univ_name){
		var request = $.ajax({
		  url: "deleteUniv.do",
		  method: "POST",
		  data: {"name":univ_name},
		  dataType: "text"
		});
		request.done(function() {
		  alert(univ_name+" 삭제 완료");
		  location.reload();
		});
		 
		request.fail(function( jqXHR, textStatus ) {
		  alert( "Request failed: " + textStatus );
		});
	}
	
	function validateUnivInfo(){
		
		if($("#is_univ_okay").val() =='false'){
			alert("대학교를 추가한 후 입력하세요");
			return false;
		}else{
			return true;
		}
    		
	}
	
   function validateSemester(semester){
	 	//학기는 1~5학기만
	 	console.log(semester)
		if( (1<=semester) && (semester <=5) ){
			return true;
		}else{
			alert("1~5학기만 입력가능합니다.");			
			return false;
		}
   }
   function validateGrade(grade){
	 	
	 	console.log(grade)
		if( (1<=grade) && (grade <=4) ){
			return true;
		}else{
			alert("1~4학년만 입력가능합니다.");			
			return false;
		}
   }

    </script>

	
	<!-- 이벤트 발생 시 -->
	<script>
		$(function(){
			//업데이트
			<c:if test="${state=='update'}">
			$("#lectureInfo_update").on("click",function(){
				let frm =this.form;
				frm.action ="updateLecture.do?${lecture.lecture_id}"
				frm.submit();
			})
			
			</c:if>
			
			//질문 선택지 선택시 변경
			$("#qSelect").on("change",function(){
				searchFunction();
			})
			
			//대학교 수정 클릭
			$("#updateUniv_outer").on("click",function(){
				getAndSetUniv();
			})
			
			$(document).on("click","#questionModal #addQuestion",function(){
				
				addQuestion();
			})
			
			$(document).on("click","#questionModal i",function(){
				
				removeQuestion();
			})
			
			//질문 업데이트
			$(document).on("click","#updateQuestions",function(){
				
				updateOptions("#questions","updateQuestions.do");
			})
			
			//
			$('#univ_name').on('keydown',function(){
				makeAutoComplete(this);
			})
			//대학교 수정
			$("#addUniv_outer").on('click',function(){
				$('#univ_name_d').val($('#univ_name').val())
			})
			
			//대학교 수정완료
			$("#updateUnivButton").on('click',function(){
				let insertFrm  = document.getElementById('updateUniv');
				
				validateEmptinessWithLabel(insertFrm);
				validateGeneralRules(insertFrm);
			})
			//대학교 삭제
			$("#deleteUniv_outer").on('click',function(){
				
				let univ_name  = document.getElementById('o_univ_name').value;
				let willDelete = confirm("이 대학교를 삭제하시겠습니까?")
				alert(univ_name)
				if(willDelete==true) deleteUniv(univ_name);
			})
			
			$("#insertUnivButton").on('click',function(){
				let insertFrm = document.getElementById('insertUniv');
				validateEmptinessWithLabel(insertFrm);
				validateGeneralRules(insertFrm);
			})
			
			$("#o_univ_name").on('blur',function(){
				
				checkUniv();
			})
			
			// 강의 넣기 submit
			$("#lectureInfo_submit").on('click',function(){
				
				let insertFrm= document.getElementById("lectureInfo_form");
				let univ_name = document.getElementById("o_univ_name");
				let semester = document.getElementById("semester").value;
				let grade = document.getElementById("grade").value;
				

				//selectEditing?
				var selectEditing = 
					(document.querySelectorAll(".select_editing").length==1)? true:false;
				if(selectEditing==true) searchFunction();
				
				//빈것이 있는지 체크
				var success1 = validateEmptinessWithLabel(insertFrm);
				if(success1==false) return;
				
				var success2 = validateSelectWithLabel(insertFrm);
				
				if(success2==false) return;
				
				
				//대학교 ;
				var success3 = validateUnivInfo();
				alert(success3)
				if(success3==false) return;
				
				//학기
				var success4 = validateSemester(semester);
				if(success4==false) return;
				//학년
				var success5 = validateGrade(grade);
				if(success5==false) return;
				//submit
				insertFrm.action = "insertLecture.do";
				insertFrm.submit();
				
				
			})
			
			
		})
		
		
	</script>
</head>
<body>
    <input type=hidden id="is_univ_okay" value='false'>	
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
                <form id="lectureInfo_form" method="post"
                 accept-charset="utf-8">
	                <table id="lectureInfo" >
	                <tr>
						<td>                
	                	  <p><label for="o_univ_name">학교</label>:</p>
	                	  
	                	</td>
	                	<td>
	                	  <input id="o_univ_name" name='univ_name' type="text" class="form-control ui-autocomplete-input"  />
	                	  <a id="addUniv_outer" data-toggle="modal" data-target="#insertUnivModal">학교 추가</a> | 
	                	  <a id="updateUniv_outer" data-toggle="modal" data-target="#updateUnivModal">학교 수정</a> | 
	                	  <a id="deleteUniv_outer" data-toggle="modal" data-target="#schoolModal">학교 삭제</a>
	                	  
	                	</td>
	                	<td>
	                	  <p id="is_univ_exist"></p>
	                	  
	                	</td>
	                </tr>
		            
	            
	                <tr>
	                	<td>
	               		 <p><label for="professor">교수명</label>:</p>
	               		</td>
	               		<td>
	               		 <input id="professor" name="professor" type="text" />
	               		</td>
	               		<td></td>
	               	</tr>
	               
	               
	              
	                <tr>
	                	<td><p><label for="major">전공</label>:</p></td>
	                	<td>
	                	 <input id="major" name="major" type="text" />
	                	</td>
	                	<td></td>
	                </tr>
	                <tr>
	                	<td>
	                	  <p><label for="grade">학년</label>:</p>
	                	</td>
	                	<td>
	                	  <input id="grade" name="grade" type="text" />
	                	</td>
	                	<td></td>
	                </tr>
	                <tr>
	                	<td>
	                	  <p><label for="semester">학기</label>:</p>
	                	</td>
	                	<td>
	                	  <input id="semester" name="semester" type="text" />
	                	</td>
	                	<td></td>
	                </tr>
	                <tr>
	                	<td>
	                	  <p><label for="credit">학점</label>:</p>
	                	</td>
	                	<td>
	                	  <input id="credit" name="credit" type="text" />
	                	</td>
	                	<td></td>
	                </tr>
	                <tr>
	                	<td><p><label for="lecture_code">강의코드</label>:</p></td>
	                	<td>
	                	 <input id="lecture_code" name="lecture_code" type="text" />
	                	</td>
	                	<td></td>
	                </tr>
	                
	                <tr>
	                	<td>
	                	 <p><label for="lecture_name">강의 이름</label>:</p>
	                	</td>
	                	<td>
	                	 <input id="lecture_name" name="lecture_name" type="text" />
	                	</td>
	                	<td></td>
	                </tr>
	                
	                
					<tr id='questionnaire' >
						<td>
						  <p><label for="qSelect">질문지 선택</label></p>
						</td>
						<td>
							<select id="qSelect" class="select_class" name="question_version">
							  <option value="">질문지를 선택하세요</option>
							  <c:if test="${not empty questionVersions}">
							  	<c:forEach var="questionVersion" items="${questionVersions}">
								<option value="${questionVersion}" >${questionVersion}</option>
								</c:forEach>
							  </c:if>
							</select>
							<div>
								<a data-toggle="modal" data-target="#questionModal">질문지 추가</a> | 
								<a onclick="check_delete()">질문지 삭제</a>|
								<a onclick="check_update()">질문지 수정</a>
							</div>
							<div id='questions'>
								
							</div>
							
							
						</td>
						<td>				
							
						</td>
					  </tr> 
					</table>
					<div>
						<c:if test="${empty state}">
						  <button type="button" id="lectureInfo_submit">제출</button>
						</c:if>
						<c:if test="${state =='update'}">
						  <button type="button" id="lectureInfo_update">수정</button>
						</c:if>
						
						<button type="reset">취소</button>
					</div>               
				</form>
			 
             	<!-- 학교 추가 Modal -->
             	<jsp:include page="insert_school_modal.jsp"></jsp:include>
             	<!-- 학교 수정 Modal -->
             	<jsp:include page="update_school_modal.jsp"></jsp:include>
             	<!-- 질문지 추가 Modal -->
             	<jsp:include page="question_modal.jsp"></jsp:include>
			 </div>
     
</body>
