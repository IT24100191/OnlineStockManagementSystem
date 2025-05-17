
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.stockmanagement.model.Sale" %>
<%@ page import="java.util.List" %>
<%
    List<Sale> sales = (List<Sale>) request.getAttribute("sales");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sales Records</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            padding: 30px;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .add-link {
            text-align: right;
            margin-bottom: 15px;
        }

        .add-link a {
            background: #28a745;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .add-link a:hover {
            background: #1c7c31;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background: #f9f9f9;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

        .edit-btn {
            background-color: #17a2b8;
        }

        .edit-btn:hover {
            background-color: #117a8b;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .delete-btn:hover {
            background-color: #a71d2a;
        }

        .no-data {
            text-align: center;
            padding: 20px;
            color: #888;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Sales Records</h2>

    <div class="add-link">
        <a href="Addsale.jsp">+ Add Sale</a>
    </div>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Product</th>
            <th>Qty</th>
            <th>Price</th>
            <th>Total</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (sales != null && !sales.isEmpty()) {
                for (Sale s : sales) {
        %>
        <tr>
            <td><%= s.getId() %></td>
            <td><%= s.getProductName() %></td>
            <td><%= s.getQuantity() %></td>
            <td><%= s.getPrice() %></td>
            <td><%= s.getQuantity() * s.getPrice() %></td>
            <td>
                <form action="sales" method="get" style="display:inline;">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="id" value="<%= s.getId() %>">
                    <button type="submit" class="btn edit-btn">Edit</button>
                </form>
                <form action="sales" method="post" style="display:inline;" onsubmit="return confirm('Delete this sale?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= s.getId() %>">
                    <button type="submit" class="btn delete-btn">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr><td colspan="6" class="no-data">No sales found.</td></tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
