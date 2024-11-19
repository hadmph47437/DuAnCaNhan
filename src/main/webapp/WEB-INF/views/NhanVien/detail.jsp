<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
<head>
    <title>Chi tiết nhân viên</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Chi tiết nhân viên</h2>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <th>ID:</th>
            <td>${nhanVien.id}</td>
        </tr>
        <tr>
            <th>Mã NV:</th>
            <td>${nhanVien.maNV}</td>
        </tr>
        <tr>
            <th>Tên:</th>
            <td>${nhanVien.ten}</td>
        </tr>
        <tr>
            <th>Tên Đăng Nhập:</th>
            <td>${nhanVien.tenDangNhap}</td>
        </tr>
        <tr>
            <th>Mật khẩu:</th>
            <td>${nhanVien.matKhau}</td>
        </tr>
        <tr>
            <th>Trạng thái:</th>
            <td>${nhanVien.trangThai == 1 ? "Hoạt động" : "Ngưng hoạt động"}</td>
        </tr>
        </tbody>
    </table>
    <a href="/nhan-vien/hien-thi" class="btn btn-secondary">Quay lại danh sách</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
