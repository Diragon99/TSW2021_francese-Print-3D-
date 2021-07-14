package com.print.control;

import java.io.File;  
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.print.model.ProductDAO;
import com.print.model.ProductBean;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet(urlPatterns={"/admin"}, name="AdminServlet", initParams= 
{@WebInitParam(name="file-upload", value="updir")})
@MultipartConfig(fileSizeThreshold=1024*1024*2, maxFileSize=1024*1024*10, maxRequestSize=1024*1024*50)
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String SAVE_DIR="";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
		SAVE_DIR=getServletConfig().getInitParameter("file-upload");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException {
			String action=request.getParameter("action");
			if(action.equalsIgnoreCase("add_product")) {
				ProductBean prod=new ProductBean();
				String savePath=request.getServletContext().getRealPath("")+File.separator+AdminServlet.SAVE_DIR;
				prod.setAvailable(request.getParameter("disponibile").equalsIgnoreCase("si"));
				prod.setBase_price((Float.parseFloat(request.getParameter("prezzo_netto"))));
				prod.setCategory(request.getParameter("categoria"));
				prod.setDescription(request.getParameter("descrizione"));
				prod.setShortdesc(request.getParameter("nome"));
				prod.setVat(Float.parseFloat(request.getParameter("iva")));
				try {
					ProductDAO.doSave(prod);
					int last=ProductDAO.doRetrieveLast();
					savePath=savePath+File.separator+last;
					File fileSaveDir=new File(savePath);
					if(!fileSaveDir.exists()) {
						fileSaveDir.mkdir();
					}
					int count=1;
					for(Part part:request.getParts()) {
						String fileName=extractFileName(part);
						if (fileName != null && !fileName.equals("")) {
							fileName="img_"+count;
							part.write(savePath + File.separator + fileName);
							count++;
						} else {
							
						};
					}
					response.sendRedirect("adminPage.jsp");
				}catch (SQLException e) {
					e.printStackTrace();
					response.sendRedirect("catalogView.jsp");
				}
			}
			else if(action.equalsIgnoreCase("change_price")) {
				ProductBean prod=new ProductBean();
				prod.setCode(Integer.parseInt(request.getParameter("id")));
				prod.setBase_price(Float.parseFloat(request.getParameter("cambia_prezzo")));
				prod.setVat(Float.parseFloat(request.getParameter("cambia_iva")));
				ProductDAO.cambiaPrezzo(prod);
				response.sendRedirect("catalogView.jsp");
		}
			else if(action.equalsIgnoreCase("set_available")) {
				ProductBean prod=new ProductBean();
				prod.setCode(Integer.parseInt(request.getParameter("id")));
				prod.setAvailable(false);
				ProductDAO.aval(prod);
				response.sendRedirect("catalogView.jsp");
		}
			else if(action.equalsIgnoreCase("set_unavailable")) {
				ProductBean prod=new ProductBean();
				prod.setCode(Integer.parseInt(request.getParameter("id")));
				prod.setAvailable(true);
				ProductDAO.aval(prod);
				response.sendRedirect("catalogView.jsp");
		}
	}
	public static String getSave_Dir() {
		return AdminServlet.SAVE_DIR;
	}
	private String extractFileName(Part part) {
		// content-disposition: form-data; name="file"; filename="file.txt"
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}
}
