<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
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
<body>
<div class="container-fluid">
    <div class="container-fluid">
        <div class="row">
            <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%">
                <div class="col-md-4">
                    LOGO
                </div>
            </nav>
        </div>

        <div class="modal-dialog">
            <div class="modal-content">
                <form class="text-center" style="color: black;" action="#" method="post">
                    <div>
                        <h3>Create</h3>
                    </div>
                    <div class="form-group">
                        <h5>Viết Câu Hỏi</h5>
                        <input type="text" name="answer" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <h5>Cau 1</h5>
                        <input type="text" name="answer1" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <h5>Cau 2</h5>
                        <input type="text" name="answer2" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <h5>Cau 3</h5>
                        <input type="text" name="answer3" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <h5>Cau 4</h5>
                        <input type="text" name="answer4" class="form-control"/>
                    </div>
                    <div>
                        <button class="btn btn-outline-info btn-rounded z-depth-0 my-4 waves-effect" type="submit">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
