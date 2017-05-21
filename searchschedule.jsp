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
//variable declaration for flightschedule
String mySearchTxt = request.getParameter("searchschedule"); //new	
int flightScheduleid=0;
	int aircraftID=0;
	String originAirport="";
	String destinationAirport="";
	
	String origincountry="";
	String destinationcountry="";
	double economycost=0;
	double businessclasscost=0;
	double firstclasscost=0;
		
//------------variables declaration ends----------------	
    try {
          // Step1: Load JDBC Driver
           Class.forName("com.mysql.jdbc.Driver");

          // Step 2: Define Connection URL
          String connURL ="jdbc:mysql://localhost/assignment?user=root&password=root"; 
          String sqlStr = "SELECT * FROM flightschedule WHERE originCountry LIKE ? OR destinationCountry LIKE ?";
          Connection conn =   DriverManager.getConnection(connURL); 
          // Step 4: Create Statement object
          PreparedStatement pstmt = conn.prepareStatement(sqlStr);  //modified
          pstmt.setString(1, "%"+mySearchTxt+"%");//modified
          pstmt.setString(2, "%"+mySearchTxt+"%");//modified
          out.print("===>"+sqlStr+mySearchTxt);
          // Step 5: Execute SQL Command
          //String sqlStr = "SELECT * FROM member";         
          ResultSet rs = pstmt.executeQuery();  //modified%>
<!-- printing schedule table  -->       
         <p>Schedule Records: </p>
		<table border=1 >
		<tr><td>Schedule ID </td><td>Aircraft ID</td><td> Origin Airport</td><td>Destination Airport</td><td>Origin Country</td><td>Destination Country</td><td>Economy Cost</td><td>Business Class Cost</td><td>First Class Cost</td><td>Date and time of departure flight</td><td>date and time of destination arrival flight</td><td>Duration</td><td>Delete</td><td>Update</td>
		<%
		while(rs.next()){
			flightScheduleid=rs.getInt(1);
			out.println(
			"<tr align=center>"+"<td>"+rs.getInt(1)+"</td>"
			+"<td>"+rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"
			+"<td>"+rs.getString(4)+"</td>"+"<td>"+rs.getString(5)+"</td>"
			+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"
			+"<td>"+rs.getString(8)+"</td>"+"<td>"+rs.getString(9)+"</td>"
			+"<td>"+rs.getString(10)+"</td>"+"<td>"+rs.getString(11)+"</td>"
			+"<td>"+rs.getString(12)+"</td>"
			+"<td><a href='deleteschedule.jsp?flightScheduleid="+flightScheduleid+"&action=delete' title='delete'>Delete</a>"
			+"<td><a href='update.jsp?flightScheduleid="+flightScheduleid+"&action=update' title='update'>Update</a></td>");
			out.println("</tr>");
			
			
		} %>
		</table>

          <% // Step 7: Close connection
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