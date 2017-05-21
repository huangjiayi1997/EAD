<%--searching results for both aircraft  --%>
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
//-----------variables declaration starts------------------
	String mySearchTxt = request.getParameter("searchaircraft"); //new
		int AircraftID=0;
		String Model="";
		int flightNo=0;
		//String flightNo="";
		int PassengerCap=0;
		String Imagepath="";
		
//------------variables declaration ends----------------	
    try {
          // Step1: Load JDBC Driver
           Class.forName("com.mysql.jdbc.Driver");

          // Step 2: Define Connection URL
          String connURL ="jdbc:mysql://localhost/assignment?user=root&password=root"; 
          String sqlStr = "SELECT * FROM aircraft WHERE aircraftModel LIKE ? OR aircraftFlightNumber like ?";
          Connection conn =   DriverManager.getConnection(connURL); 
          // Step 4: Create Statement object
          PreparedStatement pstmt = conn.prepareStatement(sqlStr);  //modified
          pstmt.setString(1, "%"+mySearchTxt+"%");
          pstmt.setString(2, "%"+mySearchTxt+"%");//modified
          // Step 5: Execute SQL Command
          //String sqlStr = "SELECT * FROM member";         
          ResultSet rs = pstmt.executeQuery();%>  

<!-- printing aircraft table -->
	<p>Aircraft Records: </p>
		<table border=1 >
		<tr><td>Aircraft ID </td><td> Model</td><td> Flight Number</td><td>Passenger Capacity</td><td>Image Path</td><td>Delete</td><td>Update</td>
		<%
		while(rs.next()){
			AircraftID=rs.getInt(1);
			out.println(
			"<tr align=center>"+"<td>"+rs.getString(1)+"</td>"
			+"<td>"+rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"
			+"<td>"+rs.getString(4)+"</td>"+"<td>"+rs.getString(5)+"</td>"
			+"<td><a href='delete.jsp?AircraftID="+AircraftID+"&action=delete' title='delete'>Delete</a>"
			+"<td><a href='update.jsp?AircraftID="+AircraftID+"&action=update' title='update'>Update</a></td>");
			out.println("</tr>");
			
			
		} %>
		</table>

          <%// Step 7: Close connection
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
