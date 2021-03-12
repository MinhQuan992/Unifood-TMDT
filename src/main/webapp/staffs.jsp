<%--
  Created by IntelliJ IDEA.
  User: Hương Gấu
  Date: 12/24/2020
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Nhân viên | Unifood</title>
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
    <link type="text/css" rel="stylesheet" href="css/staffs.css" />
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body>

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
                    <a class="dropdown-item dropdown-item-custom" href="${pageContext.request.contextPath}/EditInfo">My Profile</a>
                    <a class="dropdown-item dropdown-item-custom" href="${pageContext.request.contextPath}/signout">Sign Out</a>
                </div></li>
        </ul>
    </nav>

    <div align="center">
        <h3>DANH SÁCH NHÂN VIÊN</h3>
        <ul>
            <a style="text-align: center;"><img src="Images/MQ.jpg" style="text-align: center; width: 250px; height: 300px;"></a><br>
            <marquee scrollamount="200" scrolldelay="2000" style="height: 100px; width: 400px;">
                <span style="color: navy; font-size: 30px; text-align: center;"><b>VÕ TRẦN MINH QUÂN</b></span>
            </marquee><br>
            <a style="text-align: center;"><img src="Images/HG.jpg" style="width: 250px; height: 300px;"></a><br>
            <marquee scrollamount="200" scrolldelay="2000" style="height: 100px; width: 400px;">
                <span style="color: navy; font-size: 30px; text-align: center;"><b>TẠ THỊ MAI HƯƠNG</b></span>
            </marquee><br>
            <a style="text-align: center;"><img src="Images/QN.jpg" style="width: 250px; height: 300px;"></a><br>
            <marquee scrollamount="200" scrolldelay="2000" style="height: 100px; width: 400px;">
                <span style="color: navy; font-size: 30px; text-align: center;"><b>NGUYỄN QUỐC NINH</b></span>
            </marquee><br>
            <a style="text-align: center";><img src="Images/DT.jpg" style="width: 250px; height: 300px"> </a><br>
            <marquee scrollamount="200" scrolldelay="2000" style="height: 100px; width: 400px;">
                <span style="color: navy; font-size: 30px; text-align: center;"><b>TRẦN ĐĂNG TÂM</b></span>
            </marquee><br>
        </ul>
    </div>
</div>

<div id="footer">
    <p style="text-align: center">
        <b> NhomHQNT 2020 - Quan Com Online Unifood </b>
    </p>
</div>
</div>
</body>
</html>