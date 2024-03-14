<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="form" uri = "http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

	<link rel="stylesheet" href="/css/main.css"/>

	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<a href="/quiz/dashboard"class="btn btn-primary ms-3">Quit Quiz</a>
<div class="d-flex justify-content-center">
<div class="p-5 border border-dark-subtle shadow mt-5" >

<form:form action="/quiz/result" method="post" class="form">
	<h1>Welcome to the Quiz</h1>
	<c:forEach var="question" items="${questions}">
		<p>Question ${question.id}: <c:out value="${question.questionTitle}"/></p>
		<p><c:out value="${question.option1}"/><input type="radio" name="${question.id}"></p>
		<p><c:out value="${question.option2}"/><input type="radio" name="${question.id}"></p>
		<p><c:out value="${question.option3}"/><input type="radio" name="${question.id}"></p>
		<p><c:out value="${question.option4}"/><input type="radio" name="${question.id}"></p>
	</c:forEach>
	<input type=submit value = submit>	
</form:form>
<script>
const radioGroups = document.querySelectorAll('input[type="radio"]');

radioGroups.forEach(group => {
    group.addEventListener('click', function() {
        const clickedButton = this;
        const groupName = clickedButton.getAttribute('name');
        const buttonsInGroup = document.querySelectorAll('input[type="radio"][name="' + groupName + '"]');
        buttonsInGroup.forEach(button => {
            if (button !== clickedButton) {
                button.checked = false;
            }
        });
    });
});
	
</script>
	
	</div>
	</div>


</body>
</html>
