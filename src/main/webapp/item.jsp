<%@ include file="/common/headers.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css"/>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.7/css/fixedHeader.dataTables.min.css"/>
 
 <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
 </head>
 <body >
<div class="container">
<div class="form-inline"> 
	<!--  <div class="form-group">
	<button type="button" class="btn btn-success" data-toggle="modal" data-target="#addModal" >
	<i class="fa fa-plus fa-10x" style=" display: inline-block;
  		margin-right: .1em;" aria-hidden="true"></i>New Item</button>
  	</div>
  	-->
  	<div class="form-group">
	<a href="/itemaddNew">
	<button type="button" class="btn btn-success">
	<i class="fa fa-plus fa-10x" style=" display: inline-block;
  		margin-right: .1em;" aria-hidden="true"></i>New Item</button>
  	</a>
  	</div>
  	<div class="space"></div>
  	<div class="form-group">
		<form action="/threshold" method="get">
		<button type="submit" class="btn btn-primary" >Items Below Threshold</button> 
		</form>
	</div>
</div>  
 
<br>
	<div class="panel panel-primary">
					<table class="table table-striped table-advance table-hover border-primary table-bordered txt1" id="datatable"  >
                <thead class="thead-dark bg-success">
                  <tr>
                  
                    <th><i class="icon_table"></i>Item ID</th>
                    <th><i class="icon_table"></i>Item Name</th>
                    <th><i class="icon_table"></i>Description</th>
                    <th><i class="icon_table"></i>Current Quantity</th>
                    <th><i class="icon_table"></i>Measurement</th>
                   <!-- <th><i class="icon_table"></i>Category</th> --> 
                    <th><i class="icon_table"></i>Min Threshold</th>
                                        
                    <th><i class="icon_cogs"></i>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${itemlist}" var="item">
						<tr>
						    <td>${item.id}</td>
							<td>${item.itemName}</td>
							<td>${item.description}</td>
							<td>${item.currentAmount}</td>
							<td>${item.measurement}</td>
						<!-- <td>${item.category}</td> -->	
							<td>${item.threshold}</td>
												
							<td><a type="button" class="btn btn-warning" id="editButton"
								href="/item/findById?id=${item.id}">
								<i class="fa fa-edit fa-10x" ></i></a>
							<a type="button" class="btn btn-danger" id="deleteButton"
								href="/item/delete?id=${item.id}">
								<i class="fa fa-trash fa-10x" ></i>
								</a></td>
							
								  
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
        <h5 class="modal-title" id="exampleModalLabel">New Item</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
        <form action="/item/addNew" method="post">
   
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <label for="recipient-name" class="col-form-label">Item Id:</label>
            <input type="text" class="form-control" id="recipient-name" name="id" disabled="disabled">
          </div>
                       
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Item Name:</label>
            <input type="text" class="form-control" id="recipient-name" name="itemName"  required>
          </div>
          
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Description:</label>
            <input type="text" class="form-control" id="recipient-name" name="description"  >
          </div>
        
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Current Amount:</label>
            <input type="text" class="form-control" id="recipient-name" name="currentAmount"   >
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Measurement:</label><br>
            	  <input type="radio" id="cat1" name="measurement" value="Kilogram">
				  <label for="cat1"> Kilogram</label><br>
				  <input type="radio" id="cat2" name="measurement" value="Litter">
				  <label for="cat2"> Litter</label><br>  
				  <input type="radio" id="cat3" name="measurement" value="number">
				  <label for="cat3"> Number</label><br><br>
          </div>
        
         <div class="form-group">
            <label for="recipient-name" class="col-form-label">Category:</label><br>
            	  <input type="radio" id="cat1" name="category" value="water">
				  <label for="cat1"> Water</label><br>
				  <input type="radio" id="cat2" name="category" value="food">
				  <label for="cat2"> Food</label><br>  
				  <input type="radio" id="cat3" name="category" value="tea and coffee">
				  <label for="cat"> Tea and Coffee</label><br><br>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Threshold:</label>
            <input type="text" class="form-control" id="recipient-name" name="threshold"   >
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
        <h5 class="modal-title" id="exampleModalLabel">Update Item</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="/item/update" method="put"> 
            
          <div class="form-group">
            <label for="recipient-id" class="col-form-label">Item ID:</label>
            <input type="text" class="form-control" id="idEdit" name="id" readonly>
          </div>
        
                    
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">Item Name:</label>
            <input type="text" class="form-control" id="itemNameEdit" name="itemName">
          </div>
        
        <div class="form-group">
            <label for="recipient-email" class="col-form-label">Description:</label>
            <input type="text" class="form-control" id="descriptionEdit" name="description">
          </div>
          
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">Current Quantity:</label>
            <input type="text" class="form-control" id="currentAmountEdit" name="currentAmount" readonly>
          </div>
          <div class="form-group" >
            <label for="recipient-name" class="col-form-label">Measurement:</label><br>
            	<!-- -->   <input type="radio" id="measurementEdit" name="measurement" value="Kilogram">
				  <label for="cat1"> Kilogram</label><br>
				  <input type="radio" id="measurementEdit" name="measurement" value="Kilogram">
				  <label for="cat4"> Kilogram</label><br>
				  <input type="radio" id="measurementEdit" name="measurement" value="Litter">
				  <label for="cat2"> Litter</label><br>  
				  <input type="radio" id="measurementEdit" name="measurement" value="number">
				  <label for="cat3"> Number</label><br><br>
          </div>
        <!--   
         <div class="form-group">
            <label for="recipient-name" class="col-form-label">Category:</label><br>
            	  <input type="radio" id="categoryEdit" name="category" value="water">
				  <label for="cat1"> Water</label><br>
				  <input type="radio" id="categoryEdit" name="category" value="food">
				  <label for="cat2"> Food</label><br>  
				  <input type="radio" id="categoryEdit" name="category" value="tea and coffee">
				  <label for="cat"> Tea and Coffee</label><br><br>
          </div>
           -->
           <div class="form-group">
            <label for="recipient-email" class="col-form-label">Threshold:</label>
            <input type="text" class="form-control" id="thresholdEdit" name="threshold">
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
<script type ="text/javascript"  src="js/item.js"></script>
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