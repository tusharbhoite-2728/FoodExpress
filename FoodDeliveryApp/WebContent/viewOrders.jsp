<%@ page import="java.sql.*" %>
<%@ page import="food.app.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: url('images/food-home.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #ff5733;
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

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Order Details</h1>
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
                    <th>Total(In Rs.)</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        // Database connection
                      Connection con = ConnectDB.dbCon();
                        
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM orders");

                        // Query to fetch order details
                        rs = ps.executeQuery();

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
                              <td><%= rs.getString(11) %></td>
                        </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='9'>Error: " + e.getMessage() + "</td></tr>");
                    } 
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
