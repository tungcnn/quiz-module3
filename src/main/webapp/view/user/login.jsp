<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Login</title>
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
                        <a class="nav-link" href="/users?action=login">Login</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/users?action=register">Register</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/users?action=view&id=${user.getId()}">Profile</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>

    <div class="content col-md-6 offset-3">
           <form method="post" action="/users?action=login">
               <div class="form-outline mb-4">
                   <input type="text" id="username" class="form-control" placeholder="User Name"/>
                   <label class="form-label" for="username">User Name</label>
               </div>

               <div class="form-outline mb-4">
                   <input type="password" id="password" class="form-control" placeholder="Pass Word"/>
                   <label class="form-label" for="password">Password</label>
               </div>

               <div class="row mb-4">
                   <div class="col d-flex justify-content-center">

                       <div class="form-check">
                           <input
                                   class="form-check-input"
                                   type="checkbox"
                                   value=""
                                   id="form2Example3"
                                   checked
                           />
                           <label class="form-check-label" for="form2Example3"> Remember me </label>
                       </div>
                   </div>

                   <div class="col">

                       <a href="#!">Forgot password?</a>
                   </div>
               </div>

               <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>

               <div class="text-center">
                   <p>Not a member? <a href="/users?action=register">Register</a></p>
                   <p>or sign up with:</p>
                   <button type="button" class="btn btn-primary btn-floating mx-1">
                       <i class="fab fa-facebook-f"></i>
                   </button>

                   <button type="button" class="btn btn-primary btn-floating mx-1">
                       <i class="fab fa-google"></i>
                   </button>

                   <button type="button" class="btn btn-primary btn-floating mx-1">
                       <i class="fab fa-twitter"></i>
                   </button>

                   <button type="button" class="btn btn-primary btn-floating mx-1">
                       <i class="fab fa-github"></i>
                   </button>
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