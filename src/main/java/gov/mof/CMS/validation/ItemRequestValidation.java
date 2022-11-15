package gov.mof.CMS.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import gov.mof.CMS.model.Item;
import gov.mof.CMS.model.ItemRequest;
import gov.mof.CMS.repository.ItemRepo;
import gov.mof.CMS.repository.ItemRequestRepo;


@Component
public class ItemRequestValidation implements Validator{
	@Autowired
	ItemRepo itemRepo;
	
	@Autowired
	ItemRequestRepo itemRequestRepo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return ItemRequest.class.equals(clazz);
	}

	@Override
	public void validate(Object itemRequest, Errors errors) {
	ItemRequest itemReq= (ItemRequest) itemRequest;
	
	if(itemReq.getAmountRequested()==null) {
		errors.rejectValue("amountRequested","ER102","* Please Enter Quantity");
	}
	else {
		if(itemReq.getAmountRequested()!=null && itemReq.getAmountRequested()<=0) {
			errors.rejectValue("amountRequested","ER102","* Quantity Must Be Greater Than 0");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "amountRequested","ERR11", "* Please Enter Amount");
		
	
		Item it=itemRepo.findById(itemReq.getItemId()).orElse(new Item());
		Float currentAmount=it.getCurrentAmount();	
		
		if(itemReq.getAmountRequested()>currentAmount) {
			errors.rejectValue("amountRequested","ER104","* Quantity Can Not be Greater Than " +currentAmount);
		}
		
		if(itemRequestRepo.findAll().stream().filter(e->e.getBatchId()==itemReq.getBatchId() && e.getItemId()==itemReq.getItemId()).findAny().isPresent()) {
			errors.rejectValue("itemId","ER103","* You Have Already Requested The Same Item");
		}
	}	
        		
	}
	

}
