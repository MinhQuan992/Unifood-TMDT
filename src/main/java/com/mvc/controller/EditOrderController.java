package com.mvc.controller;

import com.mvc.dao.PaymentDao;
import com.mvc.entities.DonhangEntity;
import com.mvc.utility.EmailUtility;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "EditOrderController", urlPatterns = {"/editOrder"})
public class EditOrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String host;
    private String port;
    private String socketFactoryClass;
    private String auth;
    private String email;
    private String name;
    private String pass;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        socketFactoryClass = context.getInitParameter("socketFactoryClass");
        auth = context.getInitParameter("auth");
        email = context.getInitParameter("email");
        name = context.getInitParameter("name");
        pass = context.getInitParameter("pass");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        String action = request.getParameter("action");
        String recipient = request.getParameter("customerEmail");
        String userType = (String) request.getSession().getAttribute("userType");
        String newStatus = "";
        String subject = "";
        String content = "";

        switch (action)
        {
            case "Duyet":
                newStatus = "Đang xử lý";
                subject = "Don hang cua ban da duoc duyet va dang cho xu ly";
                content = "Xin chao ban, don hang so " + orderID + " cua ban da duoc duyet va dang duoc xu ly de giao den ban trong thoi gian som nhat.";
                content += "\nNgay khi trang thai don hang duoc cap nhat, chung toi se gui thong bao ve email nay.";
                content += "\nXin kinh chuc ban that nhieu suc khoe!";
                content += "\nTran trong.";
                content += "\nDoi ngu ho tro UNIFOOD";
                break;

            case "Huy":
                newStatus = "Đã hủy";
                subject = "Don hang cua ban da bi huy";
                content = "Xin chao ban, UNIFOOD rat tiec phai thong bao den ban rang don hang so " + orderID + " cua ban da bi huy do so luong hang hien tai trong kho khong du de dap ung don hang cua ban.";
                content += "\nChung toi rat lay lam tiec ve dieu nay va kinh mong se nhan duoc su thong cam tu ban.";
                content += "\nXin kinh chuc ban that nhieu suc khoe va mong rang trong thoi gian toi ban se tiep tuc dong hanh cung UNIFOOD!";
                content += "\nTran trong.";
                content += "\nDoi ngu ho tro UNIFOOD";
                break;

            case "BanGiaoVanChuyen":
                newStatus = "Bàn giao vận chuyển";
                subject = "Don hang cua ban da san sang de giao";
                content = "Xin chao ban, don hang so " + orderID + " cua ban da duoc chuan bi xong va se duoc gui den nhan vien giao hang de giao den ban trong thoi gian som nhat.";
                content += "\nNgay khi don hang duoc van chuyen, chung toi se gui thong bao cho ban.";
                content += "\nXin kinh chuc ban that nhieu suc khoe!";
                content += "\nTran trong.";
                content += "\nDoi ngu ho tro UNIFOOD";
                break;

            case "NhanDonHang":
                newStatus = "Đang vận chuyển";
                subject = "Don hang cua ban dang duoc van chuyen";
                content = "Xin chao ban, don hang so " + orderID + " cua ban dang duoc van chuyen va se giao den ban trong thoi gian som nhat.";
                content += "\nNhan vien giao hang cua chung toi se lien lac voi ban qua so dien thoai ban da cung cap tren he thong.";
                content += "\nXin kinh chuc ban that nhieu suc khoe!";
                content += "\nTran trong.";
                content += "\nDoi ngu ho tro UNIFOOD";
                break;

            case "DaGiaoHang":
                newStatus = "Giao hàng thành công";
                subject = "Don hang cua ban da duoc giao thanh cong";
                content = "Xin chao ban, don hang so " + orderID + " cua ban da duoc giao thanh cong.";
                content += "\nXin cam on ban da tin tuong mua hang tai UNIFOOD va mong rang ban se tiep tuc dong hanh voi chung toi trong thoi gian toi.";
                content += "\nXin kinh chuc ban that nhieu suc khoe!";
                content += "\nTran trong.";
                content += "\nDoi ngu ho tro UNIFOOD";
                break;
        }

        try
        {
            EmailUtility.sendEmail(host, port, socketFactoryClass, auth, email, name, pass,
                    recipient, subject, content);
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }

        PaymentDao paymentDao = new PaymentDao();
        DonhangEntity order = (DonhangEntity) paymentDao.GetDonHang(orderID);
        DonhangEntity orderWithNewStatus;

        if (userType.equals("Manager"))
        {
            orderWithNewStatus = new DonhangEntity(order.getMaDon(), order.getMaGio(), order.getMaNguoiVanChuyen(), order.getDiaChi(), newStatus, order.getTtThanhToan(), order.getTongGiaTri(), order.getNgayDat(), order.getNgayGiaoHang(), order.getNgayThanhToan());
            paymentDao.UpdateOrderData(orderWithNewStatus);
            response.sendRedirect("http://localhost:8080/UniFoods_war/GetAllOrders?category=%C4%90%C3%A3+ti%E1%BA%BFp+nh%E1%BA%ADn");
        }
        else
        {
            String shipperID = (String) request.getSession().getAttribute("userID");
            boolean paymentStatus;
            java.sql.Date dateInSqlDate;

            if (action.equals("DaGiaoHang"))
            {
                paymentStatus = true;
                Date dateInJavaDate = new Date();
                dateInSqlDate = new java.sql.Date(dateInJavaDate.getTime());
            }
            else
            {
                paymentStatus = false;
                dateInSqlDate = order.getNgayGiaoHang();
            }

            orderWithNewStatus = new DonhangEntity(order.getMaDon(), order.getMaGio(), shipperID, order.getDiaChi(), newStatus, paymentStatus, order.getTongGiaTri(), order.getNgayDat(), dateInSqlDate, dateInSqlDate);
            paymentDao.UpdateOrderData(orderWithNewStatus);
            response.sendRedirect("http://localhost:8080/UniFoods_war/GetAllAcceptedOrders?");
        }
    }
}
