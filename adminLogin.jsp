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
<!-- form for admin login -->
<div id="adminloginform">
			<form id="adminform" action="verification.jsp">
				<label for="username">Login ID: </label>
					<input type="text" id="username" name="username">
				<label for="password">Password: </label>
					<input type="password" id="password" name="password">
				<input type="submit" name="sumission" value="Login">
			</form>
</div>
<%-- footer --%>
<%@include file="footer.html"%>
</div>			
</body>

</html>