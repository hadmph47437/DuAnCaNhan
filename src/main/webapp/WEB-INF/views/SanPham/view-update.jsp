<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
<head>
    <title>Cập nhật sản phẩm</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Cập nhật sản phẩm</h2>
    <form action="/san-pham/update" method="post">
        <input type="hidden" name="id" value="${sanPham.id}">

        <div class="form-group">
            <label for="ma">Mã:</label>
            <input type="text" id="ma" name="ma" value="${sanPham.ma}" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="ten">Tên:</label>
            <input type="text" id="ten" name="ten" value="${sanPham.ten}" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Trạng thái:</label><br>
            <div class="form-check">
                <input type="radio" id="conHang" name="trangThai" value="1" ${sanPham.trangThai == 1 ? 'checked' : ''} class="form-check-input" required>
                <label for="conHang" class="form-check-label">Còn hàng</label>
            </div>
            <div class="form-check">
                <input type="radio" id="hetHang" name="trangThai" value="0" ${sanPham.trangThai == 0 ? 'checked' : ''} class="form-check-input" required>
                <label for="hetHang" class="form-check-label">Hết hàng</label>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
    <a href="/san-pham/hien-thi" class="btn btn-secondary mt-3">Quay lại</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
