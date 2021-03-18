<%--
  Created by IntelliJ IDEA.
  User: SonTung
  Date: 15/03/2021
  Time: 11:37 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Play</title>
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
        <span style="text-align: right">Username: ${username} ID: ${idUser} QuizID: ${idQuiz}</span>
    </div>
    <div class="row">
        <div class="col-md-6 offset-3">
            <h1 style="text-align: center">${quizName}</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 offset-3">
            <form action="/session?action=submit&idUser=${idUser}&idQuiz=${idQuiz}" method="post">
                <table class="table table-hover table-dark">
                    <c:forEach items="${questions}" var="question">
                        <tr>
                            <td>
                                <p>${question.content}</p>
                                <input type="radio" name="${question.idQuestion}" id="${question.answer1_id}" value="${question.answer1_id}">
                                <label for="${question.answer1_id}">${question.answer1}</label><br>
                                <input type="radio" name="${question.idQuestion}" id="${question.answer2_id}" value="${question.answer2_id}">
                                <label for="${question.answer2_id}">${question.answer2}</label><br>
                                <input type="radio" name="${question.idQuestion}" id="${question.answer3_id}" value="${question.answer3_id}">
                                <label for="${question.answer3_id}">${question.answer3}</label><br>
                                <input type="radio" name="${question.idQuestion}" id="${question.answer4_id}" value="${question.answer4_id}">
                                <label for="${question.answer4_id}">${question.answer4}</label><br>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <button type="submit">Submit</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
