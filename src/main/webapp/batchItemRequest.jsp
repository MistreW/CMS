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
<title>Item</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css"/>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.7/css/fixedHeader.dataTables.min.css"/>
 
 <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
 </head>
 <body>
 <center> <b class="txt2"><u>List of Requests</u></b></center>
<div class="container">
<sec:authorize access="hasRole('MINI')">
<div class="form-group">
		<form action="/batachItemRequest/addNew" method="get">
			<input type="hidden" id="batchId" name="batchId"   value="${maximum}">
		<!--  	<input type="hidden" id="dateOfRequest" name="dateOfRequest"   value="<%=LocalDate.now()%>" >
			<input type="hidden" id="requestedBy" name="requestedBy"   value="kebede">
			<input type="hidden" id="status" name="status"  value="On Progress" >-->
			<button type="submit" class="btn btn-primary" >New Request</button>  
		</form>
	</div>
</sec:authorize>	
<div class="panel panel-primary">
				<table class="table table-striped table-advance border-primary table-hover table-bordered txt1" id="datatable"  >
                <thead class="thead-dark">
                  <tr>
                    <th><i class="icon_table"></i>Batch ID</th>
                    <th><i class="icon_table"></i>Request Date</th>
                    <th><i class="icon_table"></i>Requested By</th>
                    <th><i class="icon_table"></i>Approved Date</th>
                    <th><i class="icon_table"></i>Approved By</th>
                    <th><i class="icon_table"></i>Withdraw Date</th>
                    <th><i class="icon_table"></i>Withdraw By</th>
                    <th><i class="icon_table"></i>Status</th>
                    <th><i class="icon_cogs"></i>View</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${batchItemRequestlist}" var="batchItem">
						<tr>
						    <td>${batchItem.batchId}</td>
							<td>${batchItem.dateOfRequest}</td>
							<td>${batchItem.requestedBy}</td>
							<td>${batchItem.dateOfApproval}</td>
							<td>${batchItem.approvedBy}</td>
							<td>${batchItem.dateOfWithdrawal}</td>
							<td>${batchItem.withdrawBy}</td>
							<td>${batchItem.status}</td>
																			
							<td><a type="button" class="btn btn-info" id="viewButton"
								href="/itemRequests?batchId=${batchItem.batchId}">
								<i class="fa fa-eye fa-10x" ></i></a>
							</td>
							
								  
						</tr>
					</c:forEach>
        </tbody>
        
       </table>
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
    	"order": [[ 1, "desc" ]],
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