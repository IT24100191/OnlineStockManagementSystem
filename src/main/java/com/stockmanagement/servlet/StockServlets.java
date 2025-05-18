package com.stockmanagement.servlet;

import com.stockmanagement.dao.StockDAO;
import com.stockmanagement.model.Stock;
import com.stockmanagement.util.StockSorter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/stock")
public class StockServlets extends HttpServlet {
    private enum Action {
        ADD, UPDATE, DELETE, CHANGE_QTY, ANALYSIS, CHECK_ID
    }

    private void displayStockTable(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<Stock> products = StockDAO.readAll();
        products = StockSorter.sortByExpiryDate(products); // Sort by expiry date
        req.setAttribute("products", products != null ? products : new ArrayList<>());
        req.getRequestDispatcher("stockTable.jsp").forward(req, res);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String actionParam = req.getParameter("action");

        if (actionParam != null && !actionParam.isEmpty()) {
            Action action;
            try {
                action = Action.valueOf(actionParam.toUpperCase());
            } catch (IllegalArgumentException e) {
                res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action: " + actionParam);
                return;
            }

            try {
                switch (action) {
                    case ANALYSIS:
                        List<Stock> allProducts = StockDAO.readAll();
                        List<Stock> sortedProducts = StockSorter.sortByExpiryDate(allProducts); // Use merge sort

                        req.setAttribute("sortedProducts", sortedProducts);
                        req.setAttribute("total", sortedProducts.size());

                        long lowStock = sortedProducts.stream().filter(prod -> prod.getQuantity() < 10).count();
                        long expiringSoon = sortedProducts.stream()
                                .filter(prod -> prod.getExpiryDate() != null &&
                                        prod.getExpiryDate().isBefore(LocalDate.now().plusDays(30)))
                                .count();

                        req.setAttribute("lowStock", lowStock);
                        req.setAttribute("expiringSoon", expiringSoon);
                        req.getRequestDispatcher("stockAnalysis.jsp").forward(req, res);
                        return;

                    case CHECK_ID:
                        String id = req.getParameter("id");
                        if (id == null || id.isEmpty()) {
                            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID is required");
                            return;
                        }
                        boolean idExists = StockDAO.readAll().stream().anyMatch(p -> p.getId().equals(id));
                        res.setContentType("text/plain");
                        res.getWriter().write(String.valueOf(idExists));
                        return;
                }
            } catch (Exception e) {
                req.setAttribute("error", "Operation failed: " + e.getMessage());
                req.getRequestDispatcher("error.jsp").forward(req, res);
                return;
            }
        }

        displayStockTable(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String actionParam = req.getParameter("action");

        if (actionParam == null || actionParam.isEmpty()) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing action parameter");
            return;
        }

        Action action;
        try {
            action = Action.valueOf(actionParam.toUpperCase());
        } catch (IllegalArgumentException e) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action: " + actionParam);
            return;
        }

        try {
            switch (action) {
                case ADD:
                    String id = req.getParameter("id");
                    String name = req.getParameter("name");
                    String category = req.getParameter("category");
                    String quantityStr = req.getParameter("quantity");
                    String unit = req.getParameter("unit");
                    String expiryDateStr = req.getParameter("expiryDate");

                    if (id == null || name == null || category == null || quantityStr == null || unit == null || expiryDateStr == null ||
                            id.isEmpty() || name.isEmpty() || category.isEmpty() || quantityStr.isEmpty() || unit.isEmpty() || expiryDateStr.isEmpty()) {
                        req.setAttribute("error", "All fields are required");
                        req.setAttribute("products", StockDAO.readAll());
                        req.getRequestDispatcher("addStock.jsp").forward(req, res);
                        return;
                    }

                    int quantity;
                    try {
                        quantity = Integer.parseInt(quantityStr);
                        if (quantity < 0) {
                            req.setAttribute("error", "Quantity cannot be negative");
                            req.setAttribute("products", StockDAO.readAll());
                            req.getRequestDispatcher("addStock.jsp").forward(req, res);
                            return;
                        }
                    } catch (NumberFormatException e) {
                        req.setAttribute("error", "Invalid quantity format");
                        req.setAttribute("products", StockDAO.readAll());
                        req.getRequestDispatcher("addStock.jsp").forward(req, res);
                        return;
                    }

                    LocalDate expiryDate;
                    try {
                        expiryDate = LocalDate.parse(expiryDateStr);
                    } catch (DateTimeParseException e) {
                        req.setAttribute("error", "Invalid expiry date format (expected: YYYY-MM-DD)");
                        req.setAttribute("products", StockDAO.readAll());
                        req.getRequestDispatcher("addStock.jsp").forward(req, res);
                        return;
                    }

                    Stock newProduct = new Stock(id, name, category, quantity, unit, expiryDate);
                    StockDAO.addProduct(newProduct);
                    res.sendRedirect("stock");
                    return;

                case UPDATE:
                    id = req.getParameter("id");
                    String soldQtyStr = req.getParameter("soldQty");
                    if (id == null || soldQtyStr == null || id.isEmpty() || soldQtyStr.isEmpty()) {
                        req.setAttribute("error", "ID and sold quantity are required");
                        break;
                    }

                    int soldQty;
                    try {
                        soldQty = Integer.parseInt(soldQtyStr);
                        if (soldQty < 0) {
                            req.setAttribute("error", "Sold quantity cannot be negative");
                            break;
                        }
                    } catch (NumberFormatException e) {
                        req.setAttribute("error", "Invalid sold quantity format");
                        break;
                    }

                    StockDAO.updateQuantity(id, soldQty);
                    req.setAttribute("message", "Stock updated successfully!");
                    break;

                case DELETE:
                    id = req.getParameter("id");
                    if (id == null || id.isEmpty()) {
                        req.setAttribute("error", "Product ID is required");
                        break;
                    }
                    StockDAO.deleteProduct(id);
                    req.setAttribute("message", "Product deleted successfully!");
                    break;

                case CHANGE_QTY:
                    id = req.getParameter("id");
                    String newQtyStr = req.getParameter("newQty");

                    if (id == null || newQtyStr == null || id.isEmpty() || newQtyStr.isEmpty()) {
                        req.setAttribute("error", "ID and new quantity are required");
                        displayStockTable(req, res);
                        return;
                    }

                    int newQty;
                    try {
                        newQty = Integer.parseInt(newQtyStr);
                        if (newQty < 0) {
                            req.setAttribute("error", "New quantity cannot be negative");
                            displayStockTable(req, res);
                            return;
                        }
                    } catch (NumberFormatException e) {
                        req.setAttribute("error", "Invalid quantity format");
                        displayStockTable(req, res);
                        return;
                    }

                    StockDAO.changeQuantity(id, newQty);
                    res.sendRedirect("stock");
                    return;
            }
        } catch (Exception e) {
            req.setAttribute("error", "Operation failed: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
            return;
        }

        displayStockTable(req, res);
    }
}
