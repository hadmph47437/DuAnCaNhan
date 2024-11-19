<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Cập nhật sản phẩm chi tiết</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Cập nhật sản phẩm chi tiết</h2>
    <form action="/sp-chi-tiet/update" method="post" class="mt-4">
        <input type="hidden" name="id" value="${spChiTiet.id}">

        <div class="form-group">
            <label for="maSPCT">Mã SPCT:</label>
            <input type="text" id="maSPCT" name="maSPCT" class="form-control" value="${spChiTiet.maSPCT}" required>
        </div>

        <div class="form-group">
            <label for="mauSac">Màu sắc:</label>
            <select id="mauSac" name="mauSac.id" class="form-control" required>
                <c:forEach var="mauSac" items="${mauSacs}">
                    <option value="${mauSac.id}" ${mauSac.id == spChiTiet.mauSac.id ? 'selected' : ''}>${mauSac.ten}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="kichThuoc">Kích thước:</label>
            <select id="kichThuoc" name="kichThuoc.id" class="form-control" required>
                <c:forEach var="kichThuoc" items="${kichThuocs}">
                    <option value="${kichThuoc.id}" ${kichThuoc.id == spChiTiet.kichThuoc.id ? 'selected' : ''}>${kichThuoc.ten}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="sanPham">Sản phẩm:</label>
            <select id="sanPham" name="sanPham.id" class="form-control" required>
                <c:forEach var="sanPham" items="${sanPhams}">
                    <option value="${sanPham.id}" ${sanPham.id == spChiTiet.sanPham.id ? 'selected' : ''}>${sanPham.ten}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="soLuong">Số lượng:</label>
            <input type="number" id="soLuong" name="soLuong" class="form-control" value="${spChiTiet.soLuong}" required>
        </div>

        <div class="form-group">
            <label for="donGia">Đơn giá:</label>
            <input type="number" step="0.01" id="donGia" name="donGia" class="form-control" value="${spChiTiet.donGia}" required>
        </div>

        <div class="form-group">
            <label>Trạng thái:</label><br>
            <div class="form-check form-check-inline">
                <input type="radio" id="conHang" name="trangThai" value="1" class="form-check-input" ${spChiTiet.trangThai == 1 ? 'checked' : ''}>
                <label for="conHang" class="form-check-label">Còn hàng</label>
            </div>
            <div class="form-check form-check-inline">
                <input type="radio" id="hetHang" name="trangThai" value="0" class="form-check-input" ${spChiTiet.trangThai == 0 ? 'checked' : ''}>
                <label for="hetHang" class="form-check-label">Hết hàng</label>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
