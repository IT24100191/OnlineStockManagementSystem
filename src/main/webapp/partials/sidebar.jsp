<%--
  Created by IntelliJ IDEA.
  User: Binari Jayasinghe
  Date: 5/4/2025
  Time: 5:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="side-bar">
  <div class="menu">
    <div class="menu-heading">Inventory System</div>

    <div class="item">
      <a class="sub-btn"><span>Product Management</span><div class="dropdown"></div></a>
      <div class="sub-menu">
        <a href="products">Products</a>
      </div>
    </div>

    <div class="item">
      <a class="sub-btn"><span>Category Management</span><div class="dropdown"></div></a>
      <div class="sub-menu">
        <a href="categories/view">Categories</a>
      </div>
    </div>
    <div class="item">
      <a class="sub-btn"><span>Stock Management</span><div class="dropdown"></div></a>
      <div class="sub-menu">
        <a href="stock">Stock Records</a>
      </div>
    </div>

    <div class="item">
      <a class="sub-btn"><span>Sales Management</span><div class="dropdown"></div></a>
      <div class="sub-menu">
        <a href="sales">Sale Records</a>
      </div>
    </div>
  </div>
</div>