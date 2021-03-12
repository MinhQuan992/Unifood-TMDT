<%--
  Created by IntelliJ IDEA.
  User: Vo Tran Minh Quan
  Date: 1/14/2021
  Time: 7:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cập nhật đơn hàng | Unifood</title>
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
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/order-detail.css">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body>
<div id="container">
    <nav style="background-color: #60150c;" class="navbar navbar-expand-sm">
        <a><img class="logo" src="${pageContext.request.contextPath}/Images/LOGO.png" style="width: auto; height: 50px;"></a>
        <a class="homelogo"><img src="${pageContext.request.contextPath}/Images/homepage_icon.png" style="width: auto; height: 50px;"></a>
        <ul class="navbar-nav">
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/GetAllAcceptedOrders">HOME</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/GetAllShippingOrders">ĐƠN HÀNG ĐÃ NHẬN</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/GetAllDeliveredOrders">ĐƠN HÀNG ĐÃ GIAO</a></li>
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
<h1 id="title">Đơn hàng <span><c:out value="${orderID}"></c:out></span></h1>
<div id="detail">
    <p><strong>Tên khách hàng:</strong> <span><c:out value="${customerName}"/></span></p>
    <p><strong>Số điện thoại:</strong> <span><c:out value="${customerPhone}"/></span></p>
    <p><strong>Địa chỉ giao hàng:</strong> <span><c:out value="${address}"/></span></p>
    <table id="products">
        <thead>
        <tr>
            <th style="width: 20%"></th>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${orderDetail}" var="detail">
            <tr>
                <td><img class="image" src="${pageContext.request.contextPath}<c:out value="${detail.anhMinhHoa}"/>"></td>
                <td><c:out value="${detail.tenSanPham}"/></td>
                <td style="text-align: center"><c:out value="${detail.soLuong}"/></td>
                <td style="text-align: center"><p style="margin-bottom: 0"><c:out value="${detail.donGia}"/><span> VND</span></p></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <p><strong>Trạng thái đơn hàng:</strong> <span><c:out value="${orderStatus}"/></span></p>
    <p><strong>Trạng thái thanh toán:</strong> <span><c:out value="${paymentStatus}"/></span></p>
    <p><strong>Ngày đặt:</strong> <span><c:out value="${placeOrderDate}"/></span></p>
    <c:if test="${not empty shipDate}">
        <p><strong>Ngày giao hàng:</strong> <span><c:out value="${shipDate}"/></span></p>
    </c:if>
    <c:if test="${not empty payDate}">
        <p><strong>Ngày thanh toán:</strong> <span><c:out value="${payDate}"/></span></p>
    </c:if>
    <h2><strong>Tổng giá trị:</strong> <span style="font-weight: bold; color: red"><c:out value="${totalCost}"/></span></h2>

    <c:if test="${orderStatus == 'Bàn giao vận chuyển'}">
        <form class="frmEdit" method="get" action="${pageContext.request.contextPath}/editOrder">
            <input type="hidden" name="orderID" value="<c:out value="${orderID}"/>">
            <input type="hidden" name="customerEmail" value="<c:out value="${customerEmail}"/>">
            <input type="hidden" name="action" value="NhanDonHang">
            <input id="btnNhan" type="submit" value="Nhận đơn hàng">
        </form>
        <br>
        <br>
    </c:if>

    <c:if test="${orderStatus == 'Đang vận chuyển'}">
        <form class="frmEdit" method="get" action="${pageContext.request.contextPath}/editOrder">
            <input type="hidden" name="orderID" value="<c:out value="${orderID}"/>">
            <input type="hidden" name="customerEmail" value="<c:out value="${customerEmail}"/>">
            <input type="hidden" name="action" value="DaGiaoHang">
            <input id="btnDaGiao" type="submit" value="Đã giao hàng">
        </form>
        <br>
        <br>
    </c:if>
</div>
<div id="footer">
    <p style="text-align: center">
        <b> NhomHQNT 2020 - Quan Com Online Unifood </b>
    </p>
</div>
</body>
</html>
