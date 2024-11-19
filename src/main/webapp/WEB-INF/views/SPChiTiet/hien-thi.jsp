<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm chi tiết</title>
    <!-- Link Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Link Font Awesome CSS for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-4 text-center">Danh sách sản phẩm chi tiết</h2>

    <form action="/sp-chi-tiet/search" method="get" class="form-inline mb-4">
        <div class="input-group">
            <input type="text" name="id" class="form-control" placeholder="Nhập ID" aria-label="Nhập ID">
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">Tìm kiếm</button>
            </div>
        </div>
    </form>


    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Mã SPCT</th>
            <th>Màu sắc</th>
            <th>Kích thước</th>
            <th>Sản phẩm</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="spChiTiet" items="${list}">
            <tr>
                <td>${spChiTiet.id}</td>
                <td>${spChiTiet.maSPCT}</td>
                <td>${spChiTiet.mauSac.ten}</td>
                <td>${spChiTiet.kichThuoc.ten}</td>
                <td>${spChiTiet.sanPham.ten}</td>
                <td>${spChiTiet.soLuong}</td>
                <td>${spChiTiet.donGia}</td>
                <td>
                    <span class="badge badge-${spChiTiet.trangThai == 1 ? 'success' : 'danger'}">
                            ${spChiTiet.trangThai == 1 ? "Còn hàng" : "Hết hàng"}
                    </span>
                </td>
                <td>
                    <!-- Các nút được bố trí với icon -->
                    <a href="/sp-chi-tiet/view-update?id=${spChiTiet.id}" class="btn btn-warning btn-sm d-inline-block mr-1">
                        <i class="fas fa-edit"></i> <!-- Icon chỉnh sửa -->
                    </a>
                    <a href="/sp-chi-tiet/delete?id=${spChiTiet.id}" class="btn btn-danger btn-sm d-inline-block mr-1">
                        <i class="fas fa-trash-alt"></i> <!-- Icon xóa -->
                    </a>
                    <a href="/sp-chi-tiet/detail?id=${spChiTiet.id}" class="btn btn-info btn-sm d-inline-block">
                        <i class="fas fa-info-circle"></i> <!-- Icon chi tiết -->
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/sp-chi-tiet/view-add" class="btn btn-primary mt-3">Thêm sản phẩm chi tiết</a>
</div>

<!-- Link Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
