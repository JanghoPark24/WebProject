<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    
    <head>
          <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
  $( function() {
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#search" ).autocomplete({
      source: availableTags
    });
  } );
  </script>
    </head>
    <body>
        <header>
            헤더
        </header>
        <div>
            <h2 align=center>대학이름</h2>
		
        <table  class="table" id="" align=center width=800 >
        <!-- 검색 기능  -->
        <tr>
        	<td><select class="form-control" weight="20">
        		<option value="all">전체</option>
        		<option value="대학">대학</option>
            <td colspan="5"><input type="text" class="form-control" placeholder="검색" id="search" weight="70"></td>
        	<td><button type=submit weight="20">검색</button></td>
            <td align="right"><input type="button"  value="글작성" onClick="링크" ></td>
        </tr>
    
    	<!-- 테이블 이름  -->
        <tr>
            <td>글종류</td>
            <td>글번호</td>
            <td>제목</td>
            <td>닉네임</td>
            <td>조회수</td>
            <td>추천</td>
            <td>날짜</td>            
        </tr>
        
    	<!-- 테이블 검색 결과 -->
        <tr>
            <td>${글 종류 전체공지}</td>
            <td>${공지번호}</td>
            <td><a href="공지링크"></a></td>
            <td>${공지 닉네임}</td>
            <td>${공지 조회수}</td>
            <td>${공지 추천}</td>
            <td>${공지 날짜}</td>            
        </tr>
        <tr>
            <td>${글 종류}</td>
            <td>${글 번호}</td>
            <td><a href="링크"></a></td>
            <td>${닉네임}</td>
            <td>${조회수}</td>
            <td>${추천}</td>
            <td>${날짜}</td>     
        </tr>
        </table>
        </div>
        .
        <div class="container text-center">
            <ul class="pagination">
                <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
			</ul>
        </div>
        
        
        <footer>
            풋터
        </footer>
     </body>
     
</html>
<%@ include file="footer.jsp"%>

