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
            background: #ECE9DF;
            min-height: 100vh;
        }
        .container {
            max-width: 600px;
            margin: 40px auto;
            background: #F5F3ED;
            padding: 30px 24px 24px 24px;
            border-radius: 18px;
            box-shadow: 0 8px 32px rgba(34,41,54,0.10);
        }
        h1 {
            color: #232B38;
            text-align: center;
            margin-bottom: 24px;
        }
        .form-group {
            margin-bottom: 18px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            color: #7B818A;
            font-weight: 600;
        }
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #A48C6B;
            border-radius: 6px;
            box-sizing: border-box;
            background: #ECE9DF;
            color: #232B38;
            font-size: 1rem;
            transition: border 0.2s;
        }
        input[type="text"]:focus,
        input[type="email"]:focus {
            border: 1.5px solid #232B38;
            outline: none;
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
            background: #232B38;
            color: #fff;
        }
        .save-button:hover {
            background: #E2B44A;
            color: #232B38;
            transform: translateY(-2px) scale(1.04);
        }
        .cancel-button {
            background: #ECE9DF;
            color: #232B38;
            border: 1px solid #A48C6B;
        }
        .cancel-button:hover {
            background: #A48C6B;
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