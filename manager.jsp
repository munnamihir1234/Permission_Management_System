<%@ page import="java.sql.*" %>
<%
String fname = request.getParameter("fname");
String gender = request.getParameter("gender");
String uname = request.getParameter("uname");
String pwd = request.getParameter("pwd");
String mobile = request.getParameter("mobile");
String email = request.getParameter("email");
int id = (int)(Math.random() * 99999 + 1);
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");
Connection con = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
System.out.println("Connection Established");
PreparedStatement ps = con.prepareStatement("select * from manager where username=? or email=? or mobile=?");
ps.setString(1, uname);
ps.setString(2, email);
ps.setString(3, mobile);
ResultSet rs = ps.executeQuery();
if(rs.next())
{
%>
<h3>Email Id / Username / Mobileno already available</h3><br>
<a href="reg.html">Try Again</a>
<%
}
else
{
PreparedStatement pstmt = con.prepareStatement("insert into manager values(?,?,?,?,?,?,?)");
pstmt.setInt(1, id);
pstmt.setString(2, uname);
pstmt.setString(3, pwd);
pstmt.setString(4, email);
pstmt.setString(6, gender);
pstmt.setString(7, mobile);
pstmt.setString(5, fname);
int i = pstmt.executeUpdate();
if(i>0)
{
%>
<h3>User Registration Successful</h3><br>
<a href="login.html">Go to Login</a>
<%
}
else
{
%>
<h3>User Registration UnSuccessful</h3><br>
<a href="index.html">Try to Register Again</a>
<%
}
}
}
catch(Exception e)
{
out.println(e);
}
%>
