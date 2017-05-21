<%--adding new schedule --%>
<%--database connection --%>
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

if(myAction!=null&& myAction.equals("new")){
	
}
else{
	int aircraftid=Integer.parseInt(request.getParameter("aircraftselection"));
	String Oairport=request.getParameter("originairport");
	 String Dairport=request.getParameter("Destinationairport");
	 String OCountry=request.getParameter("Origincountry");
	 String DCountry=request.getParameter("Destinationcountry");
	double EconomyCost=Double.parseDouble(request.getParameter("ECcost")); 
	double BusinessCost=Double.parseDouble(request.getParameter("Bcost"));
	double firstclasscost=Double.parseDouble(request.getParameter("FCcost"));
//time date duration not added yet
		try{
		    Class.forName("com.mysql.jdbc.Driver");
		   String connURL ="jdbc:mysql://localhost/assignment?user=root&password=root"; 
			String insertstr="INSERT INTO flightschedule(originAirport,destinationAirport,originCountry,destinationCountry,economyCost,businessClassCost,firstClassCost,date_time_of_departueFlight,date_time_of_destinationArrivalFlight,flightTime) VALUES(?,?,?,?,?,?,?,?,?,?) WHERE aircraftID=" + aircraftid;
		   Connection conn =   DriverManager.getConnection(connURL); 
		   Statement stmt=conn.createStatement();
		   PreparedStatement pstmt = conn.prepareStatement(insertstr);
			String sqlStr="SELECT * from aircraft";
			ResultSet rs=stmt.executeQuery(sqlStr);
			pstmt.setString(1,Oairport);
			pstmt.setString(2,Dairport);
			pstmt.setString(3,OCountry);
			pstmt.setString(4,DCountry);
			pstmt.setDouble(5,EconomyCost);
			pstmt.setDouble(6,BusinessCost);
			pstmt.setDouble(7,firstclasscost);
			//date and time [fill in this]
			//date and time [fill in this]
			//duration  [fill in this]
			
%>

<!-- form for insert -->
		<form action="successfuladdition.jsp">
<!-- aircraftID selection: select tag-->

			<label for="select-box1" class="label-select-box1">
				<span class="label-desc">Aircraft ID:</span></label>
					<select id="selectbox1" class="select" name="aircraftselection">
						<%
						rs.beforeFirst();
						while(rs.next()){%>
						<option><%=rs.getInt(1)%>
						
						</option>
						<%}; %>
						
						<!-- edit this to link to database -->
						
					</select>

			Origin Airport: <input type="text" name="originairport">
			Destination Airport: <input type="text" name="Destinationairport">
			Origin Country: <input type="text" name="Origincountry">
			Destination Country: <input type="text" name="Destinationcountry">
			Economy Cost: <input type="text" name="ECcost">
			Business Cost: <input type="text" name="Bcost">
			First Class Cost: <input type="text" name="FCcost">
			Date and Time of departure Flight: <input type="datetime-local" name="country">
			Date and Time of destination arrival Flight: <input type="datetime-local" name="country">
			Flight Time: <input type="text" name="duration">
<!-- add new button -->
			<input id="search" type="submit" name="addnewSchedule" value="ADD NEW SCHEDULE">		
		</form>

<%			





			int count=pstmt.executeUpdate();
			conn.close();}
			catch (Exception e) {
				 System.err.println("Error :" + e);
				 out.print("---->Error........."+e.toString());
				}
}
 
 
 %>
<%--footer --%>
<%@include file="footer.html"%>
	</div>		
</body>

</html>

