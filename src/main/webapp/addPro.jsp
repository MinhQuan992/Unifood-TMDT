<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm sản phẩm | Unifood</title>
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
<c:if test="${not empty Trangthaithem}">
    <c:choose>
        <c:when test="${Trangthaithem==true}">
            <script type="text/javascript">
                alert("Thêm thành công!");
            </script>
        </c:when>
        <c:otherwise>
            <script type="text/javascript">
                alert("Thêm không thành công!");
            </script>
        </c:otherwise>
    </c:choose>
</c:if>
<div id="container">
    <nav style="background-color: #60150c;" class="navbar navbar-expand-sm">
        <a href="#"><img class="logo" src="Images/LOGO.png" style="width: auto; height: 50px;"></a>
        <a class="homelogo"><img src="Images/homepage_icon.png" style="width: auto; height: 50px;"></a>
        <ul class="navbar-nav">
            <li class="nav-item active"><a class="nav-link" href="qlhome.jsp">HOME</a></li>
            <li class="nav-item"><a class="nav-link" href="staffs.jsp">STAFFS</a></li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">${User.hoVaTen}</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item dropdown-item-custom" href="${pageContext.request.contextPath}/EditInfo">My Profile</a>
                    <a class="dropdown-item dropdown-item-custom" href="${pageContext.request.contextPath}/signout">Sign Out</a>
                </div></li>
        </ul>
    </nav>
    <div align="center">
        <form id="addcontainer" style="margin-top: 2%" method="post" action="${pageContext.request.contextPath}/addPro">
            <table>
                <tr>
                    <td><b> Mã sản phẩm: </b></td>
                    <td>
                        <input type="text" name="maSanPham" class="text-input"
                        <c:choose>
                        <c:when test="${empty maSanPham}">
                               placeholder="Nhập mã SP"
                        </c:when>
                        <c:otherwise>
                               value="<c:out value="${maSanPham}"/> "
                        </c:otherwise>
                        </c:choose>
                        <c:if test="${not empty maSanPhamError}">
                               style="border-color: #60150c"
                        </c:if>
                               required>
                    </td>
                    <td><c:out value="${maSanPhamError}"/></td>
                </tr>

                <tr>
                    <td><b>Tên sản phẩm: </b></td>
                    <td>
                        <input type="text" name="tenSanPham" class="text-input"
                        <c:choose>
                        <c:when test="${empty tenSanPham}">
                               placeholder="Nhập tên SP"
                        </c:when>
                        <c:otherwise>
                               value="<c:out value="${tenSanPham}"/> "
                        </c:otherwise>
                        </c:choose>
                        <c:if test="${not empty tenSanPhamError}">
                               style="border-color: #60150c"
                        </c:if>
                               required>
                    </td>
                    <td><c:out value="${tenSanPhamError}"/></td>
                </tr>

                <tr>
                    <td><b> Đơn giá: </b></td>
                    <td>
                        <input type="text" name="donGia" class="text-input"
                        <c:choose>
                        <c:when test="${empty donGia}">
                               placeholder="Nhập đơn giá SP"
                        </c:when>
                        <c:otherwise>
                               value="<c:out value="${donGia}"/> "
                        </c:otherwise>
                        </c:choose>
                        <c:if test="${not empty donGiaError}">
                               style="border-color: #60150c"
                        </c:if>
                               required>
                    </td>
                    <td><c:out value="${donGiaError}"/></td>
                </tr>

                <tr>
                    <td><b> Đơn vị tính: </b></td>
                    <td>
                        <input type="text" name="donViTinh" class="text-input"
                        <c:choose>
                        <c:when test="${empty donViTinh}">
                               placeholder="Nhập đơn vị tính của SP"
                        </c:when>
                        <c:otherwise>
                               value="<c:out value="${donViTinh}"/> "
                        </c:otherwise>
                        </c:choose>
                        <c:if test="${not empty donViTinhError}">
                               style="border-color: #60150c"
                        </c:if>
                               required>
                    </td>
                    <td><c:out value="${donViTinhError}"/></td>
                </tr>

                <tr>
                    <td><b> Số lượng: </b></td>
                    <td>
                        <input type="text" name="soLuong" class="text-input"
                        <c:choose>
                        <c:when test="${empty soLuong}">
                               placeholder="Nhập số lượng SP"
                        </c:when>
                        <c:otherwise>
                               value="<c:out value="${soLuong}"/> "
                        </c:otherwise>
                        </c:choose>
                        <c:if test="${not empty soLuongError}">
                               style="border-color: #60150c"
                        </c:if>
                               required>
                    </td>
                    <td><c:out value="${soLuongError}"/></td>
                </tr>


                <tr>
                    <td><b> Hình ảnh: </b></td>
                    <td>
                        <input type="text" name="anhMinhHoa" class="text-input"
                        <c:choose>
                        <c:when test="${empty anhMinhHoa}">
                               placeholder="Nhập URL hình ảnh SP"
                        </c:when>
                        <c:otherwise>
                               value="<c:out value="${anhMinhHoa}"/> "
                        </c:otherwise>
                        </c:choose>
                        <c:if test="${not empty anhMinhHoaError}">
                               style="border-color: #60150c"
                        </c:if>
                               >
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
                        <input type="text" name="moTa" class="text-input"
                        <c:choose>
                        <c:when test="${empty moTa}">
                               placeholder="Nhập mô tả SP"
                        </c:when>
                        <c:otherwise>
                               value="<c:out value="${moTa}"/> "
                        </c:otherwise>
                        </c:choose>
                        <c:if test="${not empty moTaError}">
                               style="border-color: #60150c"
                        </c:if>
                               >
                    </td>
                    <td><c:out value="${moTaError}"/></td>
                </tr>
            </table>
            <br>
            <input type="submit" style="text-align: center; background-color: #60150c; text-decoration-color: white" value="Xác nhận">
        </form>
    </div>

    <div id="footer">
        <p style="text-align: center">
            <b> NhomHQNT 2020 - Quan Com Online Unifood </b>
        </p>
    </div>
</div>
</body>
</html>