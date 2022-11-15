<%@ include file="/common/headers.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item Purchase</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css"/>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.7/css/fixedHeader.dataTables.min.css"/>
 
 <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
 </head>
 <body>
<div class="container-fluid">
<form action="/sales/addNew" method="post" id="addForm">
 <div class="form-inline">
 <sec:authorize access="hasRole('CASHERMOF') or hasRole('CASHERPPA')">
		 <label for="foodItems" class="col-form-label txt2">Food Items: </label>
		   	    <select class="form-control"  id="foodId" name="foodId">
			       	 <c:forEach items="${foodlist}" var="foods">
				     <option value="${foods.foodId}">${foods.foodName}</option>
				   </c:forEach>
				   
			    </select>
			  	<div class="space2"></div>
  	  	
         <label for="recipient-name" class="col-form-label txt2">Quantity: </label>
            <input type="text" class="form-control" id="amount" name="amount" style="width:60px" required>
			<div class="space2"></div>
			<button type="submit" class="btn btn-primary" id="addSales" data-target="addSalesModal">Add</button>
</sec:authorize>		
			<div class="space2"></div>
			<label>Today's Sales: ${today} Birr</label> 
</div>	
</form>
<br>
	<div class="panel panel-primary">
					<table class="table table-striped table-advance table-hover  border-primary 
							table-bordered txt1" id="datatable" >
                <thead class="thead-dark">
                  <tr>
                  
                    <th><i class="icon_table"></i>Sales ID</th>
                    <th><i class="icon_table"></i>Food Name</th>
                    <th><i class="icon_table"></i>Quantity</th>
                    <th><i class="icon_table "></i>Date Of Sales</th>
                    <th><i class="icon_table"></i>User Name</th>
                    <th><i class="icon_table"></i>Unit Price</th> 
                    <th><i class="icon_table"></i>Total</th> 
                      <sec:authorize access="hasRole('CMANAGER')">                                    
                    		<th><i class="icon_cogs"></i>Actions</th>
                    </sec:authorize>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${saleslist}" var="sales">
						<tr>
						    <td>${sales.salesId}</td>
							<td>${sales.foodItems.foodName}</td>
							<td>${sales.amount}</td>
							<td>${sales.dateOfSales}</td>
							<td>${sales.users.userName}</td>
							<td>${sales.salesPrice}</td>
							<td>${sales.totalSales}</td>	
						<sec:authorize access="hasRole('CMANAGER')">												
							<td><a type="button" class="btn btn-warning" id="editButton"
								href="/sales/findById?id=${sales.salesId}">
								<i class="fa fa-edit fa-10x" ></i></a>
							<a type="button" class="btn btn-danger" id="deleteButton"
								href="/sales/delete?id=${sales.salesId}">
								<i class="fa fa-trash fa-10x" ></i>
								</a></td>
							</sec:authorize>
								  
						</tr>
					</c:forEach>
        </tbody>
        
       </table>
	</div>
</div>


<div class="modal fade" id="editModal" tabindex="-1"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update Sale</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="/sales/update" method="put"> 
                              
            <div class="form-group">
            <label for="recipient-id" class="col-form-label">Sales ID:</label>
            <input type="text" class="form-control" id="salesIdEdit" name="salesId" readonly>
          </div>            
                 
          <div class="form-group row">
		    <label for="trainee" class="col-sm-4 col-form-label">Food ID:</label>
		    <div class ="col-sm-6">
			    <select class="form-control"  id="foodIdEdit" name="foodId"  >
			       
			     	 <c:forEach items="${foodlist}" var="foods">
				      <option value="${foods.foodId}">${foods.foodName}
				   </option>
				   </c:forEach>
				   
			    </select>
			    
			    </div>		    
		  </div> 
          
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Amount:</label>
            <input type="text" class="form-control" id="amountEdit" name="amount"  >
          </div>
        
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Date Of Sales:</label>
            <input type="date" class="form-control" id="dateOfSalesEdit" name="dateOfSales"   >
          </div>
        
        <div class="form-group">
            <label for="recipient-name" class="col-form-label">Sales Price:</label>
            <input type="text" class="form-control" id="salesPriceEdit" name="salesPrice" readonly  >
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">User ID:</label>
            <input type="text" class="form-control" id="userIdEdit" name="userId" readonly  >
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


<div class="modal" id="addSalesModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirm Sales</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to Save this sales? </p>
      </div>
      <div class="modal-footer">
      
        <button type="button" class="btn btn-primary" id="confirmSalesButton">Save</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>

<%@ include file="/common/footers.jsp"%>
<script type ="text/javascript"  src="js/sales.js"></script>
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
    	"order": [[ 0, "desc" ]],
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