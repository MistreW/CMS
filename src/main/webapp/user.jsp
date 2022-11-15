<%@ include file="/common/headers.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css"/>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.7/css/fixedHeader.dataTables.min.css"/>
 
 <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
 </head>
 <body">
<div class="container-fluid">
<div class="form-inline"> 
	<div class="form-group">
	<a href="/usersaddNew">
	<button type="button" class="btn btn-success">
	<i class="fa fa-plus fa-10x" style=" display: inline-block;
  		margin-right: .1em;" aria-hidden="true"></i>New User</button>
  	</a>
  	</div>
</div>  
 
<br>
	<div class="panel panel-primary">
					<table class="table table-striped table-advance table-hover border-primary table-bordered txt1" id="datatable"  >
                <thead class="thead-dark">
                  <tr>
                  
                    <th><i class="icon_table"></i>User ID</th>
                    <th><i class="icon_table"></i>First Name</th>
                    <th><i class="icon_table"></i>Last Name</th>
                    <th><i class="icon_table"></i>User Name</th>
                    <th><i class="icon_table"></i>Role </th>
                    <th><i class="icon_table"></i>Position</th>
                    <th><i class="icon_table"></i>Password</th>
                    <th><i class="icon_table"></i>Active</th>                                         
                    <th><i class="icon_cogs"></i>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${userlist}" var="users">
						<tr>
						    <td>${users.userId}</td>
							<td>${users.firstName}</td>
							<td>${users.lastName}</td>
							<td>${users.userName}</td>
							<td>${users.role.name}</td>
							<td>${users.position}</td>
					<!-- 	<td>${users.password}</td> -->
							<td>******</td>
							<td>${users.isActive}</td>
							
												
							<td><a type="button" class="btn btn-warning" id="editButton"
								href="/users/findById?id=${users.userId}">
								<i class="fa fa-edit fa-10x" ></i></a>
						<!--  	<a type="button" class="btn btn-danger" id="deleteButton"
								href="/users/delete?id=${users.userId}">
								<i class="fa fa-trash fa-10x" ></i>
								</a>-->
								<a type="button" class="btn btn-danger" id="resetButton"
								href="/users/resetPass?id=${users.userId}">
								<i class="fa fa-unlock-alt fa-10x" ></i> RPW
								</a>
								</td>
							
								  
						</tr>
					</c:forEach>
        </tbody>
        
       </table>
	</div>
</div>
<!--  
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New User</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
        <form action="/users/addNew" method="post">
   
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <label for="recipient-name" class="col-form-label">User Id:</label>
            <input type="text" class="form-control" id="recipient-name" name="userId" disabled="disabled">
          </div>
                       
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">First Name:</label>
            <input type="text" class="form-control" id="recipient-name" name="firstName"  required>
          </div>
          
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Last Name:</label>
            <input type="text" class="form-control" id="recipient-name" name="lastName"  >
          </div>
           <div class="form-group">
            <label for="recipient-name" class="col-form-label">User Name:</label>
            <input type="text" class="form-control" id="recipient-name" name="userName"  required>
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
            <input type="text" class="form-control" id="recipient-name" name="password"   >
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
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>      
        </div>             
        </form>
      </div>
      
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
-->


<div class="modal fade" id="editModal" tabindex="-1"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update User</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="/users/update" method="put"> 
            
          <div class="form-group">
            <label for="recipient-id" class="col-form-label">User ID:</label>
            <input type="text" class="form-control" id="userIdEdit" name="userId" readonly>
          </div>
        
                    
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">First Name:</label>
            <input type="text" class="form-control" id="firstNameEdit" name="firstName">
          </div>
        
        <div class="form-group">
            <label for="recipient-email" class="col-form-label">Last Name:</label>
            <input type="text" class="form-control" id="lastNameEdit" name="lastName">
          </div>
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">User Name:</label>
            <input type="text" class="form-control" id="userNameEdit" name="userName" required>
          </div>
          <div class="form-group row">
		    <label for="trainee" class="col-sm-4 col-form-label">Role ID:</label>
		    <div class ="col-sm-6">
			    <select class="form-control"  id="roleIdEdit" name="roleId"  readonly>
			       
			     	 <c:forEach items="${rolesList}" var="roles">
				      <option value="${roles.roleId}">${roles.name}
				   </option>
				   </c:forEach>
				   
			    </select>
			    
			    </div>		    
		  </div>
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">Position:</label>
            <input type="text" class="form-control" id="positionEdit" name="position" >
          </div>
          
           <div class="form-group">
            <label for="recipient-email" class="col-form-label">Password:</label>
            <input type="password" class="form-control" id="passwordEdit" name="password" readonly>
          </div>
          
          <div class="form-group">
            <label for="recipient-telephone" class="col-form-label">Active:</label>
            <select id="isActiveEdit" name="isActive">
			    <option value="true" selected>True</option>
			    <option value="false">False</option>
			 </select>
          </div>
      
      <div class="modal-footer">
       <button type="submit" class="btn btn-primary">Submit</button> 
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
         </form>
                 
      </div>
    </div>
  </div>
</div>

<div class="modal" id="deleteModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirm Delete</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to delete this record?</p>
      </div>
      <div class="modal-footer">
        <a class="btn btn-primary" id="confirmDeleteButton" href="">Yes, Delete</a>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>

<%@ include file="/common/footers.jsp"%>
<script type ="text/javascript"  src="js/user.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.print.min.js"></script>
<script>
$(document).ready(function() {
    $('#datatable').DataTable( {
    	"iDisplayLength": 15,
        dom: 'Bfrtip',
        buttons: [
            'excel', 'pdf', 'print'
        ]
        } );
} );
</script>

</body>
</html>