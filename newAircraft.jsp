<%--add new aircraft--%>

<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to AirSP</title>
<link rel="stylesheet" href="loginpage.css"/>
</head>
<body>
	<div class="container">
 <!-- header -->
		<%@include file="header.html"%>
<%
String myAction=request.getParameter("action");

if(myAction!=null && myAction.equals("new")){
	
}else{	
	String AircraftModel=request.getParameter("model");
	int flightnumber=Integer.parseInt(request.getParameter("flightno"));
	int passengercapacity=Integer.parseInt(request.getParameter("capacity"));
	String seatlayout="this is the path of the pic";//request.getParameter("seat");
	
	
	try{
	
	    Class.forName("com.mysql.jdbc.Driver");
		String connURL ="jdbc:mysql://localhost/assignment?user=root&password=root"; 
		String storeProc="{call addAircraft(?,?,?,?)}";
		Connection conn =   DriverManager.getConnection(connURL); 
		CallableStatement cstmt=conn.prepareCall(storeProc);
		cstmt.setString(1,AircraftModel);
		cstmt.setInt(2,flightnumber);
		cstmt.setInt(3,passengercapacity);
		cstmt.setString(4,seatlayout);
		
		int count=cstmt.executeUpdate();
		conn.close();
	}catch (Exception e) {
		 System.err.println("Error :" + e);
		 out.print("---->Error........."+e.toString());
		}
}
%>
<!-- body of content -->

<!-- form for adding new aircraft -->
		<form action="successfuladdition.jsp" method="post">
			
			<!-- AircraftID SHOULD BE RANDOMLY GENERATED AND ALLOCATED TO THE DATABASE AUTOMATICALLY -->
			
			Aircraft model: <input type="text" name="model">
			Aircraft flight number:<input type="text" name="flightno">
			Aircraft passenger capacity: <input type="text" name="capacity">
			Plane Seat layout upload: <input type="file" name="seat" size="50">			<!-- ALLOW USER TO UPLOAD SEAT LAYOUT FROM HARDDRIVE -->
			<input type="submit" value="ADD NEW AIRCRAFT">
			
		</form>
<%-- footer --%>
<%@include file="footer.html"%>
	</div>		
</body>

</html>