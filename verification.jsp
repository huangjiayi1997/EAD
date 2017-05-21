<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to AirSP</title>
<link rel="stylesheet" href="loginpage.css"/>
</head>
<body>
<div class="container">
	<!-- adding header -->
	<%@include file= "header.html" %>

<%

	String user=request.getParameter("username"); 
	String pwd=request.getParameter("password");
//----------------------------------------------------

    try {
          // Step1: Load JDBC Driver
           Class.forName("com.mysql.jdbc.Driver");

          // Step 2: Define Connection URL
          String connURL ="jdbc:mysql://localhost/assignment?user=root&password=root"; 
          String storeProc = "{call checkuser(?,?)}"; //modified
          Connection conn =   DriverManager.getConnection(connURL); 
          CallableStatement cstmt = conn.prepareCall(storeProc);// modified
          cstmt.setString(1,user); //new
          cstmt.setString(2,pwd);	//new
          ResultSet rs = cstmt.executeQuery();  //modified

if (rs.next()){
	user = rs.getString("adminID");
	pwd = rs.getString("password");
	out.print("<p>Welcome back "+ user + "!<p>");
	//response.sendRedirect("new.jsp");
	%>
	<%--menu panel for admin --%>
	<ul id=adminpanel>
	<li><a href="newSchedule.jsp?action=new">ADD NEW FLIGHT SCHEDULE</a></li>
	<li><a href="newAircraft.jsp?action=new">ADD NEW AIRCRAFT</a></li>
	<li><a href="allrecords.jsp">UPDATE DATABASE RECORD</a></li>
	</ul> 
	
<%}
else{
	out.print("Error: please enter an valid ID and password");
}

conn.close();
} catch (Exception e) {
System.err.println("Error :" + e);
out.print("---->Error........."+e.toString());
}

%>
<%-- footer --%>
<%@include file="footer.html"%>
</div>		
</body>


</html>