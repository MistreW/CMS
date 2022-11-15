package gov.mof.CMS.validation;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


@Component
public class ChangePasswordValidation implements Validator{
		
	@Override
	public boolean supports(Class<?> clazz) {
		return ChangePass.class.equals(clazz);
	}

	@Override
	public void validate(Object pass, Errors errors) {
		ChangePass pas= (ChangePass) pass;
		
		if(!pas.getPassword().equals(pas.getConfirm_password())) {
			errors.rejectValue("confirm_password","ER102","Password Doesn't Match");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "ERR11", "Please Enter Valid Password");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirm_password","ERR11", "Please Enter Valid Password");
        		
	}
	

}
