<%@ include file="/common/headers.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Food Registration</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css"/>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.7/css/fixedHeader.dataTables.min.css"/>
 
 <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
 </head>
 <body>
<div class="container">

<br>
<div class="col-lg-4 col-md-2"></div>
	<div class="panel panel-primary col-lg-5">
	<center>
  <label for="recipient-name" class="col-form-label txt2">User Registration</label>
  </center>
        <form:form action="/itemsave" method="post" modelAttribute="items">
        
        <div class="form-group">
            <label for="recipient-id" class="col-form-label">Item ID:</label>
            <input type="text" class="form-control" id="id" name="id" readonly>
          </div>
        
                    
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">Item Name:</label>
            <input type="text" class="form-control" id="itemName" name="itemName" required>
            <form:errors path="itemName" style="color:red;"></form:errors>
          </div>
        
        <div class="form-group">
            <label for="recipient-email" class="col-form-label">Description:</label>
            <input type="text" class="form-control" id="description" name="description">
          </div>
          
          <div class="form-group">
            <label for="recipient-email" class="col-form-label">Current Amount:</label>
            <input type="text" class="form-control" id="currentAmount" name="currentAmount" required>
           <form:errors path="currentAmount" style="color:red;"></form:errors>
          </div>
          <div class="form-group" >
            <label for="recipient-name" class="col-form-label"> Measurement:</label><br>
            	  <input type="radio" id="measurementEdit" name="measurement" value="Kilogram">
				  <label for="cat1"> Kilogram</label><br>
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
            <input type="text" class="form-control" id="threshold" name="threshold" required>
            <form:errors path="threshold" style="color:red;"></form:errors>
          </div>
        
          <div class="form-group">
          <button type="submit" class="btn btn-primary">Save</button>  
          <a href="/items">
          	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>      
       	</a>
        </div>      
        </form:form>
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

</body>
</html>