package com.rama.pms.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rama.pms.bo.TenantSuggestion;
import com.rama.pms.bo.Tenant;
import com.rama.pms.dao.TenantSuggestionDAO;
import com.rama.pms.dao.TenantDAO;

/**
 * Servlet implementation class OwnerSuggestionsServlet
 */
@WebServlet({ "/TenantSuggestionsServlet", "/TenantSuggestions" })
public class TenantSuggestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TenantSuggestionsServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TenantSuggestionsServlet doGet invoked!!");
		TenantSuggestionDAO tenantsuggestionDAO = new TenantSuggestionDAO();
		
		try {
			TenantSuggestionDAO.connectToDB();
			System.out.println("DB Connection has been obtained");
		} catch (Exception e) {
			System.err.println("Exception occurred while connecting to the Database");
			System.err.println("Error Message : " + e.getMessage());
			e.printStackTrace();
			
			throw new ServletException(e.getMessage());
		}
		
		List<TenantSuggestion> tenantSuggestionsList = TenantSuggestionDAO.tenantSuggestionsList();
		
		System.out.println("tenantSuggestionsList" + tenantSuggestionsList);
		
		request.setAttribute("tenantSuggestionsList", tenantSuggestionsList);
		request.getRequestDispatcher("tenantsuggestionslist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
