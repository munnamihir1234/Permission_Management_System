<%@ page import="java.sql.*" %>
<%
String username = request.getParameter("uname");
String password = request.getParameter("pwd");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");
Connection con = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
System.out.println("Connection Established");
PreparedStatement pstmt = con.prepareStatement("select * from manager where username=? and password=?");
pstmt.setString(1,username);
pstmt.setString(2,password);
ResultSet rs = pstmt.executeQuery();
if(rs.next())
{
//session.setAttribute("fname", rs.getString("fullname"));
session.setAttribute("uname", username);
session.setAttribute("pwd", password);
// session.setMaxInactiveInterval(100);
// response.sendRedirect("success.html");
out.println("LOGIN SUCCESSFUL");
%>
<a href="Viewrequest_manager.jsp">CLICK TO view requests</a>
<%
}
else
{
%>
<h3>LOGIN FAILED</h3><br>
<%
}
}
catch(Exception e)
{
out.println(e);
}
%>