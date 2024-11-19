<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="vi">
<head>
    <title>Danh sách hóa đơn</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Danh sách hóa đơn</h2>

    <form action="/hoa-don/search" method="get" class="form-inline mb-4">
        <input type="number" name="id" class="form-control mr-2" placeholder="Nhập ID" />
        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
    </form>

    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Tên Khách Hàng</th>
            <th>Tên Nhân Viên</th>
            <th>Ngày Mua Hàng</th>
            <th>Trạng Thái</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hoaDon" items="${list}">
            <tr>
                <td>${hoaDon.id}</td>
                <td>${hoaDon.khachHang.ten}</td>
                <td>${hoaDon.nhanVien.ten}</td>
                <td>${hoaDon.ngayMuaHang}</td>
                <td>${hoaDon.trangThai == 1 ? "Đã thanh toán" : "Chưa thanh toán"}</td>
                <td>
                    <a href="/hoa-don/detail?id=${hoaDon.id}" class="btn btn-info btn-sm">Chi tiết</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
