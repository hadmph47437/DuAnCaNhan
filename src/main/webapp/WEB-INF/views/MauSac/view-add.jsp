<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="vi">
<head>
    <title>Thêm màu sắc</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Thêm màu sắc</h2>
    <form action="/mau-sac/add" method="post">
        <div class="form-group">
            <label for="ma">Mã:</label>
            <input type="text" id="ma" name="ma" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="ten">Tên:</label>
            <input type="text" id="ten" name="ten" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Trạng thái:</label><br>
            <div class="form-check form-check-inline">
                <input type="radio" id="conHang" name="trangThai" value="1" class="form-check-input" required>
                <label for="conHang" class="form-check-label">Còn hàng</label>
            </div>
            <div class="form-check form-check-inline">
                <input type="radio" id="hetHang" name="trangThai" value="0" class="form-check-input" required>
                <label for="hetHang" class="form-check-label">Hết hàng</label>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Thêm</button>
    </form>
    <a href="/mau-sac/hien-thi" class="btn btn-secondary mt-3">Quay lại</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
