<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="form" uri = "http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>One Question</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

	<link rel="stylesheet" href="/css/main.css"/>

	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<a href="/dashboard">Dashboard</a>
<div class="d-flex justify-content-center">
<div class="p-5 border border-dark-subtle shadow mt-5" >

	<h1><c:out value="${question.questionTitle}"/></h1>
	<p class="fs-5">Category: <c:out value="${question.category}"/></p>
	<p>Option 1: <c:out value="${question.option1}"/></p>
	<p>Option 2: <c:out value="${question.option2}"/></p>
	<p>Option 3: <c:out value="${question.option3}"/></p>
	<p>Option 4: <c:out value="${question.option4}"/></p>
	
	<p class="d-inline-flex gap-1">
	  <a class="btn btn-outline-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
	    Answer: 
	  </a>
	</p>
	<div class="collapse" id="collapseExample">
	  <div class="card card-body">
	    <c:out value="${question.answer}"/>
	  </div>
	</div>
	
	</div>
	</div>


</body>
</html>
