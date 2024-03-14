<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Quiz</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/main.css"/>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<h1>Create Quiz</h1>
<form:form action="/quiz/create" method="post" modelAttribute="newQuiz" class="form">
    <div class="form-row">
        <label for="title">Title:</label>
        <form:errors path="title" />
        <form:input path="title" id="title" class="form-control"/>
    </div>
    <div class="form-row">
        <label for="numQuestions">Number of Questions:</label>
        <form:errors path="numQuestions" />
        <form:input path="numQuestions" id="numQuestions" class="form-control" type="number" min="1"/>
    </div>
    <input type="submit" value="Create Quiz" class="btn btn-primary" />
</form:form>
</body>
</html>
