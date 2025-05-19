<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.stockmanagement.model.User" %>
<%@ page import="com.stockmanagement.dao.UserDAO" %>

<%
    String username = request.getParameter("username");
    User user = null;
    if (username != null && !username.isEmpty()) {
        try {
            user = UserDAO.getUser(username);
        } catch (Exception e) {
            throw new ServletException("Error retrieving user: " + e.getMessage(), e);
        }
    }
%>

<html>
<head>
    <title>Edit User</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #c9d6ff, #e2e2e2);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: white;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            width: 400px;
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #444;
        }

        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            margin-top: 25px;
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #333;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
<% if (user != null) { %>
<div class="container">
    <h2>Edit User</h2>
    <form action="updateUser" method="post">
        <input type="hidden" name="username" value="<%= user.getUsername() %>" />

        <label for="password">Password</label>
        <input type="password" name="password" id="password" value="<%= user.getPassword() %>" required />

        <label for="role">Role</label>
        <select name="role" id="role" required>
            <option value="Admin" <%= "Admin".equals(user.getRole()) ? "selected" : "" %>>Admin</option>
            <option value="Manager" <%= "Manager".equals(user.getRole()) ? "selected" : "" %>>Manager</option>
            <option value="Staff" <%= "Staff".equals(user.getRole()) ? "selected" : "" %>>Staff</option>
        </select>

        <input type="submit" value="Update User" />
    </form>
    <a class="back-link" href="viewUsers.jsp">← Back to User List</a>
</div>
<% } else { %>
<div class="container">
    <p class="error-message">⚠️ User not found or no username provided.</p>
    <a class="back-link" href="viewUsers.jsp">← Back to User List</a>
</div>
<% } %>
</body>
</html>
