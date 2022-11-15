$('document').ready(function(){
	
	$('table #editButton').on('click',function(event){
		event.preventDefault();
			
		var href = $(this).attr('href');
			$.get(href, function(sales, status){
			$('#salesIdEdit').val(sales.salesId);
			$('#foodIdEdit').val(sales.foodId);
			$('#amountEdit').val(sales.amount);
			$('#dateOfSalesEdit').val(sales.dateOfSales);
			$('#salesPriceEdit').val(sales.salesPrice);
			$('#userIdEdit').val(sales.userId);
								
			});					
		$('#editModal').modal();
	});
	
	$('table #deleteButton').on('click', function(event){
		event.preventDefault();
		
		var href= $(this).attr('href');
		
		$('#confirmDeleteButton').attr('href', href);
		
		$('#deleteModal').modal();
	});
	
	$('#addSales').on('click', function(event){
		event.preventDefault();
		
		//var href= $(this).attr('href');
		
		//$('#confirmSalesButton').attr('href', href);
		
		$('#addSalesModal').modal();
	});
	$("#confirmSalesButton").click(function(){        
       $("#addForm").submit(); // Submit the form
    });
    
    //$("#confirmSalesButton").on('click', function(event){        
    //    $("#addForm").submit(); // Submit the form
   // });
    
		
});


		




