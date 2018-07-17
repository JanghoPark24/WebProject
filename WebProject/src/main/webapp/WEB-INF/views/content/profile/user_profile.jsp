<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


</style>
</head>
<body>

<header align="center">헤더</header>

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
                
    <footer align="center" border=1  > footer</footer>

</body>
</html>