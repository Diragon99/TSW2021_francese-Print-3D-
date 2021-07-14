package com.print.model;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FatturaDAO {
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

	private static final String TABLE_NAME = "fattura";
	public static int doRetrieveByOrder(int order_id) {
		Connection connection = null;
		int idf=-1;
		PreparedStatement preparedStatement = null;
		String sql="select id_fattura from "+FatturaDAO.TABLE_NAME+" where ordine="+order_id+";";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(sql);
			ResultSet rs=preparedStatement.executeQuery();
			if(rs.next()) {
				idf=rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			   if (preparedStatement != null) {
			         try {
			        	 preparedStatement.close();
			         } catch (Exception e) {}
			            preparedStatement = null;
			         }
				
			      if (connection != null) {
			         try {
			            connection.close();
			         } catch (Exception e) {
			        	 
			         }
			         connection = null;
			      }
			  }
		return idf;
}
	public synchronized static void doSave(FatturaBean bean) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String sql="call registra_fattura(?,?,?,?)";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1,bean.getOrdine());
			preparedStatement.setFloat(2,bean.getCosto());
			preparedStatement.setFloat(3,bean.getSpeseSped());
			preparedStatement.setString(4,bean.getPagamento());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			   if (preparedStatement != null) {
			         try {
			        	 preparedStatement.close();
			         } catch (Exception e) {}
			            preparedStatement = null;
			         }
				
			      if (connection != null) {
			         try {
			            connection.close();
			         } catch (Exception e) {
			        	 
			         }
			         connection = null;
			      }
			  }
	}
}
