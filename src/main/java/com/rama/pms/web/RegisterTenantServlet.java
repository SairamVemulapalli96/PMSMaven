package com.rama.pms.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rama.pms.bo.Tenant;
import com.rama.pms.dao.TenantDAO;

/**
 * Servlet implementation class CreateServlet
 */
@WebServlet("/RegisterTenant")
public class RegisterTenantServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterTenantServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		System.out.println("RegisterTenantServlet - doPost() called");
		
		/*response.setContentType("text/html");
		response.getWriter().write("Create Servlet invoked!");*/
		
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
		
		// 2. Collect all the Input data and prepare a Person object
		Tenant tenant = new Tenant();
		
		String name = request.getParameter("name");
		
		String ageStr = request.getParameter("age");
		int age = ageStr!=null ? Integer.parseInt(ageStr) : 0;
		
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phoneno = request.getParameter("phoneno");
		String address = request.getParameter("address");
		
		String oidStr = request.getParameter("oid");
		int oid = oidStr!=null ? Integer.parseInt(oidStr) : 0;
	
		
		tenant.setName(name);
		tenant.setAge(age);
		//validate that the gender is not null or empty, 
		//otherwise it will throw a NullPointerException
		tenant.setGender(gender.charAt(0));
		tenant.setEmail(email);
		tenant.setPassword(password);
		tenant.setPhoneno(phoneno);
		tenant.setAddress(address);
		tenant.setOId(oid);
		
		System.out.println("Tenant Object prepared from the Request parameters : " + tenant);
		
		// 3. Insert a record into the Database Table
		//int recordsInserted = PersonDAO.createPerson(person);
		//int lastInsertedId = PersonDAO.createPerson(person);
		
		// 3.1 A different flavor of CreatePerson() method that would throw an Exception back
		int recordsInserted = 0;
		String exceptionMsg = null;
		
		try {
			recordsInserted = TenantDAO.registerTenant(tenant);
		}catch(Exception exception) {
			exceptionMsg = exception.getMessage();
			System.err.println("Exception occurred while inserting the data into the Database Table");
			System.err.println("Message : " + exceptionMsg);
		}
		
		// 4. Prepare the message to be shown to the User
		String message = null;
		String flag = null;
		
		if(recordsInserted > 0) {
			//message = "Record inserted successfully";
			message = "Registration was successful, Please login with you details";
			flag = "success";
		} else {
			exceptionMsg = "Registration was unsuccessful! Please try again";
			request.setAttribute("exceptionMsg", exceptionMsg);
			flag = "failure";
		}
		
		// 5. Store it in a way where the data is accessible in the JSP
		request.setAttribute("message", message);
		request.setAttribute("flag", flag);
	
		request.setAttribute("tenantForm", tenant);
		
		// 6. Forward / Delegate the control/flow the required JSP Page
		String url = null;

		if(recordsInserted > 0) {
			
			url = "login.jsp";
		}else {
			
			url = "registertenant.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
