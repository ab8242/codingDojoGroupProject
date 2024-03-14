<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>	
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

	<link rel="stylesheet" href="/css/main.css"/>
</head>
<body>
	<h1>Update Question</h1>
	
	<a href="/dashboard">Dashboard</a>
	<div class = "container">
		<h2>New Question</h2>
		<form:form action="/questions/${editQuestion.id}/edit" method="PUT" modelAttribute="editQuestion" class="form">
			<div class="form-row">
				<form:label path="questionTitle">Your Question:</form:label>
				<form:errors path="questionTitle" />
				<form:textarea path="questionTitle" class="form-control"/>
			</div>
			<div class="form-row">
				<form:label path="option1">Possible Answer 1:</form:label>
				<form:errors path="option1" />
				<form:input path="option1" class="form-control"/>
			</div>
			<div class="form-row">
				<form:label path="option2">Possible Answer 2:</form:label>
				<form:errors path="option2" />
				<form:input path="option2" class="form-control" />
			</div>
			<div class="form-row">
				<form:label path="option3">Possible Answer 3:</form:label>
				<form:errors path="option3" />
				<form:input path="option3" class="form-control" />
			</div>
			<div class="form-row">
				<form:label path="option4">Possible Answer 4:</form:label>
				<form:errors path="option4" />
				<form:input path="option4" class="form-control" />
			</div>
			<div class="form-row">
				<form:label path="answer">Correct Answer:</form:label>
				<form:errors path="answer" />
				<form:input path="answer" class="form-control" />
			</div>
			<div class="form-row">
				<form:label path="category">Category:</form:label>
				<form:errors path="category" />
				<form:select name="category" path="category" class="form-control">
					<form:option value="Geography"></form:option>
					<form:option value="Entertainment"></form:option>
					<form:option value="History"></form:option>
					<form:option value="Art and Lierature"></form:option>
					<form:option value="Science and Nature"></form:option>
					<form:option value="Sports and Leisure"></form:option>
					<form:option value="Potpourri"></form:option>
				</form:select>
			</div>
			
			<input type="submit" value="Edit Question" class="btn btn-primary" />
		</form:form>
	</div>

</body>
</html>