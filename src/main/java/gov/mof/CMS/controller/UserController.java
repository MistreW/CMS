package gov.mof.CMS.controller;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import gov.mof.CMS.model.Roles;
import gov.mof.CMS.model.Users;
import gov.mof.CMS.repository.RoleRepo;
import gov.mof.CMS.repository.UserRepo;
import gov.mof.CMS.validation.UserValidation;

@Controller
public class UserController {
	@Autowired
	UserRepo userRepo;
	
	@Autowired
	RoleRepo roleRepo;
	
	@Autowired
	private BCryptPasswordEncoder pass;
	
	@Autowired
	private UserValidation validator;
	
	@InitBinder 
	private void initBinder(WebDataBinder binder) {
	 binder.setValidator(validator); 
	 }


	@GetMapping("/users")
		public String GetUsers(Model model) {
		List<Users> userList = userRepo.findAll();
		model.addAttribute("userlist",userList);
		
		List<Roles> roleList = roleRepo.findAll();
		  model.addAttribute("rolesList",roleList);
		 
		  return "user";
	}
	
	 @RequestMapping("users/findById")
		@ResponseBody
		public Optional<Users> findBy(Integer id) {
		 return userRepo.findById(id);
	 }
	 @RequestMapping("usersaddNew")
		public String addFood(Model model) {
		 List<Roles> roleList = roleRepo.findAll();
		  model.addAttribute("rolesList",roleList);
			return "registration/userRegistration";	
		}
	 
	 @RequestMapping("userssave")
		public String saveUser(@Validated @ModelAttribute("users") Users user, BindingResult bindingResult, Model model) {
			
			if(bindingResult.hasErrors()) {
				List<Roles> roleList = roleRepo.findAll();
				  model.addAttribute("rolesList",roleList);
				return "registration/userRegistration";
			}
			
			else {
			user.setPassword(pass.encode(user.getPassword()));
			userRepo.save(user);
			return "redirect:/users";
			}
			
		}
		/*
		 * @RequestMapping("users/addNew") public String addUser(Users user) {
		 * user.setPassword(pass.encode(user.getPassword())); userRepo.save(user);
		 * return "redirect:/users"; }
		 */
	
	@RequestMapping("users/update")
	public String updateUser(Users user) {
		
		userRepo.save(user);
		return "redirect:/users";
	}
	
	@RequestMapping("users/delete")
	public String deleteUser(Integer id) { //not as PathParam
		Users us=userRepo.findById(id).orElse(new Users());
		userRepo.delete(us);
		return "redirect:/users";
		}
	
	@RequestMapping("/changePassword")
	public String changePass() { //not as PathParam
		
		return "common/changePassword";
		}
	
	@RequestMapping("users/changepassword")
	public String changePassword(String password) { //not as PathParam
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName ="";
		 if (principal instanceof UserDetails) {
			 userName = ((UserDetails)principal).getUsername();
		 } else {
			 userName = principal.toString();
		 }
		Users us=userRepo.findByUserName(userName);
		us.setPassword(pass.encode(password));
		us.setPasswordChangedTime(new Date());
		userRepo.save(us);
		return "redirect:/changePassword";
		}
	
	@RequestMapping("users/resetPass")
	public String resetPass(Integer id) { //not as PathParam
		Users us=userRepo.findById(id).orElse(new Users());
		us.setPassword(pass.encode("123"));
		userRepo.save(us);
		return "redirect:/users";
		}
	
}
