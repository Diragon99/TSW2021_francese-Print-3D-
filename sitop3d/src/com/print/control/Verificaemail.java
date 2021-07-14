package com.print.control;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.print.model.UserDAO;

/**
 * Servlet implementation class Verificaemail
 */
@WebServlet("/verifica_email")
public class Verificaemail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verificaemail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuilder sb = new StringBuilder();
		String mail=null;
	    BufferedReader reader = request.getReader();
	    try {
	        String line;
	        while ((line = reader.readLine()) != null) {
	            sb.append(line);
	            JSONObject jObj = new JSONObject(sb.toString());
	            mail=jObj.getString("email");
	        }
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	response.setStatus(500);
	    }
	    finally {
	        reader.close();
	    }
		if(UserDAO.doRetrievemail(mail)) {
			response.setStatus(200);
		}
		else {
			response.setStatus(412);
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
