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
				<!-- 검색 -->    
			    <form class="form-group" action="lectureList.do" style="text-align: center;">
				
				
				<table class="searchform" style="margin: auto;">
					<tr>
						<td>
						<select name="keyword" class="form-control" style="height: 34px; width:80 em">
							<option value="all">전체</option>
							<option value="univ">대학</option>
						</select></td>
						<td><input type="text" class="form-control" placeholder="강의검색"
							id="search" name="search" size="90%" style="height: 34px;"></td>
						<td>
							<button class="btn btn-default" type="submit"
								style="height: 34px;">
								
								<i class="glyphicon glyphicon-search"></i>
								검색
							</button>
						</td>
					</tr>
				</table>
			</form>
			    
			    <table class="table" id="" align=center width=800>
			       
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
									<a onclick="location.href='review.do?lecture_id=${lecture.lecture_id }'">
										<div>${lecture.lecture_name}</div>
										<p>[${lecture.lecture_code }]</p>
									</a>
								</td> 
								
								<td>
									${lecture.professor}
								</td>
								
								<td class="star_rating" style="text-align:center;" >
									<div data-productid="313" class="rateit" 
										data-rateit-mode="font" data-rateit-value="${lecture.total_avg_score}" 
										data-rateit-readonly="true"
										style="font-size:100%;">
										${lecture.total_avg_score}
									</div>
			                   		
		                   			<div style="clear:both">
		                   				
		                   			</div>
		                   			
		                   			<div style="color:grey; font-size:0.8em;">
			                   			(${lecture.rating_count}명이 평가함)
			                   		</div>
								</td> 
								
							</tr>
					           
						</c:forEach>
						      
					</c:if>
					<tr >
						<td colspan="100%" style="text-align:right;">
							${page_index.endRow-page_index.startRow+1} 개의 결과가 검색 되었습니다.
						</td>
						
						
					</tr>
			        
			
			    </table>
			</div>
			        
			<div class="container text-center">
				
				
				
	            <ul class="pagination">
	              
	              <c:if test="${ page_index.currentPage>1}">
	                <li><a href="lectureList.do?currentPage=${page_index.firstIndex}<c:if test='${not empty page_index.keyword}'>&search=${page_index.search}&keyword=${page_index.keyword}</c:if>">맨처음</a></li>
	              </c:if>
	              <c:forEach varStatus="index" begin="${page_index.firstIndex}" 
	              	end="${page_index.lastIndex}">
	                <li><a href="lectureList.do?currentPage=${index.count}<c:if test='${not empty page_index.keyword}'>&search=${page_index.search}&keyword=${page_index.keyword}</c:if>">${index.count}</a></li>
	              </c:forEach>
	              <c:if test="${page_index.currentPage < page_index.totalPage}">  
	                <li><a href="lectureList.do?currentPage=${page_index.totalPage}<c:if test='${not empty page_index.keyword}'>&search=${page_index.search}&keyword=${page_index.keyword}</c:if>">맨끝</a></li>
				  </c:if>
				  
				  
	            </ul>
			</div>
       
     </div>   
       
     </body>
</html>