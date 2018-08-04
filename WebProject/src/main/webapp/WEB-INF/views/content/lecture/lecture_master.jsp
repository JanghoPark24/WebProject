<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<%-- <c:set var="lec_List" value="${sessionScope.lectureList}"></c:set> --%>

<!DOCTYPE html>

<html>
    <head>
         <meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    
   <link rel="stylesheet" href="${contextPath}/css/lecture/lectureList.css">
   <link rel="stylesheet" href="${contextPath}/css/rating/rateit.css">
   <link rel="stylesheet" href="${contextPath}/css/review.css">
   <script src="${contextPath}/js/rating/jquery.rateit.js"></script>
    <script src="${contextPath}/js/review.js" charset="utf-8"></script>
   

	<body>
    
    
  
        
            
<div class="container text-center">    
 	<h2 align=center>강의 목록</h2>
			<div class="container text-center">    
			    <form action="lectureList.do"  method="get">
	        		<!-- search-->
		            <input type="text" class="search" placeholder="강의 검색" id="search" weight="30">
		            <button type=submit weight="10">검색</button>
	            </form>
			    
			    <table class="table" id="" align=center width=800  >
			       
					<tr id="lectureList_columns" >
						<td>
							대학/전공
						</td>
						
						<td>
							학년-학기
						</td>
						<td>
							강의명[강의코드]
						</td>
						
						<td>
							교수
						</td> 
						
						<td>
							평점
						</td> 
						
					</tr>
					
					
			        <tr class="lectureList_content">
						<td>
							대학
						</td>
						<td>
							<a href="review.do">
							강의명
							</a>
						</td> 
						<td>
							수강학기
						</td>
						
						
						<td>
							강의코드
						</td>
						
						<td class="star_rating">
							<div data-productid="313" class="rateit" 
								data-rateit-mode="font" data-rateit-value="2.5" 
								data-rateit-readonly="true"
								style="font-size:100%;">
							</div>
                   		<div style="clear: both;">
                   			2.5
                   		</div>
                   			
                   			
						</td> 
						
					</tr>
					<c:if test="${empty lectureList  }">
						<tr class="lectureList_content">
							<td colspan="100%">
							올라온 강의가 없습니다.
							</td>
						</tr>
					</c:if>
					<c:if test="${not empty lectureList}">
						<c:forEach items="${lectureList}" var="lecture" >
							<tr class="lectureList_content">
								
								<td>
									${lecture.univ_name}/${lecture.major}
								</td>
							
								<td>
									${lecture.grade}-${lecture.semester}
								</td>
								<td>
									<a onclick="location.href='review.do?${lecture.lecture_id }'">
										<div>${lecture.lecture_name}</div>
										<p>[${lecture.lecture_code }]</p>
									</a>
								</td> 
								
								<td>
									${lecture.professor}
								</td>
								
								<td class="star_rating">
									<div data-productid="313" class="rateit" 
										data-rateit-mode="font" data-rateit-value="${lecture.total_avg_score}" 
										data-rateit-readonly="true"
										style="font-size:100%; float:left;">
										${lecture.total_avg_score}
									</div>
			                   		<div style="color:grey;">
			                   			(${lecture.rating_count})
			                   		</div>
		                   			<div style="clear:both"></div>
		                   			
								</td> 
								
							</tr>
					           
						</c:forEach>>
						      
					</c:if>
			        <tr>
			            <td colspan="100%">
			            	<a href="insertLectureView.do">
			            		<button type="button" class="btn btn-primary">강의 입력</button>
			            	</a>
			            </td>
			        </tr> 
			
			    </table>
			</div>
			        
			<div class="container text-center">
	            <ul class="pagination">
	            	
	                <li><a href="#">맨처음</a>
	                <li><a href="#">1</a></li>
	                
	                <li><a href="#">맨끝</a>
	            </ul>
			</div>
       
     </div>   
       
     </body>
</html>