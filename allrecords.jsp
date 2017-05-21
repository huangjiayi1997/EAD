<%--newSchedule and newaircraft will point to here after adding in successfully--%>

<%-- showing all records of data--%>

<%-- enabling update and delete --%>

<%--search form--%>
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
	int AircraftID=0;
	String Model="";
	int flightNo=0;
	int PassengerCap=0;
	String Imagepath="";
//variable declaration for flightschedule
	int flightScheduleid=0;
	int aircraftID=0;
	String originAirport="";
	String destinationAirport="";
	
	String origincountry="";
	String destinationcountry="";
	double economycost=0;
	double businessclasscost=0;
	double firstclasscost=0;
	
//datetime
	
//------------variables declaration ends----------------	
    try {
          // Step1: Load JDBC Driver
           Class.forName("com.mysql.jdbc.Driver");

          // Step 2: Define Connection URL
          String connURL ="jdbc:mysql://localhost/assignment?user=root&password=root"; 

          // Step 3: Establish connection to URL
          Connection conn =   DriverManager.getConnection(connURL); 
          // Step 4: Create Statement object
          Statement stmt = conn.createStatement();
			Statement stmt2=conn.createStatement();
          // Step 5: Execute SQL Command
          String sqlStr = "SELECT * FROM aircraft";  
		  String sqlStr1="SELECT * FROM flightschedule";
          ResultSet rs = stmt.executeQuery(sqlStr);
          ResultSet rs1=stmt2.executeQuery(sqlStr1);%>
          
		  <!-- search form : search for aircraft -->
		  <form action="searchaircraft.jsp">
		  Search: <input type="text" placeholder="Aircraft: enter model/flight number " name=searchaircraft>
		  <input type="submit" name="btnSubmit" value="Search">
		  
		  </form>
		  <!-- search form : search for schedule -->
		   <form action="searchschedule.jsp">
		  Search: <input type="text" placeholder=" Schedule: enter country" name=searchschedule>
		  <input type="submit" name="btnSubmit" value="Search">
		  
		  </form>
		  
		  
		  
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
		
		
 <!-- printing schedule table  -->       
         <p>Schedule Records: </p>
		<table border=1 >
		<tr><td>Schedule ID </td><td>Aircraft ID</td><td> Origin Airport</td><td>Destination Airport</td><td>Origin Country</td><td>Destination Country</td><td>Economy Cost</td><td>Business Class Cost</td><td>First Class Cost</td><td>Date and time of departure flight</td><td>date and time of destination arrival flight</td><td>Duration</td><td>Delete</td><td>Update</td>
		<%
		while(rs1.next()){
			flightScheduleid=rs1.getInt(1);
			out.println(
			"<tr align=center>"+"<td>"+rs1.getInt(1)+"</td>"
			+"<td>"+rs1.getString(2)+"</td>"+"<td>"+rs1.getString(3)+"</td>"
			+"<td>"+rs1.getString(4)+"</td>"+"<td>"+rs1.getString(5)+"</td>"
			+"<td>"+rs1.getString(6)+"</td>"+"<td>"+rs1.getString(7)+"</td>"
			+"<td>"+rs1.getString(8)+"</td>"+"<td>"+rs1.getString(9)+"</td>"
			+"<td>"+rs1.getString(10)+"</td>"+"<td>"+rs1.getString(11)+"</td>"
			+"<td>"+rs1.getString(12)+"</td>"
			+"<td><a href='deleteschedule.jsp?flightScheduleid="+flightScheduleid+"&action=delete' title='delete'>Delete</a>"
			+"<td><a href='updateschedule.jsp?flightScheduleid="+flightScheduleid+"&action=update' title='update'>Update</a></td>");
			out.println("</tr>");
			
			
		} %>
		</table>
         
         <% 
         // Step 7: Close connection
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
