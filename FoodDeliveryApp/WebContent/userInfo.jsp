<%@ page import="java.sql.*" %>
<%@ page import="food.app.*" %>


<%
    // Get vendorId from session

    // Initialize vendor details
    String name = "", email = "", phone = "", address = "", city = "" , pincode = "";

    try {
        // Connect to the database
        Connection con = ConnectDB.dbCon();
         
        int id = GetterSetter.getUser_id();

        // Fetch vendor details
  
        PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE id=?");
        ps.setInt(1,id);
      
           ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            phone = rs.getString("phone");
            address = rs.getString("address");
            city = rs.getString("city");
            pincode = rs.getString("pin_code");
            
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
    <title>Vendor Information</title>
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
        }

        .info-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            margin: 0 auto;
        }

        .info-container p {
            font-size: 18px;
            margin-bottom: 10px;
            color: #333;
        }

        .info-container span {
            font-weight: bold;
            color: rgba(255, 87, 51, 0.9);
        }
        
          .sidebar h2 {
            color: #fff;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
    <br>
        <h2>User Dashboard</h2>
        <a href="userInfo.jsp">My Info</a>
        <a href="Menu.html">Menu</a>
        <a href="viewOrdersByUser.jsp">My Orders</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2>My Information</h2>
        <div class="info-container">
            <p><span>Name:</span> <%= name %></p>
            <p><span>Email:</span> <%= email %></p>
            <p><span>Phone:</span> <%= phone %></p>
            <p><span>Address:</span> <%= address %></p>
            <p><span>City:</span> <%= city %></p>
            <p><span>Pin Code :</span> <%= pincode %></p>
          
        </div>
    </div>
</body>
</html>
