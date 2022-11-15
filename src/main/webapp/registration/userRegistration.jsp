<%@ include file="/common/headers.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css"/>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.7/css/fixedHeader.dataTables.min.css"/>
 
 <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
 </head>
 <body>
<div class="container">

<br>
<div class="col-lg-4 col-md-2"></div>
	<div class="panel panel-primary col-lg-5">
	<center>
  <label for="recipient-name" class="col-form-label txt2">User Registration</label>
  </center>
        <form:form action="/userssave" method="post" modelAttribute="users">
        
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <label for="recipient-name" class="col-form-label">User Id:</label>
            <input type="text" class="form-control" id="recipient-name" name="userId" disabled="disabled">
          </div>
                       
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">First Name:</label>
            <input type="text" class="form-control" id="recipient-name" name="firstName"  required>
          <form:errors path="firstName" style="color:red;"></form:errors>
          </div>
          
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Last Name:</label>
            <input type="text" class="form-control" id="recipient-name" name="lastName"  >
          </div>
           <div class="form-group">
            <label for="recipient-name" class="col-form-label">User Name:</label>
            <input type="text" class="form-control" id="recipient-name" name="userName"  required>
          <form:errors path="userName" style="color:red;"></form:errors>
          </div>
          
           <div class="form-group row">
		    <label for="trainee" class="col-sm-4 col-form-label">Role ID:</label>
		    <div class ="col-sm-6">
			    <select class="form-control"  id="roleId" name="roleId"  readonly>
			       
			     	 <c:forEach items="${rolesList}" var="roles">
				      <option value="${roles.roleId}">${roles.name}
				   </option>
				   </c:forEach>
				   
			    </select>
			    
			    </div>		    
		  </div> 
          
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Position:</label>
            <input type="text" class="form-control" id="recipient-name" name="position"   >
          </div>
        <div class="form-group">
            <label for="recipient-name" class="col-form-label">Password:</label>
            <input type="text" class="form-control" id="recipient-name" name="password"  required >
          <form:errors path="password" style="color:red;"></form:errors>
          </div>
          <div class="form-group">
          <label for="recipient-telephone" class="col-form-label">Active:</label>
            <select id="isActive" name="isActive">
			    <option value="true" selected>True</option>
			    <option value="false">False</option>
			 </select>
          </div> 
        
          <div class="form-group">
          <button type="submit" class="btn btn-primary">Save</button>  
          <a href="/users">
          	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>      
       	</a>
        </div>      
        </form:form>
      </div> 
     </div>	

<%@ include file="/common/footers.jsp"%>
<script type ="text/javascript"  src="js/foods.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.print.min.js"></script>

</body>
</html>