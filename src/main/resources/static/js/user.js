$('document').ready(function(){
	
	$('table #editButton').on('click',function(event){
		event.preventDefault();
			
		var href = $(this).attr('href');
			$.get(href, function(user, status){
			$('#userIdEdit').val(user.userId);
			
			$('#firstNameEdit').val(user.firstName);
			$('#lastNameEdit').val(user.lastName);
			$('#userNameEdit').val(user.userName)
			$('#roleIdEdit').val(user.roleId);
			$('#positionEdit').val(user.position);
			$('#passwordEdit').val(user.password);
			//$('#isActiveEdit').val(user.isActive);
			
						
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