$('document').ready(function(){
	
	$('table #editButton').on('click',function(event){
		event.preventDefault();
			
		var href = $(this).attr('href');
			$.get(href, function(disposalRequest, status){
			
			$('#disposalIdEdit').val(disposalRequest.disposalId);
			$('#itemIdEdit').val(disposalRequest.itemId);
			$('#amountRequestedEdit').val(disposalRequest.amountRequested);
			$('#reasonEdit').val(disposalRequest.reason);
			$('#statusEdit').val(disposalRequest.status);
								
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