<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="vi">
<head>
    <title>Danh sách màu sắc</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Danh sách màu sắc</h2>

    <form action="/mau-sac/search" method="get" class="form-inline mb-4">
        <div class="input-group">
            <input type="number" name="id" class="form-control" placeholder="Nhập ID"/>
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
        <c:forEach var="mauSac" items="${list}">
            <tr>
                <td>${mauSac.id}</td>
                <td>${mauSac.ma}</td>
                <td>${mauSac.ten}</td>
                <td>${mauSac.trangThai == 1 ? "Còn hàng" : "Hết hàng"}</td>
                <td>
                    <a href="/mau-sac/view-update?id=${mauSac.id}" class="btn btn-warning btn-sm">Cập nhật</a>
                    <a href="/mau-sac/delete?id=${mauSac.id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                    <a href="/mau-sac/detail?id=${mauSac.id}" class="btn btn-info btn-sm">Chi tiết</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/mau-sac/view-add" class="btn btn-success">Thêm màu sắc</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
