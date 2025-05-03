<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="food.app.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Users</title>
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
            overflow: auto;
        }

        .main-content h1 {
            color: white;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Table styling */
        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #ff5733; /* Header background color */
            color: #fff;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <a href="viewUsers.jsp">View Users</a>
        <a href="viewVendors.jsp">View Vendors</a>
        <a href="viewDishes.jsp">View Dishes</a>
        <a href="viewOrders.jsp">View Orders</a>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <h1>User Information</h1>

        <%
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/your_database_name";
            String username = "your_database_user";
            String password = "your_database_password";
           

            try {
             
            	Connection con = ConnectDB.dbCon();
            	PreparedStatement ps = con.prepareStatement("SELECT id, name, email, phone, address, city, pin_code FROM user");
                ResultSet rs = ps.executeQuery();
        %>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>City</th>
                <th>Pin Code</th>
            </tr>
        <%
                // Loop through the result set and display each row in the table
                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("address") %></td>
                <td><%= rs.getString("city") %></td>
                <td><%= rs.getString("pin_code") %></td>
            </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } 
        %>
        </table>

    </div>

</body>
</html>
