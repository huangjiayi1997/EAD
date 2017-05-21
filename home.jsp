<%--database connection --%>
<%@page import="java.sql.*" %>
<%int id=0;
String name="";
String mypwd="";

try{
	// Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");

   // Step 2: Define Connection URL
   String connURL ="jdbc:mysql://localhost/assignment?user=root&password=root"; 

   // Step 3: Establish connection to URL
   Connection conn =   DriverManager.getConnection(connURL); 
   // Step 4: Create Statement object
	Statement stmt = conn.createStatement();
	String sqlStr = "select * from flightschedule";
	ResultSet rs = stmt.executeQuery(sqlStr);
   	
 %>
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
<%--form for public --%>
	<div id="publicform">
		<form  action ="summary.jsp">
			<div class="SelectBox">

<%-- origin selection --%>
				<label for="select-box1" class="label-select-box1">
					<span class="label-desc">Flying From:</span></label>
					<select id="selectbox1" class="select" name="origin" required>
						
					<% while(rs.next()){%>
					<option><%= rs.getString(3) %></option>
					<%} %>
					<!--EDIT THIS TO THE CORRECT ONE  -->
					
					</select>
			</div>
			
<%--for public --%>
<%-- departure location selection --%>
			<div class="SelectBox">
				<label for="select-box1" class="label-select-box2">
					<span class="label-desc">Flying To:</span></label>
					<select id="selectbox1" class="select" name="dest" required>
						
						<% 
						rs.beforeFirst(); // point back to first row
						while(rs.next()){%>
					<option><%= rs.getString(4) %></option>
					<%} %>
					<!--EDIT THIS TO THE CORRECT ONE  -->
					
					</select>
			</div>
						
<%-- return/one way selection --%>
			<div class="radioselection">
				<input type="radio" name="ticketSelection" value="Return" checked>Return<br>
				<input type="radio" name="ticketSelection" value="One-Way">One-Way
			</div>
		
				
<%--departure date selection--%>
			Departure Date: <input type="date" name="departureDate" required>
			
<%--return date selection - this is an optional field --%>
			Return Date:<input type="date" name="returnDate" value="">
			
			
<%-- search button --%>
			<input id="search" type="submit" name="search" value="Search">		
		</form>
		</div>
		
<%-- footer --%>
<%@include file="footer.html"%>
<%
conn.close();}
catch (Exception e) {
 System.err.println("Error :" + e);
 out.print("---->Error........."+e.toString());
}%>

</div>		
</body>


</html>