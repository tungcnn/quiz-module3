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
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">

            <a class="navbar-brand" href="/users">HomePage</a>

            <div id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0" style="padding-left: 786px">
                    <li class="nav-item active">
                        <a class="nav-link" href="/users?action=login">Log Out</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link"
                           href="/session?action=quizlist&username=${user.name}&idUser=${user.id}&page=1&selectedShowing=10">Play
                            Quizz</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="content col-md-4 offset-4">
        <h1 style="text-align: center">Player Details</h1>
        <form action="/users?action=update" method="post">
            <div class="form-group">
                <label for="id">ID</label>
                <input readonly type="text" class="form-control" id="id" name="id"
                       value="${requestScope["user"].getId()}"/>
            </div>
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name"
                       value="${requestScope["user"].getName()}"/>
            </div>
            <div class="form-group">
                <label for="username">User Name</label>
                <input readonly type="text" class="form-control" id="username" name="username"
                       value="${requestScope["user"].getUserName()}"/>
            </div>

            <div class="form-group">
                <label for="username">Pass Word</label>
                <div class="input-group mb-3">
                    <input type="text" class="form-control"
                           id="pwd" name="password" value="${requestScope["user"].getPassWord()}">
                    <button class="btn btn-outline-secondary" type="button" id="eye">
                        <img src="https://cdn0.iconfinder.com/data/icons/feather/96/eye-16.png" alt="eye"/>
                    </button>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" class="form-control" id="email" name="email"
                       value="${requestScope["user"].getEmail()}"/>
            </div>
            <div class="form-group">
                <label for="host">Host</label>
                <input readonly type="text" class="form-control" id="host" name="host"
                       value="${requestScope["user"].getHost()}"/>
            </div>
            <div class="">
                <button type="submit" class="btn btn-primary btn-block mb-4" style="text-align: center">Update</button>
            </div>
        </form>
    </div>
    <div class="footer">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            © 2021 Copyright:
            <a class="text-while" href="#">TDH.com</a>
        </div>
    </div>
</div>
</body>
<script>
    function show() {
        var p = document.getElementById('pwd');
        p.setAttribute('type', 'text');
    }

    function hide() {
        var p = document.getElementById('pwd');
        p.setAttribute('type', 'password');
    }

    var pwShown = 0;

    document.getElementById("eye").addEventListener("click", function () {
        if (pwShown == 0) {
            pwShown = 1;
            show();
        } else {
            pwShown = 0;
            hide();
        }
    }, false);
    hide();
</script>
</html>