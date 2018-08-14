<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

<div class="modal fade" id="updateUnivModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">학교 수정하기</h4>
      </div>
      <div id="makeUniv_body" class="modal-body">
        
        <form id="updateUniversity" action="addUniversity.do">
	        <div class="univ_info">
	         <div class="univ_name_wrapper"><label for="univ_name_d" width=15em>학교명</label>: <input type="text" id="univ_name_d" name="univ_name_d" value="" placeholder="예: 서울 대학교"/> </div>
	         <div class="univ_url_wrapper"><label for="univ_url_d">학교 url</label>: <input type="text"  id="univ_url_d" name="univ_url_d" value="" placeholder="예: snu"/> </div>
	         <div class="univ_domain_wrapper"><label for="univ_domain_d">학교 이메일 도메인</label>: <input type="text" id="univ_domain_d" name="univ_domain_d" value="" placeholder="snu.co.kr"/> </div>
	         <div class="univ_logo_wrapper"><label for="univ_logo_d">학교 로고</label>: <input type="file" id="univ_logo_d" name="univ_logo_d" value="" placeholder="logo image"/> </div>
	        </div>
	        <div id="question_button" >
	          <button type="button" id="addUniv" class="btn btn-default" >학교 추가</button>
	        </div>
        </form>	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
      </div>
    </div>
    
  </div>
</div>


