<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
         <div class="question">1번: <input type="text" name="q1" value="" placeholder="질문1"/></div>
         <div class="question">2번: <input type="text" name="q2" value="" placeholder="질문2"/> </div>
         <div class="question">3번: <input type="text" name="q3" value="" placeholder="질문3"/></div>
         <div class="question">4번: <input type="text" name="q4" value="" placeholder="질문4"/></div>
        </div>
        <script>
	        $('#questionModal .questions .question').one('ready',function () {
			    alert('?');
				$(this).eq(3).hide();
			});
        </script>
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

