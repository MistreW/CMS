$('document').ready(function(){
	
	$('table #editButton').on('click',function(event){
		event.preventDefault();
			
		var href = $(this).attr('href');
			$.get(href, function(itemRequest, status){
			
			$('#txIdEdit').val(itemRequest.txId);
			$('#batchIdEdit').val(itemRequest.batchId);
			$('#requestNumberEdit').val(itemRequest.requestNumber);
			$('#itemIdEdit').val(itemRequest.itemId);
			$('#amountRequestedEdit').val(itemRequest.amountRequested);
			$('#estimatedPriceEdit').val(itemRequest.estimatedPrice);
								
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