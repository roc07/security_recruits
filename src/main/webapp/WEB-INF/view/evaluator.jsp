<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Evaluator Home Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base.css">
</head>

<body>
	<h1>${theEvaluator.getFirstName()} ${theEvaluator.getLastName()}</h1>

	<hr>
	
<div class="container">
  <div class="col-md-12  main-table">	
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Candidate <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
                  
          <th>Current/Max Score <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
          
          <th>Test Type <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>

          <th>Appraisal/Full Review <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th> 
        </tr>
      </thead>	
	<tbody>
		
	        	<c:forEach items="${theEvaluator.getScores()}" var="scores">	     

	        	<c:forEach items="${scores.getRecruits().tests}" var="tests" varStatus="status">
	        	
	        		<c:url var="goToRecruitPage" value="/recruitPage">
		        		<c:param name="recruitId" value="${scores.getRecruits().getId()}"></c:param>
		        	</c:url>
		        	
	        		<c:url var="goToTestPage" value="/testPage">
		        		<c:param name="testId" value="${tests.getId()}"></c:param>
		        	</c:url>
		        		        	        		
					<tr>   
						<c:if test="${scores.testId eq scores.getRecruits().tests.get(status.index).id}"> 
						<td>
			        		<a href="${goToRecruitPage}">
				        		<span class="glyphicon glyphicon-link"></span>
				        		${scores.getRecruits().getFirstName()}
				        		${scores.getRecruits().getLastName()}
			        		</a>        		
		        		</td>
		        		
						<td>						
			         		<a href="#"> 
			         		<span class="glyphicon glyphicon-link"></span>
			         		${scores.getTestScore()} 
			         		/ ${tests.getMaxScore()} 
		         			</a>		
		        		</td>  		        		     	

						<td>
			        		<a href="${goToTestPage}">
			        		<span class="glyphicon glyphicon-link"></span>
			        		${tests.getTestType()}
			        		</a>     		
		        		</td>
			        		
		        		<td>	
		        			<c:choose>
		        				<c:when test="${scores.getReview().size() > 0}">
		        					
		        					<form id="approach-form">
		        					Approach:
		        					 <select>
									  <option selected class="default-select">Default: ${scores.getReview().get(0).approach}</option>
									  <option value="1">1</option>
									  <option value="2">2</option>
									  <option value="3">3</option>
									  <option value="4">4</option>
									  <option value="5">5</option>
									</select> <br>
		        					<textarea rows="4" cols="80">
										${scores.getReview().get(0).approachText}
									</textarea> 
									<br>		 
									
									
									<input type="submit">	        					
		        					</form>

		        					
		        				</c:when>
		        		 	</c:choose>

		        	    </td>
		        	    
<%-- 		        		<c:choose> --%>
<%-- 			        		<c:when test="${theReview.getId() eq score.getReview().get(0).getId()}"> --%>
<%-- 			        			<strong>Approach: ${theReview.approach}/5</strong> --%>
<!-- 			        			<br>   -->
<%-- 			        			${theReview.approachText} --%>
<!-- 			        			<br><br> -->
<%-- 			        			<strong>Style: ${theReview.style}/5</strong> --%>
<!-- 			        			<br>   -->
<%-- 			        			${theReview.styleText} --%>
<!-- 			        			<br><br>	 -->
<%-- 			        			<strong>Algorithms: ${theReview.algorithms}/5</strong> --%>
<!-- 			        			<br>   -->
<%-- 			        			${theReview.algoText} --%>
<!-- 			        			<br><br>	 -->
<!-- 			        			<strong>Notable Solutions:</strong> -->
<!-- 			        			<br>   -->
<%-- 			        			${theReview.notableSolutions} --%>
<!-- 			        			<br><br>				        			 -->
<!-- 			        			<strong>Overall Impression:</strong> -->
<!-- 			        			<br>   -->
<%-- 			        			${theReview.overallImpression} --%>
<!-- 			        			<br><br>			        			 -->
<!-- 			        			<div class="appraisal-text"><strong>Appraisal:  -->
<%-- 			        			<span class="app-review">${theReview.appraisal}</span>/5</strong></div> --%>
<!-- 			        			<br>		        			 -->
<%-- 				        		<a href="${hideReview}">    --%>
<!-- 				        		Hide Review -->
<!-- 				        		</a>				        				        				        			 -->
<%-- 			        		</c:when> --%>
<%-- 			        		<c:otherwise> --%>
<%-- 				        		Appraisal: ${score.getReview().get(0).getAppraisal()} --%>
<!-- 				        		<br> -->
<%-- 				        		<a href="${goToFullReview}">    --%>
<!-- 				        		Full Review -->
<!-- 				        		</a>		        		 -->
<%-- 			        		</c:otherwise> --%>
<%-- 		        		</c:choose> --%>
		        				
		        		
		        		</c:if>	        				        				  		        		
					</tr>		
				</c:forEach>
			</c:forEach>
	</tbody>
	</table>
</div>

</div>
	
</body>

</html>