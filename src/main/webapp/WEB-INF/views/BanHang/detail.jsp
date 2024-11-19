<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="vi">
<head>
    <title>Chi tiết hóa đơn</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://mialala.vn/media/banner/11_08-16504a67ad082c462b2d2688bc26dd3e.jpg'); /* Thêm ảnh nền */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Chi tiết hóa đơn</h2>
    <div class="mb-3">
        <p><strong>Mã hóa đơn:</strong> ${hoaDon.id}</p>
        <p><strong>Ngày mua hàng:</strong> ${hoaDon.ngayMuaHang}</p>
        <p><strong>Nhân viên:</strong> ${hoaDon.nhanVien.ten}</p>
        <p><strong>Khách hàng:</strong> ${hoaDon.khachHang.ten}</p>
        <p><strong>Trạng thái:</strong> ${hoaDon.trangThai == 1 ? "Đã thanh toán" : "Chưa thanh toán"}</p>
    </div>

    <h3>Chi tiết sản phẩm</h3>
    <table class="table table-bordered">
        <thead class="thead-light">
        <tr>
            <th>Sản phẩm</th>
            <th>Màu sắc</th>
            <th>Kích thước</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="chiTiet" items="${hoaDonChiTietList}">
            <tr>
                <td>${chiTiet.spChiTiet.sanPham.ten}</td>
                <td>${chiTiet.spChiTiet.mauSac.ten}</td>
                <td>${chiTiet.spChiTiet.kichThuoc.ten}</td>
                <td>${chiTiet.soLuong}</td>
                <td>${chiTiet.donGia}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/ban-hang" class="btn btn-secondary">Quay lại</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
