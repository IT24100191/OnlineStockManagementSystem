<%--
  Created by IntelliJ IDEA.
  User: sanuja
  Date: 5/13/2025
  Time: 10:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Product Dashboard</title>
    <link rel="stylesheet" href="./css/list-products.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  </head>
  <body>

  <%@include file="partials/sidebar.jsp"%>

  <div class="container">
    <%@include file="partials/navbar.jsp"%>

    <div class="content-container">
      <div class="add-btn-wrapper">
        <a href="${pageContext.request.contextPath}/add-product.jsp" class="add-btn">
          <i class="fas fa-plus-circle"></i> Add New Product
        </a>
      </div>
      <h2><i class="fas fa-boxes-stacked"></i> Product Dashboard</h2>

      <div class="dashboard-cards">
        <div class="card">
          <i class="fas fa-cube"></i>
          <div>
            <h3>Product Count</h3>
            <p>2</p>
          </div>
        </div>
        <div class="card">
          <i class="fas fa-coins"></i>
          <div>
            <h3>Inventory Value</h3>
            <p>Rs. 17,000</p>
          </div>
        </div>
        <div class="card">
          <i class="fas fa-triangle-exclamation"></i>
          <div>
            <h3>Out of Stock</h3>
            <p>0</p>
          </div>
        </div>
      </div>

      <!-- Search Form -->
      <form method="get" action="products" class="search-form">
        <input type="text" name="search" placeholder="Search by product name..." />
        <button type="submit"><i class="fas fa-search"></i> Search</button>
      </form>

      <!-- Product Table -->
      <form method="post" action="products">
        <input type="hidden" name="action" value="delete" />
        <table>
          <thead>
          <tr>
            <th>Select</th><th>ID</th><th>Name</th><th>Price</th><th>Type</th><th>Actions</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="temp" items="${products}">
            <tr>
              <td><input type="checkbox" name="selected"/></td>
              <td>${temp.getId()}</td>
              <td>${temp.getName()}</td>
              <td>Rs. ${temp.getPrice()}</td>
              <td>${temp.getCategory()}</td>
              <td><a href="update-product.jsp"><i class="fas fa-pen"></i> Edit</a></td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
        <button type="submit"><i class="fas fa-trash"></i> Delete Selected</button>
      </form>
    </div>
  </div>
  <script src="./js/main.js"></script>
  </body>
</html>
