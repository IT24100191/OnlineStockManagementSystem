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
        <a href="products?action=add-product" class="add-btn">
          <i class="fas fa-plus-circle"></i> Add New Product
        </a>
      </div>
      <h2><i class="fas fa-boxes-stacked"></i> Product Dashboard</h2>

      <div class="dashboard-cards">
        <div class="card">
          <i class="fas fa-cube"></i>
          <div>
            <h3>Product Count</h3>
            <p>${productCount}</p>
          </div>
        </div>
      </div>

      <!-- Search Form -->
      <div class="search-form">
        <input type="text" name="search" id="productSearch" placeholder="Search by product name..." />
      </div>

      <c:choose>
        <c:when test="${not empty products}">
      <!-- Recently Added Products Section -->
      <div class="recent-products-section">
        <h3><i class="fas fa-clock-rotate-left"></i> Recently Added Products</h3>
        <table class="recent-products-table">
          <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Type</th>
            <th>Expiry Date</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="recent" items="${recentProducts}">
            <tr>
              <td>${recent.getId()}</td>
              <td>${recent.getName()}</td>
              <td>Rs. ${recent.getPrice()}</td>
              <td>${recent.getCategory()}</td>
              <td>${recent.getExpiryDate()}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>

      <!-- Product Table -->
      <form method="post" action="products?action=delete-product">
        <input type="hidden" name="action" value="delete" />
        <table>
          <thead>
          <tr>
            <th>Select</th>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Type</th>
            <th><a href="products?sortBy=${sortBy eq 'asc' ? 'desc' : 'asc'}">
              Expiry Date
              <i class="fas ${sortBy eq 'asc' ? 'fa-sort-up' : 'fa-sort-down'}"></i>
            </a>

            </th>
            <th>Actions</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="temp" items="${products}">
            <tr>
              <td><input type="checkbox" name="product-ids" value="${temp.getId()}"/></td>
              <td>${temp.getId()}</td>
              <td>${temp.getName()}</td>
              <td>Rs. ${temp.getPrice()}</td>
              <td>${temp.getCategory()}</td>
              <td>${temp.getExpiryDate()}</td>
              <td><a href="products?action=update-product&id=${temp.getId()}"><i class="fas fa-pen"></i> Edit</a></td>
            </tr>
          </c:forEach>
          <tr id="noResultsMessageRow" style="display: none;">
            <td colspan="7" class="no-results-message">No search results found.</td>
          </tr>
          </tbody>
        </table>
        <button type="submit"><i class="fas fa-trash"></i> Delete Selected</button>
      </form>

      <form method="post" action="products">
        <input type="hidden" name="action" value="undo-delete-product" />
        <button type="submit" class="undo-btn">
          <i class="fas fa-rotate-left"></i> Undo Last Delete
        </button>
      </form>

    </div>
    </c:when>
    <c:otherwise>
      <div>
        <p style="margin-left: 50px"><strong>No Products in the inventory</strong></p>
      </div>
    </c:otherwise>
    </c:choose>
  </div>
  <script src="./js/main.js"></script>
  <script src="./js/products.js"></script>
  </body>
</html>
