package com.rama.pms.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rama.pms.bo.OwnerSuggestion;
import com.rama.pms.dao.OwnerSuggestionDAO;

/**
 * Servlet implementation class OwnerSuggestionsServlet
 */
@WebServlet({ "/OwnerSuggestionsServlet", "/OwnerSuggestions" })
public class OwnerSuggestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerSuggestionsServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("OwnerSuggestionsServlet doGet invoked!!");
		OwnerSuggestionDAO ownersuggestionDAO = new OwnerSuggestionDAO();
		
		try {
			OwnerSuggestionDAO.connectToDB();
			System.out.println("DB Connection has been obtained");
		} catch (Exception e) {
			System.err.println("Exception occurred while connecting to the Database");
			System.err.println("Error Message : " + e.getMessage());
			e.printStackTrace();
			
			throw new ServletException(e.getMessage());
		}
		
		List<OwnerSuggestion> ownerSuggestionsList = OwnerSuggestionDAO.ownerSuggestionsList();
		
		System.out.println("ownerSuggestionsList" + ownerSuggestionsList);
		
		request.setAttribute("ownerSuggestionsList", ownerSuggestionsList);
		request.getRequestDispatcher("ownersuggestionslist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
