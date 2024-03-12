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
</head>
<body>
<h1>Welcome!</h1>
	<h2>Register</h2>
	<form:form class="form" action="/register" method="POST" modelAttribute="registerUser">
		<div>
			<form:label path="userName">User Name:</form:label>
			<form:errors path="userName"/>
			<form:input path="userName"/>
		</div>
		<div>
			<form:label path="email">Email:</form:label>
			<form:errors path="email"/>
			<form:input type="email" path="email"/>
		</div>
		<div>
			<form:label path="password">Password:</form:label>
			<form:errors path="password"/>
			<form:password path="password"/>
		</div>
		<div>
			<form:label path="confirmPassword">Confirm Password:</form:label>
			<form:errors path="confirmPassword"/>
			<form:password path="confirmPassword"/>
		</div>
		<input class="btn btn-primary" type="submit" value="Register"/>
	</form:form>
	<h1>Login:</h1>
	<form:form class="form" action="/login" method="POST" modelAttribute="loginUser">
		<div>
			<form:label path="email">Email:</form:label>
			<form:errors path="email"/>
			<form:input type="email" path="email"/>
		</div>
		<div>
			<form:label path="password">Password:</form:label>
			<form:errors path="password"/>
			<form:password path="password"/>
		</div>
		<input class="btn btn-primary" type="submit" value="log In"/>
	</form:form>
</body>
</html>