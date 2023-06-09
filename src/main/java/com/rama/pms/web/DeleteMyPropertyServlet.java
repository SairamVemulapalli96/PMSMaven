package com.rama.pms.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rama.pms.bo.Owner;
import com.rama.pms.bo.Property;
import com.rama.pms.dao.PropertyDAO;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet(
		description = "A Servlet to delete the data from the database", 
		urlPatterns = { 
				"/DeleteMyPropertyServlet",
				"/DeleteMyProperty"
		})
public class DeleteMyPropertyServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMyPropertyServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		System.out.println("DeleteMyPropertyServlet - doGet() invoked");
		
		// 1. Get the data from Database 
		try {
			PropertyDAO.connectToDB();
			System.out.println("DB Connection has been obtained");
		} catch (Exception e) {
			System.err.println("Exception occurred while connecting to the Database");
			System.err.println("Error Message : " + e.getMessage());
			//TODO: Remove this later, as this is not a good practice
			e.printStackTrace();
			
			throw new ServletException(e.getMessage());
		}
		
		int pid =-1;
		String pidStr = request.getParameter("pid");
		
		if(null!=pidStr && pidStr.trim().length()>0) {
			pid = Integer.parseInt(pidStr);
		}
		
		System.out.println("Id Parameter from the Request : " + pid);
		
		int rowsDeleted = PropertyDAO.deletePropertyByPId(pid);
		String message = "Property not deleted sucessfully!";
		String flag = "false";
		
		if(rowsDeleted > 0)  {
			flag = "true";
			message = "Property deleted sucessfully!";
		}
		
		request.setAttribute("flag", flag);
		request.setAttribute("message", message);
		
		// 2. Store it in a way where the data is accessible in the JSP
		
		HttpSession session = request.getSession(true);
		Owner owner = (Owner) session.getAttribute("owner");
		int oid = owner.getOId();
		List<Property> propertyList = PropertyDAO.getPropertiesByOId(oid);
		System.out.println("propertyList from DAO : " + propertyList);
		request.setAttribute("propertyList", propertyList);
			// 3. Forward / Delegate the control/flow the required JSP Page
		request.getRequestDispatcher("viewmyproperties.jsp").forward(request, response);
	}
}