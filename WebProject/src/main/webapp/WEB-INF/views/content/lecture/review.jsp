<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" >

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"  >
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!--별점-->
    <link rel="stylesheet" href="/css/rating/rateit.css">
    <link rel="stylesheet" href="/css/review.css">
    <link rel="stylesheet" media="screen and (min-device-width: 320px) and (max-device-width: 1100px)" href="css/review_responsive.css">
    
    <!-- vue.js cdn
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="js/review.vue"></script> -->

    <!--차트-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <!--차트-->
    <script src="../js/data_chart.js"></script>
   
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--별점-->
    <script src="../js/rating/jquery.rateit.js"></script>
    <script src="../js/review.js"></script>
   

    <title>My Chart.js Chart</title>

</head>
<body onload="starting_function()">
    <!-- 평균 점수 ${average}로 불러옴-->
    

    <div id ="container">

        <div id ="content">
            <div id="content_header">
                <h3>[00000]무슨 강의</h3>
            </div>
            <div id ="content_top">
                <button>평가하기</button>
            </div>
            

            <div id="content_middle">
                <div id="left_chart">
                    <canvas id ="myChart" ></canvas>
                </div>
                
                <div class="average">
                    
                        <h5>평균 평점 :<span> ${average}</span> </h5>
                       
                        <div data-productid="312" class="rateit" data-rateit-mode="font" style="" 
                        data-rateit-value="2.5" data-rateit-ispreset="true" data-rateit-readonly="true"
                        ></div>
                        
                        
                        <div id="top_comments">

                        </div>
                    
                    
                </div>
            </div>
            <div id="content_bottom">
                <!--댓글로-->
                <form id="top-reply">
                    <div class="form-group">
                        <textarea class="form-control" rows="5" class="comment" width="100%" placeholder="공개 댓글 추가"></textarea>
                        <div class="reply-button-container">
                            <button type="reset" class="button_block">취소</button>
                            <button class="button_block">댓글 작성</button>
                        </div>
                    </div>
                </form>
                <div class="reply-container">     
              
                        <div class="reply-cotainer-header">
                            	댓글
                        </div>

                        <!--container 하나에 하나의 댓글 대댓글이 모두 들어감. -->
                        <div class="reply-container-content">
                            
                            <div class="reply-body">
                                
                                <div class="reply">
                                    <ul class="list-group">
                                        <li class="list-group-item">
                                            <a href="">작성자명</a>
                                                	댓글  coment Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim tenetur deserunt necessitatibus suscipit consectetur voluptates soluta vitae cupiditate voluptatum. Neque facere sint porro incidunt excepturi molestias ratione laboriosam, possimus sunt!
                                        </li>
                                        <li class="list-group-item">
                                             
                                            <a class="glyphicon glyphicon-thumbs-up" href="#">${num}</a>
                                            <a class="glyphicon glyphicon-thumbs-down" href="#"></a>
                                            &nbsp;

                                            <a class="re-reply" href="javascript:;">
                                                	답글달기
                                            </a>

                                            <form class="re-reply-form"  >
                                                <!--collapse뒤의 아이디는 jsp에서 불러옴-->
                                                <div class="form-group collapse" id="collapse1" >
                                                    <hr/>
                                                    <textarea class="form-control" rows="5"  width="100%" placeholder="답글쓰기" ></textarea>
                                                    <div class="reply-button-container">
                                                        <button type="reset" class="button_block">취소</button>
                                                        <button class="button_block">댓글 작성</button>
                                                    </div>
                                                </div>
                                            </form>
                                            
                                        </li> 
                                        
                                        
                                    </ul>
                                </div>
                                <!--답글 : 답글이 있으면 개수 fetch해서 불러옴-->
                                <div class="re-reply">
                                    <!--답글 보기, 숨기기: 답글이 있으면 답글 보기 있음. 답글 보기 누르면 답글 보여짐-->
                                    
                                    &nbsp;<a class="show-hide-replies" href="javascript:;">답글 보기</a>
                                    
                                    <br/>
                                    <br/>
                                    
                                    <div class="re-reply-container">
                                        <!--reply container하나에 댓글에 대한 대댓글이 모두 들어감. -->
                                        <div class="reply-container-content">
                                            
                                            <div class="reply-body">
                                                
                                                <div class="reply">
                                                    <ul class="list-group">
                                                        <li class="list-group-item">
                                                            <a href="">작성자명</a>
                                                                	댓글  coment Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim tenetur deserunt necessitatibus suscipit consectetur voluptates soluta vitae cupiditate voluptatum. Neque facere sint porro incidunt excepturi molestias ratione laboriosam, possimus sunt!
                                                        </li>
                                                        <li class="list-group-item">
                                                                
                                                            <a class="glyphicon glyphicon-thumbs-up" href="#">${num}</a>
                                                            <a class="glyphicon glyphicon-thumbs-down" href="#"></a>
                                                            &nbsp;
                                                            <a class="re-reply" href="javascript:;">
                                                                	답글달기
                                                            </a>

                                                            <form class="re-reply-form"  >
                                            
                                                                <div class="form-group1">
                                                                    <hr/>
                                                                    <textarea class="form-control" rows="5" class="comment" width="100%" placeholder="답글쓰기"></textarea>
                                                                    <div class="reply-button-container">
                                                                        <button type="reset" class="button_block">취소</button>
                                                                        <button class="button_block">댓글 작성</button>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                            
                                                        </li>
                                                        
                                                        
                                                    </ul>
                                                </div>
                                                <!--답글 : 답글이 있으면 개수 fetch해서 불러옴-->
                                                <div class="re-reply">
                                                    <!--답글 보기, 숨기기: 답글이 있으면 답글 보기 있음. 답글 보기 누르면 답글 보여짐-->
                                                    
                                                    &nbsp;<a class="show-hide-replies" href="javascript:;">답글 보기</a>
                                                    
                                                    
                                                </div>
                                            </div> 
                                            <div class="author-thumbnail">
                                                <div class="author-picture">
                                                    <!--후에 백엔드에서 뽑아서 들어갈 예정-->
                                                    <a href="#">
                                                    <img src="/images/person_example.jpg"/>
                                                    </a>
                                                </div>
                                                    
                                            </div>
                                        </div>    
                                    </div>
                                    
                            
                                </div>
                            </div> 
                            <div class="author-thumbnail">
                                <div class="author-picture">
                                    <!--후에 백엔드에서 뽑아서 들어갈 예정-->
                                    <a href="#">
                                    <img src="/images/person_example.jpg"/>
                                    </a>
                                </div>
                                    
                             </div>
                        </div>    
                        
                </div>
                

            </div>


        </div>
    </div>
    <script>
            //차트 만드는 것 -- 후에 파라미터에 json array
            
            getChart();
           
    </script>
    <script>
    
    </script>
</body>
</html>