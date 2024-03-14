<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LoginReg</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

	<link rel="stylesheet" href="/css/main.css"/>

	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<h1>Welcome!</h1>
	<h2>Register</h2>
	<div class="container" >
		<form:form class="form" action="/register" method="POST" modelAttribute="registerUser">
		<div class="form-row">
			<form:label path="userName">User Name:</form:label>
			<form:errors path="userName"/>
			<form:input path="userName" class="form-control"/>
		</div>
		<div class="form-row">
			<form:label path="email">Email:</form:label>
			<form:errors path="email"/>
			<form:input type="email" path="email" class="form-control"/>
		</div>
		<div class="form-row">
			<form:label path="password">Password:</form:label>
			<form:errors path="password"/>
			<form:password path="password" class="form-control"/>
		</div>
		<div class="form-row">
			<form:label path="confirmPassword">Confirm Password:</form:label>
			<form:errors path="confirmPassword"/>
			<form:password path="confirmPassword" class="form-control"/>
		</div>
		<input class="btn btn-primary" type="submit" value="Register"/>
	</form:form>	
	</div>
	<div class = "container">
		<h1>Login:</h1>
	<form:form class="form" action="/login" method="POST" modelAttribute="loginUser">
		<div class="form-row">
			<form:label path="email">Email:</form:label>
			<form:errors path="email"/>
			<form:input type="email" path="email" class="form-control"/>
		</div>
		<div class="form-row">
			<form:label path="password">Password:</form:label>
			<form:errors path="password"/>
			<form:password path="password" class="form-control"/>
		</div>
		<input class="btn btn-primary" type="submit" value="log In"/>
	</form:form>	
	</div>
	
</body>
</html>
