package com.print.model;
import java.sql.Connection;   
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO 	
{
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
   private static final String TABLE_NAME = "utente";
	
   public static UserBean doRetrieve(UserBean bean) {
      PreparedStatement preparedStatement = null;
	  ResultSet rs = null;
	  Connection currentCon=null;
      String username = bean.getUsername();    
      String password = bean.getPassword();   
	    
      String searchQuery =
            "select * from "+UserDAO.TABLE_NAME+" where username= '"+username+"' and password= '"+password+"'";
 try
   {
      currentCon = ds.getConnection();
      preparedStatement=currentCon.prepareStatement(searchQuery);
      rs = preparedStatement.executeQuery();	        
      boolean more = rs.next();
      if (!more) 
      {
         bean.setValid(false);
      } 
      else
      {
         String firstName = rs.getString("nome");
         String lastName = rs.getString("cognome");	     
         bean.setFirstName(firstName);
         bean.setLastName(lastName);
         bean.setAddress(rs.getString("indirizzo"));
         bean.setCf(rs.getString("codice_fiscale"));
         bean.setEmail(rs.getString("email"));
         bean.setId(rs.getInt("id_utente"));
         bean.setRagione_sociale(rs.getString("ragione_sociale"));
         bean.setSdi_code(rs.getString("codice_sdi"));
         bean.setTelephone(rs.getString("telefono"));
         bean.setUser_type(rs.getString("tipo_utente"));
         bean.setValid(true);
      }
   } 

   catch (Exception ex) 
   {
      ex.printStackTrace();
   } 
   finally 
   {
      if (rs != null)	{
         try {
            rs.close();
         } catch (Exception e) {}
            rs = null;
         }
	
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
   public static boolean doRetrievemail(String email) {
	      PreparedStatement preparedStatement = null;
		  ResultSet rs = null;
		  Connection currentCon=null;
	      String searchQuery =
	            "select count(*) from "+UserDAO.TABLE_NAME+" where email= ? ";
	 try
	   {
	      currentCon = ds.getConnection();
	      preparedStatement=currentCon.prepareStatement(searchQuery);
	      preparedStatement.setString(1, email);
	      rs = preparedStatement.executeQuery();	        
	      while(rs.next()) {
	    	  int x=rs.getInt(1);
	    	  if(x>0) {
	    		  return false;
	    	  }else {
	    		  return true;
	    	  }
	      }
	   } 

	   catch (Exception ex) 
	   {
	      System.out.println("non trovo email...");
	      ex.printStackTrace();
	   } 
	   finally 
	   {
	      if (rs != null)	{
	         try {
	            rs.close();
	         } catch (Exception e) {}
	            rs = null;
	         }
		
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
	return false;		
	   }
public static boolean verificaUn(String un) {
	String sql="select count(*) from utente where username=?";
	   PreparedStatement preparedStatement = null;
	   Connection currentCon=null;	 
	   ResultSet rs=null;
	   try {
		   currentCon=ds.getConnection();
		   preparedStatement=currentCon.prepareStatement(sql);
		   preparedStatement.setString(1, un);
		   rs=preparedStatement.executeQuery();
		   while(rs.next()) {
			   if(rs.getInt(1)==1) {
				   return true;
			   }
			   else {
				   return false;
			   }
		   }
	   }catch(SQLException e) {
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
	   return false;
}
public static synchronized boolean doSave(UserBean user) {
	   String sql="INSERT INTO "+ UserDAO.TABLE_NAME+" VALUES(?,?,?,?,?,?,?,?,?,?,?,?);";
	   PreparedStatement preparedStatement = null;
	   Connection currentCon=null;
	   boolean ok=true;
	   try {
		   currentCon=ds.getConnection();
		   preparedStatement=currentCon.prepareStatement(sql);
		   preparedStatement.setString(1, user.getCf());
		   preparedStatement.setInt(2, user.getId());
		   preparedStatement.setString(3, user.getFirstName());
		   preparedStatement.setString(4, user.getLastName());
		   preparedStatement.setString(5, user.getEmail());
		   preparedStatement.setString(6, user.getAddress());
		   preparedStatement.setString(7, user.getTelephone());
		   preparedStatement.setString(8, user.getUsername());
		   preparedStatement.setString(9, user.getPassword());
		   preparedStatement.setString(10, "utente");
		   preparedStatement.setString(11, user.getSdi_code());
		   preparedStatement.setString(12, user.getRagione_sociale());
		   preparedStatement.executeUpdate();
		   return ok;
	   }catch(SQLException e) {
		   System.out.println("impossibile registrare");
		   ok=false;
		   return ok;
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