package com.stockmanagement.controller;

import com.stockmanagement.util.SupplierFileUtil;
import com.stockmanagement.model.Supplier;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SupplierServlet", urlPatterns = {"/SupplierServlet"})
public class SupplierServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        String filePath = getServletContext().getRealPath("/WEB-INF/data/suppliers.txt");

        if (action == null) action = "list";

        switch (action) {
            case "new":
                request.getRequestDispatcher("/supplier-form.jsp").forward(request, response);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Supplier supplier = SupplierFileUtil.getSupplierById(id, filePath);
                request.setAttribute("supplier", supplier);
                request.getRequestDispatcher("/supplier-form.jsp").forward(request, response);
                break;
            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                SupplierFileUtil.deleteSupplier(deleteId, filePath);
                response.sendRedirect(request.getContextPath() + "/SupplierServlet");
                break;
            default:
                String search = request.getParameter("search");
                List<Supplier> suppliers;
                if (search != null && !search.trim().isEmpty()) {
                    suppliers = SupplierFileUtil.getSuppliersByName(search.trim(), filePath);
                } else {
                    suppliers = SupplierFileUtil.getAllSuppliers(filePath);
                }
                request.setAttribute("supplierList", suppliers);
                request.setAttribute("search", search != null ? search : "");
                request.getRequestDispatcher("/supplier-list.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = getServletContext().getRealPath("/WEB-INF/data/suppliers.txt");
        int id = request.getParameter("id").isEmpty() ? 0 : Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Supplier supplier = new Supplier(id, name, email, phone);

        if (id == 0) {
            SupplierFileUtil.addSupplier(supplier, filePath);
        } else {
            SupplierFileUtil.updateSupplier(supplier, filePath);
        }

        response.sendRedirect(request.getContextPath() + "/SupplierServlet");
    }
}