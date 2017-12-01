<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Recruit Home Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <script type="text/javascript" src="<c:url value="/resources/js/main.js" />"> </script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base.css">
</head>

<body>
	<h1>${theRecruit.firstName} ${theRecruit.lastName}</h1>
	<hr>
	
<div class="container">
  <div class="col-md-12  main-table">	
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Current/Max Score <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
          <th>Test Type <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
          <th>Reviewer <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
          <th>Appraisal/Full Review <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th> 
        </tr>
      </thead>	
	<tbody>
		
	        	<c:forEach items="${theRecruit.currentScore}" var="score" varStatus="status">
	        	
		        	<c:url var="goToTestPage" value="/testPage">
		        		<c:param name="testId" value="${theRecruit.tests.get(status.index).getId()}"></c:param>
		        	</c:url> 
	        		        	
	        		<c:url var="goToEvaluatorPage" value="/evaluatorPage">
	        			<c:param name="evaluatorId" value="${score.getReview().get(0).evaluator.getId()}"></c:param>
	        		</c:url>

	        		<c:url var="goToFullReview" value="/fullReview">
	        			<c:param name="recruitId" value="${theRecruit.getId()}"></c:param>
	        			<c:param name="reviewId" value="${score.getReview().get(0).getId()}"></c:param>
	        		</c:url>
	        			      
	        		<c:url var="hideReview" value="/recruitPage">
		        		<c:param name="recruitId" value="${theRecruit.getId()}"></c:param>
		        	</c:url>	        		
					<tr>        	
						<td>						
			         		<a href="#"> 
			         		<span class="glyphicon glyphicon-link"></span>
			         		${score.getTestScore()} 
			         		/ ${theRecruit.tests.get(status.index).getMaxScore()} 
		         			</a>		
		        		</td>        	

						<td>
			        		<a href="${goToTestPage}">
			        		<span class="glyphicon glyphicon-link"></span>
			        		${theRecruit.tests.get(status.index).testType}
			        		</a>     		
		        		</td>

		        		<td>
			        		<a href="${goToEvaluatorPage}"> 
				         	<span class="glyphicon glyphicon-link"></span>
			        		${score.getReview().get(0).evaluator.getFirstName()} 
			        		${score.getReview().get(0).evaluator.getLastName()}
			        		</a>
		        		</td>	
		        		
		        		<td>	 

		        		<c:choose>
			        		<c:when test="${theReview.getId() eq score.getReview().get(0).getId()}">
			        			<strong>Approach: ${theReview.approach}/5</strong>
			        			<br>  
			        			${theReview.approachText}
			        			<br><br>
			        			<strong>Style: ${theReview.style}/5</strong>
			        			<br>  
			        			${theReview.styleText}
			        			<br><br>	
			        			<strong>Algorithms: ${theReview.algorithms}/5</strong>
			        			<br>  
			        			${theReview.algoText}
			        			<br><br>	
			        			<strong>Notable Solutions:</strong>
			        			<br>  
			        			${theReview.notableSolutions}
			        			<br><br>				        			
			        			<strong>Overall Impression:</strong>
			        			<br>  
			        			${theReview.overallImpression}
			        			<br><br>			        			
			        			<div class="appraisal-text"><strong>Appraisal: 
			        			<span class="app-review">${theReview.appraisal}</span>/5</strong></div>
			        			<br>		        			
				        		<a href="${hideReview}">   
				        		Hide Review
				        		</a>				        				        				        			
			        		</c:when>
			        		<c:otherwise>
				        		Appraisal: ${score.getReview().get(0).getAppraisal()}
				        		<br>
				        		<a href="${goToFullReview}">   
				        		Full Review
				        		</a>		        		
			        		</c:otherwise>
		        		</c:choose>
		        				
		        		</td>	        				        				  		        		
					</tr>		
				</c:forEach>
	
	</tbody>
	</table>
</div>

</div>
	
</body>

</html>