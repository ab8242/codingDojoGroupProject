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
        <table class="table shadow rounded-4 table-hover ">
            <tr class="table-secondary">
                <th class="p-4 fs-5 align-middle">Quiz</th>
                <th class="p-4 fs-5 align-middle">Posted By</th>
                <th class="p-4 fs-5 align-middle">Actions</th>
            </tr>
            <c:forEach var="quiz" items="${quizzes}">
                <tr>
                    <td class="p-3 fs-6 align-middle"><a href="/quiz/${quiz.id}"><c:out value="${quiz.title}"/></a></td>
                    <td class="p-3 fs-6 align-middle"><c:out value="Unknown"/></td> <!-- Update with actual category -->
                    <td class="p-3 fs-6 align-middle"><c:out value="${quiz.quizCreator.userName}"/></td>
                    <td class="p-3 fs-6 d-flex gap-3 align-middle">
                        <a class="btn btn-outline-success" href="/quiz/${quiz.id}/edit">Edit</a> | 
                        <form action="/quiz/${quiz.id}/delete" method="POST" >
                            <input type="hidden" name="_method" value="DELETE">
                            <button type="submit" class="btn btn-outline-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <a href="/quiz/create" class="btn btn-primary ms-3">Create Quiz</a>
    <a href="/dashboard" class="btn btn-primary ms-3">Question Dashboard</a>
</body>
</html>

