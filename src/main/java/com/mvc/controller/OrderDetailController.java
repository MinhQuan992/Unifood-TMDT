package com.mvc.controller;

import com.mvc.dao.UserDao;
import com.mvc.dao.ViewOrderDetailDao;
import com.mvc.entities.NguoidungEntity;
import com.mvc.entities.ViewChiTietDonHangEntity;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderDetailController", urlPatterns = {"/orderDetail"})
public class OrderDetailController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        int orderID = Integer.parseInt(request.getParameter("maDon"));
        String address = request.getParameter("diaChi");
        String orderStatus = request.getParameter("ttDonHang");
        String paymentStatus = request.getParameter("ttThanhToan");
        String placeOrderDate = request.getParameter("ngayDat");
        String shipDate = request.getParameter("ngayGiaoHang");
        String payDate = request.getParameter("ngayThanhToan");
        String totalCost = request.getParameter("tongGiaTri");
        String userType = (String) request.getSession().getAttribute("userType");
        String url = "";

        if (!userType.equals("Customer"))
        {
            String customerID = request.getParameter("maKhachHang");
            String shipperID = request.getParameter("maShipper");

            UserDao userDao = new UserDao();
            NguoidungEntity customer = userDao.getUserByID(customerID);
            request.setAttribute("customerName", customer.getHoVaTen());
            request.setAttribute("customerPhone", customer.getDienThoai());
            request.setAttribute("customerEmail", customer.getEmail());

            if (!shipperID.equals(""))
            {
                NguoidungEntity shipper = userDao.getUserByID(shipperID);
                request.setAttribute("shipperName", shipper.getHoVaTen());
            }
            else
            {
                request.setAttribute("shipperName", null);
            }

            if (userType.equals("Manager"))
            {
                url = "/editOrderManager.jsp";
            }
            else
            {
                url = "/editOrderShipper.jsp";
            }
        }
        else
        {
            url = "/order-detail.jsp";
        }

        if (!placeOrderDate.equals(""))
        {
            placeOrderDate = formatDate(placeOrderDate);
        }

        if (!shipDate.equals(""))
        {
            shipDate = formatDate(shipDate);
        }

        if (!payDate.equals(""))
        {
            payDate = formatDate(payDate);
        }

        ViewOrderDetailDao viewOrderDetailDao = new ViewOrderDetailDao();
        List<ViewChiTietDonHangEntity> orderDetail = viewOrderDetailDao.getOrderDetail(orderID);

        request.setAttribute("address", address);
        request.setAttribute("orderDetail", orderDetail);
        request.setAttribute("orderID", orderID);
        request.setAttribute("orderStatus", orderStatus);
        if (paymentStatus.equals("true"))
        {
            request.setAttribute("paymentStatus", "Đã thanh toán");
        }
        else
        {
            request.setAttribute("paymentStatus", "Chưa thanh toán");
        }
        request.setAttribute("placeOrderDate", placeOrderDate);
        request.setAttribute("shipDate", shipDate);
        request.setAttribute("payDate", payDate);
        request.setAttribute("totalCost", totalCost + " VND");

        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    private String formatDate(String date)
    {
        String year = date.substring(0,4);
        String month = date.substring(5,7);
        String day = date.substring(8,10);

        return day + "-" + month + "-" + year;
    }
}
