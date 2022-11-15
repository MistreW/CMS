package gov.mof.CMS.controller;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
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
import gov.mof.CMS.model.Item;
import gov.mof.CMS.repository.ItemRepo;
import gov.mof.CMS.validation.ItemValidation;

@Controller
public class ItemController {
	@Autowired
	ItemRepo itemRepo;
	
	@Autowired
	private ItemValidation validator;
	
	@InitBinder 
	private void initBinder(WebDataBinder binder) {
	 binder.setValidator(validator); 
	 }
	
	@GetMapping("/items")
			public String GetItem(Model model) {
		
		List<Item> itemsList = itemRepo.findAll();
		  model.addAttribute("itemlist",itemsList);
		  
		  return "item";
	}
	
	 @RequestMapping("item/findById")
		@ResponseBody
		public Optional<Item> findBy(Integer id) {
		 return itemRepo.findById(id);
	 }
	 @RequestMapping("itemaddNew")
		public String addFood() {
		 	return "registration/itemRegistration";	
		}	
	@RequestMapping("itemsave")
	public String addItem(@Validated @ModelAttribute("items") Item item , BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "registration/itemRegistration";
		}
		
		else {
		itemRepo.save(item);
		return "redirect:/items";
		}
	}
	
	@RequestMapping("item/update")
	public String updateItem(Item item) {
		itemRepo.save(item);
		return "redirect:/items";
	}
	
	@RequestMapping("item/delete")
	public String deleteItem(Integer id) { //not as PathParam
		Item us=itemRepo.findById(id).orElse(new Item());
		itemRepo.delete(us);
		return "redirect:/items";
		}
	
	@RequestMapping("/threshold")
	public String GetBelowThresholdItem(Model model) {
		List<Item> itemsBelowThresholdList = itemRepo.findAll();
		List<Item> ls=itemsBelowThresholdList.stream().filter(a->a.getCurrentAmount()<a.getThreshold()).collect(Collectors.toList());
		model.addAttribute("itemBelowlist",ls);
  		return "itemBelowThreshold";
}
	
}
