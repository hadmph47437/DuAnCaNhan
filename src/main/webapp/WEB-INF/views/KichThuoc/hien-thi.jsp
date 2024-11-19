<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="vi">
<head>
    <title>Danh sách kích thước</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Danh sách kích thước</h2>

    <form action="/kich-thuoc/search" method="get" class="form-inline mb-4">
        <input type="number" name="id" placeholder="Nhập ID" class="form-control mr-2" />
        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
    </form>

    <a href="/kich-thuoc/view-add" class="btn btn-success mb-3">Thêm kích thước</a>

    <table class="table table-bordered">
        <thead class="thead-light">
        <tr>
            <th>ID</th>
            <th>Mã</th>
            <th>Tên</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="kichThuoc" items="${list}">
            <tr>
                <td>${kichThuoc.id}</td>
                <td>${kichThuoc.ma}</td>
                <td>${kichThuoc.ten}</td>
                <td>${kichThuoc.trangThai == 1 ? "Còn hàng" : "Hết hàng"}</td>
                <td>
                    <a href="/kich-thuoc/view-update?id=${kichThuoc.id}" class="btn btn-warning btn-sm">Cập nhật</a>
                    <a href="/kich-thuoc/delete?id=${kichThuoc.id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                    <a href="/kich-thuoc/detail?id=${kichThuoc.id}" class="btn btn-info btn-sm">Chi tiết</a>
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
