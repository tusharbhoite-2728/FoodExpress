package food.app;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class DishAdd
 */
public class DishAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DishAdd() {
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
		
		Part imagePart = request.getPart("image");
        InputStream imageStream = null;

		
		String name = request.getParameter("name");
		String restaurant = request.getParameter("restaurant");
		String category = request.getParameter("category");
		int price = Integer.parseInt(request.getParameter("price"));
		int vendor_id = GetterSetter.getVendor_id();
		
		  if (imagePart != null) {
	            // Obtain the input stream of the image file
	            imageStream = imagePart.getInputStream();
	        }
		
		try{
			Connection con = ConnectDB.dbCon();
			PreparedStatement ps = con.prepareStatement("insert into dishes values(?,?,?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setInt(2, vendor_id);
			ps.setString(3, name);
			ps.setString(4, category);
			ps.setInt(5, price);
         

			 if (imageStream != null) {
	                ps.setBlob(6, imageStream);
	            } else {
	                ps.setNull(6, java.sql.Types.BLOB);
	            }
			 ps.setString(7, restaurant);
			
			 int row = ps.executeUpdate();
	            if (row > 0) {
	                response.getWriter().println("Dish added successfully with image.");
	            }
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
	}

}
