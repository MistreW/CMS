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
 <style type ="text/css">
 table tfoot {
 display: table-row-group; }
 </style>
 </head>
 <body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3 offset-5 txt2"><b>Today Sales ${today} Birr</b></div>
		
		<div class="col-md-2"><label>MoF: ${inMOF} Birr</label></div>
		<div class="col-md-2"><label>PPA: ${inPPA} Birr</label></div>
	</div>
	
	<div class="UserNameDiv" id="userNameId" align="right"><label>System user:${userName}</label></div>

	<div class="panel panel-primary">
					<table class="table table-striped table-advance table-bordered table-hover txt1" id="datatable"  >
                <thead class="thead-dark">
                  <tr>
                    <th><i class="icon_table"></i>Sales ID</th>
                    <th><i class="icon_table"></i>Food Name</th>
                    <th><i class="icon_table"></i>Quantity</th>
                    <th><i class="icon_table "></i>Date Of Sales</th>
                    <th><i class="icon_table"></i>User Name</th>
                    <th><i class="icon_table"></i>Unit Price</th> 
                    <th><i class="icon_table"></i>Total</th> 
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
						</tr>
					</c:forEach>
        </tbody>
        
        <tfoot>
        <tr>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th>Grand Total</th>
        <th></th>
        </tr>
        </tfoot>
        
       </table>
	</div>
</div>


<%@ include file="/common/footers.jsp"%>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.print.min.js"></script>

<script>
var currentdate = new Date();
$(document).ready(function() {
    $('#datatable').DataTable( 
        {
            footerCallback: function (row, data, start, end, display) {
                var api = this.api();
     
                // Remove the formatting to get integer data for summation
                var intVal = function (i) {
                    return typeof i === 'string' ? i.replace(/[\$,]/g, '') * 1 : typeof i === 'number' ? i : 0;
                };
     
                // Total over all pages
                total = api
                    .column(6)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);
     
                     
                // Update footer
                $(api.column(6).footer()).html( ' ( ' + total + ' Birr)');
            },
       
        	"iDisplayLength": 30,
            dom: 'Bfrtip',
            buttons: [ {
            	extend: 'excel',
                title: 'Today Sales',
                footer: true,

            },
            	 {
            	
            	extend: 'print',
                title: 'Today Sales',
                footer: true,
                messageTop: (currentdate.getDate() + "/" + (currentdate.getMonth()+1) + "/" + currentdate.getFullYear()),
                customize: function(win) {
                	$(win.document.body).prepend($("#userNameId"));
                	$(win.document.body).find('h1').css('text-align', 'center');
                	
                }
                
            }
            ],	
       } 
    );
} );
</script>

</body>
</html>