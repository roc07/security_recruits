<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Hr Main Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base.css">

    <script type="text/javascript" src="<c:url value="/resources/js/main.js" />"> </script>
</head>

<body>
	<h1>HR PAGE</h1>
	<hr>
	
	<a href="/">MAIL TEST</a>
<div class="container">
  <div class="col-sm-12  main-table">
    <h2>Recruits' Table</h2>
             
     <br>
     
     <div class="btn-group btn-group-justified">
	  <a href="#" class="btn btn-primary">
	  <span class="glyphicon glyphicon-plus"></span>
	  Add Row</a>
	  
	  <a href="#" class="btn btn-primary">
	  <span class="glyphicon glyphicon-search"></span>
	  Search By</a>
	
      <button type="button" class="btn btn-primary" id="colorTrickShow" onclick="colorTrickShow()">
      <span class="glyphicon glyphicon-ok"></span>
      Score Colors</button>
      
	  <button type="button" class="btn btn-primary" id="colorTrickHide" onclick="colorTrickHide()">
	  <span class="glyphicon glyphicon-remove"></span>
	  Clear Colors</button>

	 </div>  
	
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Candidate <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
          <th>Email <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
          <th>Phone <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
  
          <th>Reviewer <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
          <th>Test Status <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
          <th>Quick Review <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
          
          <th>Current/Max Score <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>                
          <th>Test Type <button class="sorter"><span class="glyphicon glyphicon-arrow-up"></span></button> 
          <button class="sorter"><span class="glyphicon glyphicon-arrow-down"></span></button> </th>
          
        </tr>
      </thead>
      <tbody>
        <c:forEach var="recruits" items="${allRecruits}">
 	
 	        <c:url var="goToRecruitPage" value="/recruitPage">
        		<c:param name="recruitId" value="${recruits.id}"></c:param>
        	</c:url>
        	
 	        <c:url var="goToEvaluatorPage" value="/evaluatorPage">
        		<c:param name="evaluatorId" value="${recruits.currentScore.get(status.index).getReview().get(0).evaluator.getId()}"></c:param>
        	</c:url>
        	       	 
			<!------>
        	<c:forEach var="test" items="${recruits.tests}" varStatus="status">   
        	
	        	<c:url var="goToTestPage" value="/testPage">
	        		<c:param name="testId" value="${test.getId()}"></c:param>
	        	</c:url> 
	        	
	        	<c:url var="goToFullReview" value="/fullReview">
	        		<c:param name="recruitId" value="${recruits.getId()}"></c:param>
	        		<c:param name="reviewId" value="${recruits.currentScore.get(status.index).getReview().get(0).getId()}"></c:param>
	        	</c:url>
	        		
	        	<tr>
	        		<td>
		        		<a href="${goToRecruitPage}">
			        		<span class="glyphicon glyphicon-link"></span>
			        		${recruits.firstName} 
			        		${recruits.lastName}
		        		</a>        		
	        		</td>
	        		<td>
		        		<a href="#" class="mail-link">
		        		<span class="glyphicon glyphicon-envelope"></span>
		        		${recruits.email}        		
		        		</a>
	        		</td>
	        		<td>${recruits.phone}</td>
	
	        		<td>
<%-- 	        		<c:choose> --%>
<%-- 	        		<c:when test="${recruits.currentScore.size() ne 0}"> --%>
<%-- 	        		<c:if test="${recruits.currentScore.get(status.index).getReview().get(0).evaluator.getFirstName() ne null}"> --%>
<%-- 		        		<a href="${goToEvaluatorPage}">  --%>
<!-- 			         	<span class="glyphicon glyphicon-link"></span> -->
<%-- 		        		${recruits.currentScore.get(status.index).getReview().get(0).evaluator.getFirstName()}  --%>
<%-- 		        		${recruits.currentScore.get(status.index).getReview().get(0).evaluator.getLastName()} --%>
<!-- 		        		</a> -->
<%-- 					</c:if> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<%-- 						<form> --%>
<!-- 						<select> -->
<%-- 									  <option selected class="default-select">Default: ${scores.getReview().get(0).approach}</option> --%>
<!-- 									  <option value="1">1</option> -->
<!-- 									  <option value="2">2</option> -->
<!-- 									  <option value="3">3</option> -->
<!-- 									  <option value="4">4</option> -->
<!-- 									  <option value="5">5</option> -->
<!-- 						</select> -->
<%-- 						</form> --%>
<%-- 					</c:otherwise> --%>
<%-- 					</c:choose> --%>

		        		<a href="#"> 
			         	<span class="glyphicon glyphicon-link"></span>
		        		${recruits.currentScore.get(status.index).getReview().get(0).evaluator.getFirstName()} 
		        		${recruits.currentScore.get(status.index).getReview().get(0).evaluator.getLastName()}
		        		</a>

	        		</td>
	        		
	        		<td> ___ </td>
		
	        		<td>
		        		<table class="small-review">
		        			<tr>
		        			  <td class="small-review-td">Approach: ${recruits.currentScore.get(status.index).getReview().get(0).getApproach()}
		        			  </td>
		         			  <td class="small-review-td">Style: ${recruits.currentScore.get(status.index).getReview().get(0).getStyle()}
		        			  </td>       			  
		        			</tr>
		        			<tr>
		        			  <td class="small-review-td">Algorithms: ${recruits.currentScore.get(status.index).getReview().get(0).getAlgorithms()}
		        			  </td> 			  
		         			  <td class="small-review-td">
<%-- 		         			  <a href="${goToFullReview}"> --%>
		         			  <a href="#">
		         			  <span class="glyphicon glyphicon-link"></span>
		         			  Appraisal: ${recruits.currentScore.get(status.index).getReview().get(0).getAppraisal()}
		        			  </a>
		        			  </td>  
		        			</tr>        			
		        		</table>
	        		</td>   
	        		  
	        		<c:set var = "cScore" value = "${recruits.currentScore.get(status.index).getTestScore()}"/>
	         		<td class="scores-cl">
	         			<div >
		         		<a href="#"> 
		         		<span class="glyphicon glyphicon-link"></span>		         		
		         		<span class="curr-score">${recruits.currentScore.get(status.index).getTestScore()}</span>
		         		/ <span class="max-score">${test.getMaxScore()}</span> 
		         		</a>
		         		<button class="color-button"
		         		onclick='scoreEvaluator(${cScore}, ${test.getMaxScore()}, "scores-cl", ${cScore / test.getMaxScore()})'>COLOR ME!</button>
		         		</div>
		         		
	         		</td>
	         			         		
	        		<td>
		        		<a href="${goToTestPage}">
		        		<span class="glyphicon glyphicon-link"></span>
		        		${test.testType}
		        		</a>     		
	        		</td>		  		        		
	        	</tr>     
        	</c:forEach>    
        </c:forEach>

	  </tbody>
    </table>
  </div>
</div>
  
  
</body>

</html>