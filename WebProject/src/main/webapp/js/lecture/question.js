/**
 * 
 */

//질문지 추가 유효성 검사	
function validateQuestions(){

	var question_type = $("#question_type");
	var question = $(".questions > .question");
	var qlength = question.length;
	
	// 질문지 제목 null체크
	if(question_type.val()=="") {
		alert("질문지 제목을 입력해주세요");
		return;
	}
	// 질문 null체크
	for(var i=0; i<qlength; i++){
		var qval= question.children().eq(i).val();
		
		if(qval==""){
			alert((i+1)+'번 질문을 입력해주세요');
			return;
		}
	}
	
	// submit
	$("[name='insertQuestions']").submit()
}	
	
// 질문 삭제 여부 묻기
function check_delete(){
	var selectedQ_val =$("#qSelect > option:selected").val();
	 if(selectedQ_val=="0"){
		alert('삭제할 질문지를 선택하세요')
		
	}
	else{
		// 확인
		result=confirm(selectedQ_val+"을 삭제하시겠습니까?")
		
		if(result){
			deleteQuestion(selectedQ_val);
		}
		
	} 
}

// 질문 삭제
function deleteQuestion(selectedOption){
	var request = $.ajax({
	  url: "deleteQuestion.do",
	  method: "POST",
	  data: { question_version:selectedOption},
	  dataType: "text"
	});
	request.done(function() {
	  alert(questionVersion+" 삭제 완료");
	  location.reload();
	});
	 
	request.fail(function( jqXHR, textStatus ) {
	  alert( "Request failed: " + textStatus );
	});
	
}


// 질문 수정 체크
function check_update(){
	var selectedQ_val =$("#qSelect > option:selected").val();
	 if(selectedQ_val=="0"){
		alert('수정할 질문지를 선택하세요')
		return;	
	}else{
		console.log(selectedQ_val)
		selectQuestions(selectedQ_val,"update")
	}
}

// 수정 완료 버튼 누른 후
function updateOptions(formID,urlDestination){
	
	// var frm = $("form#questions_form");
	var frm = $(formID+' input');
 	var frmVal = frm.serialize();
 	console.log(frmVal)
	
	var request = $.post(urlDestination,frmVal,function(data){
		
		alert(data=='0'?"수정 완료":"수정실패");
		location.reload();
	});
 	
	 
	request.fail(function( jqXHR, textStatus ) {
	  alert( "수정 실패" );
	});
 	
}


/* selection에 대한 Questionnaire 불러오기 */
function selectQuestions(questionVersion,forWhat){
	
	$.post("selectQuetionnaire.do",{"questionVersion":questionVersion},function(questions){
		
		var questionId="";
		var output="";
		var update_button="";
		
		if(forWhat=="update"){
			update_button +=
				"<button type='button' id='updateQuestions' >"+
				"수정완료"+
				"</button>";
			$("#questions").attr("class", "q_updating");
			
		
		}
		$.each(questions,function(index,item){
			if(forWhat=="update"){
				questionId += "<input type='hidden' name='questionIDs' value=\'"+item.question_id+"\' />"
				output +="<div>"+"<p>"+(index+1)+"번</p>"+
				"<input type='text' name='u_questionContents' value='"+item.question_content+"'></div>";
				
			}else{
				output +="<div>"+"<p>"+(index+1)+"번</p>"+item.question_content+"</div>";
			}
			
		})
		$("#questions").html(questionId+output+update_button);
		})
	}
 	


// 질문 불러오기 
// 질문지 선택
function searchFunction(){
	var selectedVersion = $('#qSelect > option:selected').val();
	if(selectedVersion=='질문지를 선택하세요'){
		selectedVersion='';
		return;
	}
	
	selectQuestions(selectedVersion,'default');
}


// 질문지 추가하기
function addQuestion(){
	
	// 질문 개수
	var nextElement = $( ".questions > .question" ).length+1;
	// 질문 최대 개수
	if(nextElement<11){
		
		$("#questionModal i").removeClass("fas fa-times-circle x_icon_color");
		$("#makeQuestion_body > .questions")
			.append("<div class='question'>"+nextElement+"번: "+
					"<input type=\'text\' name='questionContents[]' value=\'\' placeholder=\'질문"+nextElement+"\'/> "+
					"<i class='fas fa-times-circle x_icon_color'></i>"+"</div>"); 
					
	}
}

// 질문지 질문삭제
function removeQuestion(){
	
	// 질문 개수
	var nextElement = $( ".questions > .question" ).length+1;
	
	// 질문 최대 개수
	if(nextElement>5){
		$("#questionModal .question").eq(nextElement-2)
			.remove();
		
		$("#questionModal .question i").last()
			.addClass('fas fa-times-circle x_icon_color');
		
	}
}



	