<%@page import="java.time.LocalDate"%>

<%@ include file="/common/headers.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css"/>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.7/css/fixedHeader.dataTables.min.css"/>
 
 <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
 </head>
 <body >
<div class="container">
<div class="form-inline">
<div class="col-lg-4 col-md-4 form-inline">
<sec:authorize access="hasRole('MAIN')">
<form:form action="/purchaseItemRequestsaddNew" method="post" modelAttribute="purchaseRequest">
<form:errors path="*" style="color:red;"></form:errors>

 <div class="form-inline">
		 <label for="trainee" class="col-form-label txt2">Item: </label>
		   	    <select class="form-control"  id="itemId" name="itemId"  >
			       	 <c:forEach items="${itemlist}" var="items">
				     <option value="${items.id}">${items.itemName}</option>
				   </c:forEach>
				   
			    </select>
			  	<div class="space2"></div>
  	  	
            <label for="recipient-name" class="col-form-label txt2">Quantity: </label>
            <input type="text" class="form-control" id="amountRequested" name="amountRequested" style="width:60px">
          	<div class="space2"></div>
			<input type="hidden" id="batchId" name="batchId"   value="${bid}">
			<input type="hidden" id="requestNumber" name="requestNumber"  value="${reqNum}" >
			<button type="submit" class="btn btn-primary">Add</button>
</div>	
</form:form>
</sec:authorize>
</div>
<div class="col-lg-4 col-md-4 form-inline">
	
	<label for="recipient-name" class="col-form-label">Total Request: ${reqNum-1}</label> 
   	<div class="space2"></div>
	<label for="recipient-name" class="col-form-label">Total Price: ${price} Birr</label> 
		<div class="space2"></div>
</div>		
<div class="col-lg-4 col-md-4 form-inline">
  	<div class="form-group">
		<form action="/purchaseBatchItems" method="get">
		<button type="submit" class="btn btn-primary">Done</button> 
		</form>
	</div>
	<div class="space2"></div>
	<!-- 
	<div class="form-group">
		<form action="/purchaseBatchItems" method="get">
		<button type="submit" class="btn btn-danger">Discard</button> 
		</form>
	</div>
	 -->
	<sec:authorize access="hasRole('CMANAGER')">
	<div class="space2"></div>
	<div class="form-group">
		<form action="/purchaseItemRequests/approve" method="get">
		<button type="submit" class="btn btn-primary">Approve</button> 
		</form>
	</div>
	<div class="space2"></div>
	<div class="form-group">
		<form action="/purchaseItemRequests/reject" method="get">
		<button type="submit" class="btn btn-danger">Reject</button> 
		</form>
	</div>
	</sec:authorize>  
	
	<sec:authorize access="hasRole('ACCOUNTANT')">
	<div class="space2"></div>
	<div class="form-group">
		<form action="/purchaseItemRequests/estimate" method="get">
		<button type="submit" class="btn btn-success">Complete Estimation</button> 
		</form>
	</div>
	</sec:authorize>
</div>

</div>


<br>

	<div class="panel panel-primary">
					<table class="table table-striped table-advance table-hover border-primary table-bordered txt1" id="datatable"  >
                <thead class="thead-dark">
                  <tr>
                    <th><i class="icon_table"></i>Batch ID</th>
                    <th><i class="icon_table"></i>Request Number</th>
                    <th><i class="icon_table"></i>Item Name</th>
                    <th><i class="icon_table "></i>Requested Quantity</th>
                    <th><i class="icon_table "></i>Measurement</th>
                 <!-- <th><i class="icon_table"></i>Date of Request</th>
                    <th><i class="icon_table"></i>Requested By</th> -->   
                    <th><i class="icon_table"></i>Estimation</th>
                                                            
                    <th><i class="icon_cogs"></i>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${itemRequestlist}" var="itemRequest">
						<tr>
						    <td>${itemRequest.batchId}</td>
							<td>${itemRequest.requestNumber}</td>
							<td>${itemRequest.item.itemName}</td>
							<td>${itemRequest.amountRequested}</td>
							<td>${itemRequest.item.measurement}</td>
						<!--<td>${itemRequest.dateOfRequest}</td>
							<td>${itemRequest.requestedBy}</td>  -->	
							<td>${itemRequest.estimatedPrice}</td>
																			
							<td><a type="button" class="btn btn-warning" id="editButton"
								href="/purchaseItemRequests/findById?id=${itemRequest.txId}">
								<i class="fa fa-edit fa-10x" ></i></a>
							<a type="button" class="btn btn-danger" id="deleteButton"
								href="/purchaseItemRequests/delete?id=${itemRequest.txId}">
								<i class="fa fa-trash fa-10x" ></i>
								</a></td>
							
								  
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
        <h5 class="modal-title" id="exampleModalLabel">Update Purchase Request</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="/purchaseItemRequests/update" method="put"> 
            <div class="form-group ${status.error ? 'has-error' : ''}">
            <label for="recipient-id" class="col-form-label">Txn ID:</label>
            <input type="text" class="form-control" id="txIdEdit" name="txId" readonly>
          </div>
                              
            <div class="form-group">
            <label for="recipient-id" class="col-form-label">Batch ID:</label>
            <input type="text" class="form-control" id="batchIdEdit" name="batchId" readonly>
          </div>    
                  
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Request Number:</label>
            <input type="text" class="form-control" id="requestNumberEdit" name="requestNumber" readonly >
          </div>  
               
          <div class="form-group row">
		    <label for="trainee" class="col-sm-4 col-form-label">Item ID:</label>
		    <div class ="col-sm-6">
			    <select class="form-control"  id="itemIdEdit" name="itemId"  readonly>
			       
			     	 <c:forEach items="${itemlist}" var="items">
				      <option value="${items.id}">${items.itemName}
				   </option>
				   </c:forEach>
				   
			    </select>
			    
			    </div>		    
		  </div> 
          
           <div class="form-group">
            <label for="recipient-name" class="col-form-label">Requested Quantity:</label>
            <input type="text" class="form-control" id="amountRequestedEdit" name="amountRequested"   >
          </div>
          
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Estimated Price:</label>
            <input type="text" class="form-control" id="estimatedPriceEdit" name="estimatedPrice"   >
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
<script type ="text/javascript"  src="js/purchaseRequest.js"></script>
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
    	"iDisplayLength": 5,
        dom: 'Bfrtip',
        buttons: [
            'excel', 'pdf', 'print'
        ]
        } );
} );
</script>

</body>
</html>