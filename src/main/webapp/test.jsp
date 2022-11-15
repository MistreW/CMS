<%@ include file="common/headers.jsp"%>
<%@ include file="common/footers.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring</title>
</head>
<body>
<h1 align="center">Fixed asset Registration <s>CMS</s></h1>
		<form action="adduser">
			User ID:   <input type="text" name="id"/><br/><br>
			First Name:<input type="text" name="firstName"/><br/><br>
			Last Name: <input type="text" name="LastName"/><br/><br>
			<input type="submit" value="Save"/><br>
		<!-- 	<button type="submit">BUTTONE</button> -->
		</form>
		
		<br/><br>
		<form action="updateuser">
			User ID:   <input type="text" name="id"/><br/><br>
			First Name:<input type="text" name="firstName"/><br/><br>
			Last Name: <input type="text" name="LastName"/><br/><br>
			<input type="submit" value="Update"/><br>
		</form>
		<br/><br>
		
		<form action="getuser">
		User ID: <input type="text" name="id"/><br/><br>
			<input type="submit" value="Search">
			
		</form>
		
		<form action="deletone">
		<br>
		User ID: <input type="text" name="id"/><br/><br>
			<input type="submit" value="Delete">
		</form>

</body>
</html>