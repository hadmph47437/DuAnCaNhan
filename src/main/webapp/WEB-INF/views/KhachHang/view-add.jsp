<%--<%@ page contentType="text/html; charset=UTF-8" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--<html lang="vi">--%>
<%--<head>--%>
<%--    <title>Thêm khách hàng</title>--%>
<%--    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <style>--%>
<%--        .error {--%>
<%--            color: red;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container mt-4">--%>
<%--    <h2 class="text-center mb-4">Thêm khách hàng mới</h2>--%>
<%--    <form:form action="/khach-hang/add" method="post" modelAttribute="khachHang">--%>

<%--        <div class="form-group">--%>
<%--            <label for="ten">Tên:</label>--%>
<%--            <form:input path="ten" id="ten" class="form-control"/>--%>
<%--            <div class="error">--%>
<%--                <form:errors path="ten"/>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--            <label for="sdt">Số điện thoại:</label>--%>
<%--            <form:input path="sdt" id="sdt" class="form-control"/>--%>
<%--            <div class="error">--%>
<%--                <form:errors path="sdt"/>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--            <label for="maKH">Mã KH:</label>--%>
<%--            <form:input path="maKH" id="maKH" class="form-control"/>--%>
<%--            <div class="error">--%>
<%--                <form:errors path="maKH"/>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--            <label>Trạng thái:</label><br>--%>
<%--            <form:radiobuttons path="trangThai" items="${{'1':'Hoạt động', '0':'Không hoạt động'}}"/>--%>
<%--            <div class="error">--%>
<%--                <form:errors path="trangThai"/>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <button type="submit" class="btn btn-primary">Thêm</button>--%>
<%--    </form:form>--%>
<%--    <a href="/khach-hang/hien-thi" class="btn btn-secondary mt-2">Quay lại</a>--%>
<%--</div>--%>

<%--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="vi">
<head>
    <title>Thêm khách hàng</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error {
            color: red;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-primary {
            width: 100%;
        }
        .form-container {
            max-width: 400px; /* Giới hạn chiều rộng của form */
            margin: auto; /* Giữa trang */
            opacity: 0.9;
        }

        body {
            background-image: url('https://mialala.vn/media/banner/02_03-60dcd619959183b8941961d5dd1144cc.jpg'); /* Thêm ảnh nền */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Thêm khách hàng mới</h2>
    <div class="form-container">
        <form:form action="/khach-hang/add" method="post" modelAttribute="khachHang">
            <div class="card p-3">
                <div class="form-group">
                    <label for="ten">Tên:</label>
                    <form:input path="ten" id="ten" class="form-control" placeholder="Nhập tên khách hàng"/>
                    <div class="error">
                        <form:errors path="ten"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="sdt">Số điện thoại:</label>
                    <form:input path="sdt" id="sdt" class="form-control" placeholder="Nhập số điện thoại"/>
                    <div class="error">
                        <form:errors path="sdt"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="maKH">Mã KH:</label>
                    <form:input path="maKH" id="maKH" class="form-control" placeholder="Nhập mã khách hàng"/>
                    <div class="error">
                        <form:errors path="maKH"/>
                    </div>
                </div>

                <div class="form-group">
                    <label>Trạng thái:</label><br>
                    <form:radiobuttons path="trangThai" items="${{'1':'Hoạt động', '0':'Không hoạt động'}}"/>
                    <div class="error">
                        <form:errors path="trangThai"/>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Thêm</button>
            </div>
        </form:form>
        <a href="/khach-hang/hien-thi" class="btn btn-secondary mt-3">Quay lại</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

