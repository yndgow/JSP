<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String custId	 = request.getParameter("custId");
	String name 	 = request.getParameter("name");
	String address	 = request.getParameter("address");
	String phone 	 = request.getParameter("phone");
	String opt		 = request.getParameter("opt");
	
	try{
		Connection conn = DBCP.getConnection();
		
		String sql = "";
		if(opt.equals("opt_modify")){ // 수정
			sql += "UPDATE `customer` SET ";
			sql += "`name` = ?, ";
			sql += "`address` = ?, ";
			sql += "`phone` = ? ";
			sql += "WHERE `custId` =? ";
		}else if(opt.equals("opt_register")){ // 등록
			sql += "INSERT INTO `customer` SET ";
			sql += "`name` = ?,";
			sql += "`address` = ?, ";
			sql += "`phone` = ?, ";
			sql += "`custId` = ? ";
		}

		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, address);
		psmt.setString(3, phone);
		psmt.setString(4, custId);	
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("../customer/list.jsp");
%>
