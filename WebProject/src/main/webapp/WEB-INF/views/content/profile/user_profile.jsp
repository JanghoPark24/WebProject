<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>

<style>

/* Add a dark background color to the footer */

table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}


</style>
</head>
<body>



<form name="my_profile" method="post" action="my_profile.do"
				onsubmit="return validateForm(this)">
<table border=1 align=center height=400 class="table">

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
    <input type="text" name="nickname" 
    id="nickname" maxlength="20" 
	 value="zz" align="center">
    </td>
       </tr>
      <tr class="warning">    
          <td><center><label>나는 누구누구입니다!</label></center></td>
      </tr>
</table>      
     <center><input type="submit" class="btn btn-primary" value="회원정보 수정"></center>
     
 </form>      

    
                
    

</body>
</html>