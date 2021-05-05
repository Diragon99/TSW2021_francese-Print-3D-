package com.print.control;

import java.io.IOException; 
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.print.model.ProductModel;
import com.print.model.ProductModelDM;
import com.print.model.ProductModelDS;
import com.print.model.Cart;
import com.print.model.ProductBean;
/**
 * Servlet implementation class ProductControl
 */
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// ProductModelDS usa il DataSource
	// ProductModelDM usa il DriverManager	
	static boolean isDataSource = true;
	
	static ProductModel model;
	
	static {
		if (isDataSource) {
			model = new ProductModelDS();
		} else {
			model = new ProductModelDM();
		}
	}
	
	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addC")) {
					int flag = 0;
					int id = Integer.parseInt(request.getParameter("id"));
					
					List<ProductBean> products = cart.getProducts();
					for( ProductBean product:products)
					{
						if (id == product.getCode())
							flag = 1;
					}
					if(flag==0) {
					cart.addProduct(model.doRetrieveByKey(id));
					
					}
					if(!response.isCommitted()) {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
						dispatcher.forward(request, response);
					}
				} else if (action.equalsIgnoreCase("deleteC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(model.doRetrieveByKey(id));
					if(!response.isCommitted()) {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
						dispatcher.forward(request, response);
					}
				} else if (action.equalsIgnoreCase("read")) {
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					request.setAttribute("product", model.doRetrieveByKey(id));
					if(!response.isCommitted()) {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
						dispatcher.forward(request, response);
					}
				} else if (action.equalsIgnoreCase("home")) {
					if(!response.isCommitted()) {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CatalogView.jsp");
						dispatcher.forward(request, response);
					}
				} else if (action.equalsIgnoreCase("checkout")) {
					
					cart = new Cart();
					if(!response.isCommitted()) {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Checkout.jsp");
						dispatcher.forward(request, response);
					}
					
				} else if (action.equalsIgnoreCase("viewC")) {
					
					if(!response.isCommitted()) {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
						dispatcher.forward(request, response);
					}
					
				}
			}			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		request.getSession().setAttribute("cart", cart);
		//request.setAttribute("cart", cart);
		
		
		String sort = request.getParameter("sort");

		try {
			request.removeAttribute("products");
			request.setAttribute("products", model.doRetrieveAll(sort));
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		if(!response.isCommitted()) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CatalogView.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
