<%@ page import="java.sql.*" %>
<%
String username =(String)session.getAttribute("uname");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");
Connection con = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
System.out.println("Connection Established");
PreparedStatement pstmt = con.prepareStatement("select * from request where username=?");
pstmt.setString(1,username);
ResultSet rs = pstmt.executeQuery();
if(rs.next()){
%>
<table align=center border=2>
<tr>
<th>ID</th>
<th>Username</th>
<th>Reason</th>
<th>Leader Status</th>
<th>Manager Status</th>
<th>Final Status</th>
</tr>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
</tr>
</table>
<%
if(rs.getString(6).equals("Accept")){
%>
<a href="letter.jsp">click to generate letter</a>
<%}
}
}
catch(Exception e)
{
out.println(e);
}
%>