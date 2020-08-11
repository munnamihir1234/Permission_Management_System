<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");
Connection con = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "skill", "skill");
System.out.println("Connection Established");
String uname = (String) session.getAttribute("emp_uname");
PreparedStatement pstmt = con.prepareStatement("delete from request where username=?");
pstmt.setString(1, uname);
int n=pstmt.executeUpdate();
if(n>0)
{
%><a href = "Viewrequest_leader.jsp">back to leader view page</a> <%
}
%>