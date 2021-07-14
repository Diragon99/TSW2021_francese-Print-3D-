package com.print.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDAO {
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

	private static final String TABLE_NAME = "prodotto";

	public synchronized static void doSave(ProductBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "call inserisci_prodotto(?,?,?,?,?,?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getShortdesc());
			preparedStatement.setString(2, product.getDescription());
			preparedStatement.setBoolean(3, product.getAvailable());					
			preparedStatement.setFloat(4, product.getVat());
			preparedStatement.setFloat(5, product.getBase_price());
			preparedStatement.setString(6, product.getCategory());

			preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
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
	public static synchronized int doRetrieveLast() {
		String sql="Select max(id_prodotto) from prodotto";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int last=-1;
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(sql);
			ResultSet rs=preparedStatement.executeQuery();
			if(rs.next()) {
				last=rs.getInt(1);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return last;
	}

	public static synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME + " WHERE id_prodotto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getInt("id_prodotto"));
				bean.setShortdesc(rs.getString("descrizione_breve"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setAvailable(rs.getBoolean("disponibilita"));
				bean.setVat(rs.getFloat("iva"));
				bean.setBase_price(rs.getFloat("prezzo_base"));
				bean.setCategory(rs.getString("categoria"));;
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}

	public synchronized static boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProductDAO.TABLE_NAME + " WHERE id_prodotto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}
	public synchronized static void aval(ProductBean p) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String SQL = "update "+ProductDAO.TABLE_NAME+" set disponibilita=? where id_prodotto=?";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(SQL);
			preparedStatement.setBoolean(1, !p.getAvailable());
			preparedStatement.setInt(2, p.getCode());
			preparedStatement.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public synchronized static void cambiaPrezzo(ProductBean p) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String SQL = "call cambia_prezzo(?,?,?)";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(SQL);
			preparedStatement.setInt(1, p.getCode());
			preparedStatement.setFloat(2, p.getBase_price());
			preparedStatement.setFloat(3, p.getVat());
			preparedStatement.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public synchronized static Collection<ProductBean> doRetrieveAll(String order, boolean admin) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String selectSQL=null;
		Collection<ProductBean> products = new LinkedList<ProductBean>();
		if(admin) {
			selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME;
		}
		else {
			selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME+" where disponibilita=1";
		}
		if (order != null && !order.equals("")) {
			if(order.equalsIgnoreCase("name")) {
				order="descrizione_breve";
			}
			else if(order.equalsIgnoreCase("code")) {
				order="id_prodotto";
			}
			else if(order.equalsIgnoreCase("description")){
				order="descrizione";
			}
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("id_prodotto"));
				bean.setShortdesc(rs.getString("descrizione_breve"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setAvailable(rs.getBoolean("disponibilita"));
				bean.setVat(rs.getFloat("iva"));
				bean.setBase_price(rs.getFloat("prezzo_base"));
				bean.setCategory(rs.getString("categoria"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
}
