$('document').ready(function(){
	
	$('table #editButton').on('click',function(event){
		event.preventDefault();
			
		var href = $(this).attr('href');
			$.get(href, function(item, status){
			$('#idEdit').val(item.id);
			
			$('#itemNameEdit').val(item.itemName);
			$('#descriptionEdit').val(item.description);
			
			$('#currentAmountEdit').val(item.currentAmount);
			$('#measurementEdit').val(item.measurement);
			//$('#categoryEdit').val(item.category);
			$('#thresholdEdit').val(item.threshold);
						
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