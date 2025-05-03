package food.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PlaceOrderServlet
 */
public class PlaceOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		int user_id = GetterSetter.getUser_id();
		int dish_id = Integer.parseInt(request.getParameter("id"));
		int vendor_id = Integer.parseInt(request.getParameter("vendor_id"));
		String name = request.getParameter("name");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String desc = request.getParameter("description");
		int price = Integer.parseInt(request.getParameter("price"));
		String address = request.getParameter("address");
		int total = quantity * price;
		
		Connection con = ConnectDB.dbCon();
		
		try{
			PreparedStatement ps = con.prepareStatement("insert into orders values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setInt(2, dish_id);
			ps.setInt(3, user_id);
			ps.setInt(4, vendor_id);
			ps.setString(5, name);
			ps.setInt(6, quantity);
			ps.setString(7,address);
			ps.setString(8,"unpaid");
			ps.setString(9, "pending");
			ps.setString(10, desc);
			ps.setInt(11,total);
			
			
			int i = ps.executeUpdate();
			
			if(i>0){
				response.sendRedirect("success.html");
			}
			
			else{
				response.sendRedirect("error.html");
			}
			
			
			
		}
		catch(Exception e){
			e.printStackTrace();
		}

		
		
		
		
	}

}
