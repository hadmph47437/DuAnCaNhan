<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="vi">
<head>
    <title>Danh sách sản phẩm</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Danh sách sản phẩm</h2>

    <form action="/san-pham/search" method="get" class="form-inline mb-4">
        <div class="input-group">
            <input type="text" name="id" class="form-control" placeholder="Nhập ID sp" aria-label="Nhập ID sản phẩm">
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">Tìm kiếm</button>
            </div>
        </div>
    </form>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Mã</th>
            <th>Tên</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="sanPham" items="${list}">
            <tr>
                <td>${sanPham.id}</td>
                <td>${sanPham.ma}</td>
                <td>${sanPham.ten}</td>
                <td>${sanPham.trangThai == 1 ? "Còn hàng" : "Hết hàng"}</td>
                <td>
                    <a href="/san-pham/view-update?id=${sanPham.id}" class="btn btn-warning btn-sm">Cập nhật</a>
                    <a href="/san-pham/delete?id=${sanPham.id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                    <a href="/san-pham/detail?id=${sanPham.id}" class="btn btn-info btn-sm">Chi tiết</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/san-pham/view-add" class="btn btn-success">Thêm sản phẩm</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
