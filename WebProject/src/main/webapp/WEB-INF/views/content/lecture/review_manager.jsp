<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" >

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"  >
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!--별점-->
    <link rel="stylesheet" href="../css/rating/rateit.css">
    <link rel="stylesheet" href="../css/review.css">
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
          
        </div>

    <script>
            //차트 만드는 것 -- 후에 파라미터에 json array
            
            getChart();
           
    </script>
    <script>
    
    </script>
</body>
</html>