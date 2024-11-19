<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
<head>
    <title>Cập nhật khách hàng</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Cập nhật khách hàng</h2>
    <form action="/khach-hang/update" method="post">
        <input type="hidden" name="id" value="${khachHang.id}">

        <div class="form-group">
            <label for="ten">Tên:</label>
            <input type="text" id="ten" name="ten" class="form-control" value="${khachHang.ten}" required>
        </div>

        <div class="form-group">
            <label for="sdt">Số điện thoại:</label>
            <input type="text" id="sdt" name="sdt" class="form-control" value="${khachHang.sdt}" required>
        </div>

        <div class="form-group">
            <label for="maKH">Mã KH:</label>
            <input type="text" id="maKH" name="maKH" class="form-control" value="${khachHang.maKH}" required>
        </div>

        <div class="form-group">
            <label>Trạng thái:</label><br>
            <div class="form-check form-check-inline">
                <input type="radio" id="hoatDong" name="trangThai" value="1" class="form-check-input" ${khachHang.trangThai == 1 ? 'checked' : ''} required>
                <label for="hoatDong" class="form-check-label">Hoạt động</label>
            </div>
            <div class="form-check form-check-inline">
                <input type="radio" id="khongHoatDong" name="trangThai" value="0" class="form-check-input" ${khachHang.trangThai == 0 ? 'checked' : ''} required>
                <label for="khongHoatDong" class="form-check-label">Không hoạt động</label>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
    <a href="/khach-hang/hien-thi" class="btn btn-secondary mt-2">Quay lại</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
