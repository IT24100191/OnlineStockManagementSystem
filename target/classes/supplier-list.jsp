<%@ page import="model.Supplier" %>
<%@ page import="java.util.List" %>
<%
    List<Supplier> supplierList = (List<Supplier>) request.getAttribute("supplierList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Supplier List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .add-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .action-link {
            color: #2196F3;
            text-decoration: none;
            margin-right: 10px;
        }
        .action-link.delete {
            color: #f44336;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Supplier List</h1>
        <a href="SupplierServlet?action=new" class="add-button">Add New Supplier</a>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
            <% for (Supplier supplier : supplierList) { %>
            <tr>
                <td><%= supplier.getId() %></td>
                <td><%= supplier.getName() %></td>
                <td><%= supplier.getEmail() %></td>
                <td><%= supplier.getPhone() %></td>
                <td>
                    <a href="SupplierServlet?action=edit&id=<%= supplier.getId() %>" class="action-link">Edit</a>
                    <a href="SupplierServlet?action=delete&id=<%= supplier.getId() %>" 
                       class="action-link delete" 
                       onclick="return confirm('Are you sure you want to delete this supplier?')">Delete</a>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>