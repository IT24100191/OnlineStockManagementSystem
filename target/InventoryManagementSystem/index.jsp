<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Stock Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #ECE9DF;
            min-height: 100vh;
        }
        .container {
            max-width: 900px;
            margin: 40px auto;
            background: #F5F3ED;
            padding: 0;
            border-radius: 18px;
            box-shadow: 0 8px 32px rgba(34,41,54,0.10);
            overflow: hidden;
        }
        .hero {
            background: linear-gradient(90deg, #232B38 60%, #A48C6B 100%);
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
            border: 6px solid #E1E5C5;
            margin-bottom: 18px;
            box-shadow: 0 4px 16px rgba(34,41,54,0.10);
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
            color: #ECE9DF;
        }
        .menu {
            display: flex;
            justify-content: center;
            gap: 24px;
            padding: 32px 0 40px 0;
            background: #F5F3ED;
        }
        .menu a {
            display: inline-block;
            padding: 16px 36px;
            background: #E2B44A;
            color: #232B38;
            font-size: 1.1rem;
            font-weight: 600;
            text-decoration: none;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(34,41,54,0.10);
            transition: background 0.2s, transform 0.2s;
        }
        .menu a:hover {
            background: #A48C6B;
            color: #fff;
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
            <h1>Welcome to Online Stock Management System</h1>
            <p>Efficiently manage your suppliers, products, and stock with a modern, easy-to-use interface.</p>
        </div>
        <div class="menu">
            <a href="${pageContext.request.contextPath}/SupplierServlet">Manage Suppliers</a>
            <!-- Add more menu items as needed -->
        </div>
    </div>
</body>
</html> 