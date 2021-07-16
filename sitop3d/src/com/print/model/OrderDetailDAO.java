package com.print.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrderDetailDAO {
	 private static DataSource ds;
	   static {
			try {
				Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");

				ds = (DataSource) envCtx.lookup("jdbc/print3d");

			} catch (NamingException e) {
				e.printStackTrace();
			}
		}
	   private static final String TABLE_NAME = "dettagli_ordini";
  public static ArrayList<OrderDetailBean> doRetrieveOrderDetails(int id) {
			  PreparedStatement preparedStatement = null;
			  ResultSet rs = null;
			  Connection currentCon=null;
			  String sql="Select * from "+OrderDetailDAO.TABLE_NAME+" where id_ordine=?";
			  ArrayList<OrderDetailBean> details=new ArrayList<OrderDetailBean>();
			  try {
				  currentCon=ds.getConnection();
				  preparedStatement=currentCon.prepareStatement(sql);
				  preparedStatement.setInt(1, id);
				  rs=preparedStatement.executeQuery();
				  while(rs.next()) {
					  OrderDetailBean o=new OrderDetailBean();
					  o.setProdotto(rs.getInt("prodotto"));
					  o.setTot(rs.getFloat("prezzo_acquisto"));
					  o.setIva(rs.getFloat("iva"));
					  o.setCat(rs.getString("categoria"));
					  o.setOrdine(id);
					  details.add(o);
				  }
				  return details;
			  }
			  catch(SQLException e) {
				  e.printStackTrace();
				  return null;
			  }
			  finally {
			   if (preparedStatement != null) {
			         try {
			        	 preparedStatement.close();
			         } catch (Exception e) {}
			            preparedStatement = null;
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
