<%-- summary of the four fields that user just input in home page--%>

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
<%@page import="java.text.*" %>
<%@page import="java.util.*" %>

<%
	//search by the origin airport, destination airport, departure and return dates
	String origin = request.getParameter("origin");
	String dest = request.getParameter("dest");
	String deDate = request.getParameter("departureDate");
	String reDate = request.getParameter("returnDate"); //optional
		
	//when return date is chosen so not empty
	if (reDate != "" ) {
		
		try {
		// Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");  
		// Step 2: Define Connection URL
		String connURL="jdbc:mysql://localhost/assignment?user=root&password=root"; 
		// Step 3: Establish connection to URL
    	Connection conn = DriverManager.getConnection(connURL); 
 		// Step 4: Create Statement object
 		// Step 5: Execute SQL Command
		String sqlStr = "select * from flightschedule where originAirport like ? and destinationAirport like ? and departureDate like ? ";

   		 PreparedStatement pstmt = conn.prepareStatement(sqlStr);
    	pstmt.setString(1, origin);
    	pstmt.setString(2, dest);
    	pstmt.setString(3, deDate);
		ResultSet rs = pstmt.executeQuery();
		
		//getting result set for return flight
		PreparedStatement pstmt2 = conn.prepareStatement(sqlStr);
		pstmt2.setString(1, dest);
		pstmt2.setString(2, origin);
		pstmt2.setString(3, reDate); //departure date from destination country represents the return date
		ResultSet rs2 = pstmt2.executeQuery();
	
		//print summary table for the four fields
		out.print("<table border=1>");
		out.print("<tr><th>Origin Airport</th>" + "<th>Destination Airport</th>" + "<th>Departure Date</th>" + "<th>Return Date</th>" + "<th>More Details</th></tr>");				
		while (rs.next() && rs2.next()){
			out.print("<tr><td>"+ rs.getString("originAirport")+"</td><td>" + rs.getString("destinationAirport")+"</td><td>" +rs.getString("departureDate")+"</td><td>"+rs2.getString("departureDate")+"</td><td>"+"<a href='publicFullDetails.jsp?flightScheduleID="+rs.getInt("flightScheduleID")+"&action=view' title='view'>More Details</a>");
			//second out.print for the return flight
			out.print("<tr><td>"+rs2.getString("originAirport")+"</td><td>" + rs2.getString("destinationAirport")+"</td><td>" + rs2.getString("departureDate") +"</td><td>"+null+"</td><td>"+"<a href='publicFullDetails.jsp?flightScheduleID="+rs2.getInt("flightScheduleID")+"&action=view' title='view'>More Details</a>");
		}
		out.print("</table>");
		conn.close(); 
		} catch (Exception e) {
	   	   System.err.println("Error :" + e);
	    }
	}
		else {
			try {
				// Step1: Load JDBC Driver
				Class.forName("com.mysql.jdbc.Driver");  
				// Step 2: Define Connection URL
				String connURL="jdbc:mysql://localhost/assignment?user=root&password=root"; 
				// Step 3: Establish connection to URL
			    Connection conn = DriverManager.getConnection(connURL); 
			 	// Step 4: Create Statement object
			 	// Step 5: Execute SQL Command
				String sqlStr = "select * from flightschedule where originAirport like ? and destinationAirport like ? and departureDate like ? ";

			    PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			    pstmt.setString(1, origin);
			    pstmt.setString(2, dest);
			    pstmt.setString(3, deDate);
				ResultSet rs = pstmt.executeQuery();
				
				//print summary table for the three fields including more details
				out.print("<table border=1>");
				out.print("<tr><th>Origin Airport</th>" + "<th>Destination Airport</th>" + "<th>Departure Date</th>"+ "<th>More Details</th></tr>");
				while (rs.next()){
					out.print("<tr><td>"+rs.getString("originAirport")+"</td><td>" + rs.getString("destinationAirport")+"</td><td>" +rs.getString("departureDate")+"</td><td>"+"<a href='publicFullDetails.jsp?flightScheduleID="+rs.getInt("flightScheduleID")+"&action=view' title='view'>More Details</a>");
				}
				out.print("</table>");
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