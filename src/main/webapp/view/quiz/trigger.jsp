<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
    <title>Thể Loại </title>
</head>
<body style="background-color: #23395d">
<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%">
            <div class="col-md-4">
                <a href="/quiz"><img src="/session/images/logo.jpg" width="90px" height="50px"></a>
            </div>
            <div class="col-md-2 offset-6">
                <a class="nav-link" href="/users?action=login">Log Out</a>
            </div>
        </nav>
    </div>
    <div class="modal-dialog">
        <div class="modal-content" style="text-align: center; background-color: white; padding: 20px" id="center">
            <div>
                <h1>Create A Quiz</h1>
            </div>
            <form action="/quiz?action=trigger" method="post">
                <div>
                    <label>
                        <input type="text" name="namequiz" placeholder="Enter The Name"/>
                    </label>
                </div>
                <div>
                    <h5>Chọn Độ Khó</h5>
                    <input type="radio" id="hard" name="difficulty" value="hard">
                    <label for="hard">Hard</label>

                    <input type="radio" id="normal" name="difficulty" value="normal">
                    <label for="normal">Normal</label>

                    <input type="radio" id="easy" name="difficulty" value="easy">
                    <label for="easy">Easy</label>

                </div>
                <div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
