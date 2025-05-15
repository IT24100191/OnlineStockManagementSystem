<%@ page import="model.Product" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Stock Levels</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 20px;
            background-color: #f4f6f9;
            color: #333;
        }
        .container {
            width: 90%;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #2c3e50;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #3498db;
            color: white;
            text-transform: uppercase;
            font-size: 0.9em;
            letter-spacing: 1px;
        }
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        tr:hover {
            background-color: #e9ecef;
            transition: background-color 0.3s;
        }
        td {
            font-size: 0.95em;
        }
        form {
            display: inline;
            margin: 0;
        }
        button {
            padding: 6px 12px;
            margin-right: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9em;
            transition: background-color 0.3s;
        }
        button.action-btn-remove {
            background-color: #e74c3c;
            color: white;
        }
        button.action-btn-remove:hover {
            background-color: #c0392b;
        }
        button.action-btn-update {
            background-color: #3498db;
            color: white;
        }
        button.action-btn-update:hover {
            background-color: #2980b9;
        }
        input[type="number"] {
            padding: 6px;
            width: 60px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 0.9em;
        }
        .no-products {
            text-align: center;
            padding: 20px;
            color: #7f8c8d;
            font-style: italic;
        }
        .links {
            text-align: center;
            margin-top: 15px;
        }
        a {
            display: inline-block;
            padding: 10px 20px;
            margin: 0 5px;
            background-color: #2ecc71;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #27ae60;
        }
        @media (max-width: 600px) {
            table {
                display: block;
                overflow-x: auto;
            }
            th, td {
                min-width: 120px;
            }
            a {
                display: block;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Stock Level Table</h2>
    <table>
        <tr>
            <th>ID</th><th>Name</th><th>Category</th><th>Quantity</th><th>Unit</th><th>Expiry Date</th><th>Actions</th>
        </tr>
        <%
            List<model.Product> products = (List<model.Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (model.Product p : products) {
        %>
        <tr>
            <td><%= p.getId() != null ? p.getId() : "" %></td>
            <td><%= p.getName() != null ? p.getName() : "" %></td>
            <td><%= p.getCategory() != null ? p.getCategory() : "" %></td>
            <td><%= p.getQuantity() >= 0 ? p.getQuantity() : 0 %></td>
            <td><%= p.getUnit() != null ? p.getUnit() : "" %></td>
            <td><%= p.getExpiryDate() != null ? p.getExpiryDate() : "" %></td>
            <td>
                <form action="stock" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= p.getId() != null ? p.getId() : "" %>">
                    <button type="submit" class="action-btn-remove">Remove</button>
                </form>
                <form action="stock" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="CHANGE_QTY">
                    <input type="hidden" name="id" value="<%= p.getId() != null ? p.getId() : "" %>">
                    <input type="number" name="newQty" value="<%= p.getQuantity() >= 0 ? p.getQuantity() : 0 %>" required min="0">
                    <button type="submit" class="action-btn-update">Update</button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="7" class="no-products">No products available.</td>
        </tr>
        <%
            }
        %>
    </table>
    <div class="links">
        <a href="addStock.jsp">Add Stock</a>
        <a href="stock?action=analysis">Go to Stock Analysis</a>

    </div>
</div>
</body>
</html>