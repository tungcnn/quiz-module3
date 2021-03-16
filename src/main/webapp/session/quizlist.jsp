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
<body>
<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%">
            <div class="col-md-4">
                LOGO
            </div>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="">Quiz List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">History</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">LeaderBoard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="row">
        <h1 style="margin-left: auto; margin-right: auto;">Quiz List</h1>
    </div>
    <div class="row">
        <div class="col-md-10 offset-1">
            <div class="input-group mb-3" style="width: 40%;float: right;">
                <form action="" method="post">
                    <input type="text" name="idSearch" class="form-control">
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
            </div>
            <br>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 offset-1">
            <table class="table table-bordered table-striped" style="text-align: center;">
                <thead>
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
                            <a href="/session?action=play&id=${quiz.id}" class="btn btn-primary">
                                Play
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="row">
                <div class="col-md-4">
                    <p>Showing 0 to 0 of 0 entries</p>
                </div>
        </div>
    </div>
</div>
</body>
</html>
