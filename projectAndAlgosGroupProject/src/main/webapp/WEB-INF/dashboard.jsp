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

	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<h1>Dashboard</h1>
<form action="/logout" method="post">
		<input type="submit" value="Logout"/>
	</form>
<h1>Welcome, <c:out value="${ loggedUser.userName }"></c:out>!!</h1>
	
<div class="container">

		<table class="table">

			<tr>
				<th>Question</th>
				<th>Posted By</th>
			</tr>
			<c:forEach var="question" items="${questions}">

				<tr>
					<td><a href="/questions/${question.id}"><c:out value="${question.questionTitle}"/></a></td>
					<td><c:out value="${question.user.userName}"/></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<a href="/questions/add">Add Question</a>
</body>
</html>
