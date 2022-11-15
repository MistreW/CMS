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
  <label for="recipient-name" class="col-form-label txt2">Food Registration</label>
  </center>
        <form:form action="/foodssave" method="post" modelAttribute="food">
        
        <br>
        <div class="form-group">
            <label for="recipient-name" class="col-form-label">Food Id:</label>
            <input type="text" class="form-control" id="recipient-name" name="foodId" disabled="disabled">
          </div>
                       
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Food Name:</label>
            <input type="text" class="form-control " id="recipient-name" name="foodName"  >
             <form:errors path="foodName" style="color:red;"></form:errors>
          </div>
          
         
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Current Price:</label>
            <input type="text" class="form-control" id="currentPrice" name="currentPrice">
            <form:errors path="currentPrice" style="color:red;"></form:errors>
          </div>
              
          <div class="form-group">
          <label for="category" class="col-form-label">Category:</label>
            <select id="category" name="category">
			    <option value="Food" selected>Food</option>
			    <option value="Hot-Drink">Hot-Drink</option>
			    <option value="Cold-Drink">Cold-Drink</option>
			 </select>
          </div> 
        
          <div class="form-group">
          <div class="form-inline"> 
				<div class="form-group">
				<button type="submit" class="btn btn-success">Save</button> 
			  	<a href="/foods"><button type="button" class="btn btn-primary" >Close</button>
			  	</a>
			  	</div>	
			</div>    
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