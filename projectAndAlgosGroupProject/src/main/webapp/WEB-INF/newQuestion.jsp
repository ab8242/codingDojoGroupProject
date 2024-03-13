<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>	
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Questions</title>
</head>
<body>
<h1>Add Question to the Quiz</h1>
	
	<a href="/dashboard">dashboard</a>
	<div>
		<h2>New Question</h2>
		<form:form action="/questions/add" method="post" modelAttribute="newQuestion">
			<div>
				<form:label path="questionTitle">Your Question:</form:label>
				<form:errors path="questionTitle" />
				<form:textarea path="questionTitle" />
			</div>
			<div>
				<form:label path="option1">Possible Answer 1:</form:label>
				<form:errors path="option1" />
				<form:input path="option1" />
			</div>
			<div>
				<form:label path="option2">Possible Answer 2:</form:label>
				<form:errors path="option2" />
				<form:input path="option2" />
			</div>
			<div>
				<form:label path="option3">Possible Answer 3:</form:label>
				<form:errors path="option3" />
				<form:input path="option3" />
			</div>
			<div>
				<form:label path="option4">Possible Answer 4:</form:label>
				<form:errors path="option4" />
				<form:input path="option4" />
			</div>
			<div>
				<form:label path="answer">Correct Answer:</form:label>
				<form:errors path="answer" />
				<form:input path="answer" />
			</div>
			<div>
				<form:label path="category">Category:</form:label>
				<form:errors path="category" />
				<form:select name="category" path="category">
					<form:option value="Geography"></form:option>
					<form:option value="Entertainment"></form:option>
					<form:option value="History"></form:option>
					<form:option value="Art and Lierature"></form:option>
					<form:option value="Science and Nature"></form:option>
					<form:option value="Sports and Leisure"></form:option>
					<form:option value="Potpourri"></form:option>
				</form:select>
			</div>
			
			<input type="submit" value="Submit Question" />
		</form:form>
	</div>
</body>
</html>