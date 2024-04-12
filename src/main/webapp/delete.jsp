<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
	Integer id = Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_001", "root", "Jagesh@2501");
	PreparedStatement ps = con.prepareStatement("delete from user where id=?");
	ps.setInt(1, id);
	
	ps.execute();
	
	RequestDispatcher rd = request.getRequestDispatcher("FetchData.jsp");
	rd.forward(request,response);
	
%>

</body>
</html>