<%@page import="config.DBCP"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String bookId	 = request.getParameter("bookId");
	String bookName  = request.getParameter("bookName");
	String publisher = request.getParameter("publisher");
	String price 	 = request.getParameter("price");
	String opt		 = request.getParameter("opt");
	
	try{
		Connection conn = DBCP.getConnection();
		String sql = "";
		if(opt.equals("opt_modify")){ // 수정
			sql += "UPDATE `book` SET ";
			sql += "`bookName` = ?, ";
			sql += "`publisher` = ?, ";
			sql += "`price` = ? ";
			sql += "WHERE `bookId` =? ";
		}else if(opt.equals("opt_register")){ // 등록
			sql += "INSERT INTO `book` SET ";
			sql += "`bookName` = ?,";
			sql += "`publisher` = ?, ";
			sql += "`price` = ?, ";
			sql += "`bookId` = ? ";
		}

		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, bookName);
		psmt.setString(2, publisher);
		psmt.setString(3, price);
		psmt.setString(4, bookId);	
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("../book/list.jsp");
%>
