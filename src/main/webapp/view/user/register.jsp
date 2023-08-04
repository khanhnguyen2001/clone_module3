<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>Đăng ký</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="<c:url value = "/view/css/userLogin.css"/>">

</head>
<body>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">Đăng ký</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-12 col-lg-10">
                <div class="wrap d-md-flex">
                    <div class="img" style="background-image: url(<c:url value="/view/img/imgLogin.jpg"/>);">
                    </div>
                    <div class="login-wrap p-4 p-md-5">
                        <div class="d-flex">
                            <div class="w-100">
                                <h3 class="mb-4">Đăng ký</h3>
                            </div>
                            <div class="w-100">
                                <p class="social-media d-flex justify-content-end">
                                    <a href="#"
                                       class="social-icon d-flex align-items-center justify-content-center"><span
                                            class="fa fa-facebook"></span></a>
                                    <a href="#"
                                       class="social-icon d-flex align-items-center justify-content-center"><span
                                            class="fa fa-twitter"></span></a>
                                </p>
                            </div>
                        </div>
                        <form action="user?action=register" method="post" class="signin-form">
                            <div class="form-group mb-3">
                                <label class="label" for="name">Tên tài khoản</label>
                                <input type="text" id="name" name="username" class="form-control"
                                       placeholder="Nhập tên tài khoản"
                                       required>
                                <div class="mt-1" style="color: red">
                                    <span><c:out value="${mess}"></c:out></span>
                                </div>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="password">Mật khẩu</label>
                                <input type="password" id="password" name="password" class="form-control"
                                       placeholder="Nhập mật khẩu"
                                       onkeyup='check();' required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="confirm_password">Nhập lại mật khẩu</label>
                                <input type="password" id="confirm_password" class="form-control"
                                       placeholder="Nhập lại mật khẩu" onkeyup='check();' required>
                                <div style="height: 1em"><span id='message'></span></div>
                            </div>
                            <div class="form-group">
                                <button type="submit" id="btn-register"
                                        class="form-control btn btn-primary rounded submit px-3">Đăng ký
                                </button>
                            </div>
                        </form>
                        <p class="text-center">Đã có tài khoản? <a data-toggle="tab" href="user?action=login">Đăng
                            nhập</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
<script>
    let check = function () {
        if (document.getElementById('password').value ===
            document.getElementById('confirm_password').value) {
            document.getElementById('message').style.color = 'green';
            document.getElementById('message').innerHTML = 'Mật khẩu xác nhận phù hợp';
            document.getElementById('btn-register').disabled = false;
        } else {
            document.getElementById('message').style.color = 'red';
            document.getElementById('message').innerHTML = 'Mật khẩu xác nhận chưa đúng';
            document.getElementById('btn-register').disabled = true;
        }
    };
</script>
