<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Create new customer</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="header">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">

            <a class="navbar-brand" href="/users">HomePage</a>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="/users?action=login">Log Out</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/users?action=register">Play Quizz</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>

    <div class="content col-md-4 offset-4">
        <h1 style="text-align: center">Player Details</h1>
        <form>
            <div class="form-group">
                <label for="formGroupExampleInput">Name</label>
                <input type="text" class="form-control" id="formGroupExampleInput" name="name"
                       value= "${requestScope["user"].getName()}"/>
            </div>
            <div class="form-group">
                <label for="formGroupExampleInput2">User Name</label>
                <input type="text" class="form-control" id="formGroupExampleInput2" name="username"
                       value="${requestScope["user"].getUserName()}"/>
            </div>
            <div class="form-group">
                <label for="formGroupExampleInput3">Email</label>
                <input type="text" class="form-control" id="formGroupExampleInput3" name="email"
                       value="${requestScope["user"].getEmail()}"/>
            </div>
        </form>
    </div>
    <div class="footer">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            © 2021 Copyright:
            <a class="text-dark" href="#">TDH.com</a>
        </div>
    </div>
</div>
</body>
</html>