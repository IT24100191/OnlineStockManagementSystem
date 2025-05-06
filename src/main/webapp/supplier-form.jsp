<%@ page import="model.Supplier" %>
<%
    Supplier supplier = (Supplier) request.getAttribute("supplier");
    if (supplier == null) {
        supplier = new Supplier(0, "", "", "");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= supplier.getId() == 0 ? "Add New" : "Edit" %> Supplier</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #dbe4ea 0%, #52ab98 100%);
            min-height: 100vh;
        }
        .container {
            max-width: 600px;
            margin: 40px auto;
            background: #fff;
            padding: 30px 24px 24px 24px;
            border-radius: 18px;
            box-shadow: 0 8px 32px rgba(43,103,119,0.10);
        }
        h1 {
            color: #2b6777;
            text-align: center;
            margin-bottom: 24px;
        }
        .form-group {
            margin-bottom: 18px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            color: #2b6777;
            font-weight: 600;
        }
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #dbe4ea;
            border-radius: 6px;
            box-sizing: border-box;
            background: #f2f2f2;
            color: #2b6777;
            font-size: 1rem;
        }
        .button-group {
            margin-top: 24px;
            text-align: center;
        }
        .button {
            padding: 10px 28px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            margin: 0 8px;
            font-weight: 600;
            transition: background 0.2s, color 0.2s, transform 0.2s;
        }
        .save-button {
            background: linear-gradient(90deg, #2b6777 60%, #52ab98 100%);
            color: #fff;
        }
        .save-button:hover {
            background: linear-gradient(90deg, #52ab98 60%, #2b6777 100%);
            color: #2b6777;
            transform: translateY(-2px) scale(1.04);
        }
        .cancel-button {
            background: #dbe4ea;
            color: #2b6777;
        }
        .cancel-button:hover {
            background: #52ab98;
            color: #fff;
            transform: translateY(-2px) scale(1.04);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><%= supplier.getId() == 0 ? "Add New" : "Edit" %> Supplier</h1>
        <form action="SupplierServlet" method="post">
            <input type="hidden" name="id" value="<%= supplier.getId() %>">
            
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= supplier.getName() %>" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= supplier.getEmail() %>" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" value="<%= supplier.getPhone() %>" required>
            </div>
            
            <div class="button-group">
                <button type="submit" class="button save-button">Save</button>
                <a href="SupplierServlet" class="button cancel-button">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>