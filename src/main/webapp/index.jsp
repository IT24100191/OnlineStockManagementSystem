<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inventory Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #dbe4ea 0%, #52ab98 100%);
            min-height: 100vh;
        }
        .container {
            max-width: 900px;
            margin: 40px auto;
            background: #fff;
            padding: 0;
            border-radius: 18px;
            box-shadow: 0 8px 32px rgba(43,103,119,0.10);
            overflow: hidden;
        }
        .hero {
            background: linear-gradient(90deg, #2b6777 60%, #52ab98 100%);
            color: #fff;
            padding: 40px 30px 30px 30px;
            text-align: center;
            position: relative;
        }
        .hero img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 50%;
            border: 6px solid #dbe4ea;
            margin-bottom: 18px;
            box-shadow: 0 4px 16px rgba(43,103,119,0.10);
        }
        .hero h1 {
            margin: 0 0 10px 0;
            font-size: 2.5rem;
            font-weight: 700;
            letter-spacing: 1px;
        }
        .hero p {
            font-size: 1.2rem;
            margin: 0 0 10px 0;
            color: #dbe4ea;
        }
        .menu {
            display: flex;
            justify-content: center;
            gap: 24px;
            padding: 32px 0 40px 0;
            background: #fff;
        }
        .menu a {
            display: inline-block;
            padding: 16px 36px;
            background: linear-gradient(90deg, #2b6777 60%, #52ab98 100%);
            color: #fff;
            font-size: 1.1rem;
            font-weight: 600;
            text-decoration: none;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(43,103,119,0.10);
            transition: background 0.2s, transform 0.2s;
        }
        .menu a:hover {
            background: linear-gradient(90deg, #52ab98 60%, #2b6777 100%);
            color: #2b6777;
            transform: translateY(-2px) scale(1.04);
        }
        @media (max-width: 600px) {
            .container { margin: 10px; }
            .hero h1 { font-size: 1.5rem; }
            .menu { flex-direction: column; gap: 16px; padding: 20px 0; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="hero">
            <img src="https://images.unsplash.com/photo-1521737852567-6949f3f9f2b5?auto=format&fit=facearea&w=256&q=80" alt="Inventory Hero" />
            <h1>Welcome to Inventory Management System</h1>
            <p>Efficiently manage your suppliers, products, and stock with a modern, easy-to-use interface.</p>
        </div>
        <div class="menu">
            <a href="${pageContext.request.contextPath}/SupplierServlet">Manage Suppliers</a>
            <!-- Add more menu items as needed -->
        </div>
    </div>
</body>
</html> 