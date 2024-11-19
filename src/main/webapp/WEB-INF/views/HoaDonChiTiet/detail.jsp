<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
<head>
    <title>Chi tiết hóa đơn chi tiết</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Chi tiết hóa đơn chi tiết</h2>

    <table class="table table-bordered">
        <tbody>
        <tr>
            <th>ID:</th>
            <td>${hoaDonChiTiet.id}</td>
        </tr>
        <tr>
            <th>ID SP Chi Tiết:</th>
            <td>${hoaDonChiTiet.spChiTiet.id}</td>
        </tr>
        <tr>
            <th>ID Hóa Đơn:</th>
            <td>${hoaDonChiTiet.hoaDon.id}</td>
        </tr>
        <tr>
            <th>Số Lượng:</th>
            <td>${hoaDonChiTiet.soLuong}</td>
        </tr>
        <tr>
            <th>Đơn Giá:</th>
            <td>${hoaDonChiTiet.donGia}</td>
        </tr>
        <tr>
            <th>Trạng Thái:</th>
            <td>${hoaDonChiTiet.trangThai == 1 ? "Đã thanh toán" : "Chưa thanh toán"}</td>
        </tr>
        </tbody>
    </table>

    <a href="/hoa-don-chi-tiet/hien-thi" class="btn btn-secondary">Quay lại</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
