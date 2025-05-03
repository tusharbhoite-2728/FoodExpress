<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="food.app.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Dishes</title>
    <style>
        /* Reset and basic styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            min-height: 100vh;
            background: url('images/food-home.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }

        /* Sidebar styling */
        .sidebar {
            width: 250px;
            background-color: rgba(0, 0, 0, 0.8); /* Dark transparent background */
            padding: 20px;
            display: flex;
            flex-direction: column;
        }

        .sidebar h2 {
            color: #fff;
            margin-bottom: 20px;
            text-align: center;
        }

        .sidebar a {
            color: #ff5733; /* Matching color for links */
            padding: 15px;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover {
            background-color: #ff5733;
            color: #fff;
        }

        /* Main content area */
        .main-content {
            flex: 1;
            padding: 20px;
            background: rgba(255, 255, 255, 0.3); /* Semi-transparent background */
            overflow: auto;
        }

        .main-content h1 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Grid styling for dishes */
        .dish-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .dish-card {
            width: 30%; /* Three columns */
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            text-align: center;
            transition: transform 0.3s;
        }

        .dish-card:hover {
            transform: scale(1.05);
        }

        .dish-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .dish-info {
            padding: 15px;
        }

        .dish-info h3 {
            font-size: 1.2em;
            color: #333;
        }

        .dish-info p {
            font-size: 1em;
            color: #555;
        }
        
          table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #ff5733;
            color: white;
        }

        tr {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Vendor Dashboard</h2>
        <a href="vendorInfo.jsp">My Information</a>
        <a href="executedOrders.jsp">Executed Orders</a>
        <a href="pendingOrders.jsp">Pending Orders</a>
        <a href="addDishes.html">Add Dishes</a>
        <a href="viewDishesByVendor.jsp">View Dishes</a>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <h1>Pending Orders</h1>
        
          <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Dish ID</th>
                    <th>User ID</th>
                    <th>Vendor ID</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Address</th>
                    <th>Payment</th>
                    <th>Status</th>
                    <th>Description</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
                <%
                    
                    int id = GetterSetter.getVendor_id();
                    try {
                        // Database connection
                      Connection con = ConnectDB.dbCon();
                        
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM orders where vendor_id = ? and status = ?");
                        
                        ps.setInt(1,id);
                        ps.setString(2, "pending");

                        // Query to fetch order details
                       ResultSet rs = ps.executeQuery();

                        // Iterate through the result set and print table rows
                        while (rs.next()) {
                %>
                        <tr>
                            <td><%= rs.getInt(1) %></td>
                            <td><%= rs.getInt(2) %></td>
                            <td><%= rs.getInt(3) %></td>
                            <td><%= rs.getInt(4) %></td>
                            <td><%= rs.getString(5) %></td>
                            <td><%= rs.getInt(6) %></td>
                            <td><%= rs.getString(7) %></td>
                            <td><%= rs.getString(8) %></td>
                            <td><%= rs.getString(9) %></td>
                            <td><%= rs.getString(10) %></td>
                            <td><%= rs.getInt(11) %></td>
                        </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } 
                %>
            </tbody>
        </table>

       
    </div>

</body>
</html>
