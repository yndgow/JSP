package db;

public class Sql {

	// customer
	public static final String SELECT_CUSTOMERS = "SELECT * FROM `customer`";
	
	// order
	public static final String SELECT_ORDERS = "SELECT a.*, b.name, c.prodName FROM `order` AS a "
												+ "JOIN `customer` AS b "
												+ "ON a.orderId = b.custId "
												+ "JOIN `product` AS c "
												+ "ON a.orderProduct = c.prodNo ";
	public static final String INSERT_ORDER = "INSERT INTO `order` "
											+ "SET "
											+ "`orderNo` = (SELECT MAX(`orderNo`) FROM `order` AS temp)+1, "
											+ "`orderId` = ?, "
											+ "`orderProduct` = ?, "
											+ "`orderCount` = ?, "
											+ "`orderDate` = NOW() ";
	
	
	// product
	public static final String SELECT_PRODUCTS = "SELECT * FROM `product`";
}
