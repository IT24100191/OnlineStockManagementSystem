<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="css/home.css">
</head>
<body>
<header class="page-header">
    <h1 class="page-title"><%= "Welcome!" %></h1>
    <div class="nav-links">
        <a href="products" class="nav-link">Product Management</a>
        <a href="categories/view" class="nav-link">Category Management</a>
        <a href="stock" class="nav-link">Stock Management</a>
        <a href="sales" class="nav-link">Sales Management</a>
    </div>
</header>
</body>
</html>