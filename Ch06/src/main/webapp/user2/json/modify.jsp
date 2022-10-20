<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.UserBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DB"%>
<%@page import="config.DBCP"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	UserBean ub = null;
	
	try{
		Connection conn = DB.getInstance().getConnection();
		String sql = "SELECT * FROM `user2` WHERE `uid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, uid);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			ub = new UserBean();
			ub.setUid(rs.getString(1));
			ub.setName(rs.getString(2));
			ub.setHp(rs.getString(3));
			ub.setAge(rs.getInt(4));
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

	Gson gson = new Gson();
	String jsonData = gson.toJson(ub);
	
	out.print(jsonData);
%>