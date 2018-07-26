<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    
    <head>
         <meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
   
        
            
<div class="container text-center">    
 	<h2 align=center>강의 목록</h2>
			<div class="container text-center">    
			    <form action="lectureList.do"  method="get">
	        		<!-- search-->
		            <input type="text" class="search" placeholder="강의 검색" id="search" weight="30">
		            <button type=submit weight="10">검색</button>
	            </form>
			    
			    <table  class="table" id="" align=center width=800 >
			        <tr rowspan="2">
			             oo 대학
			        </tr>
			        <tr>
			        	<td colspan=2>
			        	
			            </td>
			        </tr>
			        <tr>
			            <td rowspan="10">
			                <button type="button" class="btn btn-primary">강의관리</button><br><br>
			                <button type="button" class="btn btn-primary">글작성</button>
			
			                   
			        </tr>
					<tr>
						<td><a href="review.do">강의 list</a></td> 
					</tr>
			        
			        <tr>
			            <td colspan="2"><button type="button" class="btn btn-primary">강의 입력</button></td>
			        </tr>            
			
			    </table>
			</div>
			        
			<div class="container text-center">
	            <ul class="pagination">
	                <li><a href="#">맨처음</a>
	                <li><a href="#">1</a></li>
	                  <li><a href="#">2</a></li>
	                  <li><a href="#">3</a></li>
	                  <li><a href="#">4</a></li>
	                  <li><a href="#">5</a></li>
	                <li><a href="#">맨끝</a>
	            </ul>
			</div>
       
     </div>   
       
     </body>
</html>