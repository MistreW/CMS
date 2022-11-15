package gov.mof.CMS.controller;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
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
import gov.mof.CMS.model.FoodItems;
import gov.mof.CMS.repository.FoodItemsRepo;
import gov.mof.CMS.validation.FoodItemsValidation;


@Controller
public class FoodItemsController {
		@Autowired
		FoodItemsRepo foodItemRepo;
	
	/*	@Autowired
		@Qualifier("foodItemsValidation") 
		private Validator validator;
		
		
	*/	 
	 
		@Autowired
		private FoodItemsValidation validator;
		
		@InitBinder 
		private void initBinder(WebDataBinder binder) {
		 binder.setValidator(validator); 
		 } 
		
	  
	
	@GetMapping("/foods")
		public String Getfoods(Model model) {
		List<FoodItems> foodList = foodItemRepo.findAll();
		model.addAttribute("foodlist",foodList);
			 
	  return "foodItems";
	}
	
	 @RequestMapping("foods/findById")
		@ResponseBody
		public Optional<FoodItems> findBy(Integer id) {
		 return foodItemRepo.findById(id);
	 }
	
	@RequestMapping("foodssave")//@ModelAttribute("food") @Valid
	public String saveFood(@Validated @ModelAttribute("food") FoodItems food, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			return "registration/foodItemsRegistration";
		}
		
		else {
		foodItemRepo.save(food);
		return "redirect:/foods";
		}
	}
	
	@RequestMapping("foodsaddNew")
	public String addFood() {
		return "registration/foodItemsRegistration";	
	}
	
	@RequestMapping("foods/update")
	public String updateFoodItems(FoodItems food) {
		foodItemRepo.save(food);
		return "redirect:/foods";
	}
	
	@RequestMapping("foods/delete")
	public String deleteFoodItems(Integer id) { //not as PathParam
		FoodItems us=foodItemRepo.findById(id).orElse(new FoodItems());
		foodItemRepo.delete(us);
		return "redirect:/foods";
		}
	
	
}
