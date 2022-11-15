package gov.mof.CMS.validation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import gov.mof.CMS.model.FoodItems;
import gov.mof.CMS.repository.FoodItemsRepo;

//@Validated
@Component//("foodItemsValidation")
public class FoodItemsValidation implements Validator{
	@Autowired
	FoodItemsRepo foodItemsRepo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return FoodItems.class.equals(clazz);
	}

	@Override
	public void validate(Object food, Errors errors) {
		FoodItems foodItems= (FoodItems) food;
		
		if(foodItems.getCurrentPrice()!=null && foodItems.getCurrentPrice()<1) {
			 errors.rejectValue("currentPrice","ER101","Current Price Can not be less than 1");
		}
		if(foodItemsRepo.findByFoodName(foodItems.getFoodName().trim())!=null) {
			errors.rejectValue("foodName","ER102","Food Name("+foodItems.getFoodName()+") Alredy Exists");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "foodName", "ERR11", "Please Enter Valid Food Name");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "currentPrice","ERR11", "Please Enter Valid Price");
        		
	}
	

}
