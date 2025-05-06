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
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #dbe4ea 0%, #52ab98 100%);
            min-height: 100vh;
        }
        .container {
            max-width: 1000px;
            margin: 40px auto;
            background: #fff;
            padding: 30px 24px 24px 24px;
            border-radius: 18px;
            box-shadow: 0 8px 32px rgba(43,103,119,0.10);
        }
        h1 {
            color: #2b6777;
            text-align: center;
            margin-bottom: 24px;
        }
        .add-button {
            display: inline-block;
            padding: 12px 28px;
            background: linear-gradient(90deg, #2b6777 60%, #52ab98 100%);
            color: #fff;
            text-decoration: none;
            border-radius: 8px;
            margin-bottom: 24px;
            font-weight: 600;
            font-size: 1rem;
            transition: background 0.2s, color 0.2s, transform 0.2s;
        }
        .add-button:hover {
            background: linear-gradient(90deg, #52ab98 60%, #2b6777 100%);
            color: #2b6777;
            transform: translateY(-2px) scale(1.04);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: #fff;
        }
        th, td {
            padding: 14px 10px;
            text-align: left;
            border-bottom: 1px solid #dbe4ea;
        }
        th {
            background-color: #f2f2f2;
            color: #2b6777;
            font-weight: 700;
        }
        tr:hover {
            background-color: #dbe4ea;
        }
        .action-link {
            color: #2b6777;
            text-decoration: none;
            margin-right: 10px;
            font-weight: 600;
            transition: color 0.2s;
        }
        .action-link:hover {
            color: #52ab98;
        }
        .action-link.delete {
            color: #f44336;
        }
        .action-link.delete:hover {
            color: #2b6777;
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