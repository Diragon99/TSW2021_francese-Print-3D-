package com.print.control;

import java.io.IOException;  
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.print.model.ProductDAO;
import com.print.model.UserBean;
import com.print.model.Cart;
import com.print.model.OrderDetailBean;
import com.print.model.OrderDetailDAO;
import com.print.model.ProductBean;
/**
 * Servlet implementation class ProductControl
 */
@WebServlet("/product")
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
				if(action.equalsIgnoreCase("vieworder")) {
					int id = Integer.parseInt(request.getParameter("id"));
					ArrayList<OrderDetailBean> details=OrderDetailDAO.doRetrieveOrderDetails(id);
					System.out.println(id);
					request.setAttribute("order_details", details);
					if(!response.isCommitted()) {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/orderDetails.jsp");
						dispatcher.forward(request, response);
					}
				}
				else if (action.equalsIgnoreCase("addC")) {
					int flag = 0;
					int id1 = Integer.parseInt(request.getParameter("id"));

					List<ProductBean> products = cart.getProducts();
					for( ProductBean product:products)
					{
						if (id1 == product.getCode())
							flag = 1;
					}
					if(flag==0) {
					cart.addProduct(ProductDAO.doRetrieveByKey(id1));

					}
					if(!response.isCommitted()) {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/cartView.jsp");
						dispatcher.forward(request, response);
					}
				} else if (action.equalsIgnoreCase("deleteC")) {
					int id1 = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(ProductDAO.doRetrieveByKey(id1));
					if(!response.isCommitted()) {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/cartView.jsp");
						dispatcher.forward(request, response);
					}
				} else if (action.equalsIgnoreCase("read")) {
					int id1 = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					request.setAttribute("product", ProductDAO.doRetrieveByKey(id1));
					if(!response.isCommitted()) {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
						dispatcher.forward(request, response);
					}
				} else if (action.equalsIgnoreCase("home")) {
					if(!response.isCommitted()) {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/catalogView.jsp");
						dispatcher.forward(request, response);
					}
				}  else if (action.equalsIgnoreCase("viewC")) {

					if(!response.isCommitted()) {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/cartView.jsp");
						dispatcher.forward(request, response);
					}

				}
			}			
	} catch (SQLException e) {
			e.printStackTrace();
		}

		request.getSession().setAttribute("cart", cart);

		String sort = request.getParameter("sort");

		try {
			request.removeAttribute("products");
			UserBean user=(UserBean) request.getSession().getAttribute("user");			
			if(user!=null && user.isValid()) {
				request.setAttribute("products", ProductDAO.doRetrieveAll(sort, user.isAdmin()));
			}
			else {
				request.setAttribute("products", ProductDAO.doRetrieveAll(sort, false));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(!response.isCommitted()) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/catalogView.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}