<%@ include file="/common/headers.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 
<!DOCTYPE html>
<html>
<head>
	<title>Logout</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body style="margin:0;padding:0">
<br>
<div class="container">
		<div class="container-login100">
			<div class="wrap-login100 border border-success">
				
			<form:form action="/userschangepassword" modelAttribute="pass">
			
				<span class="login100-form-title"> Change Password </span>
					<div> </div> <br>
				<form:errors path="*" style="color:red;"></form:errors>
				<br><br>
					<div class="wrap-input100 validate-input">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
						<input class="input100" type="password" name="password" id="password" onkeyup='check();' required>
						<span class="focus-input100" data-placeholder="New Pasword"></span>
						
					</div>

			 		<div class="wrap-input100 validate-input">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
						<input class="input100" type="password" name="confirm_password" id="confirm_password" onkeyup='check();' required>
						<span class="focus-input100" data-placeholder="ReEnter Password"></span>
						
					</div> 
		

		<div class="container-login100-form-btn">
			<div class="wrap-login100-form-btn">
				<div class="login100-form-bgbtn"></div>
				<button type="submit" class="login100-form-btn" onclick="CheckPassword()">
					Change
				</button>					
			</div>
		</div>					
						
	</form:form>		
					
		</div>
	</div>
</div>

<script type="text/javascript">
function CheckPassword() 
{ 
	if(document.getElementById('password').value ==
	    document.getElementById('confirm_password').value && 
	    document.getElementById('password').value!="" && 
	    document.getElementById('confirm_password').value!="") 
			{ 
			alert('Password Changed')
			return true;
			}
	if(document.getElementById('password').value=="" || 
	    document.getElementById('confirm_password').value=="") 
			{ 
			alert('Password Can Not be Empty')
			return true;
			}
	else
	{ 
		alert('Wrong, Confirm Password Does Not Match...!')
		return false;
	}
}	
</script>

<%@ include file="/common/footers.jsp"%>	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script src="js/pass.js"></script>

</body>
</html>
</html>