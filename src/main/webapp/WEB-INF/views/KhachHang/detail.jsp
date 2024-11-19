<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
<head>
    <title>Chi tiết khách hàng</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Chi tiết khách hàng</h2>

    <table class="table table-bordered">
        <tbody>
        <tr>
            <th>ID:</th>
            <td>${khachHang.id}</td>
        </tr>
        <tr>
            <th>Tên:</th>
            <td>${khachHang.ten}</td>
        </tr>
        <tr>
            <th>Số điện thoại:</th>
            <td>${khachHang.sdt}</td>
        </tr>
        <tr>
            <th>Mã KH:</th>
            <td>${khachHang.maKH}</td>
        </tr>
        <tr>
            <th>Trạng thái:</th>
            <td>${khachHang.trangThai == 1 ? 'Hoạt động' : 'Không hoạt động'}</td>
        </tr>
        </tbody>
    </table>

    <a href="/khach-hang/hien-thi" class="btn btn-secondary">Quay lại</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
