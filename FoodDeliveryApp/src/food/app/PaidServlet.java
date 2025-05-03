package food.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaidServlet
 */
public class PaidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaidServlet() {
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
		
		int id = Integer.parseInt(request.getParameter("orderId"));
		
		Connection con = ConnectDB.dbCon();
		try {
			PreparedStatement ps = con.prepareStatement("UPDATE orders SET payment = ? WHERE id = ?");
			ps.setString(1, "Paid");
			ps.setInt(2, id);
			
			int i = ps.executeUpdate();
			
			if(i>0){
				response.sendRedirect("deliveryOrders.jsp");
			}
			else{
				response.sendRedirect("error.html");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
