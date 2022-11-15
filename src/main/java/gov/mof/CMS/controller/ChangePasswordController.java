package gov.mof.CMS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import gov.mof.CMS.model.Users;
import gov.mof.CMS.repository.RoleRepo;
import gov.mof.CMS.repository.UserRepo;
import gov.mof.CMS.validation.ChangePass;
import gov.mof.CMS.validation.ChangePasswordValidation;


@Controller
public class ChangePasswordController {
	@Autowired
	UserRepo userRepo;
	
	@Autowired
	RoleRepo roleRepo;
	
	@Autowired
	private BCryptPasswordEncoder pass;
	
	@Autowired
	private ChangePasswordValidation validator;
	
	@InitBinder 
	private void initBinder(WebDataBinder binder) {
	 binder.setValidator(validator); 
	 }


	@RequestMapping("userschangepassword")
	public String changePassword(@Validated @ModelAttribute("pass") ChangePass user, BindingResult bindingResult) { //not as PathParam
		if(bindingResult.hasErrors()) {
			return "common/changePassword";
		}
	else {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName ="";
		 if (principal instanceof UserDetails) {
			 userName = ((UserDetails)principal).getUsername();
		 } else {
			 userName = principal.toString();
		 }
		Users us=userRepo.findByUserName(userName);
		us.setPassword(pass.encode(user.getPassword()));
		userRepo.save(us);
		return "redirect:/changePassword";
		}
	}
	
}
