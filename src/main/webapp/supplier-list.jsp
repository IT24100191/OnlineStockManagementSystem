<%@ page import="com.stockmanagement.model.Supplier" %>
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
            background: #ECE9DF;
            min-height: 100vh;
        }
        .container {
            max-width: 1000px;
            margin: 40px auto;
            background: #F5F3ED;
            padding: 30px 24px 24px 24px;
            border-radius: 18px;
            box-shadow: 0 8px 32px rgba(34,41,54,0.10);
        }
        h1 {
            color: #232B38;
            text-align: center;
            margin-bottom: 24px;
        }
        .flex-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            flex-wrap: wrap;
            gap: 12px;
        }
        .add-button {
            display: inline-block;
            padding: 12px 28px;
            background: #232B38;
            color: #fff;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 1rem;
            transition: background 0.2s, color 0.2s, transform 0.2s;
            border: none;
            box-shadow: 0 2px 8px rgba(34,41,54,0.10);
        }
        .add-button:hover {
            background: #E2B44A;
            color: #232B38;
            transform: translateY(-2px) scale(1.04);
        }
        .search-form {
            display: flex;
            align-items: center;
            gap: 8px;
            margin: 0;
            position: relative;
        }
        .search-form input[type="text"] {
            padding: 10px;
            width: 260px;
            border-radius: 6px;
            border: 1px solid #A48C6B;
            font-size: 1rem;
            color: #232B38;
            background: #ECE9DF;
            transition: border 0.2s;
        }
        .search-form input[type="text"]:focus {
            border: 1.5px solid #232B38;
            outline: none;
        }
        .search-form button {
            padding: 10px 18px;
            border-radius: 6px;
            border: none;
            background: #E2B44A;
            color: #232B38;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.2s;
        }
        .search-form button:hover {
            background: #A48C6B;
            color: #fff;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: #F5F3ED;
        }
        th, td {
            padding: 14px 10px;
            text-align: left;
            border-bottom: 1px solid #ECE9DF;
        }
        th {
            background-color: #7B818A;
            color: #fff;
            font-weight: 700;
        }
        tr:hover {
            background-color: #ECE9DF;
        }
        .action-link {
            color: #232B38;
            text-decoration: none;
            margin-right: 10px;
            font-weight: 600;
            transition: color 0.2s;
        }
        .action-link:hover {
            color: #E2B44A;
        }
        .action-link.delete {
            color: #b23a48;
        }
        .action-link.delete:hover {
            color: #232B38;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Supplier List</h1>
        <div class="flex-bar">
            <a href="SupplierServlet?action=new" class="add-button">Add New Supplier</a>
            <form method="get" action="SupplierServlet" class="search-form">
                <input type="text" name="search" placeholder="Search by supplier name..." value="<%= request.getAttribute("search") != null ? request.getAttribute("search") : "" %>">
                <button type="submit">Search</button>
            </form>
        </div>
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