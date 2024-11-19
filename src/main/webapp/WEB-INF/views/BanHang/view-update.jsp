
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="vi">
<head>
    <title>Cập nhật hóa đơn</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://mialala.vn/media/banner/11_08-16504a67ad082c462b2d2688bc26dd3e.jpg'); /* Thêm ảnh nền */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 15px;
            text-align: center;
            border-radius: 5px 5px 0 0;
        }
        .footer {
            margin-top: 20px;
            padding: 10px;
            text-align: center;
            background-color: #e9ecef;
            border-radius: 0 0 5px 5px;
        }
        .form-container {
            max-width: 860px;
            margin: auto;
        }
        .btn-danger {
            margin-top: 5px;
        }
    </style>
    <script>
        function addRow() {
            const table = document.getElementById("productTable");
            const newRow = table.insertRow(table.rows.length - 1);
            newRow.innerHTML = `
                <td>
                    <select name="idSPChiTiet" class="form-control">
                        <c:forEach var="sp" items="${spChiTietList}">
                            <option value="${sp.id}">${sp.sanPham.ten}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <select name="idMauSac" class="form-control">
                        <c:forEach var="mau" items="${mauSacList}">
                            <option value="${mau.id}">${mau.ten}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <select name="idKichThuoc" class="form-control">
                        <c:forEach var="kich" items="${kichThuocList}">
                            <option value="${kich.id}">${kich.ten}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <input type="number" name="soLuong" class="form-control" required />
                </td>
                <td>
                    <button type="button" class="btn btn-danger" onclick="removeRow(this)">Xóa</button>
                </td>
            `;
        }

        function removeRow(button) {
            const row = button.parentNode.parentNode;
            const table = document.getElementById("productTable");
            if (table.rows.length > 2) {
                row.parentNode.removeChild(row);
            } else {
                alert("Cần ít nhất một sản phẩm!");
            }
        }
    </script>
</head>
<body>
<div class="container mt-4">
    <div class="header">
        <h2>Cập nhật hóa đơn</h2>
    </div>
    <div class="form-container">
        <form action="/ban-hang/update/${hoaDon.id}" method="post">
            <div class="mb-3">
                <label><strong>Mã Hóa Đơn:</strong></label>
                <span>${hoaDon.id}</span>
            </div>

            <div class="mb-3">
                <label><strong>Nhân Viên:</strong></label>
                <span>${hoaDon.nhanVien.ten}</span>
            </div>

            <div class="mb-3">
                <label><strong>Khách Hàng:</strong></label>
                <span>${hoaDon.khachHang.ten}</span>
            </div>

            <h3>Chi tiết sản phẩm:</h3>
            <table id="productTable" class="table table-bordered">
                <thead class="thead-light">
                <tr>
                    <th>Sản Phẩm</th>
                    <th>Màu Sắc</th>
                    <th>Kích Thước</th>
                    <th>Số Lượng</th>
                    <th>Thao Tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="chiTiet" items="${hoaDonChiTietList}">
                    <tr>
                        <td>
                            <select name="idSPChiTiet" class="form-control">
                                <c:forEach var="sp" items="${spChiTietList}">
                                    <option value="${sp.id}" ${chiTiet.spChiTiet.id == sp.id ? 'selected' : ''}>${sp.sanPham.ten}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>
                            <select name="idMauSac" class="form-control">
                                <c:forEach var="mau" items="${mauSacList}">
                                    <option value="${mau.id}" ${chiTiet.spChiTiet.mauSac.id == mau.id ? 'selected' : ''}>${mau.ten}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>
                            <select name="idKichThuoc" class="form-control">
                                <c:forEach var="kich" items="${kichThuocList}">
                                    <option value="${kich.id}" ${chiTiet.spChiTiet.kichThuoc.id == kich.id ? 'selected' : ''}>${kich.ten}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>
                            <input type="number" name="soLuong" value="${chiTiet.soLuong}" class="form-control" required />
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger" onclick="removeRow(this)">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <button type="button" class="btn btn-primary" onclick="addRow()">Thêm Sản Phẩm</button><br/><br/>

            <div class="form-inline mb-3">
                <label>Trạng thái:</label>
                <select name="trangThai" class="form-control">
                    <option value="1" ${hoaDon.trangThai == 1 ? 'selected' : ''}>Đã thanh toán</option>
                    <option value="0" ${hoaDon.trangThai == 0 ? 'selected' : ''}>Chưa thanh toán</option>
                </select>
            </div>

            <input type="submit" value="Cập nhật" class="btn btn-success">
        </form>
        <a href="/ban-hang" class="btn btn-secondary mt-3">Quay lại</a>
    </div>
    <div class="footer">
        <p>&copy; 2024 Công ty XYZ</p>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

