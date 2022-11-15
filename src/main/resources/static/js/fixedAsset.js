$('document').ready(function(){
	
	$('table #editButton').on('click',function(event){
		event.preventDefault();
			
		var href = $(this).attr('href');
			$.get(href, function(asset, status){
			$('#idEdit').val(asset.id);
			
			$('#nameEdit').val(asset.assetName);
			$('#modelEdit').val(asset.model);
			
			$('#dopEdit').val(asset.dateOfPurchase);
			$('#purchaseCostEdit').val(asset.purchaseCost);
			$('#assetLifeEdit').val(asset.assetLife);
			
			//$('#linearDepreciationEdit').val(asset.linearDepreciation);
			$('#residualValueEdit').val(asset.residualValue);
			//$('#activeEdit').val(asset.active);
			
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