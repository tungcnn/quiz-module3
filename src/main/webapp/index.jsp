<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>
</head>
<body style="background-image:url('view/user/images/bg.jpg'); background-size: contain">
<div class="container-fluid">
    <div class="header">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">

            <a class="navbar-brand" href="/users">Home Page</a>

            <div class="collapse navbar-collapse col-md-2 offset-8" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0 ul" style="margin: inherit;">
                    <li class="nav-item active">
                        <a class="nav-link" href="/users?action=login">Login</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/users?action=register">Register</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="content" style="height: 620px">
<%--        <img src="/view/images/cat.PNG" alt="MeoMeo" style="height: 620px" >--%>
    </div>
    <div class="footer">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            © 2021 Copyright:
            <a class="text-while" href="#">TDH.com</a>
        </div>
    </div>
</div>
</body>
</html>