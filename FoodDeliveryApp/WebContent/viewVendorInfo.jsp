<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="food.app.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vendor Information</title>
    <style>
        /* Basic Reset */
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
        }

        /* Sidebar styling */
        .sidebar {
            width: 250px;
            background-color: rgba(0, 0, 0, 0.8);
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
            color: #ff5733;
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
            padding: 40px;
            background: rgba(255, 255, 255, 0.4);
        }

        .main-content h1 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Card styling for vendor info */
        .vendor-card {
            background-color: rgba(255, 255, 255, 0.85);
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: left;
        }

        .vendor-card h3 {
            font-size: 1.5em;
            color: #333;
            margin-bottom: 10px;
        }

        .vendor-card p {
            font-size: 1.1em;
            color: #555;
            margin: 5px 0;
        }

        .vendor-card p span {
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Vendor Dashboard</h2>
        <a href="viewMyInformation.jsp">View My Information</a>
        <a href="executedOrders.jsp">Executed Orders</a>
        <a href="pendingOrders.jsp">Pending Orders</a>
        <a href="addDishes.jsp">Add Dishes</a>
        <a href="viewDishesByVendor.jsp">View Dishes</a>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <h1>Vendor Information</h1>

        <div class="vendor-card">
            <%
               
                int vendorId = GetterSetter.getVendor_id(); // Assuming vendor ID is stored in session
                System.out.println("in jsp");
                System.out.println(vendorId);

                try {
                	
                	Connection con = ConnectDB.dbCon();
                	PreparedStatement ps = con.prepareStatement("SELECT * FROM vendor WHERE id = ?");
                    ps.setInt(1, vendorId);
                  
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String phone = rs.getString("phone");
                        String address = rs.getString("address");
                        String city = rs.getString("city");
                        String openingTime = rs.getString("opening_time");
                        String closingTime = rs.getString("closing_time");
            %>
                        <h3><%= name %></h3>
                        <p><span>Email:</span> <%= email %></p>
                        <p><span>Phone:</span> <%= phone %></p>
                        <p><span>Address:</span> <%= address %></p>
                        <p><span>City:</span> <%= city %></p>
                        <p><span>Opening Time:</span> <%= openingTime %></p>
                        <p><span>Closing Time:</span> <%= closingTime %></p>
            <%
                    } else {
                        out.println("<p>Vendor information not found.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } 
            %>
        </div>

    </div>

</body>
</html>
