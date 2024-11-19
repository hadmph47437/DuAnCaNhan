<%--<%@ page contentType="text/html; charset=UTF-8" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Thêm sản phẩm</title>--%>
<%--    <style>--%>
<%--        .error {--%>
<%--            color: red;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>Thêm sản phẩm</h2>--%>
<%--<form:form action="/san-pham/add" method="post" modelAttribute="sanPham">--%>
<%--    <label for="ma">Mã:</label>--%>
<%--    <form:input path="ma" id="ma"/>--%>
<%--    <div class="error">--%>
<%--        <form:errors path="ma"/>--%>
<%--    </div><br>--%>

<%--    <label for="ten">Tên:</label>--%>
<%--    <form:input path="ten" id="ten"/>--%>
<%--    <div class="error">--%>
<%--        <form:errors path="ten"/>--%>
<%--    </div><br>--%>

<%--    Trạng thái:--%>
<%--    <label>--%>
<%--        <input type="radio" name="trangThai" value="1" /> Còn hàng--%>
<%--    </label>--%>
<%--    <label>--%>
<%--        <input type="radio" name="trangThai" value="0" /> Hết hàng--%>
<%--    </label>--%>
<%--    <div class="error">--%>
<%--        <form:errors path="trangThai"/>--%>
<%--    </div><br>--%>

<%--    <button type="submit">Thêm</button>--%>
<%--</form:form>--%>
<%--<a href="/san-pham/hien-thi">Quay lại</a>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="vi">
<head>
    <title>Thêm sản phẩm</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Thêm sản phẩm</h2>
    <form:form action="/san-pham/add" method="post" modelAttribute="sanPham">
        <div class="form-group">
            <label for="ma">Mã:</label>
            <form:input path="ma" id="ma" class="form-control"/>
            <div class="error">
                <form:errors path="ma" cssClass="error"/>
            </div>
        </div>

        <div class="form-group">
            <label for="ten">Tên:</label>
            <form:input path="ten" id="ten" class="form-control"/>
            <div class="error">
                <form:errors path="ten" cssClass="error"/>
            </div>
        </div>

        <div class="form-group">
            <label>Trạng thái:</label><br>
            <label class="radio-inline">
                <input type="radio" name="trangThai" value="1" /> Còn hàng
            </label>
            <label class="radio-inline">
                <input type="radio" name="trangThai" value="0" /> Hết hàng
            </label>
            <div class="error">
                <form:errors path="trangThai" cssClass="error"/>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Thêm</button>
    </form:form>
    <a href="/san-pham/hien-thi" class="btn btn-secondary mt-3">Quay lại</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

