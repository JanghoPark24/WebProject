<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필(수정)</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
.filebox label { display: inline-block; padding: .5em .75em; 
color: white; font-size: inherit; line-height: normal; 
vertical-align: middle; background-color:#00BFFF; cursor: pointer; border: 1px solid #ebebeb; 
border-bottom-color: #e2e2e2; border-radius: .25em; }

 .filebox input[type="file"] { /* /파일 필드 숨기기 */ position: absolute; 
 width: 1px; height: 1px; padding: 0; 
 margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }

출처: http://webdir.tistory.com/435 [WEBDIR]

/* Add a dark background color to the footer */

table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}


</style>


</head>
<body>
<header align="center">헤더</header>

<table border=1 align=center width=50 class="table">
<form method="post">
      <h2 align="center" >내 프로필</h2>
  <tr class="info">
  <td rowspan="5">
  <article align="center">
  <p id="status"></p>
  <div class="filebox">
  <label for="ex_file">프로필 수정</label>
  <input type="file" id="ex_file">
</div>
  <div id="holder"></div> 
   </article> 
     </td>
      </tr>
      <tr class="info">
     <td> 
          <input type=text value="이메일" disabled="disabled">
          <input type=text value="대학" disabled="disabled"></td>
       </tr>
      <tr class="success">
    <td>  <input type=checkbox id="email" >메일 공개</td>
    </tr>
    <tr class="danger">
    <td>  
    <input type=text value="이름(닉네임)" size=20>
    <input type=text value="학과" size=20></td>
       </tr>
      <tr class="warning">    
          <td><textarea cols=90 rows=10  >자신을소개하세요!</textarea></td>
      </tr>
      
      <tr class="info"><td colspan=2 align=center>    
          <a href="profile.html" class="btn btn-info" role="button">비밀번호 변경</a>
          <a href="profile2.html" class="btn btn-info" role="button" id="p">저장</a>
          </td>
          </tr>
 </form>      
</table>            
    <footer align="center" border=1  >footer</footer>

<script src="profile.js"> </script>

</body>
</html>