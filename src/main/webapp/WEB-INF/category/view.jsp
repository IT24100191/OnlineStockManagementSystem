<%--
  Created by IntelliJ IDEA.
  User: KALANA
  Date: 5/12/2025
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Category Details</title>
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
      background-color: #f5f7ff;
      color: var(--dark-color);
      line-height: 1.6;
      padding: 2rem;
      margin: 0;
    }

    .container {
      max-width: 800px;
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
      padding: 1.5rem;
      text-align: center;
    }

    .header h1 {
      font-weight: 600;
      font-size: 1.8rem;
      margin: 0;
    }

    .content {
      padding: 2rem;
    }

    .detail-container {
      background-color:  #cad2f3;
      border-radius: var(--border-radius);
      padding: 1.5rem;
      margin-bottom: 2rem;
    }

    .detail-item {
      display: flex;
      margin-bottom: 1rem;
      padding-bottom: 1rem;
      border-bottom: 1px solid #e9ecef;
    }

    .detail-item:last-child {
      border-bottom: none;
      margin-bottom: 0;
      padding-bottom: 0;
    }

    .detail-label {
      font-weight: 600;
      color: #495057;
      min-width: 120px;
    }

    .detail-value {
      flex: 1;
      color: var(--dark-color);
    }

    .action-links {
      display: flex;
      gap: 1rem;
      margin-top: 1.5rem;
      flex-wrap: wrap;
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

    .btn-edit {
      background-color: var(--primary-color);
      color: white;
    }

    .btn-edit:hover {
      background-color: var(--primary-hover);
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(67, 97, 238, 0.2);
    }

    .btn-delete{
      background-color: var(--danger-color);
      color: white;
    }

    .btn-delete:hover{
      background-color: #db2777;
    }

    .btn-back {
      background-color: var(--secondary-color);
      color: white;
    }

    .btn-back:hover {
      background-color: #5a6268;
    }

    .not-found {
      text-align: center;
      padding: 2rem;
      color: var(--secondary-color);
    }

    .not-found i {
      font-size: 3rem;
      margin-bottom: 1rem;
      color: #e0e0e0;
    }

    .not-found p {
      font-size: 1.1rem;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <h1>Category Details</h1>
  </div>

  <div class="content">
    <%
      com.stockmanagement.model.Category category =
              (com.stockmanagement.model.Category) request.getAttribute("category");
      if (category == null) {
    %>
    <div class="not-found">
      <i class="fas fa-exclamation-triangle"></i>
      <p>Category not found</p>
    </div>
    <% } else { %>
    <div class="detail-container">
      <div class="detail-item">
        <span class="detail-label">ID:</span>
        <span class="detail-value"><%= category.getId() %></span>
      </div>
      <div class="detail-item">
        <span class="detail-label">Name:</span>
        <span class="detail-value"><%= category.getName() %></span>
      </div>
      <div class="detail-item">
        <span class="detail-label">Description:</span>
        <span class="detail-value"><%= category.getDescription() != null ? category.getDescription() : "No description" %></span>
      </div>
    </div>

    <div class="action-links">
      <a href="<%= request.getContextPath() %>/categories/edit?id=<%= category.getId() %>" class="btn btn-edit">
        <i class="fas fa-edit"></i> Edit Category
      </a>
      <form action="<%= request.getContextPath() %>/categories/delete" method="post"
            style="display: inline-block;"
            onsubmit="return confirm('Are you sure you want to delete this category?');">
        <input type="hidden" name="id" value="<%= category.getId() %>">
        <button type="submit" class="btn btn-delete">
          <i class="fas fa-trash-alt"></i> Delete Category
        </button>
      </form>
      <a href="<%= request.getContextPath() %>/categories" class="btn btn-back">
        <i class="fas fa-arrow-left"></i> Back to List
      </a>
    </div>
    <% } %>
  </div>
</div>
</body>
</html>