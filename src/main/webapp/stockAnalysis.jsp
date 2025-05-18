<%@ page import="com.stockmanagement.model.Stock" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Stock Analysis</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 20px;
            background-color: #f4f6f9;
            color: #333;
        }
        .container {
            width: 90%;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        h3 {
            color: #34495e;
            margin-top: 15px;
            margin-bottom: 10px;
            font-size: 1.1em;
        }
        ul {
            list-style-type: disc;
            margin-left: 20px;
            padding-left: 0;
            margin-bottom: 15px;
        }
        li {
            padding: 5px 0;
            font-size: 0.95em;
            color: #2c3e50;
        }
        .no-products {
            color: #7f8c8d;
            font-style: italic;
            padding: 10px 0;
        }
        .stats {
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .back-link {
            display: block;
            text-align: center;
            padding: 10px 20px;
            background-color: #2ecc71;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .back-link:hover {
            background-color: #27ae60;
        }
        .error {
            text-align: center;
            color: #e74c3c;
            font-weight: bold;
            margin: 10px 0;
        }
        @media (max-width: 600px) {
            h2 {
                font-size: 1.5em;
            }
            h3 {
                font-size: 1em;
            }
            .stats {
                padding: 10px;
            }
            .back-link {
                width: 100%;
                box-sizing: border-box;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Stock Analysis</h2>

    <%
        List<Stock> sortedProducts = (List<Stock>) request.getAttribute("sortedProducts");
        if (sortedProducts == null) {
    %>
    <p class="error">Error: Unable to load products for analysis.</p>
    <%
    } else {
    %>
    <div class="stats">
        <h3>Total Products: <%= request.getAttribute("total") != null ? request.getAttribute("total") : 0 %></h3>

        <h3>Low Stock Products (<%= request.getAttribute("lowStock") != null ? request.getAttribute("lowStock") : 0 %>):</h3>
        <ul>
            <%
                if (!sortedProducts.isEmpty()) {
                    boolean hasLowStock = false;
                    for (Stock p : sortedProducts) {
                        if (p.getQuantity() < 10) {
                            hasLowStock = true;
            %>
            <li><%= p.getName() %> - Quantity: <%= p.getQuantity() %></li>
            <%
                    }
                }
                if (!hasLowStock) {
            %>
            <li class="no-products">No low stock products (quantity < 10).</li>
            <%
                }
            } else {
            %>
            <li class="no-products">No products available for analysis.</li>
            <%
                }
            %>
        </ul>

        <h3>Expiring Soon (<%= request.getAttribute("expiringSoon") != null ? request.getAttribute("expiringSoon") : 0 %>):</h3>
        <ul>
            <%
                if (!sortedProducts.isEmpty()) {
                    boolean hasExpiringSoon = false;
                    for (Stock p : sortedProducts) {
                        if (p.getExpiryDate() != null && p.getExpiryDate().isBefore(LocalDate.now().plusDays(30))) {
                            hasExpiringSoon = true;
            %>
            <li><%= p.getName() %> - Expiry Date: <%= p.getExpiryDate() %></li>
            <%
                    }
                }
                if (!hasExpiringSoon) {
            %>
            <li class="no-products">No products expiring within 30 days.</li>
            <%
                }
            } else {
            %>
            <li class="no-products">No products available for analysis.</li>
            <%
                }
            %>
        </ul>
    </div>
    <%
        }
    %>

    <a class="back-link" href="stock">Back to Stock Table</a>
</div>
</body>
</html>
