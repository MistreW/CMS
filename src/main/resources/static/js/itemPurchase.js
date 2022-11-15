$('document').ready(function(){
	
	$('table #editButton').on('click',function(event){
		event.preventDefault();
			
		var href = $(this).attr('href');
			$.get(href, function(itemPurchase, status){
			$('#purchaseIdEdit').val(itemPurchase.purchaseId);
			
			$('#itemIdEdit').val(itemPurchase.itemId);
			$('#amountPurchasedEdit').val(itemPurchase.amountPurchased);
			
			$('#dateOfPurchaseEdit').val(itemPurchase.dateOfPurchase);
			$('#purchasePriceEdit').val(itemPurchase.purchasePrice);
								
			});					
		$('#editModal').modal();
	});
	
	$('table #deleteButton').on('click', function(event){
		event.preventDefault();
		
		var href= $(this).attr('href');
		
		$('#confirmDeleteButton').attr('href', href);
		
		$('#deleteModal').modal();
	});
		
});