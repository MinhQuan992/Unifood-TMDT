<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hương Gấu
  Date: 12/24/2020
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh sửa sản phẩm | Unifood</title>
    <meta name="description" content="Quan Com Online Unifood" />
    <meta name="author" content="NhomHQNT">
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
    <link type="text/css" rel="stylesheet" href="css/qlpage.css" />
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body>
<%
    String maSanPham = request.getParameter("maSanPham");
%>
<c:if test="${not empty Trangthaicapnhat}">
    <c:choose>
        <c:when test="${Trangthaicapnhat==true}">
            <script type="text/javascript">
                alert("Cập nhật thành công!");
            </script>
        </c:when>
        <c:otherwise>
            <script type="text/javascript">
                alert("Cập nhật không thành công!");
            </script>
        </c:otherwise>
    </c:choose>
</c:if>
<div id="container">
    <nav style="background-color: #60150c;" class="navbar navbar-expand-sm">
        <a><img class="logo" src="Images/LOGO.png" style="width: auto; height: 50px;"></a>
        <a class="homelogo"><img src="Images/homepage_icon.png" style="width: auto; height: 50px;"></a>
        <ul class="navbar-nav">
            <li class="nav-item active"><a class="nav-link" href="qlhome.jsp">HOME</a></li>
            <li class="nav-item"><a class="nav-link" href="staffs.jsp">STAFFS</a></li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">${User.hoVaTen}</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item dropdown-item-custom" href="${pageContext.request.contextPath}/ManageWarehouse">My Profile</a>
                    <a class="dropdown-item dropdown-item-custom" href="${pageContext.request.contextPath}/signout">Sign Out</a>
                </div></li>
        </ul>
    </nav>

    <div align="center">
        <form method="post" style="margin-top: 2%" action="${pageContext.request.contextPath}/editdetail">
            <table>
                <tr>
                    <td><b> Mã sản phẩm: </b></td>
                    <td>
                        <input type="text" name="maSanPham" class="text-input" value="<c:out value="${maSanPham}"/>">
                    </td>
                    <td><c:out value="${maSanPhamError}"/></td>
                </tr>

                <tr>
                    <td><b>Tên sản phẩm: </b></td>
                    <td>
                        <input type="text" name="tenSanPham" class="text-input" value="<c:out value="${tenSanPham}"/>">
                    </td>
                    <td><c:out value="${tenSanPhamError}"/></td>
                </tr>

                <tr>
                    <td><b> Đơn giá: </b></td>
                    <td>
                        <input type="text" name="donGia" class="text-input" value="<c:out value="${donGia}"/>">
                    </td>
                    <td><c:out value="${donGiaError}"/></td>
                </tr>

                <tr>
                    <td><b> Đơn vị tính: </b></td>
                    <td>
                        <input type="text" name="donViTinh" class="text-input" value="<c:out value="${donViTinh}"/>">
                    </td>
                    <td><c:out value="${donViTinhError}"/></td>
                </tr>

                <tr>
                    <td><b> Số lượng: </b></td>
                    <td>
                        <input type="text" name="soLuong" class="text-input" value="<c:out value="${soLuong}"/>">
                    </td>
                    <td><c:out value="${soLuongError}"/></td>
                </tr>


                <tr>
                    <td><b> Hình ảnh: </b></td>
                    <td>
                        <input type="text" name="anhMinhHoa" class="text-input" value="<c:out value="${anhMinhHoa}"/>">
                    </td>
                    <td><c:out value="${anhMinhHoaError}"/></td>
                </tr>

                <tr>
                    <td><b> Nhóm sản phẩm: </b></td>
                    <td>
                        <select name="maNhom">
                            <option value="1" <c:if test="${maNhom == '1'}">selected</c:if>>Cơm</option>
                            <option value="2" <c:if test="${maNhom == '2'}">selected</c:if>>Món bún, phở, mì</option>
                            <option value="3" <c:if test="${maNhom == '3'}">selected</c:if>>Bánh mì</option>
                            <option value="4" <c:if test="${maNhom == '4'}">selected</c:if>>Bánh mặn</option>
                            <option value="5" <c:if test="${maNhom == '5'}">selected</c:if>>Bánh ngọt</option>
                            <option value="6" <c:if test="${maNhom == '6'}">selected</c:if>>Thức ăn nhanh</option>
                            <option value="7" <c:if test="${maNhom == '7'}">selected</c:if>>Nước suối</option>
                            <option value="8" <c:if test="${maNhom == '8'}">selected</c:if>>Nước ngọt</option>
                            <option value="10" <c:if test="${maNhom == '10'}">selected</c:if>>Đồ ăn kèm</option>
                            <option value="11" <c:if test="${maNhom == '11'}">selected</c:if>>Canh phần</option>
                            <option value="12" <c:if test="${maNhom == '12'}">selected</c:if>>Nước giải khát</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><b> Kho hàng: </b></td>
                    <td>
                        <select name="maKho">
                            <option value="KHOHANG01" <c:if test="${maKho == 'KHOHANG01'}">selected</c:if>>Kho hàng trụ sở chính HCMUTE</option>
                            <option value="KHOHANG02" <c:if test="${maKho == 'KHOHANG02'}">selected</c:if>>Kho hàng phụ HCMUTE</option>
                            <option value="KHOHANG03" <c:if test="${maKho == 'KHOHANG03'}">selected</c:if>>Kho hàng dự phòng</option>
                            <option value="KHOHANG04" <c:if test="${maKho == 'KHOHANG04'}">selected</c:if>>Kho hàng Quận 9</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><b> Mô tả: </b></td>
                    <td>
                        <input type="text" name="moTa" class="text-input" value="<c:out value="${moTa}"/>">
                    </td>
                    <td><c:out value="${moTaError}"/></td>
                </tr>
            </table>
            <br>
            <input type="submit" style="text-align: center; background-color: #60150c; text-decoration-color: white;" value="Xác Nhận">

        </form>
    </div>

</div><br>

<div id="footer">
    <p style="text-align: center">
        <b> NhomHQNT 2020 - Quan Com Online Unifood </b>
    </p>
</div>
</body>
</html>