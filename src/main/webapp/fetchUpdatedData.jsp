<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");

	Integer id = Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_001", "root", "Jagesh@2501");
	PreparedStatement ps = con.prepareStatement("update user set Name=?,email=?,Password=? where id=? ");
	
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, pass);
	ps.setInt(4, id);
	
	ps.executeUpdate();
	
	RequestDispatcher rd = request.getRequestDispatcher("FetchData.jsp");
	rd.forward(request,response);
%>

</body>
</html>