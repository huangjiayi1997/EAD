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
			String updStr="UPDATE aircraft SET aircraftModel=?,aircraftFlightNumber=?,flightPassengerCapacity=?,imagePath=? WHERE aircraftID="+ aircraft;
		   
			Class.forName("com.mysql.jdbc.Driver");
		   String connURL ="jdbc:mysql://localhost/assignment?user=root&password=root"; 
		   Connection conn =   DriverManager.getConnection(connURL); 
		   PreparedStatement pstmt=conn.prepareStatement(updStr);
			%>
			
	<form name=updateaircraft method="post">
		<p>Update aircraft: <%=aircraft%></p>
			Model: <input type="text" name="model">
			Flight Number: <input type="text" name="flightnumber">
			Passenger Capacity: <input type="text" name="PassengerCap">
			Image Path: <input type="text" name="image"> <!-- when upload form hard drive does this type change?? -->
			<input type="submit" value="UPDATE">
	</form>
<% 	
String model="";
String image="";
int flightnumber=0;
int PassengerCap=0;
model=request.getParameter("model");
 pstmt.setString(1,model);
 flightnumber=Integer.parseInt(request.getParameter("flightnumber"));
pstmt.setInt(2,flightnumber);
 PassengerCap=Integer.parseInt(request.getParameter("PassengerCap"));
pstmt.setInt(3,PassengerCap);
image=request.getParameter("image");
pstmt.setString(4,image);
int count = pstmt.executeUpdate();
	if (count>0)out.println(count+"record updated");
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