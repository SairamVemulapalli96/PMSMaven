package com.rama.pms.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rama.pms.bo.Tenant;
import com.rama.pms.dao.TenantDAO;
import com.rama.pms.bo.Owner;

/**
 * Servlet implementation class ViewServlet
 */
@WebServlet({ "/ViewMyTenantsServlet", "/ViewMyTenants" })
public class ViewMyTenantsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewMyTenantsServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		System.out.println("ViewMyTenantsServlet - doGet() invoked");
		
		// 1. Get the data from Database 
		try {
			TenantDAO.connectToDB();
		} catch (Exception e) {
			System.err.println("Exception occurred while connecting to the Database");
			System.err.println("Error Message : " + e.getMessage());
			//TODO: Remove this later, as this is not a good practice
			e.printStackTrace();
			
			//throw new ServletException(e.getMessage());
		}
		int oid =-1;
		HttpSession session = request.getSession(true);
		Owner owner = (Owner) session.getAttribute("owner");
		
		oid = owner.getOId();
		
		
		
		System.out.println("Id Parameter from the Request : " + oid);
		
		List<Tenant> tenantList = TenantDAO.getTenantsByOId(oid);
		
	
		
		// 2. Store it in a way where the data is accessible in the JSP
		request.setAttribute("tenantList", tenantList);
		
		// 3. Forward / Delegate the control/flow the required JSP Page
		request.getRequestDispatcher("viewmytenants.jsp").forward(request, response);
	}

}
