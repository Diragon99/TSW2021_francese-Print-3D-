package com.print.control;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.print.model.*;
@WebServlet("/register")
public class ServletRegistrazione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, java.io.IOException {
			UserBean user = new UserBean();
			user.setUserName(request.getParameter("un"));
			user.setPassword(request.getParameter("pw"));
			user.setCf(request.getParameter("cf"));
			user.setFirstName(request.getParameter("nome"));
			user.setLastName(request.getParameter("cognome"));
			user.setEmail(request.getParameter("email"));
			user.setAddress(request.getParameter("indirizzo"));
			user.setTelephone(request.getParameter("telefono"));
			user.setUser_type("authUser");
			if(request.getParameter("ragione_sociale").equals("")||!(request.getParameter("ragione_sociale")!=null)) {
				user.setRagione_sociale(null);
			}
			else {
				user.setRagione_sociale(request.getParameter("ragione_sociale"));
			}
			if(request.getParameter("sdi").equals("")||!(request.getParameter("sdi")!=null)){
				user.setSdi_code(null);
			}
			else {
				user.setSdi_code(request.getParameter("sdi"));
			}
			boolean b=UserDAO.doSave(user);
			if(b) {
				user.setValid(b);
				request.getSession().setAttribute("currentSessionUser", user);
				response.sendRedirect("catalogView.jsp");
			}
			else {
				user.setValid(b);
				response.sendRedirect("loginPage.jsp");
			}
		}
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, java.io.IOException{
		doGet(request, response);
	}
}
