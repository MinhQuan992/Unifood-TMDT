package com.mvc.controller;

import com.mvc.dao.ViewOrderDao;
import com.mvc.entities.ViewDonHangEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetAllAcceptedOrdersController", urlPatterns = {"/GetAllAcceptedOrders"})
public class GetAllAcceptedOrdersController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ViewOrderDao viewOrderDao = new ViewOrderDao();
        List<ViewDonHangEntity> orders = viewOrderDao.getAllAcceptedOrders();
        request.setAttribute("title", "ĐƠN HÀNG CẦN GIAO");
        request.getSession().setAttribute("orders", orders);
        request.getRequestDispatcher("/shipperhome.jsp").forward(request, response);
    }
}
