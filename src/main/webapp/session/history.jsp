<%--
  Created by IntelliJ IDEA.
  User: SonTung
  Date: 17/03/2021
  Time: 10:20 am
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
            <div class="col-md-2">
                <img src="/session/images/logo.jpg" width="90px" height="50px">
            </div>
            <div class="collapse navbar-collapse col-md-4 offset-2" id="navbarNav">
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
            <div class="col-md-4" style="text-align: right;">
                <span>Username: ${username}</span>
                <span>ID: ${idUser}</span>
            </div>
        </nav>
    </div>
    <div class="row">
        <h1 style="margin-left: auto; margin-right: auto; color: white; padding: 20px">HISTORY</h1>
    </div>
    <div class="row">
        <div class="col-md-6 offset-3">
            <div class="row">
                <div class="col-md-2">
                    <select class="custom-select" onchange="location = this.value;">
                        <option>Showing</option>
                        <c:forEach items="${showings}" var="showing">
                            <option value="/session?action=history&idUser=${idUser}&username=${username}&page=${page}&selectedShowing=${showing}">
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
                                       href="/session?action=history&idUser=${idUser}&username=${username}&page=${page - 1}&selectedShowing=${selectedShowing}">Previous</a>
                                </li>
                            </c:if>
                            <c:forEach items="${pages}" var="page">
                                <li class="page-item">
                                    <a class="page-link"
                                       href="/session?action=history&idUser=${idUser}&username=${username}&page=${page}&selectedShowing=${selectedShowing}">${page}
                                    </a>
                                </li>
                            </c:forEach>
                            <c:if test="${page < pages.size()}">
                                <li class="page-item">
                                    <a class="page-link"
                                       href="/session?action=history&idUser=${idUser}&username=${username}&page=${page + 1}&selectedShowing=${selectedShowing}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
            <table class="table table-hover table-striped" style="background-color: white; text-align: center">
                <tr>
                    <th>Session ID</th>
                    <th>Quiz Name</th>
                    <th>Quiz Difficulty</th>
                    <th>Score Earned</th>
                    <th>Time</th>
                </tr>
                <tbody>
                <c:forEach items="${sessions}" var="session">
                    <tr>
                        <td>${session.sessionID}</td>
                        <td>${session.quizName}</td>
                        <td>${session.quizDifficulty}</td>
                        <td>${session.score}</td>
                        <td>${session.date}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
