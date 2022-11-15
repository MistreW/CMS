package gov.mof.CMS.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import gov.mof.CMS.model.DisposalRequest;
import gov.mof.CMS.model.Item;
import gov.mof.CMS.repository.ItemRepo;



@Component
public class DisposalValidation implements Validator{
	@Autowired
	ItemRepo itemRepo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return DisposalRequest.class.equals(clazz);
	}

	@Override
	public void validate(Object disposalReq, Errors errors) {
		DisposalRequest disposal= (DisposalRequest) disposalReq;
		if(disposal.getAmountRequested()==null) {
			errors.rejectValue("amountRequested","ER102","* Please Enter Quantity");
		}
		else {
			if(disposal.getAmountRequested()!=null && disposal.getAmountRequested()<=0) {
				errors.rejectValue("amountRequested","ER102","* Amount Must Be Greater Than 0");
			}
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "amountRequested","ERR11", "* Please Enter Amount");
			
		
			Item it=itemRepo.findById(disposal.getItemId()).orElse(new Item());
			Float currentAmount=it.getCurrentAmount();	
			
			if(disposal.getAmountRequested()>currentAmount) {
				errors.rejectValue("amountRequested","ER104","* Disposal Amount Of "+it.getItemName().toUpperCase()+" Can Not be Greater Than " +currentAmount);
			}
			
			
		}	
		
        		
	}
	

}
