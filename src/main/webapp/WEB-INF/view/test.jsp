<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Test Home Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base.css">	
</head>

<body>
	<c:set var="testid" value="${theTest.id}"></c:set>
	
	<h1>Test ${theTest.id} - ${theTest.testType}</h1>

	<br>

<div class="container">
  <div class="col-sm-12  main-table">	
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Current/Max Score <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
          <th>Candidate <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
          <th>Quick Review <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
          <th>Reviewer <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th> 
        </tr>
      </thead>	
	<tbody>
		
			<c:forEach items="${theTest.recruits}" var="items">
				<c:forEach items="${items.currentScore}" var="score">
					
				<c:url var="goToRecruitPage" value="/recruitPage">
        			<c:param name="recruitId" value="${items.id}"></c:param>
	        	</c:url>
	        	
	 	        <c:url var="goToEvaluatorPage" value="/evaluatorPage">
	        		<c:param name="evaluatorId" value="${score.getReview().get(0).evaluator.getId()}"></c:param>
	        	</c:url>
        	
					<c:if test="${score.testId eq testid}">
					<tr>
						<td>
							${score.testScore} / ${theTest.maxScore}
						</td>
						<td>
							<a href="${goToRecruitPage}">
				        		<span class="glyphicon glyphicon-link"></span>
								${items.firstName} 
								${items.lastName}
							</a>
						</td>
						
						<td>
							<table class="small-review">
			        			<tr>
			        			  <td class="small-review-td">Approach: ${score.getReview().get(0).getApproach()}
			        			  </td>
			         			  <td class="small-review-td">Style: ${score.getReview().get(0).getStyle()}
			        			  </td>       			  
			        			</tr>
			        			<tr>
			        			  <td class="small-review-td">Algorithms: ${score.getReview().get(0).getAlgorithms()}
			        			  </td> 			  
			         			  <td class="small-review-td"><a href="#">
			         			  <span class="glyphicon glyphicon-link"></span>
			         			  Appraisal: ${score.getReview().get(0).getAppraisal()}
			        			  </a>
			        			  </td>  
			        			</tr>        			
		        			</table>
						</td>
						<td>
							<a href="${goToEvaluatorPage}"> 
			         			<span class="glyphicon glyphicon-link"></span>
		        				${score.getReview().get(0).evaluator.getFirstName()} 
		        				${score.getReview().get(0).evaluator.getLastName()}
		        			</a>
						</td>
					</tr>		
					</c:if>
				</c:forEach>		
			</c:forEach>	
	</tbody>
	</table>
</div>
</div>

</body>

</html>