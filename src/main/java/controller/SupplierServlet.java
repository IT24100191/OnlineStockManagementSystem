package controller;

import dao.SupplierDAO;
import model.Supplier;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SupplierServlet", urlPatterns = "/SupplierServlet")
public class SupplierServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) action = "list";

        switch (action) {
            case "new":
                request.getRequestDispatcher("supplier-form.jsp").forward(request, response);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Supplier supplier = SupplierDAO.getSupplierById(id);
                request.setAttribute("supplier", supplier);
                request.getRequestDispatcher("supplier-form.jsp").forward(request, response);
                break;
            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                SupplierDAO.deleteSupplier(deleteId);
                response.sendRedirect("SupplierServlet");
                break;
            default:
                List<Supplier> suppliers = SupplierDAO.getAllSuppliers();
                request.setAttribute("supplierList", suppliers);
                request.getRequestDispatcher("supplier-list.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = request.getParameter("id").isEmpty() ? 0 : Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Supplier supplier = new Supplier(id, name, email, phone);

        if (id == 0) {
            SupplierDAO.addSupplier(supplier);
        } else {
            SupplierDAO.updateSupplier(supplier);
        }

        response.sendRedirect("SupplierServlet");
    }
}