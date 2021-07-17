package com.print.control;

import java.io.IOException;
import com.print.model.UserBean;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebFilter(filterName="adminFilter", urlPatterns={"/admin", "/adminPage.jsp"})
public class AdminFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AdminFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponse hresponse = (HttpServletResponse) response; 
		if((hrequest.getRequestURI().equalsIgnoreCase("/sitop3d/adminPage.jsp"))||
			(request.getParameter("action")!=null&&request.getParameter("action").equalsIgnoreCase("add_product"))) {
				HttpSession session = hrequest.getSession(false);
				if(session!=null) {
					UserBean user=(UserBean)session.getAttribute("currentSessionUser");
					boolean isAdmin = (user!=null&&user.isValid()&&user.isAdmin());
					if(!isAdmin){
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
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
