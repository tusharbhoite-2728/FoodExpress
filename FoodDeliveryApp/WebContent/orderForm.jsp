<%@ page import="java.sql.*, java.util.*, javax.sql.*" %>
<%@ page import="food.app.*" %>

<%
    int dishId = Integer.parseInt(request.getParameter("id"));
    String dishName = "";
    String dishCategory = "";
    String dishPrice = "";
    int vendor_id = Integer.parseInt(request.getParameter("vendor_id")) ;

    // Database connection to fetch dish details
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Connection con = ConnectDB.dbCon();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM dishes WHERE id = ?");
        ps.setInt(1, dishId);
        rs = ps.executeQuery();

        if (rs.next()) {
            dishName = rs.getString("name");
            dishCategory = rs.getString("category");
            dishPrice = rs.getString("price");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/food-home.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .form-container h2 {
            text-align: center;
            color: #ff5733;
            margin-bottom: 20px;
        }
        .form-container label {
            font-weight: bold;
            margin-top: 10px;
        }
        .form-container input, .form-container select, .form-container textarea {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container button {
            background-color: #ff5733;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
        }
        .form-container button:hover {
            background-color: #cc462d;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Order Form</h2>
        <form action="PlaceOrderServlet" method="post">
            <label for="dishName">Dish ID</label>
            <input type="number" name="id" value="<%= dishId %>" readonly>
            
             <label for="dishName">Vendor ID</label>
            <input type="number" name="vendor_id" value="<%= vendor_id %>" readonly>
            
            <label for="dishName">Dish Name</label>
            <input type="text" id="dishName" name="name" value="<%= dishName %>" readonly>

            <label for="category">Category</label>
            <input type="text" id="category" name="category" value="<%= dishCategory %>" readonly>

            <label for="price">Price</label>
            <input type="text" id="price" name="price" value="<%= dishPrice %>" readonly>

            <label for="quantity">Quantity</label>
            <input type="number" id="quantity" name="quantity" required>

            <label for="address">Delivery Address</label>
            <textarea id="address" name="address" rows="4" required></textarea>
            
               <label for="address">Description</label>
            <textarea id="address" name="description" rows="4" required></textarea>

            <button type="submit">Place Order</button>
        </form>
    </div>
</body>
</html>
