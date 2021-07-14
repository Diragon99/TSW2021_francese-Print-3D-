package com.print.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ComposizioneDAO {
	private static DataSource ds;
	   static {
			try {
				Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");
				ds = (DataSource) envCtx.lookup("jdbc/print3d");
				} catch (NamingException e) {
				System.out.println("Error:" + e.getMessage());
			}
		}
	   private static final String TABLE_NAME = "composizione";
public static synchronized void doSave(ComposizioneBean comp) {
	   int fattura=comp.getFattura();
	   Cart cart=comp.getCart();
	   List<ProductBean> prods=cart.getProducts();			   
	   PreparedStatement ps = null;
	   Connection currentCon=null;
	   try {
		   currentCon=ds.getConnection();				   
		   for(ProductBean prod:prods) {
			   String sql="INSERT INTO "+ ComposizioneDAO.TABLE_NAME+" VALUES(?,?,?,?);";
			   ps=currentCon.prepareStatement(sql);
			   ps.setInt(1, fattura);
			   ps.setInt(2, prod.getCode());
			   ps.setFloat(3, prod.getBase_price()+prod.getVat());
			   ps.setFloat(4, prod.getVat());
			   ps.executeUpdate();
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   finally {
		   if (ps != null) {
		         try {
		        	 ps.close();
		         } catch (Exception e) {}
		            ps = null;
		         }
			
		      if (currentCon != null) {
		         try {
		            currentCon.close();
		         } catch (Exception e) {
		        	 
		         }
		         currentCon = null;
		      }
		  }
   }
}
