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
  <title>Add New Category</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
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
      background-color:  #cad2f3;
      color: var(--dark-color);
      line-height: 1.6;
      padding: 0;
      margin: 0;
    }

    .container {
      max-width: 600px;
      margin: 2rem auto;
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
    }

    .content {
      padding: 2rem;
    }

    .alert-error {
      background-color: #fff5f5;
      color: var(--danger-color);
      padding: 1rem;
      border-radius: var(--border-radius);
      margin-bottom: 1.5rem;
      border-left: 4px solid var(--danger-color);
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .alert-error:before {
      content: "!";
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 20px;
      height: 20px;
      background-color: var(--danger-color);
      color: white;
      border-radius: 50%;
      font-weight: bold;
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    .form-group label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 500;
      color: #495057;
    }

    .form-control {
      width: 100%;
      padding: 0.8rem 1rem;
      border: 1px solid #e0e0e0;
      border-radius: var(--border-radius);
      font-family: 'Poppins', sans-serif;
      font-size: 1rem;
      transition: var(--transition);
    }

    .form-control:focus {
      outline: none;
      border-color: var(--primary-color);
      box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
    }

    textarea.form-control {
      min-height: 120px;
      resize: vertical;
    }

    .btn-group {
      display: flex;
      gap: 1rem;
      margin-top: 2rem;
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

    .btn-secondary {
      background-color: white;
      color: var(--secondary-color);
      border: 1px solid #e0e0e0;
    }

    .btn-secondary:hover {
      background-color: #f8f9fa;
      border-color: #d1d5db;
    }

    .required-field:after {
      content: " *";
      color: var(--danger-color);
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <h1>Add New Category</h1>
  </div>

  <div class="content">
    <c:if test="${not empty error}">
      <div class="alert-error">
          ${error}
      </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/categories/add" method="post">
      <div class="form-group">
        <label for="name" class="required-field">Category Name</label>
        <input type="text" id="name" name="name" class="form-control" required>
      </div>

      <div class="form-group">
        <label for="description">Description</label>
        <textarea id="description" name="description" class="form-control"></textarea>
      </div>

      <div class="btn-group">
        <button type="submit" class="btn btn-primary">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
          </svg>
          Save Category
        </button>
        <a href="${pageContext.request.contextPath}/categories" class="btn btn-secondary">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
          </svg>
          Cancel
        </a>
      </div>
    </form>
  </div>
</div>
</body>
</html>