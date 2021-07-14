package com.print.control;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.print.model.UserBean;
@WebFilter(filterName="loginFilter", urlPatterns={"/loginServlet" , "/checkoutServlet", "/orderCheckout.jsp"})
public class LoginFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponse hresponse = (HttpServletResponse) response; 
		if((hrequest.getRequestURI().equalsIgnoreCase("/sitop3d/orderCheckout.jsp"))||
			(request.getParameter("action")!=null&&request.getParameter("action").equalsIgnoreCase("logout"))) {
				HttpSession session = hrequest.getSession(false);
				if(session!=null) {
					boolean loggedIn = (session.getAttribute("currentSessionUser")!=null&&(((UserBean)session.getAttribute("currentSessionUser")).isValid()));
					if(!loggedIn){
						hresponse.sendRedirect(hrequest.getContextPath()+ "/loginPage.jsp");
					} else {
						chain.doFilter(request, response);
					}
				}else {
					hresponse.sendRedirect(hrequest.getContextPath()+ "/loginPage.jsp");
				}
		}
		else {
			chain.doFilter(request, response);
		}
	}
}