package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.ProductBean;
import db.DBCP;
import db.Sql;

public class ProductDao extends DBCP{

	private static ProductDao instance = new ProductDao();
	
	public static ProductDao getInstance() {
		return instance;
	}
	
	private ProductDao () {}
	
	// CRUD
	public List<ProductBean> select_products () {
		List<ProductBean> products = new ArrayList<>();
		
		try{
			Connection conn = getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_PRODUCTS);
			
			while(rs.next()) {
				ProductBean product = new ProductBean();
				product.setProdNo(rs.getInt(1));
				product.setProdName(rs.getString(2));
				product.setStock(rs.getInt(3));
				product.setPrice(rs.getInt(4));
				product.setCompany(rs.getString(5));
				
				products.add(product);
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	public void select_product () {}
	public void insert_product() {}
	public void delete_product() {}
	
	
}
