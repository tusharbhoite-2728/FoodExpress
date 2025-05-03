<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
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
            background: url('menu-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }

        /* Sidebar Navigation */
        .sidebar {
            width: 200px;
            height: 100vh;
            background-color: #333;
            padding-top: 20px;
            position: fixed;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 15px;
            text-decoration: none;
            font-weight: bold;
        }

        .sidebar a:hover {
            background-color: #555;
        }

        .sidebar a.active {
            background-color: #ff5733;
        }

        /* Main Content */
        .main-content {
            margin-left: 220px;
            padding: 20px;
            width: calc(100% - 220px);
        }

        .category-title {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
            color: #ff5733;
        }

        /* Dish Display */
        .dishes-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .dish-card {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .dish-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
        }

        .dish-name {
            font-weight: bold;
            margin: 10px 0 5px;
            color: #333;
        }

        .dish-category {
            font-size: 14px;
            color: #777;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="menu.jsp?category=all" class="<%= request.getParameter("category") == null || request.getParameter("category").equals("all") ? "active" : "" %>">All Dishes</a>
        <a href="menu.jsp?category=Vegetarian" class="<%= "Vegetarian".equals(request.getParameter("category")) ? "active" : "" %>">Vegetarian</a>
        <a href="menu.jsp?category=Non-Vegetarian" class="<%= "Non-Vegetarian".equals(request.getParameter("category")) ? "active" : "" %>">Non-Vegetarian</a>
        <a href="menu.jsp?category=Chinese" class="<%= "Chinese".equals(request.getParameter("category")) ? "active" : "" %>">Chinese</a>
        <a href="menu.jsp?category=Beverages" class="<%= "Beverages".equals(request.getParameter("category")) ? "active" : "" %>">Beverages</a>
        <a href="menu.jsp?category=Desserts" class="<%= "Desserts".equals(request.getParameter("category")) ? "active" : "" %>">Desserts</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2 class="category-title">
            <%
                String category = request.getParameter("category");
                if (category == null || category.equals("all")) {
                    out.print("All Dishes");
                } else {
                    out.print(category + " Dishes");
                }
            %>
        </h2>
        <div class="dishes-container">
            <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    // Connect to the database
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database_name", "your_username", "your_password");

                    // Query dishes based on the category
                    String sql = "SELECT name, category, price, image FROM dishes";
                    if (category != null && !category.equals("all")) {
                        sql += " WHERE category = ?";
                        ps = conn.prepareStatement(sql);
                        ps.setString(1, category);
                    } else {
                        ps = conn.prepareStatement(sql);
                    }

                    rs = ps.executeQuery();

                    // Display dishes
                    while (rs.next()) {
                        String dishName = rs.getString("name");
                        String dishCategory = rs.getString("category");
                        float price = rs.getFloat("price");
                        Blob imageBlob = rs.getBlob("image");
                        String base64Image = null;

                        if (imageBlob != null) {
                            byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                            base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);
                        }
            %>
            <div class="dish-card">
                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= dishName %>">
                <p class="dish-name"><%= dishName %></p>
                <p class="dish-category">Category: <%= dishCategory %></p>
                <p class="dish-price">Price: $<%= price %></p>
            </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                }
            %>
        </div>
    </div>
</body>
</html>
