package food.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserLogin
 */
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
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
		int id;
		
	try{
			
			String username = request.getParameter("email");
			String password = request.getParameter("password");
			
			Connection con = ConnectDB.dbCon();
			
			PreparedStatement ps = con.prepareStatement("select * from user where email = ? and password = ? ");
			ps.setString(1, username);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
		
			
			
			if(rs.next()){
				id = rs.getInt(1);
				GetterSetter.setUser_id(id);
				response.sendRedirect("userDashboard.html");
			}
			else
			{
				response.sendRedirect("error.html");
				
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	

}
