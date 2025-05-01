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
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .button-group {
            margin-top: 20px;
            text-align: center;
        }
        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin: 0 5px;
        }
        .save-button {
            background-color: #4CAF50;
            color: white;
        }
        .cancel-button {
            background-color: #f44336;
            color: white;
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