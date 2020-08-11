<%@ page import="java.sql.*" %>
<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");
Connection con = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
System.out.println("Connection Established");
int id = Integer.parseInt(request.getParameter("id"));
String uname = request.getParameter("uname");
String button = request.getParameter("button");
PreparedStatement pstmt = con.prepareStatement("update request set status_2=?,status_3=? where username=? and id=?");
pstmt.setString(1,button);
pstmt.setString(2,button);
pstmt.setString(3,uname);
pstmt.setInt(4,id);
int n = pstmt.executeUpdate();
if(n>0){
%><h4>Updated</h4>
<a href="home.html">Home</a><%
}
else{
%><h4>Not Updated or Invalid Credentials</h4><%
}
}
catch(Exception e)
{
out.println(e);
}
%>