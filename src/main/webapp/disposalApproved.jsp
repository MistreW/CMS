<%@ page import="java.lang.String"%>
        	
<%@ include file="/common/headers.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 

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
<div class="container-fluid">
 
<br>
	<div class="panel panel-primary">
					<table class="table table-striped border-primary table-advance table-hover table-bordered txt1" id="datatable"  >
                <thead class="thead-dark">
                  <tr>
                  	<th><i class="icon_table"></i>Disposal ID</th>
                    <th><i class="icon_table"></i>Item Name</th>
                    <th><i class="icon_table"></i>Quantity</th>
                    <th><i class="icon_table"></i>Reason</th>
                    <th><i class="icon_table"></i>Date of Request</th>
                    <th><i class="icon_table"></i>Requested By</th>
                    <th><i class="icon_table"></i>Data of Approval</th>
                    <th><i class="icon_table"></i>Approved By</th>
                    <th><i class="icon_table"></i>Status</th>
                                        
                    <th><i class="icon_cogs"></i>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${disposalList}" var="disposal">
						<tr>
							<td>${disposal.disposalId}</td>
						    <td>${disposal.item.itemName}</td>
							<td>${disposal.amountRequested}</td>
							<td>${disposal.reason}</td>
							<td>${disposal.dateOfRequest}</td>
							<td>${disposal.requestedBy}</td>
							<td>${disposal.dateOfApproval}</td>
							<td>${disposal.approvedBy}</td>
							<td>${disposal.status}</td>				
							<td>								
					
						<a type="button" class="btn btn-primary" id="disposeButton"
						href="/disposaldispose?id=${disposal.disposalId}">
						<i class="fa fa-recycle fa-10x">Dispose</i></a>
						
									
							</td>
							
								  
						</tr>
					</c:forEach>
        </tbody>
        
       </table>
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