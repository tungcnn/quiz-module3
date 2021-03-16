<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <title>Thể Loại </title>
</head>
<body>
<div class="container">
    <dic class="row">
        <div class="col-md-5">
            <form action="/quiz?action=create" method="post">
                <h2>Tên Quiz</h2>
                <div class="row">
                    <div class="col">
                        <input type="text" placeholder="Nhập Tên Quiz">
                    </div>
                </div>
                <div>
                    <label>Chọn Độ Khó:</label>
                    <input type="radio" value="easy" id="easy" name="dif">
                    <label for="easy">Easy</label>
                    <input type="radio" value="easy" id="medium" name="dif">
                    <label for="medium">Medium</label>
                    <input type="radio" value="easy" id="hard" name="dif">
                    <label for="hard">Hard</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </dic>
</div>
</body>
</html>
