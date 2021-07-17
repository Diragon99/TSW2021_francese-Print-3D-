package com.print.control;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.print.model.*;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginServlet")
public class ServletLogin extends HttpServlet {


/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public void doGet(HttpServletRequest request, HttpServletResponse response) 
			           throws ServletException, java.io.IOException {
	String action = request.getParameter("action");
	if(action.equalsIgnoreCase("login")) {
		try{	    
			UserBean user = new UserBean();
			user.setUserName(request.getParameter("un"));
			user.setPassword(request.getParameter("pw"));
			user = UserDAO.doRetrieve(user);
			if (user.isValid())
			{  
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser",user);
				if(user.getUser_type().equalsIgnoreCase("authUser")) {
					session.setAttribute("orders", OrderDAO.doRetrieveByUser(user));
				}else if(user.getUser_type().equalsIgnoreCase("admin")) {
					session.setAttribute("orders", OrderDAO.doRetrieveAll());
				}
				response.sendRedirect("catalogView.jsp");      		
			}  
			else { 
				response.sendRedirect("invalidLogin.jsp");
			}
		}
			
		catch (Throwable theException) 	    
		{
			theException.printStackTrace();
		}
	}
	else if(action.equalsIgnoreCase("logout")) {
		HttpSession session = request.getSession(false);
		session.removeAttribute("user");
		session.invalidate();
		response.sendRedirect("catalogView.jsp");
	}
	else if(action.equalsIgnoreCase("verifica_un")) {
		StringBuilder sb = new StringBuilder();
		String un=null;
		BufferedReader reader = request.getReader();
	    try {
	        String line;
	        while ((line = reader.readLine()) != null) {
	            sb.append(line);
	            JSONObject jObj = new JSONObject(sb.toString());
	            un=jObj.getString("username");
	        }
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	response.setStatus(500);
	    }
	    finally {
	        reader.close();
	    }
		if(UserDAO.verificaUn(un)) {
			response.setStatus(200);
		}
		else {
			response.setStatus(412);
		}
	}
}
public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
}
	}