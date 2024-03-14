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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

	<link rel="stylesheet" href="/css/main.css"/>

	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body >

<h1 class="d-flex justify-content-center mt-4">Welcome!</h1>
	<div class="d-flex justify-content-center gap-4 p-3">
	<div class=" border border-dark-subtle shadow-sm w-75 p-4 rounded-4 " >
		<h2>Register</h2>
		<form:form  action="/register" method="POST" modelAttribute="registerUser">
		<div class=" mb-3 ">
			<form:label path="userName" class="form-label">User Name:</form:label>
			<form:errors path="userName"/>
			<form:input path="userName" class="form-control"/>
		</div>
		<div class=" mb-3">
			<form:label path="email" class="form-label">Email:</form:label>
			<form:errors path="email"/>
			<form:input type="email" path="email" class="form-control"/>
		</div>
		<div class=" mb-3">
			<form:label path="password" class="form-label">Password:</form:label>
			<form:errors path="password"/>
			<form:password path="password" class="form-control"/>
		</div>
		<div class="mb-3">
			<form:label path="confirmPassword" class="form-label">Confirm Password:</form:label>
			<form:errors path="confirmPassword"/>
			<form:password path="confirmPassword" class="form-control"/>
		</div>
		<input class="btn btn-primary" type="submit" value="Register"/>
	</form:form>	
	</div>
	<div class=" border border-dark-subtle shadow-sm w-75 p-4 rounded-4">
		<h1>Login:</h1>
	<form:form class="form" action="/login" method="POST" modelAttribute="loginUser">
		<div class=" mb-3">
			<form:label path="email" class="form-label">Email:</form:label>
			<form:errors path="email"/>
			<form:input type="email" path="email" class="form-control"/>
		</div>
		<div class="mb-3">
			<form:label path="password" class="form-label">Password:</form:label>
			<form:errors path="password"/>
			<form:password path="password" class="form-control"/>
		</div>
		<input class="btn btn-primary" type="submit" value="log In"/>
	</form:form>	
	</div>
	</div>
	
</body>
</html>
