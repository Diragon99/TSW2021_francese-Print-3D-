package com.print.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.print.model.Cart;
import com.print.model.ComposizioneBean;
import com.print.model.ComposizioneDAO;
import com.print.model.FatturaBean;
import com.print.model.FatturaDAO;
import com.print.model.OrderBean;
import com.print.model.OrderDAO;
import com.print.model.ProductBean;
import com.print.model.UserBean;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/checkoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cart cart= (Cart)request.getSession(false).getAttribute("cart");
		UserBean u=(UserBean)request.getSession(false).getAttribute("currentSessionUser");
		String radio=request.getParameter("indirizzo");
		String indirizzo=null;
		if(radio.equalsIgnoreCase("new")){
			indirizzo=request.getParameter("nuovo_indirizzo");
		}
		int id_ordine=-1;
		try {
			id_ordine = registraOrdine(u, cart, indirizzo);
			int idf=registraFattura(cart, id_ordine, request.getParameter("pagamento"));
			registraComp(cart, idf);
			request.getSession().setAttribute("orders", OrderDAO.doRetrieveByUser(u));
			request.getSession().setAttribute("cart", new Cart());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("catalogView.jsp");
	}
	private int registraOrdine(UserBean user, Cart cart, String indirizzo) throws SQLException {
		List<ProductBean> prods=cart.getProducts();
		float tot=0;
		if(indirizzo==null) {
			indirizzo=user.getAddress();
		}
		for(ProductBean prod:prods) {
			tot=tot+(prod.getTot());
		}
		OrderBean order=new OrderBean();
		order.setUtente(user.getId());
		order.setCosto(tot);
		if(indirizzo==null) {
			indirizzo=user.getAddress();
		}
		order.setIndirizzo(indirizzo);
		order.setValid(true);
		OrderDAO.doSave(order);
		return OrderDAO.doRetrieveLastOrderByUser(user);
	}
	private void registraComp(Cart cart, int idf) {
		ComposizioneBean comp=new ComposizioneBean();
		comp.setCart(cart);
		comp.setFattura(idf);
		ComposizioneDAO.doSave(comp);
	}
	private int registraFattura(Cart cart,int ordine, String pagamento) {
		FatturaBean bean=new FatturaBean();
		bean.setOrdine(ordine);
		bean.setData(new Date());
		bean.setCosto(cart.getTotal());
		bean.setPagamento(pagamento);
		bean.setSpeseSped(0);
		FatturaDAO.doSave(bean);
		return FatturaDAO.doRetrieveByOrder(ordine);
	}
	}
