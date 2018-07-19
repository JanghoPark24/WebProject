<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    
    <head>
          <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            헤더
        </header>
        
            <h2 align=center>강의관리</h2>
<div class="container text-center">    
    <table  class="table" id="" align=center width=800 >
        <tr rowspan="2">
            oo 대학
        </tr>
        <tr>
        	<td colspan=2>
            <input type="text" class="form-control" placeholder="강의 검색" id="search" weight="30">
            <button type=submit weight="10">검색</button>
            </td>
        </tr>
        <tr>
            <td rowspan="10">
                <button type="button" class="btn btn-primary">강의관리</button><br><br>
                <button type="button" class="btn btn-primary">글작성</button>

            <td>${강의 list}</td>        
        </tr>

        <tr>
            <td>${강의 list}</td>       
        </tr>
        <tr>
            <td>${강의 list}</td>       
        </tr>
        <tr>
            <td>${강의 list}</td>       
        </tr>
        <tr>
            <td>${강의 list}</td>       
        </tr>
        <tr>
            <td>${강의 list}</td>       
        </tr>
        <tr>
            <td>${강의 list}</td>       
        </tr>
        <tr>
            <td>${강의 list}</td>       
        </tr>
        <tr>
            <td>${강의 list}</td>       
        </tr>
        <tr>
            <td>${강의 list}</td>       
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
        
        
        <footer>
            풋터
        </footer>
     </body>
</html>

