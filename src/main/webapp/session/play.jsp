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
<div class="row">
    <div class="col-md-6 offset-3">
        <h1>PLAY QUIZ</h1>
    </div>
</div>
<div class="row">
    <form action="?action=submit" method="post">
        <ul>
            <c:forEach items="${questions}" var="question">
                <li>${question.question}
                    <ul>
                        <li><input type="radio" name="${question.id}" value="${question.answer1}">${question.answer1}</li>
                        <li><input type="radio" name="${question.id}" value="${question.answer2}">${question.answer2}</li>
                        <li><input type="radio" name="${question.id}" value="${question.answer3}">${question.answer3}</li>
                        <li><input type="radio" name="${question.id}" value="${question.answer4}">${question.answer4}</li>
                    </ul>
                </li>
            </c:forEach>
        </ul>
        <button type="submit">Submit</button>
    </form>
</div>
</body>
</html>
