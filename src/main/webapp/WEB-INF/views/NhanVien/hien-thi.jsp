<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="vi">
<head>
    <title>Danh sách nhân viên</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Danh sách nhân viên</h2>

    <form action="/nhan-vien/search" method="get" class="form-inline mb-4">
        <div class="input-group">
            <input type="number" name="id" class="form-control" placeholder="Nhập ID" aria-label="Nhập ID" />
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">Tìm kiếm</button>
            </div>
        </div>
    </form>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Mã NV</th>
            <th>Tên</th>
            <th>Tên Đăng Nhập</th>
            <th>Trạng Thái</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="nhanVien" items="${list}">
            <tr>
                <td>${nhanVien.id}</td>
                <td>${nhanVien.maNV}</td>
                <td>${nhanVien.ten}</td>
                <td>${nhanVien.tenDangNhap}</td>
                <td>${nhanVien.trangThai == 1 ? "Hoạt động" : "Ngưng hoạt động"}</td>
                <td>
                    <a href="/nhan-vien/view-update?id=${nhanVien.id}" class="btn btn-warning btn-sm">Cập nhật</a>
                    <a href="/nhan-vien/delete?id=${nhanVien.id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                    <a href="/nhan-vien/detail?id=${nhanVien.id}" class="btn btn-info btn-sm">Chi tiết</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/nhan-vien/view-add" class="btn btn-success">Thêm nhân viên</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
