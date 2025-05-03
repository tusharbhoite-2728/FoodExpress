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
        <h1>Dishes</h1>

        <div class="dish-grid">
            <%
               
                try {
                    Connection con = ConnectDB.dbCon();
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM dishes");
                 
                    ResultSet rs = ps.executeQuery();

                    // Loop through the result set and display each dish in a card format
                    while (rs.next()) {
                    	int id = Integer.parseInt(rs.getString("id"));
                        String dishName = rs.getString("name");
                        String category = rs.getString("category");
                        int price = Integer.parseInt(rs.getString("price"));
                        Blob imageBlob = rs.getBlob("image"); // Retrieve the BLOB column

                        // Convert the BLOB to a byte array
                        byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());

                        // Convert the byte array to a Base64 encoded string
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            %>
                <div class="dish-card">
                    <!-- Display image using Base64 encoding -->
                   
                    
                    <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Dish Image">
                    <div class="dish-info">
                        <h3><%= dishName %></h3>
                        <p>Category: <%= category %></p>
                        <h3> Rs <%= price %></h3>
                   
                    </div>
                </div>
            <%
                    }
                } catch (Exception e) {
                   e.printStackTrace();
                } 
            %>
        </div>

    </div>

</body>
</html>
