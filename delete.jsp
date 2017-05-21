<%--allowing delete in searchaircraft, searchschedule,allrecords --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to AirSP</title>
<link rel="stylesheet" href="loginpage.css"/>
</head>
<body>
<div class="container">
<%@include file="header.html"%>
<%@page import ="java.sql.*"%>
<%
String action=request.getParameter("action");

if(action==null) {}
else{
	
	int aircraft=Integer.parseInt(request.getParameter("AircraftID"));
try{
			String delStr="DELETE FROM aircraft where aircraftID ="+aircraft;
		   
			Class.forName("com.mysql.jdbc.Driver");
		   String connURL ="jdbc:mysql://localhost/assignment?user=root&password=root"; 
		   Connection conn =   DriverManager.getConnection(connURL); 
		   PreparedStatement pstmt=conn.prepareStatement(delStr);
		  
			int count = pstmt.executeUpdate(delStr);
	
	if (count>0)out.println(count+"record deleted");
	conn.close();
     } catch (Exception e) {
        System.err.println("Error :" + e);
        out.print("---->Error........."+e.toString());
     }}

     %>
	

<%-- footer --%>
<%@include file="footer.html"%>

</div>		
</body>


</html>