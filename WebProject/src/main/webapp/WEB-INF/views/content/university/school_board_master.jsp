<%@ page contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="ko">
	<head>
		<title> 저만 덥나요?</title>
		<meta charset="UTF-8" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="<%=request.getContextPath()%>/js/write.js" ></script>
		<style>
			div {
				padding:10px;
				position: relative;
				
			}
			#container {
				width:1600px;
				margin:0 auto;
			}
			#header {
				padding:20px;
				margin-bottom:20px;
			}
			#top{
				background-color: rgb(24, 84, 175);
                color: white;
				}
			
			
			#contents {
				width: 820px;
				float: left;
				margin-bottom: 20px;
			}
			#subject {
				width:  650px
			}
			#select {
				width: 120px;	
				height: 27px;
				
			}
			#m_subject {
				width: 780px;
				height: 600px;
			}

				#left-sidebar {
				width: 250px;
				float: left;
				margin-bottom: 120px;
				margin-right: 130px;
			}
			#right-sidebar {
				width: 250px;
				float: right;
				margin-bottom: 20px;
			}
			#comment{
				clear:both;
				margin-bottom: 300px;
				}
			
				.icon {
                display: block;
				float:left;
                border: none;
                background-color: rgb(24, 84, 175);
                color: white;
				width: 194px;
				height: 40px;
                cursor: pointer;
                text-align: center;
				margin-bottom: 0px;
            }
            
            .icon:hover {
                background-color:  RoyalBlue;
                color:  white;
            }
			#button1{
				display: inline-block;
			}
			.button_write{
				display: inline-block;
				width: 780px;
				height: 40px;
				display: block;
				
                border: none;
                background-color: rgb(24, 84, 175);
                color: white;
               cursor: pointer;
                text-align: center;
				margin-bottom:0px;
				}
				.button_write:hover {
                background-color:  RoyalBlue;
                color:  white;
          	    }
      			#write{
				width: 736px;
				height: 50px; 
						}
			#footer {
				 clear:both;		
						}
						
		</style>
	</head>
	<body>
	
				<div  id="container">
			<div id="header">
				<center><h1>관리자모드 </h1></center>
			</div>
			<div id="left-sidebar">
			<img src="<%=request.getContextPath()%>/images/gi2.jpg" style="width: 230px; height: 750px;">
			</div>
			<div name="contents" id="contents" method="post">
			<div id="top" ><center><h2 >대학 관리자 공지 모드</h2></center></div>
			<form>
			<div><tr>
				<td> <select id="select" name="select" >
					<option value="volvo">전체공지사항</option>
					<option value="saab">학교공지사항</option>
					<option value="opel">게시판공지사항</option>
					</select>
					<input id="subject" type="text" placeholder="제목을 입력하세요" required="required"></td>
				</tr></div>
					<div id="contents2">
				<tr><td><textarea id="m_subject" name="m_subject" placeholder="내용을 입력해주세요." required="required"></textarea></td>
					</tr>
				</div>
			<div id="button1" name="button1"><tr><td>
				<button  class="btn btn-info btn-lg icon" name="icon1" id="icon1" type="Reset">
				<i class="glyphicon glyphicon-paperclip"></i>파일 첨부</button>
				<button  class="btn btn-info btn-lg icon" name="icon2" id="icon2" type="Reset">
				<i class="glyphicon glyphicon-picture"></i>이미지 첨부</button>
				<button  class="btn btn-info btn-lg icon" name="icon3" id="icon3" type="Reset">
				<i class="glyphicon glyphicon-facetime-video"></i>동영상 첨부</button>
				<button class="btn btn-info btn-lg icon" id="icon4" type="Reset" onclick=""><i class="glyphicon glyphicon-trash"></i>취소</button></td>
				</tr>
			</div>
			<div id="button2">
				<input type="submit" name="icon5" class="btn btn-info btn-lg button_write" >
				
				 
				</div>
				</form>
			</div>
			<div id="right-sidebar">
				<img src="<%=request.getContextPath()%>/images/gi.jpg" style="width: 230px; height: 750px;">
				
				<table id="table1">
				</table>
			</div>
			<div id="comment">
				<%@ include file="../../common/footer.jsp"%>
			</div>
			
		</div>
		</body>
	
</html>

