<%--
  Created by IntelliJ IDEA.
  User: sanuja
  Date: 5/13/2025
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="./css/add-product.css"> <!-- Reuse same CSS for consistency -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <title>Update Product</title>
</head>
<body>

<%@include file="partials/sidebar.jsp"%>

<div class="container">
  <%@include file="partials/navbar.jsp"%>

  <div class="content-container">
    <form method="post" action="products?action=update-product" class="add-form">

      <div class="form-group">
        <label><i class="fas fa-box"></i> Product Id</label>
        <input type="text" name="product-id" value="${product.getId()}" required />
      </div>

      <div class="form-group">
        <label><i class="fas fa-box"></i> Product Name</label>
        <input type="text" name="name" value="${product.getName()}" required />
      </div>

      <div class="form-group">
        <label>Category</label>
        <select name="category">
          <option value="Electronics">Electronics</option>
          <option value="Clothing">Clothing</option>
        </select>
      </div>

      <div class="form-group">
        <label><i class="fas fa-dollar-sign"></i> Price</label>
        <input type="number" name="price" step="0.01" value="${product.getPrice()}" required />
      </div>

      <div class="form-group">
        <label><i class="fas fa-layer-group"></i> Stock</label>
        <input type="number" name="quantity" min="1" value="${product.getQuantity()}" required />
      </div>

      <div class="form-group">
        <label><i class="fas fa-bell"></i> Stock Alert Limit</label>
        <input type="number" name="stock-alert-limit" min="0" value="${product.getStockAlertLimit()}" required />
      </div>

      <button type="submit"><i class="fas fa-save"></i> Update Product</button>
    </form>
  </div>
</div>
<script src="./js/main.js"></script>
</body>
</html>
