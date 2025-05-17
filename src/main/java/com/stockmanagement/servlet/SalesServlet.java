package com.stockmanagement.servlet;

import com.stockmanagement.model.Sale;

import com.stockmanagement.util.SalefileHandler;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/sales")
public class SalesServlet extends HttpServlet {
    private List<Sale> sales = new ArrayList<>();
    private int idCounter = 1;

@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            for (Sale s : sales) {
                if (s.getId() == id) {
                    request.setAttribute("editSale", s);
                    break;
                }
            }
            request.getRequestDispatcher("Addsale.jsp").forward(request, response);
        } else if ("view".equals(action)) {
            request.setAttribute("sales", sales);
            request.getRequestDispatcher("sales.jsp").forward(request, response);
        } else {
            response.sendRedirect("sales?action=view");
        }

        //request.setAttribute("sales", sales);
        //request.getRequestDispatcher("sales.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("create".equals(action)) {
            String productName = request.getParameter("productName");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));

            sales.add(new Sale(getNextId(sales), productName, quantity, price));

        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String productName = request.getParameter("productName");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));

            for (Sale s : sales) {
                if (s.getId() == id) {
                    s.setProductName(productName);
                    s.setQuantity(quantity);
                    s.setPrice(price);
                    break;
                }
            }

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            sales.removeIf(s -> s.getId() == id);
        }

        SalefileHandler.saveSales(sales);
        response.sendRedirect("sales?action=view");
    }

    // Add this helper method for auto-increment ID:
    private int getNextId(List<Sale> sales) {
        int maxId = 0;
        for (Sale s : sales) {
            if (s.getId() > maxId) {
                maxId = s.getId();
            }
        }
        return maxId + 1;
    }

}
