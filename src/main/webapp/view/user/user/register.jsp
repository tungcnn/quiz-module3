<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>
    <style>
        .centered-form .panel {
            background: rgba(255, 255, 255, 0.8);
            box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="/users">
                HomePage
            </a>
            <div class="collapse navbar-collapse col-md-2 offset-8" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0" style="margin: inherit">
                    <li class="nav-item active">
                        <a class="nav-link" href="/users?action=login">
                            Login
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/users?action=register">
                            Register
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="content" style="height: 620px">
        <div class="row centered-form">
            <div class="panel panel-default" style="margin-left:auto; margin-right: auto; width: 500px">
                <div class="panel-heading">
                    <h3 class="panel-title text-center">Please Register</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="post" action="/users?action=register">
                        <div class="form-group">
                            <label class="form-label" for="name">Name</label>
                            <input type="text" name="name" id="name" class="form-control input-sm"
                                   placeholder="Full Name">
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="username">User Name</label>
                            <input type="text" name="username" id="username" class="form-control input-sm"
                                   placeholder="User Name">
                        </div>


                        <div class="form-group">
                            <label class="form-label" for="password">Pass Word</label>
                            <input type="password" name="password" id="password" class="form-control input-sm"
                                   placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="confirm_password">Confirm Password</label>
                            <input type="password" name="confirm_password" id="confirm_password"
                                   class="form-control input-sm" placeholder="Confirm Password">
                            <span id="message"></span>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="email">Email</label>
                            <input type="email" name="email" id="email" class="form-control input-sm"
                                   placeholder="Email Address">
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="host">Host</label>
                            <input type="text" name="host" id="host" class="form-control input-sm"
                                   placeholder="Admin = 1; Player = 0">
                        </div>
                        <input type="submit" value="Register" class="btn btn-info btn-block">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            © 2021 Copyright:
            <a class="text-while" href="#">TDH.com</a>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $('#password, #confirm_password').on('keyup', function () {
        if ($('#password').val() == $('#confirm_password').val()) {
            $('#message').html('Matching').css('color', 'green');
        } else
            $('#message').html('Not Matching').css('color', 'red');
    });
</script>
</html>