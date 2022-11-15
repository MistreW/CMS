package gov.mof.CMS.validation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import gov.mof.CMS.model.Users;
import gov.mof.CMS.repository.UserRepo;


@Component
public class LoginValidation implements Validator{
	@Autowired
	UserRepo userRepo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Users.class.equals(clazz);
	}

	@Override
	public void validate(Object user, Errors errors) {
		Users users= (Users) user;
		
		if(userRepo.findByUserName(users.getUserName().trim())==null) {
			errors.rejectValue("userName","ER102","User Name Doesn't Exists");
		}
		
        		
	}
	

}
