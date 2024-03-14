<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/main.css"/>
</head>
<body>
    <div class="d-flex justify-content-between p-2 border-bottom border-dark-subtle align-middle ">
        <h1 class="ms-3">Quiz Dashboard</h1>
        <form class="mt-2 me-3" action="/logout" method="post">
            <input class="btn btn-outline-danger align-middle" type="submit" value="Logout"/>
        </form>
    </div>
    <h1 class="d-flex justify-content-center mt-4">Welcome <c:out value="${loggedUser.userName}"/>!! Are you ready to take a quiz??</h1>
    
    <div class="p-4 d-flex justify-content-center rounded ">
        <a href="/quiz/start" class="btn btn-primary ms-3">Start Quiz</a>
    	<a href="/dashboard" class="btn btn-primary ms-3">Question Dashboard</a>
    </div>
</body>
</html>

