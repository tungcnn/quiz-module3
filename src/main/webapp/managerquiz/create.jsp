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

        <div class="row">
            <div class="modal-dialog col-md-3" style="float: left">
                <div class="modal-content">
                    <form class="text-center" style= "color: black"   action="/quiz?action=create&idquiz=${idquiz}" method="post">
                        <div>
                            <h3>Create</h3>
                        </div>
                        <div class="form-group">
                            <h5>Quiz ID: ${idquiz}</h5>
                            <h5>Viết Câu Hỏi</h5>
                            <input type="text" name="namequestion" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <h5>Câu 1</h5>
                            <input type="text" name="answer1" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <h5>Câu 2</h5>
                            <input type="text" name="answer2" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <h5>Câu 3</h5>
                            <input type="text" name="answer3" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <h5>Câu 4</h5>
                            <input type="text" name="answer4" class="form-control"/>
                        </div>
                        <div>
                            <h5>Chon Dap An Dung</h5>
                            <input type="radio" id="dap1" name="correct" value="a1">
                            <label for="dap1">Dap An 1</label>

                            <input type="radio" id="dap2" name="correct" value="a2">
                            <label for="dap2">Dap An 2</label>

                            <input type="radio" id="dap3" name="correct" value="a3">
                            <label for="dap3">Dap An 3</label>

                            <input type="radio" id="dap4" name="correct" value="a4">
                            <label for="dap4">Dap An 4</label>

                        </div>
                        <div>
                            <button class="btn btn-outline-info btn-rounded z-depth-0 my-4 waves-effect" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-9">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Quiz ID</th>
                        <th scope="col">Câu Hỏi</th>
                        <th scope="col">Câu 1</th>
                        <th scope="col">Câu 2</th>
                        <th scope="col">Câu 3</th>
                        <th scope="col">Câu 4</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
<%--                    <c:forEach items="${}">--%>
                    <tr>
                        <th scope="row">1</th>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
<%--                    </c:forEach>--%>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>
</body>
</html>
