package gov.mof.CMS.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import gov.mof.CMS.model.PurchaseItemRequest;
import gov.mof.CMS.repository.PurchaseItemRequestRepo;


@Component
public class PurchaseRequestValidation implements Validator{
	@Autowired
	PurchaseItemRequestRepo purchaseRepo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return PurchaseItemRequest.class.equals(clazz);
	}

	@Override
	public void validate(Object purchaseRequest, Errors errors) {
	PurchaseItemRequest req= (PurchaseItemRequest) purchaseRequest;
	
	if(req.getAmountRequested()==null) {
		errors.rejectValue("amountRequested","ER102","* Please Enter Quantity");
	}
	else {
		if(req.getAmountRequested()!=null && req.getAmountRequested()<=0) {
			errors.rejectValue("amountRequested","ER102","* Quantity Must Be Greater Than 0");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "amountRequested","ERR11", "* Please Enter Amount");
		
		if(purchaseRepo.findAll().stream().filter(e->e.getBatchId()==req.getBatchId() && e.getItemId()==req.getItemId()).findAny().isPresent()) {
			errors.rejectValue("itemId","ER103","* You Have Already Requested The Same Item");
		}
	}	
        		
	}
	

}
