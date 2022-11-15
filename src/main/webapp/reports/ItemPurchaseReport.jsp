<%@page import="java.time.LocalDate"%>

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
<div class="container-fluid">
	<div class="row">
	<form action="/itemPurchaseFilter" method="get">
 	<div class="form-inline">
 			<div class="form-row px-5">
	            <label for="recipient-name" class="col-form-label txt2">Start: </label>
	            <input type="date" class="form-control" id="startDate" name="startDate" required>
            </div>
            <div class="form-row px-1">
	            <label for="recipient-name" class="col-form-label txt2">End: </label>
	            <input type="date" class="form-control" id="endDate" name="endDate" required>
            </div>	
          
		<div class="form-group px-3">
			<button type="submit" class="btn btn-success">Filter</button>
		</div>
	</div>	
	</form>
	
	
	
		<div class="col-md-2 offset-1 txt2"><b>Purchase History</b></div>
		<div class="col-md-3 txt2"><label>Total Purchase: ${purNum}</label></div>
	</div>

	<div class="panel panel-primary">
					<table class="table table-striped table-advance table-bordered table-hover txt1" id="datatable"  >
                <thead class="thead-dark">
                  <tr>
                 <th><i class="icon_table"></i>Purchase ID</th>
                    <th><i class="icon_table"></i>Item</th>
                    <th><i class="icon_table"></i>Measurement</th>
                    <th><i class="icon_table"></i>Quantity</th>
                    <th><i class="icon_table "></i>Date Of Purchase</th>
                    <th><i class="icon_table"></i>Purchase Price</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${itemPurchaselist}" var="itemPurchase">
						<tr>
						    <td>${itemPurchase.purchaseId}</td>
							<td>${itemPurchase.item.itemName}</td>
							<td>${itemPurchase.item.measurement}</td>
							<td>${itemPurchase.amountPurchased}</td>
							<td>${itemPurchase.dateOfPurchase}</td>
							<td>${itemPurchase.purchasePrice}</td>
						</tr>
					</c:forEach>
        </tbody>
        
       </table>
	</div>
</div>


<%@ include file="/common/footers.jsp"%>
<script type ="text/javascript"  src="js/itemRequest.js"></script>
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
    	"iDisplayLength": 30,
        dom: 'Bfrtip',
        buttons: [
            'excel', 'pdf', 'print'
        ]
        } );
} );
</script>

</body>
</html>