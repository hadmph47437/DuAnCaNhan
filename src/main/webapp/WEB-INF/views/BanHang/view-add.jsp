
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm hóa đơn</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://mialala.vn/media/banner/11_08-16504a67ad082c462b2d2688bc26dd3e.jpg'); /* Thêm ảnh nền */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
        }

        .form-container {
            max-width: 650px; /* Giới hạn độ rộng của form */
            margin: 0 auto; /* Căn giữa form */
            padding: 20px;

            background-color: rgba(255, 255, 255, 0.6);/* Màu nền trắng trong suốt */
            border-radius: 8px; /* Bo góc form */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15); /* Hiệu ứng đổ bóng mạnh hơn */
            opacity: 1.5; /* Làm mờ form*/
        }

        h2 {
            font-weight: bold;
            color: #4a4a4a;
        }

        .form-section {
            margin-bottom: 1.5rem;
        }

        .sanPhamRow {
            margin-bottom: 1rem;
            border-bottom: 1px solid #ccc;
            padding-bottom: 1rem;
        }

        .btn-block {
            padding: 10px 0;
        }

        .removeSanPham {
            border-radius: 50%; /* Làm cho nút tròn */
            background-color: #dc3545; /* Màu đỏ */
            color: white;
            border: none;
            width: 35px;
            height: 35px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .removeSanPham:hover {
            background-color: #bd2130; /* Đổi màu khi hover */
        }

        .addSanPham {
            background-color: #007bff;
            color: white;
            transition: background-color 0.3s ease;
        }

        .addSanPham:hover {
            background-color: #0056b3; /* Màu xanh đậm khi hover */
        }

        .sanPhamRow label {
            font-size: 18px;
            font-weight: bold;
            color: #555;
        }

        .sanPhamRow input,
        .sanPhamRow select {
            font-size: 14px;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            transition: background-color 0.3s ease;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            transition: background-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <div class="form-container">
        <h2 class="text-center mb-4">Thêm hóa đơn mới</h2>

        <form id="addHoaDonForm" action="/ban-hang/add" method="post">
            <!-- Chọn nhân viên -->
            <div class="form-group form-section">
                <label for="idNhanVien">Nhân viên:</label>
                <select id="idNhanVien" name="idNhanVien" class="form-control" required>
                    <c:forEach var="nhanVien" items="${nhanVienList}">
                        <option value="${nhanVien.id}">${nhanVien.ten}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Chọn khách hàng -->
            <div class="form-group form-section">
                <label for="idKhachHang">Khách hàng:</label>
                <select id="idKhachHang" name="idKhachHang" class="form-control"  required>
                    <c:forEach var="khachHang" items="${khachHangList}">
                        <option value="${khachHang.id}">${khachHang.ten}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Phần sản phẩm -->
            <div id="sanPhamContainer" class="form-group form-section">
                <div class="sanPhamRow form-row align-items-center">
                    <div class="col">
                        <label>ID SPCT :</label>
                        <input type="number" class="form-control idSPChiTiet" name="idSPChiTiet" required/>
                    </div>

                    <div class="col">
                        <label>Màu sắc:</label>
                        <select class="form-control idMauSac" name="idMauSac" required>
                            <c:forEach var="mauSac" items="${mauSacList}">
                                <option value="${mauSac.id}">${mauSac.ten}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col">
                        <label>Kích thước:</label>
                        <select class="form-control idKichThuoc" name="idKichThuoc" required>
                            <c:forEach var="kichThuoc" items="${kichThuocList}">
                                <option value="${kichThuoc.id}">${kichThuoc.ten}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col">
                        <label>Số lượng:</label>
                        <input type="number" class="form-control soLuong" placeholder="0" name="soLuong" required/>
                    </div>

                    <div class="col">
                        <label>Đơn giá:</label>
                        <input type="number" step="0.01" class="form-control donGia" name="donGia" placeholder="0" required/>
                    </div>

                    <div class="col-auto">
                        <button type="button" class="btn removeSanPham mt-4">&times;</button>
                    </div>
                </div>
            </div>

            <!-- Thêm sản phẩm -->
            <div class="form-group text-right">
                <button type="button" class="btn addSanPham" id="addSanPham"><i class="fas fa-plus-circle"></i>Add</button>
            </div>

            <!-- Trạng thái hóa đơn -->
            <div class="form-group form-section">
                <label for="trangThai">Trạng thái:</label>
                <select id="trangThai" name="trangThai" class="form-control" required>
                    <option value="1">Đã thanh toán</option>
                    <option value="0">Chưa thanh toán</option>
                </select>
            </div>

            <!-- Nút thêm hóa đơn -->
            <button type="submit" class="btn btn-success btn-block"><i class="fas fa-save"></i> Thêm hóa đơn</button>
        </form>

        <!-- Nút quay lại -->
        <div class="text-center mt-4">
            <a href="/ban-hang" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Quay lại</a>
        </div>
    </div>

</div>

<script>
    // Lấy dòng sản phẩm đầu tiên để sao chép
    const sanPhamRowTemplate = document.querySelector('.sanPhamRow');

    document.getElementById('addSanPham').addEventListener('click', function () {
        // Kiểm tra nếu không có dòng sản phẩm nào
        const currentRows = document.querySelectorAll('.sanPhamRow');
        if (currentRows.length === 0) {
            // Nếu không có dòng nào, sao chép dòng đầu tiên
            const sanPhamRow = sanPhamRowTemplate.cloneNode(true);
            resetSanPhamRow(sanPhamRow);
            document.getElementById('sanPhamContainer').appendChild(sanPhamRow);
        } else {
            // Nếu có dòng sản phẩm, sao chép dòng mới
            const sanPhamRow = currentRows[0].cloneNode(true);
            resetSanPhamRow(sanPhamRow);
            document.getElementById('sanPhamContainer').appendChild(sanPhamRow);
        }
    });

    // Hàm reset giá trị của dòng sản phẩm
    function resetSanPhamRow(sanPhamRow) {
        sanPhamRow.querySelector('.idSPChiTiet').value = '';
        sanPhamRow.querySelector('.soLuong').value = '';
        sanPhamRow.querySelector('.donGia').value = '';

        // Thêm sự kiện cho nút xóa trong dòng sản phẩm
        sanPhamRow.querySelector('.removeSanPham').addEventListener('click', function () {
            sanPhamRow.remove();
        });
    }

    // Sự kiện cho các nút xóa
    document.querySelectorAll('.removeSanPham').forEach(button => {
        button.addEventListener('click', function () {
            this.parentElement.parentElement.remove();
        });
    });

    // Thay đổi Đơn giá dựa trên ID SPCT
    document.getElementById('sanPhamContainer').addEventListener('input', function (e) {
        if (e.target.classList.contains('idSPChiTiet')) {
            const idSPCT = e.target.value;
            const donGiaInput = e.target.closest('.sanPhamRow').querySelector('.donGia');
            if (idSPCT == 1) {
                donGiaInput.value = 100.0;
            } else if (idSPCT == 2) {
                donGiaInput.value = 200.0;
            } else if (idSPCT == 3) {
                donGiaInput.value = 300.0;
            } else {
                donGiaInput.value = '0'; // Reset nếu không hợp lệ
            }
        }
    });
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


