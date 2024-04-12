<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
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
	PreparedStatement ps = con.prepareStatement("select * from user where id=?");
	ps.setInt(1, id);
	
	ResultSet rs = ps.executeQuery();
	
	 rs.next();
%>
	<form action="fetchUpdatedData.jsp" method ="post">
	Id <input type = "number" name ="id" value="<%=rs.getInt(1) %>"  readonly="true">
	Name <input type = "text" name = "name" value="<%=rs.getString(2) %>">
	Email <input type = "email" name ="email" value="<%=rs.getString(3)%>">	
	Password <input type = "password" name ="pass" value="<%=rs.getString(4) %>">	
	<input type = "submit">
	</form>		
	

</body>
</html>