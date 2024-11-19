<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
<head>
    <title>Chi tiết màu sắc</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Chi tiết màu sắc</h2>
    <table class="table table-bordered">
        <tr>
            <th>ID:</th>
            <td>${mauSac.id}</td>
        </tr>
        <tr>
            <th>Mã:</th>
            <td>${mauSac.ma}</td>
        </tr>
        <tr>
            <th>Tên:</th>
            <td>${mauSac.ten}</td>
        </tr>
        <tr>
            <th>Trạng thái:</th>
            <td>${mauSac.trangThai == 1 ? "Còn hàng" : "Hết hàng"}</td>
        </tr>
    </table>
    <a href="/mau-sac/hien-thi" class="btn btn-secondary">Quay lại</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
