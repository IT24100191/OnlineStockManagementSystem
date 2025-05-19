<%@ page import="java.util.List" %>
<%@ page import="com.stockmanagement.dao.UserDAO" %>
<%@ page import="com.stockmanagement.model.User" %>
<%
  List<User> users = null;
  try {
    users = UserDAO.getAllUsers();
  } catch (Exception e) {
    throw new ServletException("Failed to load users: " + e.getMessage(), e);
  }
%>
<html>
<head>
  <title>User Management</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #f2f2f2;
      padding: 40px;
    }

    h2 {
      color: #333;
      text-align: center;
    }

    .container {
      max-width: 800px;
      margin: auto;
      background: white;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    a.add-btn {
      display: inline-block;
      margin-bottom: 20px;
      padding: 10px 18px;
      background-color: #28a745;
      color: white;
      border-radius: 6px;
      text-decoration: none;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    a.add-btn:hover {
      background-color: #218838;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }

    th, td {
      padding: 12px 15px;
      text-align: left;
    }

    th {
      background-color: #007BFF;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    tr:hover {
      background-color: #eef;
    }

    a.action-link {
      margin: 0 5px;
      color: #007BFF;
      text-decoration: none;
      font-weight: bold;
    }

    a.action-link:hover {
      text-decoration: underline;
    }

    .no-data {
      text-align: center;
      font-style: italic;
      color: #888;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>All Users</h2>
  <a class="add-btn" href="addUser.jsp">+ Add New User</a>
  <table>
    <tr>
      <th>Username</th>
      <th>Role</th>
      <th>Actions</th>
    </tr>
    <%
      if (users != null && !users.isEmpty()) {
        for (User user : users) {
    %>
    <tr>
      <td><%= user.getUsername() %></td>
      <td><%= user.getRole() %></td>
      <td>
        <a class="action-link" href="editUser.jsp?username=<%= java.net.URLEncoder.encode(user.getUsername(), "UTF-8") %>">Edit</a> |
        <a class="action-link"
           href="deleteUser?username=<%= java.net.URLEncoder.encode(user.getUsername(), "UTF-8") %>"
           onclick="return confirm('Are you sure you want to delete user <%= user.getUsername() %>?');">
          Delete
        </a>
      </td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="3" class="no-data">No users found.</td>
    </tr>
    <%
      }
    %>
  </table>
</div>
</body>
</html>
