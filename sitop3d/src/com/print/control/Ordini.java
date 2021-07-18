package com.print.control;

import java.io.IOException; 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.print.model.OrderBean;
import com.print.model.OrderDAO;
import com.print.model.UserBean;

/**
 * Servlet implementation class Ordini
 */
@WebServlet("/orders")
public class Ordini extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ordini() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		request.removeAttribute("orders");
		UserBean u=(UserBean)request.getAttribute("currentSessionUser");
		if(action.isEmpty()) {
			request.setAttribute("orders", OrderDAO.doRetrieveByUser(u));
			if(!response.isCommitted()) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/orderView.jsp");
				dispatcher.forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("vieworder")) {
			int id=Integer.parseInt(request.getParameter("id"));
			OrderBean b=new OrderBean();
			b.setId(id);
			OrderDAO.doRetrieveById(b);
			if(!response.isCommitted()) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/orderDetails.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
