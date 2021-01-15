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

@WebServlet(name = "GetAllOrdersController", urlPatterns = {"/GetAllOrders"})
public class GetAllOrdersController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category");
        ViewOrderDao viewOrderDao = new ViewOrderDao();
        List<ViewDonHangEntity> orders = viewOrderDao.getAllOrderManager(category);
        request.getSession().setAttribute("orders", orders);
        request.getRequestDispatcher("/Page/OrderManage.jsp").forward(request, response);
    }
}
