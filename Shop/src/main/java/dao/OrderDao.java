package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.OrderBean;
import db.DBCP;
import db.Sql;

public class OrderDao extends DBCP{

	private static OrderDao instance = new OrderDao();
	
	public static OrderDao getInstance() {
		return instance;
	}
	
	private OrderDao () {}
	
	
	public List<OrderBean> select_orders() {

		List<OrderBean> orders = new ArrayList<>();
		
		try{
			Connection conn = getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_ORDERS);
			
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setOrderNo(rs.getInt(1));
				order.setOrderId(rs.getString(2));
				order.setOrderProduct(rs.getInt(3));
				order.setOrderCount(rs.getInt(4));
				order.setOrderDate(rs.getString(5));

				order.setName(rs.getString(6));
				order.setProdName(rs.getString(7));
				
				orders.add(order);
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return orders;
		
	};
	
	public void select_order() {};
	
	public int insert_order(String orderId, String orderProduct, String orderCount) {
		int result = 0;
		
		try{
			Connection conn = DBCP.getConnection();
			conn.setAutoCommit(false);
			
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ORDER);
			psmt.setString(1, orderId);
			psmt.setString(2, orderProduct);
			psmt.setString(3, orderCount);
			result = psmt.executeUpdate();
			
			conn.commit();
			
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	};
	
	public void delete_order() {};
	public void update_order() {};
	
}
