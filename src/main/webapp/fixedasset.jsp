<%@ include file="/common/headers.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fixed Asset List</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css"/>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.7/css/fixedHeader.dataTables.min.css"/>

 <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
 <script type="text/javascript">
    function EnableDisableTextBox(linearDepreciation) {
        var selectedValue = linearDepreciation.options[linearDepreciation.selectedIndex].value;
        var residualValue = document.getElementById("residualValue");
        residualValue.disabled = selectedValue == "false" ? false : true;
        if (!residualValue.disabled) {
        	residualValue.focus();
        }
    }
</script>
 </head>
 <body>
<div class="container-fluid">

<button type="button" class="btn btn-success" data-toggle="modal" data-target="#addModal" >
<i class="fa fa-plus fa-10x" style=" display: inline-block;
  margin-right: .1em;" aria-hidden="true"></i>New Fixed Asset</button>
<br><br>
	<div class="panel panel-primary">
					<table class="table table-striped table-advance table-hover border-primary table-bordered txt1" id="datatable"  >
                <thead class="thead-dark">
                  <tr>
                  
                    <th><i class="icon_table"></i>ID</th>
                    <th><i class="icon_table"></i>Name</th>
                    <th><i class="icon_table"></i>Model</th>
                    <th><i class="icon_table"></i>Purchase Date</th>
                    <th><i class="icon_table"></i>Purchase Cost</th>
                    <th><i class="icon_table"></i>Asset Life</th>
                    <th><i class="icon_table"></i>Linear Depr.</th>
                    <th><i class="icon_table"></i>Res. Value</th>
                    <th><i class="icon_table"></i>Active</th>
                    
                    <th><i class="icon_cogs"></i>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${fixedassetlist}" var="fixedAsset">
						<tr>
						    <td>${fixedAsset.id}</td>
							<td>${fixedAsset.assetName}</td>
							<td>${fixedAsset.model}</td>
							<td>${fixedAsset.dateOfPurchase}</td>
							<td>${fixedAsset.purchaseCost}</td>
							<td>${fixedAsset.assetLife}</td>
							<td>${fixedAsset.linearDepreciation}</td>
							<td>${fixedAsset.residualValue}</td>
							<td>${fixedAsset.active}</td>
							
							<td><a type="button" class="btn btn-warning" id="editButton"
								href="/fixedAsset/findById?id=${fixedAsset.id}">
								<i class="fa fa-edit fa-10x" ></i></a>
							<a type="button" class="btn btn-danger" id="deleteButton"
								href="/fixedAsset/delete?id=${fixedAsset.id}">
								<i class="fa fa-trash fa-10x" ></i>
								</a></td>
							
								  
						</tr>
					</c:forEach>
        </tbody>
        
       </table>
	</div>
</div>


<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New Asset</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
        <form action="/fixedAsset/addNew" method="post">
   
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <label for="recipient-name" class="col-form-label">Asset Id:</label>
            <input type="text" class="form-control" id="recipient-name" name="id" disabled="disabled">
          </div>
                       
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Asset Name:</label>
            <input type="text" class="form-control" id="recipient-name" name="assetName"  required>
          </div>
          
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Model:</label>
            <input type="text" class="form-control" id="recipient-name" name="model"  >
          </div>
        
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Date of Purchase:</label>
            <input type="date" class="form-control" id="recipient-name" name="dateOfPurchase"   >
          </div>
        
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Purchase Cost:</label>
            <input type="text" class="form-control" id="recipient-name" name="purchaseCost">
          </div>
        <div class="form-group">
            <label for="recipient-name" class="col-form-label">Asset Life:</label>
            <input type="text" class="form-control" id="recipient-name" name="assetLife">
          </div>
           <div class="form-group">
          <label for="recipient-telephone" class="col-form-label">Linear Depreciation:</label>
            <select id="linearDepreciation" name="linearDepreciation" onchange = "EnableDisableTextBox(this)">
			    <option value="true" selected>Yes</option>
			    <option value="false">No</option>
			 </select>
          </div> 
        <div class="form-group">
            <label for="recipient-name" class="col-form-label">Residual  Value:</label>
            <input type="text" class="form-control" id="residualValue" name="residualValue" disabled="disabled">
          </div>
            
          <div class="form-group">
          <label for="recipient-telephone" class="col-form-label">Active:</label>
            <select id="active" name="active">
			    <option value="true" selected>Yes</option>
			    <option value="false">No</option>
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

<div class="modal fade" id="editModal" tabindex="-1"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update Fixed Asset</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="/fixedAsset/update" method="put"> 
            
          <div class="form-group">
            <label for="recipient-id" class="col-form-label">Asset ID:</label>
            <input type="text" class="form-control" id="idEdit" name="id" readonly>
          </div>
        
                    
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">Asset Name:</label>
            <input type="text" class="form-control" id="nameEdit" name="assetName">
          </div>
        
        <div class="form-group">
            <label for="recipient-email" class="col-form-label">Model:</label>
            <input type="text" class="form-control" id="modelEdit" name="model">
          </div>
          
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">Date of Purchase:</label>
            <input type="text" class="form-control" id="dopEdit" name="DateOfPurchase">
          </div>
        
          <div class="form-group">
            <label for="recipient-telephone" class="col-form-label">Purchase Cost:</label>
            <input type="text" class="form-control" id="purchaseCostEdit" name="purchaseCost">
          </div>
          
           <div class="form-group">
            <label for="recipient-telephone" class="col-form-label">Asset Life:</label>
            <input type="text" class="form-control" id="assetLifeEdit" name="assetLife">
          </div>
          <div class="form-group">
            <label for="recipient-telephone" class="col-form-label">Linear Depreciation:</label>
            <select id="linearDepreciationEdit" name="linearDepreciation">
			    <option value="true" selected>Yes</option>
			    <option value="false">No</option>
			 </select>
          </div>
          <div class="form-group">
            <label for="recipient-telephone" class="col-form-label">Residual Value:</label>
            <input type="text" class="form-control" id="residualValueEdit" name="residualValue">
          </div>
          <div class="form-group">
            <label for="recipient-telephone" class="col-form-label">Active:</label>
            <select id="activeEdit" name="active">
			    <option value="true" selected>Yes</option>
			    <option value="false">No</option>
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
<script type ="text/javascript"  src="js/fixedAsset.js"></script>
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