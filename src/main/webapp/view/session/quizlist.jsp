<%--
  Created by IntelliJ IDEA.
  User: SonTung
  Date: 12/03/2021
  Time: 2:57 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
</head>
<body style="background-color: #23395d">
<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%; background-color: white">
            <div class="col-md-1">
                <img src="/view/session/images/logo.jpg" width="90px" height="50px">
            </div>
            <form class="col-md-3 input-group mb-3" style="margin-top: 10px" action="/session?action=search"
                  method="post">
                <input type="text" class="form-control" placeholder="search for quiz" name="searchField"
                       aria-describedby="button-addon2">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Search</button>
                </div>
            </form>
            <div class="collapse navbar-collapse col-md-2" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link"
                           href="?action=quizlist&idUser=${idUser}&username=${username}&page=1&selectedShowing=10">Quiz
                            List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
                           href="/session?action=history&idUser=${idUser}&username=${username}&page=1&selectedShowing=10">History</a>
                    </li>
                </ul>
            </div>
            <div class="col-md-3" style="text-align: right; color: black">
                <span>Username: ${username}</span>
                <span>ID: ${idUser}</span>
            </div>
            <div class="col-md-2">
                <a class="nav-link" href="/users?action=login">Log Out</a>
            </div>
        </nav>
    </div>
    <div class="row">
        <h1 style="margin-left: auto; margin-right: auto; color: white; padding: 20px">Quiz List</h1>
    </div>
    <div class="row">
        <div class="col-md-8 offset-2">
            <div class="row">
                <div class="col-md-2">
                    <select class="custom-select" onchange="location = this.value;">
                        <option>Showing</option>
                        <c:forEach items="${showings}" var="showing">
                            <option value="/session?action=quizlist&idUser=${idUser}&username=${username}&page=${page}&selectedShowing=${showing}">
                                    ${showing}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-4">
                    <p style="color: white">On page ${page} showing ${selectedShowing} items</p>
                </div>
                <div class="col-md-6">
                    <nav aria-label="Page navigation example" style="float: right">
                        <ul class="pagination">
                            <c:if test="${page > 1}">
                            <li class="page-item">
                                <a class="page-link"
                                   href="/session?action=quizlist&idUser=${idUser}&username=${username}&page=${page - 1}&selectedShowing=${selectedShowing}">Previous</a>
                            </li>
                            </c:if>
                            <c:forEach items="${pages}" var="page">
                                <li class="page-item">
                                    <a class="page-link"
                                       href="/session?action=quizlist&idUser=${idUser}&username=${username}&page=${page}&selectedShowing=${selectedShowing}">${page}
                                    </a>
                                </li>
                            </c:forEach>
                            <c:if test="${page < pages.size()}">
                            <li class="page-item">
                                <a class="page-link"
                                   href="/session?action=quizlist&idUser=${idUser}&username=${username}&page=${page + 1}&selectedShowing=${selectedShowing}">Next</a>
                            </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
            <table class="table table-bordered table-striped" style="text-align: center; background-color: white;">
                <thead style="background-color: #485063; color: white">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Quiz Name</th>
                    <th scope="col">Quiz Difficulty</th>
                    <th scope="col">Play</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${quizes}" var="quiz">
                    <tr>
                        <td>${quiz.id}</td>
                        <td>${quiz.name}</td>
                        <td>${quiz.difficulty}</td>
                        <td>
                            <a href="/session?action=play&idQuiz=${quiz.id}&idUser=${idUser}&username=${username}&quizName=${quiz.name}"
                               class="btn btn-primary">
                                Play
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
