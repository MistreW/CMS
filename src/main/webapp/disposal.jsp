<%@ page import="java.lang.String"%>
        	
<%@ include file="/common/headers.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Disposal</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css"/>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.7/css/fixedHeader.dataTables.min.css"/>
 
 <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
 </head>
 <body>
  <center> <b class="txt2"><u>List of Disposal Requests</u></b></center>
<div class="container-fluid">
<sec:authorize access="hasRole('MAIN')">
<div class="form-inline"> 
	<div class="form-group">
	<a href="/disposalAddNew">
	<button type="button" class="btn btn-success">
	<i class="fa fa-plus fa-10x" style=" display: inline-block;
  		margin-right: .1em;" aria-hidden="true"></i>New Disposal</button>
  	</a>
  	</div>
</div>  
 </sec:authorize>
<br>
	<div class="panel panel-primary">
					<table class="table table-striped border-primary table-advance table-hover table-bordered txt1" id="datatable"  >
                <thead class="thead-dark">
                  <tr>
                  	<!--<th><i class="icon_table"></i>ID</th>  -->
                    <th><i class="icon_table"></i>Item </th>
                    <th><i class="icon_table"></i>Quantity</th>
                     <th><i class="icon_table"></i>Mes</th>
                    
                    <th><i class="icon_table"></i>Reason</th>
                    <th><i class="icon_table"></i>Request Date</th>
                    <th><i class="icon_table"></i>Requested By</th>
                    <th><i class="icon_table"></i>Approval Data</th>
                    <th><i class="icon_table"></i>Approved By</th>
                    <th><i class="icon_table"></i>Status</th>
                                        
                    <th><i class="icon_cogs"></i>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${disposalList}" var="disposal">
						<tr>
						<!--  <td>${disposal.disposalId}</td>-->	
						    <td>${disposal.item.itemName}</td>
							<td>${disposal.amountRequested}</td>
							<td>${disposal.item.measurement}</td>
							<td>${disposal.reason}</td>
							<td>${disposal.dateOfRequest}</td>
							<td>${disposal.requestedBy}</td>
							<td>${disposal.dateOfApproval}</td>
							<td>${disposal.approvedBy}</td>
							<td>${disposal.status}</td>
							
												
							<td>
							<sec:authorize access="hasRole('MAIN')">
							<a type="button" class="btn btn-warning" id="editButton"
								href="/disposal/findById?id=${disposal.disposalId}">
								<i class="fa fa-edit fa-10x" ></i></a>
							<a type="button" class="btn btn-danger" id="deleteButton"
								href="/disposal/delete?id=${disposal.disposalId}">
								<i class="fa fa-trash fa-10x" ></i>
								</a>
							</sec:authorize>
							
							<sec:authorize access="hasRole('CMANAGER')">
								<a type="button" class="btn btn-primary" id="approveButton"
								href="/disposal/approve?id=${disposal.disposalId}">
								
								<i class="fa fa-check fa-10x" >Appr</i>
								
								</a>
								<a type="button" class="btn btn-danger" id="rejectButton"
								href="/disposal/reject?id=${disposal.disposalId}">
								<i class="fa fa-close fa-10x" >Rej</i>
								</a>	</sec:authorize>								
							
							</td>
							
								  
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
<!--         <h5 class="modal-title" id="exampleModalLabel">New Item Disposal</h5> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
      
<!--       <div class="modal-body"> -->
<%--         <form action="/disposal/addNew" method="post"> --%>
   
<%--           <div class="form-group ${status.error ? 'has-error' : ''}"> --%>
<!--             <label for="recipient-name" class="col-form-label">Disposal Id:</label> -->
<!--             <input type="text" class="form-control" id="recipient-name" name="disposalId" disabled="disabled"> -->
<!--           </div> -->
          
<!--           <div class="form-group row"> -->
<!-- 		    <label for="trainee" class="col-sm-4 col-form-label">Item ID:</label> -->
<!-- 		    <div class ="col-sm-6"> -->
<!-- 			    <select class="form-control"  id="itemId" name="itemId"  > -->
			       
<%-- 			     	 <c:forEach items="${itemlist}" var="items"> --%>
<%-- 				      <option value="${items.id}">${items.itemName} --%>
<!-- 				   </option> -->
<%-- 				   </c:forEach> --%>
				   
<!-- 			    </select> -->
			    
<!-- 			    </div>		     -->
<!-- 		  </div>             -->
<!--           <div class="form-group"> -->
<!--             <label for="recipient-name" class="col-form-label">Amount:</label> -->
<!--             <input type="text" class="form-control" id="recipient-name" name="amountRequested"  required> -->
<!--           </div> -->
          
<!--           <div class="form-group"> -->
<!--             <label for="recipient-name" class="col-form-label">Reason:</label> -->
<!--             <input type="text" class="form-control" id="recipient-name" name="reason"  > -->
<!--           </div> -->
        
<!--          <div class="form-group">
<!--             <label for="recipient-name" class="col-form-label">Date Of Request:</label> -->
<!--             <input type="date" class="form-control" id="recipient-name" name="dateOfRequest"   > -->
<!--           </div> -->
          
<!--            <div class="form-group"> -->
<!--             <label for="recipient-name" class="col-form-label">Requested By:</label> -->
<!--             <input type="text" class="form-control" id="recipient-name" name="requestedBy"   > -->
<!--           </div> -->
          
<!--            <div class="form-group"> -->
<!--             <label for="recipient-name" class="col-form-label">Date Of Approval:</label> -->
<!--             <input type="date" class="form-control" id="recipient-name" name="dateOfApproval"   > -->
<!--           </div> -->
          
<!--           <div class="form-group"> -->
<!--             <label for="recipient-name" class="col-form-label">Approved By:</label> -->
<!--             <input type="text" class="form-control" id="recipient-name" name="approvedBy"   > -->
<!--           </div> -->
          
<!--           <div class="form-group"> -->
<!--             <label for="recipient-name" class="col-form-label">Status:</label> -->
<!--             <input type="text" class="form-control" id="recipient-name" name="status"   > -->
<!--           </div> -->
<!--       -->    -->
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
        <h5 class="modal-title" id="exampleModalLabel">Update Disposal</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="/disposal/update" method="put"> 
            
          <div class="form-group">
            <label for="recipient-id" class="col-form-label">Dispoal ID:</label>
            <input type="text" class="form-control" id="disposalIdEdit" name="disposalId" readonly>
          </div>
        <div class="form-group row">
		    <label for="trainee" class="col-sm-4 col-form-label">Item ID:</label>
		    <div class ="col-sm-6">
			    <select class="form-control"  id="itemIdEdit" name="itemId"  >
			       
			     	 <c:forEach items="${itemlist}" var="items">
				      <option value="${items.id}">${items.itemName}
				   </option>
				   </c:forEach>
				   
			    </select>
			    
			    </div>		    
		  </div>
                    
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">Quantity Requested:</label>
            <input type="text" class="form-control" id="amountRequestedEdit" name="amountRequested">
          </div>
        
        <div class="form-group">
            <label for="recipient-email" class="col-form-label">Reason:</label>
            <input type="text" class="form-control" id="reasonEdit" name="reason">
          </div>
      <!--    
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">Date Of Request:</label>
            <input type="date" class="form-control" id="dateOfRequestEdit" name="dateOfRequest" readonly>
          </div>
          
           <div class="form-group">
            <label for="recipient-email" class="col-form-label">Requested By:</label>
            <input type="text" class="form-control" id="requestedByEdit" name="requestedBy">
          </div>
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">Date Of Approval:</label>
            <input type="date" class="form-control" id="dateOfApprovalEdit" name="dateOfApproval" readonly>
          </div>
          
           <div class="form-group">
            <label for="recipient-email" class="col-form-label">Approved By:</label>
            <input type="text" class="form-control" id="approvedByEdit" name="approvedBy">
          </div>
       -->   
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">Status:</label>
            <input type="text" class="form-control" id="statusEdit" name="status" readonly>
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
<script type ="text/javascript"  src="js/disposalRequest.js"></script>
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