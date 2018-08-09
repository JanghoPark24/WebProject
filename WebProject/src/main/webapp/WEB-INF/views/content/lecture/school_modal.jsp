<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function checkUnivInfo(){
		var univ_name = $("#univ_name").val();
		var univ_url = $("#univ_url").val();
		var univ_domain = $("#univ_domain").val();
		var univ_logo = $("#univ_logo").val();
		
		if(univ_name=="") {
			alert('대학교 명을 입력해주세요');
			history.go(-1);
		}
		else if(univ_url==""){
			alert('학교 url을 입력해주세요');
			return false;
		}
		else if(univ_domain="") {
			alert('학교 이메일 도메인을 입력해주세요');
			return false;
		}else{
			location.href="insertLectureView.do?"
		}
		
		
	}
	
</script>    
    
    

<div class="modal fade" id="schoolModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">학교 추가하기</h4>
      </div>
      <div id="makeQuestion_body" class="modal-body">
        
        
        <div class="univ_info">
         <div class="univ_name_wrapper"><p width=15em>학교명:</p> <input type="text" id="univ_name" name="univ_name" value="" placeholder="예: 서울 대학교"/> </div>
         <div class="univ_url_wrapper"><p>학교 url:</p> <input type="text"  id="univ_url" name="univ_url" value="" placeholder="예: snu"/> </div>
         <div class="univ_domain_wrapper"><p>학교 이메일 도메인:</p> <input type="text" id="univ_domain" name="univ_domain" value="" placeholder="snu.co.kr"/> </div>
         <div class="univ_logo_wrapper"><p>학교 로고 첨부:</p> <input type="file" id="univ_logo" name="univ_logo" value="" placeholder="logo image"/> </div>
        </div>
        <div id="question_button" >
          <button id="addQuestion" class="btn btn-default" >학교 추가</button>
        </div>	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
      </div>
    </div>
    
  </div>
</div>


