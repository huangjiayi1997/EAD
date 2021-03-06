<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to AirSP</title>
<link rel="stylesheet" href="loginpage.css"/>
</head>
<body>
<div class="container">
<%--header --%>
<%@include file="header.html"%>


<%@ page import="java.sql.*" %>
<%
//get action done from summary page
	String action=request.getParameter("action");

	if(action==null) {
	
	}
	else {
		//get flight schedule from summary page
		int flightScheduleID = Integer.parseInt(request.getParameter("flightScheduleID"));
		String origin=request.getParameter ("orgin");
		String dest = request.getParameter("dest");
		String deDate = request.getParameter("departureDate");
		String reDate = request.getParameter("returnDate");
	try {
    // Step1: Load JDBC Driver
     Class.forName("com.mysql.jdbc.Driver");

    // Step 2: Define Connection URL
    String connURL ="jdbc:mysql://localhost/assignment?user=root&password=root"; 

    // Step 3: Establish connection to URL
    Connection conn = DriverManager.getConnection(connURL); 

    String sqlStr = "SELECT * FROM flightschedule f, aircraft a WHERE a.aircraftID = f.aircraftID and flightScheduleID = ?"; 
	// Step 4: Create Statement object

    //using prepared statement
    PreparedStatement pstmt = conn.prepareStatement(sqlStr); 
    pstmt.setInt(1,flightScheduleID);
    ResultSet rs = pstmt.executeQuery();%>
    <table border=1>
    <tr>
    <td>Origin Airport</td>
    <td>Destination Airport</td>
    <td>Aircraft Model</td>
    <td>Flight number</td>
    <td>Economy cost</td>
    <td>Business cost</td>
    <td>First class cost</td>
    <td>Departure Date</td>
    <td>Departure time</td>
    <td>Arrival Date</td>
    <td>Arrival time</td>
    <td>Seat Map</td>
    </tr>
    <%
    if(rs.next()){
    	out.println(rs.getString(3));
      	out.println(
    			"<tr align=center>"+"<td>"+rs.getString(3)+"</td>" 
      	         +"<td>"+rs.getString(4)+"</td> " +
      			 "<td>" + rs.getString("aircraftModel") + "</td>"
      					+"<td>" + rs.getString("aircraftFlightNumber") + "</td>"
      					+"<td>" + rs.getDouble("economyCost") + "</td>"
      					+"<td>" + rs.getDouble("businessClassCost") + "</td>"
      					+"<td>" + rs.getDouble("firstClassCost") + "</td>"
      					+"<td>" + rs.getString("departureDate") + "</td>"
      					+"<td>" + rs.getString("departureTime") + "</td>"
      					+"<td>" + rs.getString("arrivalDate") + "</td>"
      					+"<td>" + rs.getString("arrivalTime") + "</td>"
      					+"<td>" + rs.getString("imagePath") + "</td>"
      					);
    	out.println("</tr>");
    	%>
    	</table>
   <%  }
    else{out.print("no more records found");}// Step 7: Close connection
    conn.close();
	} catch (Exception e) {
  	System.err.println("Error :" + e);
	}
	}
%>

<%-- footer --%>
<%@include file="footer.html"%>

</div>		
</body>

</html>