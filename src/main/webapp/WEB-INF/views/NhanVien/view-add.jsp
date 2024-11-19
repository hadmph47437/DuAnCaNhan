<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="vi">
<head>
    <title>Thêm nhân viên</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Thêm nhân viên</h2>
    <form action="/nhan-vien/add" method="post">
        <div class="form-group">
            <label for="maNV">Mã NV:</label>
            <input type="text" id="maNV" name="maNV" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="ten">Tên:</label>
            <input type="text" id="ten" name="ten" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="tenDangNhap">Tên Đăng Nhập:</label>
            <input type="text" id="tenDangNhap" name="tenDangNhap" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="matKhau">Mật khẩu:</label>
            <input type="password" id="matKhau" name="matKhau" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Trạng thái:</label>
            <div>
                <input type="radio" id="hoatDong" name="trangThai" value="1" required>
                <label for="hoatDong">Hoạt động</label>
                <input type="radio" id="ngungHoatDong" name="trangThai" value="0" required>
                <label for="ngungHoatDong">Ngưng hoạt động</label>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Thêm</button>
    </form>
    <a href="/nhan-vien/hien-thi" class="btn btn-secondary mt-2">Quay lại</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
