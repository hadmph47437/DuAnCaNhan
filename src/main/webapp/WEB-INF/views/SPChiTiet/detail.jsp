<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết sản phẩm chi tiết</title>
    <!-- Link Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
        .card-header {
            background-color: #007bff;
            color: white;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        h2 {
            color: #343a40;
            margin: 20px 0;
        }
        .btn-back {
            background-color: #007bff;
            color: white;
            transition: background-color 0.3s;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
        table {
            margin: 20px 0;
            background-color: white; /* Màu nền trắng cho bảng */
            border: 1px solid #dee2e6; /* Đường viền rõ ràng */
        }
        th, td {
            border: 1px solid #dee2e6; /* Đường viền rõ ràng cho các ô */
        }
        th {
            background-color: #e9ecef;
            text-align: left;
        }
        tr:hover {
            background-color: #d9edf7; /* Màu nền cho dòng khi di chuột qua */
        }
        .badge {
            font-size: 1rem;
            padding: 0.5em 0.75em;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Chi tiết sản phẩm chi tiết</h2>
    <div class="card">
        <div class="card-header">
            Thông tin sản phẩm
        </div>
        <div class="card-body">
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <th>ID</th>
                    <td>${spChiTiet.id}</td>
                </tr>
                <tr>
                    <th>Mã SPCT</th>
                    <td>${spChiTiet.maSPCT}</td>
                </tr>
                <tr>
                    <th>Màu sắc</th>
                    <td>${spChiTiet.mauSac.ten}</td>
                </tr>
                <tr>
                    <th>Kích thước</th>
                    <td>${spChiTiet.kichThuoc.ten}</td>
                </tr>
                <tr>
                    <th>Sản phẩm</th>
                    <td>${spChiTiet.sanPham.ten}</td>
                </tr>
                <tr>
                    <th>Số lượng</th>
                    <td>${spChiTiet.soLuong}</td>
                </tr>
                <tr>
                    <th>Đơn giá</th>
                    <td>${spChiTiet.donGia}</td>
                </tr>
                <tr>
                    <th>Trạng thái</th>
                    <td>
                            <span class="badge badge-${spChiTiet.trangThai == 1 ? 'success' : 'danger'}">
                                ${spChiTiet.trangThai == 1 ? "Còn hàng" : "Hết hàng"}
                            </span>
                    </td>
                </tr>
                </tbody>
            </table>
            <a href="/sp-chi-tiet/hien-thi" class="btn btn-back">Quay lại danh sách</a>
        </div>
    </div>
</div>

<!-- Link Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
