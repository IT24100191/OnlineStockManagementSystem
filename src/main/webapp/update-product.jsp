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
    <form method="post" action="../ProductServlet" class="add-form">
      <input type="hidden" name="action" value="update" />
      <input type="hidden" name="id" value="P1001" />

      <div class="form-group">
        <label><i class="fas fa-box"></i> Product Name</label>
        <input type="text" name="name" value="Phone" required />
      </div>

      <div class="form-group">
        <label><i class="fas fa-dollar-sign"></i> Price</label>
        <input type="number" name="price" step="0.01" value="15000" required />
      </div>

      <div class="form-group">
        <label><i class="fas fa-layer-group"></i> Stock</label>
        <input type="number" name="stock" min="1" value="20" required />
      </div>

      <div class="form-group">
        <label><i class="fas fa-bell"></i> Stock Alert Limit</label>
        <input type="number" name="stock_low_limit" min="0" value="5" required />
      </div>

      <div class="form-group" id="electronicFields">
        <label><i class="fas fa-shield-alt"></i> Warranty (months)</label>
        <input type="number" name="warranty" value="12" />
      </div>

      <div class="form-group" id="foodFields" style="display:none;">
        <label><i class="fas fa-calendar-alt"></i> Expiry Date</label>
        <input type="text" name="expiry" placeholder="YYYY-MM-DD" value="${product.expiry}" />
      </div>

      <button type="submit"><i class="fas fa-save"></i> Update Product</button>
    </form>
  </div>
</div>

<script>
  function toggleFields(type) {
    document.getElementById("electronicFields").style.display = type === "Electronic" ? "block" : "none";
    document.getElementById("foodFields").style.display = type === "Food" ? "block" : "none";
  }
  
  // document.querySelector("select[name='type']").addEventListener("change", function() {
  //   toggleFields(this.value);
  // });
  
  // toggleFields("${product.type}");
</script>
<script src="./js/main.js"></script>
</body>
</html>
