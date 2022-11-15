$('document').ready(function(){
	
	$('table #editButton').on('click',function(event){
		event.preventDefault();
			
		var href = $(this).attr('href');
			$.get(href, function(foods, status){
			$('#foodIdEdit').val(foods.foodId);
			$('#foodNameEdit').val(foods.foodName);
			$('#currentPriceEdit').val(foods.currentPrice);
			$('#categoryEdit').val(foods.category);
						
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