<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
<head>
    <title>Chi tiết hóa đơn</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Chi tiết hóa đơn</h2>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <th>ID:</th>
            <td>${hoaDon.id}</td>
        </tr>
        <tr>
            <th>Tên Khách Hàng:</th>
            <td>${hoaDon.khachHang.ten}</td>
        </tr>
        <tr>
            <th>Tên Nhân Viên:</th>
            <td>${hoaDon.nhanVien.ten}</td>
        </tr>
        <tr>
            <th>Ngày Mua Hàng:</th>
            <td>${hoaDon.ngayMuaHang}</td>
        </tr>
        <tr>
            <th>Trạng Thái:</th>
            <td>${hoaDon.trangThai == 1 ? "Đã thanh toán" : "Chưa thanh toán"}</td>
        </tr>
        </tbody>
    </table>
    <div class="text-center">
        <a href="/hoa-don/hien-thi" class="btn btn-secondary">Quay lại</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
