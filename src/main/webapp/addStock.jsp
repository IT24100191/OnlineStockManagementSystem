<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Stock</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 20px;
            background-color: #f4f6f9;
            color: #333;
        }
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        form {
            max-width: 450px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: 500;
            color: #34495e;
        }
        input[type="text"], input[type="number"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 0.95em;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus, input[type="number"]:focus, input[type="date"]:focus, select:focus {
            border-color: #3498db;
            outline: none;
        }
        .error {
            color: #e74c3c;
            font-size: 0.9em;
            display: none;
            margin-top: -10px;
            margin-bottom: 10px;
        }
        button {
            padding: 10px 20px;
            margin-right: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.95em;
            transition: background-color 0.3s, transform 0.2s;
        }
        button[type="submit"] {
            background-color: #2ecc71;
            color: white;
        }
        button[type="submit"]:hover {
            background-color: #27ae60;
            transform: translateY(-1px);
        }
        button[type="reset"] {
            background-color: #e74c3c;
            color: white;
        }
        button[type="reset"]:hover {
            background-color: #c0392b;
            transform: translateY(-1px);
        }
        p {
            text-align: center;
            margin: 10px 0;
        }
        p[style*="green"] { color: #2ecc71; }
        p[style*="red"] { color: #e74c3c; }
        a {
            display: block;
            text-align: center;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
            margin-top: 15px;
        }
        a:hover {
            background-color: #2980b9;
        }
        @media (max-width: 600px) {
            form {
                margin: 0;
                padding: 15px;
            }
            button {
                width: 100%;
                margin-bottom: 10px;
            }
            button:last-child {
                margin-right: 0;
            }
            a {
                width: 100%;
                box-sizing: border-box;
            }
        }
    </style>
</head>
<body>
<h2>Add New Product</h2>

<!-- Display success or error messages -->
<% if (request.getAttribute("message") != null) { %>
<p style="color: green;"><%= request.getAttribute("message") %></p>
<% } %>
<% if (request.getAttribute("error") != null) { %>
<p style="color: red;"><%= request.getAttribute("error") %></p>
<% } %>

<form action="stock" method="post" onsubmit="return validateForm()">
    <input type="hidden" name="action" value="add"/>

    <label for="id">ID:</label>
    <input type="number" id="id" name="id" required
           title="Enter a numeric ID (any number)">
    <div class="error" id="idError">ID already exists!</div>


    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required pattern="[A-Za-z0-9 ]{1,50}"
           title="Name must be 1-50 alphanumeric characters or spaces" oninvalid="this.setCustomValidity('Please enter a valid name (1-50 characters)')">

    <label for="category">Category:</label>
    <select id="category" name="category" required>
        <option value="">Select a Category</option>
        <option value="Grocery">Grocery</option>
        <option value="Electronics">Electronics</option>
    </select>

    <label for="quantity">Quantity:</label>
    <input type="number" id="quantity" name="quantity" required min="0"
           oninvalid="this.setCustomValidity('Quantity must be 0 or greater')">

    <label for="unit">Unit:</label>
    <select id="unit" name="unit" required>
        <option value="">Select a Unit</option>
        <option value="Kg">Kg</option>
        <option value="Pieces">Pieces</option>
    </select>

    <label for="expiryDate">Expiry Date:</label>
    <input type="date" id="expiryDate" name="expiryDate" required
           min="<%= LocalDate.now().plusDays(1).toString() %>"
           oninvalid="this.setCustomValidity('Expiry date must be in the future')"
           oninput="this.setCustomValidity('')">

    <button type="submit">Add Product</button>
    <button type="reset">Reset</button>
</form>

<a href="stock">Back to Stock Table</a>

<script>
    function validateForm() {
        const id = document.getElementById("id").value;
        const idError = document.getElementById("idError");
        idError.style.display = "none";

        // Check for duplicate ID
        fetch('stock?action=checkId&id=' + encodeURIComponent(id))
            .then(response => response.text())
            .then(data => {
                if (data === "true") {
                    idError.style.display = "block";
                    return false;
                }
                return true;
            })
            .catch(error => console.error('Error checking ID:', error));

        // Additional client-side validation can be added here
        return true; // Default to true; fetch will handle async validation
    }

    // Optional: Add event listener for real-time ID validation
    document.getElementById("id").addEventListener("input", function() {
        const id = this.value;
        const idError = document.getElementById("idError");
        if (id) {
            fetch('stock?action=checkId&id=' + encodeURIComponent(id))
                .then(response => response.text())
                .then(data => {
                    idError.style.display = data === "true" ? "block" : "none";
                })
                .catch(error => console.error('Error checking ID:', error));
        } else {
            idError.style.display = "none";
        }
    });
</script>
</body>
</html>