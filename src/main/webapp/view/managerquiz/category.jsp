
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
            <form action="/quiz?action=create">
                <h2>Tên Câu Hỏi</h2>
                <div class="row">
                    <div class="col">
                        <input type="text" placeholder="Nhập Tên Câu Hỏi">
                    </div>
                </div>
                <div class="mb-3 form-check">
                    <h3>Chọn Thể Loại</h3>
                    <input type="checkbox" class="form-check-input">
                    <label class="form-check-label">JAVA</label>
                    <input type="checkbox" class="form-check-input">
                    <label class="form-check-label">MySql</label>
                    <input type="checkbox" class="form-check-input">
                    <label class="form-check-label">CSS</label>
                    <input type="checkbox" class="form-check-input">
                    <label class="form-check-label">Boostrap</label>
                </div>
                <a href="/quiz?action=create"
                <button type="submit" class="btn btn-primary">Submit</button>
                </a>
            </form>
        </div>
    </dic>
</div>
</body>
</html>
