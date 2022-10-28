package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.CustomerBean;
import db.DBCP;
import db.Sql;

public class CustomerDao extends DBCP{

	private static CustomerDao instance = new CustomerDao();
	
	public static CustomerDao getInstance() {
		return instance;
	}
	
	private CustomerDao() {}
	
	public List<CustomerBean> select_Customers() {
		
		List<CustomerBean> customers = new ArrayList<>();
		
		try{
			Connection conn = getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_CUSTOMERS);
			
			while(rs.next()) {
				CustomerBean customer = new CustomerBean();
				customer.setCustId(rs.getString(1));
				customer.setName(rs.getString(2));
				customer.setHp(rs.getString(3));
				customer.setAddr(rs.getString(4));
				customer.setRdate(rs.getString(5));
				
				customers.add(customer);
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return customers;
	};
	public void insert_Customer() {};
	public void update_Customer() {};
	public void delete_customer() {};
	
}
