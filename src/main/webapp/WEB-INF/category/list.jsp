<%--
  Created by IntelliJ IDEA.
  User: KALANA
  Date: 5/12/2025
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.stockmanagement.model.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  List<Category> categories = (List<Category>) request.getAttribute("categories");
  String message = (String) request.getAttribute("message");
  String error = (String) request.getAttribute("error");
  String searchQuery = request.getParameter("search") != null ? request.getParameter("search") : "";
%>

<html>
<head>
  <title>Category Management</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #4361ee;
      --primary-hover: #3a56d4;
      --secondary-color: #6c757d;
      --success-color: #4cc9f0;
      --danger-color: #f72585;
      --light-color: #f8f9fa;
      --dark-color: #212529;
      --border-radius: 8px;
      --box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
      --transition: all 0.3s ease;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background-color: #cad2f3;
      color: var(--dark-color);
      line-height: 1.6;
      padding: 2rem;
      margin: 0;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      background: white;
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
      overflow: hidden;
      animation: fadeIn 0.5s ease;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .header {
      background: linear-gradient(135deg, var(--primary-color), #3f37c9);
      color: white;
      padding: 1.5rem 2rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
      gap: 1rem;
    }

    .header h1 {
      font-weight: 600;
      font-size: 1.8rem;
      margin: 0;
    }

    .content {
      padding: 2rem;
    }

    .alert {
      padding: 1rem;
      border-radius: var(--border-radius);
      margin-bottom: 1.5rem;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .alert-success {
      background-color: #f0fdf4;
      color: #166534;
      border-left: 4px solid #22c55e;
    }

    .alert-error {
      background-color: #fff5f5;
      color: var(--danger-color);
      border-left: 4px solid var(--danger-color);
    }

    .search-add-container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
      gap: 1rem;
      margin-bottom: 1.5rem;
    }

    .search-bar {
      position: relative;
      flex-grow: 1;
      max-width: 400px;
    }

    .search-bar input {
      width: 100%;
      padding: 0.8rem 1rem 0.8rem 2.5rem;
      border: 1px solid #e0e0e0;
      border-radius: var(--border-radius);
      font-family: 'Poppins', sans-serif;
      font-size: 1rem;
      transition: var(--transition);
    }

    .search-bar input:focus {
      outline: none;
      border-color: var(--primary-color);
      box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
    }

    .search-bar i {
      position: absolute;
      left: 1rem;
      top: 50%;
      transform: translateY(-50%);
      color: var(--secondary-color);
    }

    .btn {
      padding: 0.8rem 1.5rem;
      border: none;
      border-radius: var(--border-radius);
      font-family: 'Poppins', sans-serif;
      font-weight: 500;
      font-size: 1rem;
      cursor: pointer;
      transition: var(--transition);
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
      text-decoration: none;
    }

    .btn-primary {
      background-color: var(--primary-color);
      color: white;
    }

    .btn-primary:hover {
      background-color: var(--primary-hover);
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(67, 97, 238, 0.2);
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 1.5rem;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
    }

    th {
      background-color: #f8f9fa;
      color: #495057;
      font-weight: 600;
      text-align: left;
      padding: 1rem;
      border-bottom: 2px solid #e9ecef;
    }

    td {
      padding: 1rem;
      border-bottom: 1px solid #e9ecef;
      vertical-align: middle;
    }

    tr:hover {
      background-color: #f8f9fa;
    }

    .action-btns {
      display: flex;
      gap: 0.5rem;
    }

    .btn-sm {
      padding: 0.5rem 0.8rem;
      font-size: 0.875rem;
    }

    .btn-info {
      background-color: #3b82f6;
      color: white;
    }

    .btn-info:hover {
      background-color: #2563eb;
    }

    .btn-warning {
      background-color: #f59e0b;
      color: white;
    }

    .btn-warning:hover {
      background-color: #d97706;
    }

    .btn-danger {
      background-color: var(--danger-color);
      color: white;
    }

    .btn-danger:hover {
      background-color: #db2777;
    }

    .empty-state{
      text-align: center;
      padding: 2rem;
      color: var(--secondary-color);
    }

    .empty-state i{
      font-size: 3rem;
      margin-bottom: 1rem;
      color: #e0e0e0;
    }

    .empty-state p{
      font-size: 1.1rem;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <h1>Category Management</h1>
    <div class="search-add-container">
      <form action="<%= request.getContextPath() %>/categories" method="get" class="search-bar">
        <i class="fas fa-search"></i>
        <input type="text" name="search" placeholder="Search categories..." value="<%= searchQuery %>">
      </form>
      <a href="<%= request.getContextPath() %>/categories/add" class="btn btn-primary">
        <i class="fas fa-plus"></i> Add New Category
      </a>
    </div>
  </div>

  <div class="content">
    <% if (message != null) { %>
    <div class="alert alert-success">
      <i class="fas fa-check-circle"></i> <%= message %>
    </div>
    <% } %>

    <% if (error != null) { %>
    <div class="alert alert-error">
      <i class="fas fa-exclamation-circle"></i> <%= error %>
    </div>
    <% } %>

    <table>
      <thead>
      <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <% if (categories == null || categories.isEmpty()) { %>
      <tr>
        <td colspan="3" class="empty-state">
          <i class="fas fa-box-open"></i>
          <p>No categories found</p>
        </td>
      </tr>
      <% } else {
        for (Category category : categories) {
      %>
      <tr>
        <td><%= category.getName() %></td>
        <td><%= category.getDescription() != null ? category.getDescription() : "-" %></td>
        <td class="action-btns">
          <a href="<%= request.getContextPath() %>/categories/view?id=<%= category.getId() %>" class="btn btn-info btn-sm">
            <i class="fas fa-eye"></i> View
          </a>
          <a href="<%= request.getContextPath() %>/categories/edit?id=<%= category.getId() %>" class="btn btn-warning btn-sm">
            <i class="fas fa-edit"></i> Edit
          </a>
          <form action="<%= request.getContextPath() %>/categories/delete" method="post" style="display:inline;"
                onsubmit="return confirm('Are you sure you want to delete this category?');">
            <input type="hidden" name="id" value="<%= category.getId() %>">
            <button type="submit" class="btn btn-danger btn-sm">
              <i class="fas fa-trash-alt"></i> Delete
            </button>
          </form>
        </td>
      </tr>
      <% } } %>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>