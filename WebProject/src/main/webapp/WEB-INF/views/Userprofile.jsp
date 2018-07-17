<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

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
  


<table border=1 align=center height=400 class="table">
<form method="post">
      <h2 align="center" >내 프로필</h2>
  <tr class="info">
  <td><center><img src="img/Koala.jpg" width="90" height="130" border=1 
     title="프로필 사진"  class="img-rounded"></center></td>
      </tr>
      <tr class="info">
     <td> 
         <center><label>이메일</label></center>
         </td>
       </tr>
      
    <tr class="danger">
    <td>  
    <center><label>이름(닉네임)</label></center>
    </td>
       </tr>
      <tr class="warning">    
          <td><center><label>나는 누구누구입니다!</label></center></td>
      </tr>
      
     
 </form>      
</table>

     <center><a href="profile.html" class="btn btn-info" role="button"> 회원정보수정</a></center>
                
    <footer align="center" border=1  >이용규약,개인정보처리방침,문의<br>저작권 카피라이트<br>문의 이메일 주소</footer>

</body>
</html>