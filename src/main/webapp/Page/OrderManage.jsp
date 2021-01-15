<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Manage</title>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/qlpage.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/orders.css" />
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <link rel="stylesheet" href="bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Oswald:wght@500&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JS/CartScript.js"></script>
</head>
<body>
<div id="container">
    <nav style="background-color: #60150c;" class="navbar navbar-expand-sm">
        <a><img class="logo" src="${pageContext.request.contextPath}/Images/LOGO.png" style="width: auto; height: 50px;"></a>
        <a class="homelogo"><img src="${pageContext.request.contextPath}/Images/homepage_icon.png" style="width: auto; height: 50px;"></a>
        <ul class="navbar-nav">
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/qlhome.jsp">HOME</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/staffs.jsp">STAFFS</a></li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">${User.hoVaTen}</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item dropdown-item-custom" href="${pageContext.request.contextPath}/EditInfo">My Profile</a>
                    <a class="dropdown-item dropdown-item-custom" href="${pageContext.request.contextPath}/signout">Sign Out</a>
                </div>
            </li>
        </ul>
    </nav>
</div>
<form style="margin-left: 10%; padding-top: 2%;" method="get" action="${pageContext.request.contextPath}/GetAllOrders">
    <select name="category" id="category">
        <option value="Đã tiếp nhận">Đã tiếp nhận</option>
        <option value="Đang xử lý">Đang xử lý</option>
        <option value="Bàn giao vận chuyển">Bàn giao vận chuyển</option>
        <option value="Đang vận chuyển">Đang vận chuyển</option>
        <option value="Giao hàng thành công">Giao hàng thành công</option>
        <option value="Đã hủy">Đã hủy</option>
    </select>
    &nbsp;
    <input id="btnChon" type="submit" value="Chọn">
</form>
<c:choose>
    <c:when test="${empty orders}">
        <img id="image" src="Images/no-order.png">
        <h1 class="title">Chưa có đơn hàng nào!</h1>
    </c:when>
    <c:otherwise>
        <div align="center">
            <h1 class="title">QUẢN LÝ ĐƠN HÀNG</h1>
            <table id="orders" style="margin-left: 0; width: 80%;">
                <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Mã khách hàng</th>
                    <th>Mã shipper</th>
                    <th>Địa chỉ giao hàng</th>
                    <th>Trạng thái đơn hàng</th>
                    <th>Trạng thái thanh toán</th>
                    <th>Tổng giá trị</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orders}" var="order">
                    <tr>
                        <td>
                            <form method="get" action="${pageContext.request.contextPath}/orderDetail">
                                <input type="hidden" name="maDon" value="${order.maDon}">
                                <input type="hidden" name="maKhachHang" value="${order.maNguoiDung}">
                                <input type="hidden" name="maShipper" value="${order.maNguoiVanChuyen}">
                                <input type="hidden" name="diaChi" value="${order.diaChi}">
                                <input type="hidden" name="ttDonHang" value="${order.ttDonHang}">
                                <input type="hidden" name="ttThanhToan" value="${order.ttThanhToan}">
                                <input type="hidden" name="ngayDat" value="${order.ngayDat}">
                                <input type="hidden" name="ngayGiaoHang" value="${order.ngayGiaoHang}">
                                <input type="hidden" name="ngayThanhToan" value="${order.ngayThanhToan}">
                                <input type="hidden" name="tongGiaTri" value="${order.tongGiaTri}">
                                <input id="btnSubmit" style="margin-left: 17%" type="submit" value="<c:out value="${order.maDon}"/>">
                            </form>
                        </td>
                        <td><c:out value="${order.maNguoiDung}"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${empty order.maNguoiVanChuyen}">
                                    <i>Chưa được giao</i>
                                </c:when>

                                <c:otherwise>
                                    <c:out value="${order.maNguoiVanChuyen}"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><c:out value="${order.diaChi}"/></td>
                        <td><c:out value="${order.ttDonHang}"/></td>
                        <c:choose>
                            <c:when test="${order.ttThanhToan == true}">
                                <td>Đã thanh toán</td>
                            </c:when>

                            <c:otherwise>
                                <td>Chưa thanh toán</td>
                            </c:otherwise>
                        </c:choose>
                        <td style="text-align: center"><p style="margin-bottom: 0"><c:out value="${order.tongGiaTri}"/><span> VND</span></p></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:otherwise>
</c:choose>
<div id="footer">
    <p style="text-align: center">
        <b> NhomHQNT 2020 - Quan Com Online Unifood </b>
    </p>
</div>
</body>
</html>
