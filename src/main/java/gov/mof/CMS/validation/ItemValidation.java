package gov.mof.CMS.validation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import gov.mof.CMS.model.Item;
import gov.mof.CMS.repository.ItemRepo;


@Component
public class ItemValidation implements Validator{
	@Autowired
	ItemRepo itemRepo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Item.class.equals(clazz);
	}

	@Override
	public void validate(Object item, Errors errors) {
		Item items= (Item) item;
		if(items.getCurrentAmount()==null) {
			errors.rejectValue("currentAmount","ER102","* Please Enter Current Amount");
		}
		if(items.getCurrentAmount()==null) {
			errors.rejectValue("threshold","ER102","* Please Enter Threshold");
		}
		
		if(itemRepo.findByItemName(items.getItemName().trim())!=null) {
			errors.rejectValue("itemName","ER102","Item Name Alredy Exists");
		}
		if(items.getThreshold()<=0) {
			errors.rejectValue("threshold","ER102","Threshold Can Not Be Less Than 0");
		}
		if(items.getCurrentAmount()<=0) {
			errors.rejectValue("currentAmount","ER102","Current Amount Can Not Be Less Than 0");
		}
        		
	}
	

}
