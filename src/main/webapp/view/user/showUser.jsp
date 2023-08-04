<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value = "/view/css/showUser.css"/>">
    <title>User</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-2 nav-bar-left">
            <div class="row">
                <div class="col-12 px-0 nav-bar-logo">
                    <img src="<c:url value = "/view/img/logoshop.png"/>" alt="" href="http://localhost:8080/product?action=getAll" style="width: 100%" height="70px">
                </div>
                <a href="product?action=getAll" class="col-12 nav-bar-list ">
                    <div class="nav-bar-list_icon">
                        <i class="fa-solid fa-laptop"></i>
                    </div>
                    <div class="nav-bar-list_text">
                        <p>Sản phẩm</p>
                    </div>
                </a>
                <a href="user?action=getAll" class="col-12 nav-bar-list btn-color">
                    <div class="nav-bar-list_icon">
                        <i class="fa-solid fa-circle-user"></i>
                    </div>
                    <div class="nav-bar-list_text">
                        <p>User</p>
                    </div>
                </a>
                <a href="" class="col-12 nav-bar-list">
                    <div class="nav-bar-list_icon">
                        <i class="fa-solid fa-file-import"></i>
                    </div>
                    <div class="nav-bar-list_text">
                        <p>Nhập kho</p>
                    </div>
                </a>
                <a href="" class="col-12 nav-bar-list">
                    <div class="nav-bar-list_icon">
                        <i class="fa-solid fa-file-export"></i>
                    </div>
                    <div class="nav-bar-list_text">
                        <p>Xuất kho</p>
                    </div>
                </a>
                <a href="" class="col-12 nav-bar-list">
                    <div class="nav-bar-list_icon">
                        <i class="fa-solid fa-clipboard-list"></i>
                    </div>
                    <div class="nav-bar-list_text">
                        <p>Thống kê</p>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-10 body-right">
            <div class="row header-body">
                <div class="col-10 header-body_search">
                    <div class="header-search_icon">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </div>
                    <div class="header-search_input">
                        <input type="text" name="header-search" placeholder="Nhập tìm kiếm">
                    </div>
                </div>
                <div class="col-2 header-body_information">
                    <div class="header--information_icon">
                        <i class="fa-solid fa-user"></i>
                    </div>
                    <div class="header--information_text">
                        <p>ABC</p>
                    </div>
                </div>
            </div>
            <div class="row page-title">
                <div class="col-6 text-theme">
                    <H1>User</H1>
                    <p>ADMIN > User</p>
                </div>
                <div class="col-6">
                </div>
            </div>
            <div class="row main-body-position">
                <div class="col-12 main-body">
                    <table class="body-table">
                        <tr>
                            <td>ID</td>
                            <td>Tên User</td>
                            <td>Mật khẩu</td>
                            <td>Role</td>
                            <td colspan="2">Action</td>
                        </tr>
                        <c:forEach items="${userList}" var="user">
                            <tr>
                                <td>${user.userId}</td>
                                <td>${user.username}</td>
                                <td>${user.password}</td>
                                <td>${user.role.roleName}</td>
                                <td><a href="user?action=edit&id=${user.userId}" class="btn btn-outline-primary">Sửa</a>
                                </td>
                                <td><a href="user?action=delete&id=${user.userId}"
                                       class="btn btn-outline-danger">Xóa</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>