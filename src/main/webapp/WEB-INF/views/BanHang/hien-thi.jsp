<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bán hàng</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>

        body {
            background-image: url('https://mialala.vn/media/banner/05_03-c8e769fba925ae704f84ca333ae49aa0.jpg'); /* Thêm ảnh nền */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
        }


        /* Tùy chỉnh cho bảng */
        table {
            table-layout: fixed;
            width: 100%;
            background-color: #fff; /* Màu nền trắng */
            font-size: 17px; /* Cỡ chữ nhỏ hơn */
            opacity: 0.9;
        }

        th, td {
            text-align: center;
            padding: 12px; /* Tăng khoảng cách giữa các dòng */
            white-space: nowrap;
            border-color: #dee2e6; /* Màu viền nhạt */
        }

        th {
            background-color: #343a40; /* Nền tối cho tiêu đề bảng */
            color: #fff; /* Chữ trắng */
        }

        tr:nth-child(even) {
            background-color: #f8f9fa; /* Dòng chẵn có màu nền nhẹ */
        }

        .btn i {
            margin-right: 4px; /* Khoảng cách nhỏ giữa icon và text */
        }

        /* Tùy chỉnh cho ảnh panel */
        .banner {
            background-image: url('https://mialala.vn/media/banner/26_01-cfd7c87af8a806fb1f6facfe9d218df0.jpg'); /* Link ảnh mẫu */
            background-size: cover;
            background-position: center;
            height: 500px;
            margin-bottom: -50px; /* Để nav tab chạm vào banner */
        }

        .banner-text {
            position: relative;
            top: 50%;
            transform: translateY(-50%);
            color: white;
            text-align: center;
            font-size: 48px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        /* Tùy chỉnh cho nav tab */
        .nav-tabs .nav-link {
            color: #fff; /* Màu chữ trắng */
        }

        .nav-tabs {
            background-color: #007bff;
            margin-bottom: -1px; /* Để nav tab chạm vào panel */
        }

        .nav-tabs .nav-link.active {
            background-color: #007bff;
            color: #ffffff; /* Màu xanh da trời cho tab đang hoạt động */
        }

        /* Tùy chỉnh cho tiêu đề */
        h2.title {
            font-size: 2.5rem; /* Cỡ chữ lớn hơn */
            color: #007bff; /* Màu xanh da trời */
            font-weight: bold; /* Chữ đậm */
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3); /* Đổ bóng nhẹ cho chữ */
            margin-bottom: 30px; /* Khoảng cách dưới tiêu đề */
            border-bottom: 2px solid #007bff; /* Viền dưới cho tiêu đề */
            padding-bottom: 10px; /* Khoảng cách dưới viền */
        }

        /* Tùy chỉnh cho form tìm kiếm */
        .search-form {
            text-align: center; /* Căn giữa form tìm kiếm */
            margin-top: 20px; /* Khoảng cách trên form */
        }

        .search-form input {
            width: 300px; /* Đặt chiều rộng cho ô nhập */
        }
    </style>
</head>
<body>
<div class="container-fluid p-0">

    <!-- Ảnh panel lớn -->
    <!-- Slider banner -->
    <!-- Slider banner -->
    <div id="bannerCarousel" class="carousel slide" data-ride="carousel" data-interval="2000" data-pause="false">
        <!-- Indicators -->
        <ul class="carousel-indicators">
            <li data-target="#bannerCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#bannerCarousel" data-slide-to="1"></li>
            <li data-target="#bannerCarousel" data-slide-to="2"></li>
            <li data-target="#bannerCarousel" data-slide-to="3"></li>
            <li data-target="#bannerCarousel" data-slide-to="4"></li>
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner">



            <div class="carousel-item">
                <img src="https://file.hstatic.net/200000227041/file/website_-_1920x630.png" alt="Banner 1" class="d-block w-100" style="height: 500px; object-fit: cover;">
            </div>

            <div class="carousel-item">
                <img src="https://mialala.vn/media/banner/03_08-05a92a3e4d08cd645d7641ff183d1934.jpg" alt="Banner 1" class="d-block w-100" style="height: 500px; object-fit: cover;">
            </div>

            <div class="carousel-item">
                <img src="https://mialala.vn/media/banner/02_03-60dcd619959183b8941961d5dd1144cc.jpg" alt="Banner 2" class="d-block w-100" style="height: 500px; object-fit: cover;">
            </div>


            <div class="carousel-item">
                <img src="https://mialala.vn/media/banner/11_08-16504a67ad082c462b2d2688bc26dd3e.jpg" alt="Banner 3" class="d-block w-100" style="height: 500px; object-fit: cover;">
            </div>
            <div class="carousel-item">
                <img src="https://mialala.vn/media/banner/11_10-0a932970d48fd5ac2b912bee0e2f6958.jpg" alt="Banner 4" class="d-block w-100" style="height: 500px; object-fit: cover;">
            </div>


            <div class="carousel-item active">
                <img src="https://owen.cdn.vccloud.vn/media/codazon/slideshow/1/3/1366x532_041024_1_.jpg" alt="Banner 4" class="d-block w-100" style="height: 500px; object-fit: cover;">
            </div>



        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#bannerCarousel" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#bannerCarousel" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>


    <!-- Menu nav tab -->
    <ul class="nav nav-tabs justify-content-center mt-0"> <!-- Sửa margin-top thành 0 -->
        <li class="nav-item">
            <a class="nav-link active" href="/ban-hang"><i class="fas fa-shopping-cart"></i> Bán hàng</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/san-pham/hien-thi"><i class="fas fa-box"></i> Sản phẩm</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/sp-chi-tiet/hien-thi"><i class="fas fa-info-circle"></i> Sản phẩm chi tiết</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/khach-hang/hien-thi"><i class="fas fa-users"></i> Khách hàng</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/hoa-don/hien-thi"><i class="fas fa-file-invoice"></i> Hóa đơn</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/hoa-don-chi-tiet/hien-thi"><i class="fas fa-file-alt"></i> Hóa đơn chi tiết</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/mau-sac/hien-thi"><i class="fas fa-palette"></i> Màu sắc</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/kich-thuoc/hien-thi"><i class="fas fa-ruler-combined"></i> Kích thước</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/nhan-vien/hien-thi"><i class="fas fa-user-tie"></i> Nhân viên</a>
        </li>
    </ul>

    <!-- Nội dung chính -->
    <div class="container-fluid mt-4">
        <h2 class="text-center mb-4 title">Cửa hàng đồ ngủ Eva</h2>

        <!-- Form tìm kiếm theo ID -->
        <form action="/ban-hang/search" method="get" class="form-inline mb-4 search-form">
            <input type="number" class="form-control mr-2" name="hoaDonId" placeholder="Nhập gì tùy!" />
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
        </form>

        <!-- Bảng có thể cuộn ngang khi màn hình nhỏ -->
        <div class="table-responsive">
            <table class="table table-bordered table-striped w-100">
                <thead>
                <tr>
                    <th>Mã HD</th>
                    <th>Nhân Viên</th>
                    <th>Khách Hàng</th>
                    <th>Sản Phẩm</th>
                    <th>Màu Sắc</th>
                    <th>Kích Thước</th>
                    <th>Số Lượng</th>
                    <th>Đơn Giá</th>
                    <th>Ngày Mua</th>
                    <th>Trạng Thái</th>
                    <th>HD</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="hoaDon" items="${hoaDonList}">
                    <c:set var="chiTietList" value="${hoaDonChiTietList}" />
                    <c:set var="filteredChiTietList" value="${chiTietList.stream().filter(c -> c.hoaDon.id == hoaDon.id).toList()}" />
                    <c:set var="rowSpan" value="${fn:length(filteredChiTietList)}" />

                    <c:forEach var="chiTiet" items="${filteredChiTietList}" varStatus="status">
                        <tr>
                            <c:if test="${status.index == 0}">
                                <td rowspan="${rowSpan}">${hoaDon.id}</td>
                                <td rowspan="${rowSpan}">${hoaDon.nhanVien.ten}</td>
                                <td rowspan="${rowSpan}">${hoaDon.khachHang.ten}</td>
                                <td>${chiTiet.spChiTiet.sanPham.ten}</td>
                                <td>${chiTiet.spChiTiet.mauSac.ten}</td>
                                <td>${chiTiet.spChiTiet.kichThuoc.ten}</td>
                                <td>${chiTiet.soLuong}</td>
                                <td>${chiTiet.donGia}</td>
                                <td rowspan="${rowSpan}">${hoaDon.ngayMuaHang}</td>
                                <td rowspan="${rowSpan}">${hoaDon.trangThai == 1 ? "Đã thanh toán" : "Chưa thanh toán"}</td>
                                <td rowspan="${rowSpan}" class="text-center">
                                    <a href="/ban-hang/detail/${hoaDon.id}" class="btn btn-info btn-sm d-inline" title="Chi tiết">
                                        <i class="fas fa-info-circle"></i>
                                    </a>
                                    <a href="/ban-hang/update/${hoaDon.id}" class="btn btn-warning btn-sm d-inline" title="Cập nhật">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                </td>
                            </c:if>
                            <c:if test="${status.index > 0}">
                                <td>${chiTiet.spChiTiet.sanPham.ten}</td>
                                <td>${chiTiet.spChiTiet.mauSac.ten}</td>
                                <td>${chiTiet.spChiTiet.kichThuoc.ten}</td>
                                <td>${chiTiet.soLuong}</td>
                                <td>${chiTiet.donGia}</td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="text-center mt-4">
    <a href="/ban-hang/add" class="btn btn-success btn-lg"><i class="fas fa-plus-circle"></i> Tạo hóa đơn </a>
</div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
