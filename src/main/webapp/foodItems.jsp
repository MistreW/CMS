<%@ include file="/common/headers.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Foods</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css"/>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.7/css/fixedHeader.dataTables.min.css"/>
 
 <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
 </head>
 <body>
<div class="container">
	<div class="form-group">
	        <form action="/foodsaddNew" method="post">
        			<div class="form-group">
						<button type="submit" class="btn btn-success">
						<i class="fa fa-plus fa-10x" style=" display: inline-block;
	  						margin-right: .1em;"></i> New Food</button> 
			  	</div>             
        </form>		
  	</div>

	<div class="panel panel-primary">
			<table class="table table-striped table-advance table-hover border-primary table-bordered txt1" id="datatable"  >
                <thead class="thead-dark">
                  <tr>
                  
                    <th><i class="icon_table"></i>Food ID</th>
                    <th><i class="icon_table"></i>Food Name</th>
                    <th><i class="icon_table"></i>Category</th>
                    <th><i class="icon_table"></i>Current Price</th>
                    <th><i class="icon_cogs"></i>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${foodlist}" var="foods">
						<tr>
						    <td>${foods.foodId}</td>
							<td>${foods.foodName}</td>
							<td>${foods.category}</td>
							<td>${foods.currentPrice}</td>
													
												
							<td><a type="button" class="btn btn-warning" id="editButton"
								href="/foods/findById?id=${foods.foodId}">
								<i class="fa fa-edit fa-10x" ></i></a>
							<a type="button" class="btn btn-danger" id="deleteButton"
								href="/foods/delete?id=${foods.foodId}">
								<i class="fa fa-trash fa-10x" ></i>
								</a></td>
							
								  
						</tr>
					</c:forEach>
        </tbody>
        
       </table>
	</div>
</div>
<!-- <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!--   <div class="modal-dialog" role="document"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title" id="exampleModalLabel">New Food Item</h5> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
      
<!--       <div class="modal-body"> -->
<%--         <form action="/foods/addNew" method="post" id="adduser" name =""> --%>
<!--         <div class="form-group"> -->
<!--             <label for="recipient-name" class="col-form-label">Food Id:</label> -->
<!--             <input type="text" class="form-control" id="recipient-name" name="foodId" disabled="disabled"> -->
<!--           </div> -->
                       
<%--           <div class="form-group"  ${status.error ? 'has-error' : ''}> --%>
<!--             <label for="recipient-name" class="col-form-label">First Name:</label> -->
<!--             <input type="text" class="form-control" id="recipient-name" name="foodName"  required> -->
<%--             <form:errors path="foodName"></form:errors> --%>
<!--           </div> -->
          
         
<%--           <div class="form-group"  ${status.error ? 'has-error' : ''}> --%>
<!--             <label for="recipient-name" class="col-form-label">Current Price:</label> -->
<!--             <input type="text" class="form-control" id="currentPrice" name="currentPrice"> -->
<%--            <form:errors path="currentPrice"></form:errors>  --%>

<!--           </div> -->
              
<!--           <div class="form-group"> -->
<!--           <label for="category" class="col-form-label">Category:</label> -->
<!--             <select id="category" name="category"> -->
<!-- 			    <option value="Food" selected>Food</option> -->
<!-- 			    <option value="Hot-Drink">Hot-Drink</option> -->
<!-- 			    <option value="Cold-Drink">Cold-Drink</option> -->
<!-- 			 </select> -->
<!--           </div>  -->
        
<!--           <div class="form-group"> -->
<!--           <button type="submit" class="btn btn-primary">Save</button>   -->
<!--           <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>       -->
<!--         </div>              -->
<%--         </form> --%>
<!--       </div> -->
      
<!--       <div class="modal-footer"> -->
        
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->

<div class="modal fade" id="editModal" tabindex="-1"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update Food</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="/foods/update" method="post" modelAttribute="foodedit"> 
            
          <div class="form-group">
            <label for="recipient-id" class="col-form-label">Food ID:</label>
            <input type="text" class="form-control" id="foodIdEdit" name="foodId" readonly>
          </div>
         
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">Food Name:</label>
            <input type="text" class="form-control" id="foodNameEdit" name="foodName">
            <form:errors path="foodName" style="color:red;"></form:errors>
          </div>
        
        <div class="form-group">
            <label for="recipient-email" class="col-form-label">Current Price:</label>
            <input type="text" class="form-control" id="currentPriceEdit" name="currentPrice">
          <form:errors path="currentPrice" style="color:red;"></form:errors>
          </div>
                 
          <div class="form-group">
            <label for="category" class="col-form-label">Category:</label>
            <select id="categoryEdit" name="category">
			    <option value="Food" selected>Food</option>
			    <option value="Hot-Drink">Hot-Drink</option>
			    <option value="Cold-Drink">Cold-Drink</option>
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
<script type ="text/javascript"  src="js/foods.js"></script>
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
    	"iDisplayLength": 10,
        dom: 'Bfrtip',
        buttons: [
            'excel', 'pdf', 'print'
        ]
        } );
} );
</script>

</body>
</html>