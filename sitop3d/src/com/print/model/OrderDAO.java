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

public class OrderDAO {
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
	   private static final String TABLE_NAME = "ordine";
		
	   public static OrderBean doRetrieveById(OrderBean bean) {
		     PreparedStatement preparedStatement = null;
			 ResultSet rs = null;
			 Connection currentCon=null;
			 String searchQuery = "select * from "+OrderDAO.TABLE_NAME+" where id_ordine=" + bean.getId()  +";";
			 try 
			   {
				  currentCon = ds.getConnection();
			      preparedStatement=currentCon.prepareStatement(searchQuery);
			      rs = preparedStatement.executeQuery(searchQuery);	        
			      boolean more = rs.next();				    
			      if (!more) 
			      {
			         bean.setValid(false);
			      } 
			      else if (more) 
			      {
			         bean.setUtente(rs.getInt("utente"));
			         bean.setData_ordine(rs.getDate("data_ordine"));				     			  
			         bean.setData_spedizione(rs.getDate("data_spedizione"));
			         bean.setStato(rs.getString("stato_ordine"));
			         bean.setIndirizzo(rs.getString("indirizzo_spedizione"));
			         bean.setCosto(rs.getFloat("costo_totale"));
			         bean.setValid(true);			        
			      }
			   }
			 catch (Exception ex) 
			   {
				 ex.printStackTrace();
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
			 return bean;
	   }
	   public static ArrayList<OrderBean> doRetrieveAll() {
		     PreparedStatement preparedStatement = null;
			 ResultSet rs = null;
			 Connection currentCon=null;
			 ArrayList<OrderBean> beans=new ArrayList<OrderBean>();
			 String searchQuery = "select * from "+OrderDAO.TABLE_NAME+" where utente>0;";
			 try 
			   {
				  currentCon = ds.getConnection();
			      preparedStatement=currentCon.prepareStatement(searchQuery);
			      rs = preparedStatement.executeQuery(searchQuery);	        
			      while(rs.next()) {
			         	OrderBean bean=new OrderBean();
			         	bean.setCosto(rs.getFloat("costo_totale"));
			         	bean.setData_ordine(rs.getDate("data_ordine"));
			         	bean.setData_spedizione(rs.getDate("data_spedizione"));
			         	bean.setId(rs.getInt("id_ordine"));
			         	bean.setIndirizzo(rs.getString("indirizzo_spedizione"));
			         	bean.setStato(rs.getString("stato_ordine"));
			         	bean.setUtente(rs.getInt("utente"));
			         	beans.add(bean);			        
			      }
			   }
			 catch (Exception ex) 
			   {
			      System.out.println("errore nella ricerca degli ordini");
			      ex.printStackTrace();
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
			 return beans;
	   }
	   public static ArrayList<OrderBean> doRetrieveByUser(UserBean user_id) {
		     PreparedStatement preparedStatement = null;
			 ResultSet rs = null;
			 Connection currentCon=null;
			 ArrayList<OrderBean> beans=new ArrayList<OrderBean>();
			 String searchQuery = "select * from "+OrderDAO.TABLE_NAME+" where utente=" + user_id.getId()  +";";
			 try 
			   {
				  currentCon = ds.getConnection();
			      preparedStatement=currentCon.prepareStatement(searchQuery);
			      rs = preparedStatement.executeQuery(searchQuery);	        
			      while(rs.next()) {
			         	OrderBean bean=new OrderBean();
			         	bean.setCosto(rs.getFloat("costo_totale"));
			         	bean.setData_ordine(rs.getDate("data_ordine"));
			         	bean.setData_spedizione(rs.getDate("data_spedizione"));
			         	bean.setId(rs.getInt("id_ordine"));
			         	bean.setIndirizzo(rs.getString("indirizzo_spedizione"));
			         	bean.setStato(rs.getString("stato_ordine"));
			         	bean.setUtente(rs.getInt("utente"));
			         	beans.add(bean);
			      }
			   }
			 catch (Exception ex) 
			   {
			      System.out.println("errore nella ricerca degli ordini");
			      ex.printStackTrace();
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
			 return beans;
	   }
	   public static int doRetrieveLastOrderByUser(UserBean userid) {
		   String sql="select max(id_ordine) from ordine where utente="+userid.getId();
		   PreparedStatement preparedStatement = null;
		   Connection currentCon=null;
		   int ord=-1;
		   try 
		   {
			  currentCon = ds.getConnection();
		      preparedStatement=currentCon.prepareStatement(sql);
		      ResultSet rs=preparedStatement.executeQuery();
		      if(rs.next()) {
		    	  ord=rs.getInt(1);
		      }
		   } catch(Exception e) {
	    	   e.printStackTrace();
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
		   return ord;
	   }
	   public static synchronized void doSave(OrderBean bean) throws SQLException {
		   String sql="call registra_ordine(?,?,?)";
		   PreparedStatement preparedStatement = null;
		   Connection currentCon=null;
		   try 
		   {
			  currentCon = ds.getConnection();
		      preparedStatement=currentCon.prepareStatement(sql);
		      preparedStatement.setInt(1, bean.getUtente());
		      preparedStatement.setString(2, bean.getIndirizzo());
		      preparedStatement.setFloat(3, bean.getCosto());
		      preparedStatement.executeUpdate();	
	       } catch(Exception e) {
	    	   e.printStackTrace();
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