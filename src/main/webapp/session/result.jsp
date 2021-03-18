<%--
  Created by IntelliJ IDEA.
  User: SonTung
  Date: 17/03/2021
  Time: 9:55 am
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
<div class="row">
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%; background-color: white;">
        <div class="col-md-4">
            <img src="/session/images/logo.jpg" width="90px" height="50px">
        </div>
        <div class="collapse navbar-collapse col-md-4" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="/session">Quiz List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/session?action=history&idUser=${idUser}&username=${username}&page=1">History</a>
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
    <p style="text-align: center; width: 100%; color: white">Congrats! You got ${score} score!</p>
</div>
</body>
</html>
