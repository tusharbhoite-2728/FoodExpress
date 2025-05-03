<%@ page import="java.sql.*" %>
<%@ page import="food.app.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Orders</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            background: url('images/food-home.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }

        /* Sidebar */
        .sidebar {
            width: 200px;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.8);
            display: flex;
            flex-direction: column;
            position: fixed;
        }

        .sidebar a {
            color: #ff5733;
            padding: 15px;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background-color: #ff5733;
            color: #fff;
        }

        /* Main Content */
        .main-content {
            margin-left: 200px;
            padding: 20px;
            width: calc(100% - 200px);
        }

        .main-content h2 {
            color: rgba(255, 87, 51, 0.9);
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
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

        tr{
            background-color: #f1f1f1;
        }

        .btn {
            padding: 8px 15px;
            background-color: #ff5733;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #e74c3c;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2 style="color : white ">Dashboard</h2><br>
        <a href="deliveryBoyOrders.jsp" class="active">All Orders</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2>All Orders</h2>
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
                    <th>Total</th>
                    <th>Action</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                   Connection con = ConnectDB.dbCon();
                    try {
                        // Fetch the delivery boy's ID from the session
                     

                    
                       PreparedStatement ps = con.prepareStatement("SELECT * FROM orders");

                       ResultSet rs = ps.executeQuery();

                        // Display orders in table rows
                        while (rs.next()) {
                %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getInt("dish_id") %></td>
                            <td><%= rs.getInt("user_id") %></td>
                            <td><%= rs.getInt("vendor_id") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getInt("quantity") %></td>
                            <td><%= rs.getString("address") %></td>
                            <td><%= rs.getString("payment") %></td>
                            <td><%= rs.getString("status") %></td>
                            <td><%= rs.getString("description") %></td>
                            <td><%= rs.getInt("total") %></td>
                            <td>
                                <form action="PaidServlet" method="post">
                                    <input type="hidden" name="orderId" value="<%= rs.getInt("id") %>" />
                                    <input type="hidden" name="action" value="paid" />
                                    <button type="submit" class="btn">Paid</button>
                                </form>
                            </td>
                            <td>
                                <form action="ExecutedServlet" method="post">
                                    <input type="hidden" name="orderId" value="<%= rs.getInt("id") %>" />
                                    <input type="hidden" name="action" value="executed" />
                                    <button type="submit" class="btn">Executed</button>
                                </form>
                            </td>
                        </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='12'>Error: " + e.getMessage() + "</td></tr>");
                    } 
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
