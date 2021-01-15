package com.mvc.controller;

import com.mvc.dao.ManageWarehouseDao;
import com.mvc.dao.PaymentDao;
import com.mvc.entities.*;
import com.mvc.utility.EmailUtility;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "PaymentController")
public class PaymentController extends HttpServlet {
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
        int maGio = Integer.parseInt(request.getParameter("MaGio"));

        List<DathangEntity> listDat = PaymentDao.GetDatHang(maGio);
        List<SanphamEntity> listSP = new ArrayList<>();

        int cost = 0;
        for (DathangEntity d: listDat) {
            SanphamEntity sp = ManageWarehouseDao.GetItem(d.getMaSanPham());
            sp.setSoLuong(d.getSoLuong());
            listSP.add(sp);
            cost += sp.getDonGia() * d.getSoLuong();
        }

        List<DonhangEntity> listDon = PaymentDao.GetAllDonHang();
        listDon.sort(Comparator.comparing(DonhangEntity::getMaDon).reversed());
        int maDon = 1;
        if (!listDon.isEmpty()) {
            maDon = listDon.get(0).getMaDon() + 1;
        }

        request.setAttribute("MaGio",maGio);
        request.setAttribute("listSP", listSP);
        request.setAttribute("cost", cost);
        request.setAttribute("MaDon", maDon);

        RequestDispatcher dispatcher = request.getRequestDispatcher("payment.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int maDon = Integer.parseInt(request.getParameter("MaDon"));
        int maGio = Integer.parseInt(request.getParameter("MaGio"));
        int cost = Integer.parseInt(request.getParameter("TongGiaTri"));
        String diaChi = request.getParameter("DiaChi").trim();
        String recipient = request.getParameter("UserEmail");

        DonhangEntity don = new DonhangEntity();
        don.setMaDon(maDon);
        don.setMaGio(maGio);
        don.setMaNguoiVanChuyen(null);
        don.setDiaChi(diaChi);
        don.setTtDonHang("Đã tiếp nhận");
        don.setTtThanhToan(false);
        don.setTongGiaTri(cost);
        don.setNgayDat(new java.sql.Date(Calendar.getInstance().getTime().getTime()));

        PaymentDao.AddDonHang(don);

        request.setAttribute("authorize", true);

        String subject = "Don hang cua ban da duoc tiep nhan";
        String content = "Xin chao ban, UNIFOOD da tiep nhan don hang so " + maDon + " cua ban.";
        content += "\nChung toi se xem xet don hang cua ban trong thoi gian som nhat va gui thong bao ve email nay.";
        content += "\nXin kinh chuc ban that nhieu suc khoe va chan thanh cam on ban da mua hang tai UNIFOOD!";
        content += "\nTran trong.";
        content += "\nDoi ngu ho tro UNIFOOD";

        try
        {
            EmailUtility.sendEmail(host, port, socketFactoryClass, auth, email, name, pass,
                    recipient, subject, content);
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("payment-message.jsp");
        dispatcher.forward(request, response);
    }
}
