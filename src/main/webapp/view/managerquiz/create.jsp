<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<body>
<div class="container">

    <div>
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Create Quiz</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Viết Câu Hỏi
                                <textarea name="#" class="form-control"></textarea>
                            </label>
                        </div>
                        <div class="form-group">
                            <label>Đáp Án 1
                                <input name="#" type="text" class="form-control">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>Đáp Án 2
                                <input name="amount" type="text" class="form-control">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>Đáp Án 3
                                <input name="color" type="text" class="form-control" >
                            </label>
                        </div>
                        <div class="form-group">
                            <label>Đáp Án 4
                                <input name="color" type="text" class="form-control">
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-danger" value="Exit">
                        <input type="submit" class="btn btn-success" value="Create">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
