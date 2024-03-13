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
</head>
<body>
<h1>Dashboard</h1>
<form action="/logout" method="post">
		<input type="submit" value="Logout"/>
	</form>
<h1>Welcome, <c:out value="${ loggedUser.userName }"></c:out>!!</h1>
	
	<div>
		
	</div>
	<a href="/questions/add">Add Question</a>
</body>
</html>