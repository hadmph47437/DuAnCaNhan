<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
<head>
    <title>Danh sách khách hàng</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Danh sách khách hàng</h2>

    <!-- Form tìm kiếm theo ID -->
    <form action="/khach-hang/search" method="get" class="form-inline mb-4">
        <div class="input-group">
            <input type="text" name="id" class="form-control" placeholder="Nhập ID khách hàng">
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">Tìm kiếm</button>
            </div>
        </div>
    </form>



    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Số điện thoại</th>
            <th>Mã KH</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="khachHang" items="${list}">
            <tr>
                <td>${khachHang.id}</td>
                <td>${khachHang.ten}</td>
                <td>${khachHang.sdt}</td>
                <td>${khachHang.maKH}</td>
                <td>${khachHang.trangThai == 1 ? 'Hoạt động' : 'Không hoạt động'}</td>
                <td>
                    <a href="/khach-hang/detail?id=${khachHang.id}" class="btn btn-info btn-sm">Chi tiết</a>
                    <a href="/khach-hang/view-update?id=${khachHang.id}" class="btn btn-warning btn-sm">Cập nhật</a>
                    <a href="/khach-hang/delete?id=${khachHang.id}"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/khach-hang/view-add" class="btn btn-success mb-3">Thêm khách hàng mới</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
