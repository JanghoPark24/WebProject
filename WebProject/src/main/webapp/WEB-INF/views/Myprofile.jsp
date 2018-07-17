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

 .filebox input[type="file"] { /* 파일 필드 숨기기 */ position: absolute; 
 width: 1px; height: 1px; padding: 0; 
 margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }

출처: http://webdir.tistory.com/435 [WEBDIR]

/* Add a dark background color to the footer */

table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}

footer {
    background-color: #2d2d30;
    color: #f5f5f5;
    padding: 32px;
}

footer a {
    color: #f5f5f5;
}

footer a:hover {
    color: #777;
    text-decoration: none;
}
</style>


</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Logo</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">학교별 게시판 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
     
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
  


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
    <footer align="center" border=1  >이용규약,개인정보처리방침,문의<br>저작권 카피라이트<br>문의 이메일 주소</footer>

<script src="profile.js"> </script>

</body>
</html>