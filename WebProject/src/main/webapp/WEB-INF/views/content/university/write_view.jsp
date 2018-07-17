<!doctype html>
<html lang="ko">
	<head>
		<title> 주의)정신이 나간 학생 입니다.</title>
		<meta charset="UTF-8" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

		<style>
			
   			


			div {
				padding:10px;
				position: relative;
				

				
				border:1px solid gray;


			}
			#container {
				width:1200px;
				margin:0 auto;
			}
			#header {
				padding:20px;
				margin-bottom:20px;
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
			#text {
				width: 780px;
				height: 400px;
				
			}

			#left-sidebar {
				width: 150px;
				float: left;
				margin-bottom: 20px;
				margin-right: 20px;
			}
			#right-sidebar {
				width: 150px;
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
				margin-bottom: 0px;
				}
			
				.button_write:hover {
                background-color:  RoyalBlue;
                color:  white;
            }
		
      
		
			  /* #icon1{
				width: 200px;
				height: 50px;
				

				}  

			
			 #icon2{
				width: 200px;
				height: 50px;
				
			}
			#icon3{
				width: 200px;
				height: 50px;
				
			}
			#icon4{
				width: 124px;
				height: 50px;
               
			}  */
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
				<center><h1>header 자리</h1></center>
			</div>
			
			<div id="left-sidebar">
				
			</div>
			
			<div name="contents" id="contents" method="post">

					<div id="top" ><center><h2 >Army대학(뷰))</h2></center></div>
						<form>
						<div><tr>
								<td> <select id="select" name="select" >
										<option value="volvo">전체공지사항</option>
										<option value="saab">학교공지사항</option>
										<option value="opel">공지사항</option>
										</select>
									<input id="subject" type="text" placeholder="제목을 입력하세요"></td>
							</tr></div>
					<div id="contents2">
							<tr>
								<td><textarea id="text" name="text" placeholder="내용을 입력하세요" ></textarea></td>
							</tr>


					</div>

					<div> 댓글 쓸 위치</div>
					
					<div>
						댓글 달릴위치
					</div>
				</form>
				</div>
			
			<div id="right-sidebar">
					<img src="images/lcat.jpg" style="width: 120px; height: 100px;">
					<img src="images/right.gif" style="width: 120px; height: 100px;">
					<img src="images/right.jpg" style="width: 120px; height: 100px;">
					<img src="images/rmonkey.jpg" style="width: 120px; height: 100px;">
				<table id="table1">
			




					

				</table>
			</div>
			<div id="comment">
				댓글 위치

			</div>
			<div id="footer">
				footer
			</div>
		</div>
		
	</body>
</html>