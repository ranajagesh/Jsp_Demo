<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
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
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_001", "root", "Jagesh@2501");
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select * from user");
%>

<table cellPadding="20px" border="1">
	<th>id</th>
	<th>name</th>
	<th>email</th>
	<th>password</th>
	
	
	<%	while(rs.next()) {%>
			
		<tr> 
			<td><%= rs.getInt(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			<td><a href= "delete.jsp?id=<%=rs.getInt(1)%>">Delete</a></td>
			<td> <a href = "updateForm.jsp?id=<%= rs.getInt(1) %>">Update</a></td>
		</tr>
	<%} %>
		
</table>

</body>
</html>