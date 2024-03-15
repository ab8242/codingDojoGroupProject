<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Result</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/main.css"/>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<a href="/quiz/dashboard"class="btn btn-primary ms-3">Back to Dashboard</a>
<div class="d-flex justify-content-center">
<div class="p-5 border border-dark-subtle shadow mt-5" >

<h1 class="d-flex justify-content-center mt-4">Quiz Results!</h1>
<p class="d-flex justify-content-center mt-4">Your score: ${score}</p>
</div>
</div>
</body>
</html>
