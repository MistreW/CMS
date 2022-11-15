package gov.mof.CMS.controller;
import java.time.LocalDate;
import java.util.Collections;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import gov.mof.CMS.model.Item;
import gov.mof.CMS.model.ItemPurchase;
import gov.mof.CMS.repository.ItemPurchaseRepo;
import gov.mof.CMS.repository.ItemRepo;

@Controller
public class ItemPurchaseController {
	@Autowired
	ItemPurchaseRepo itemPurchaseRepo;
	
	@Autowired
	ItemRepo itemRepo;

	@GetMapping("/itemPurchases")
	public String GetItemPurchase(Model model) {
		
		List<ItemPurchase> itemsPurchaseList = itemPurchaseRepo.findAll();
		
		Collections.sort(itemsPurchaseList);
		
		  model.addAttribute("itemPurchaselist",itemsPurchaseList);
		  
		  List<Item> itemsList = itemRepo.findAll();
		  model.addAttribute("itemlist",itemsList);
		  
		  		  
		  return "itemPurchase";
	}
	
	 @RequestMapping("itemPurchase/findById")
		@ResponseBody
		public Optional<ItemPurchase> findBy(Integer id) {
		 return itemPurchaseRepo.findById(id);
	 }
	
	@RequestMapping("itemPurchase/addNew")
	public String addItemPurchase(ItemPurchase itemPurchase) {
		
		Integer id=itemPurchase.getItemId();
		Float amount= itemPurchase.getAmountPurchased();
		addCurretAmount(id,amount);
		
		
		itemPurchaseRepo.save(itemPurchase);
		return "redirect:/itemPurchases";
	}
	
	@RequestMapping("itemPurchase/update")
	public String updateItemPurchase(ItemPurchase itemPurchase) {
		List<ItemPurchase> itemsPurchaseList=itemPurchaseRepo.findAll();
		ItemPurchase p=itemsPurchaseList.stream().filter(a->a.getPurchaseId()==itemPurchase.getPurchaseId()).findFirst().orElse(new ItemPurchase());

		Float amount=itemPurchase.getAmountPurchased()-p.getAmountPurchased();
		Integer id=itemPurchase.getItemId();
		addCurretAmount(id,amount);
		
		itemPurchaseRepo.save(itemPurchase);
		return "redirect:/itemPurchases";
	}
	
	@RequestMapping("itemPurchase/delete")
	public String deleteItemPurchase(Integer id) { //not as PathParam
		ItemPurchase us=itemPurchaseRepo.findById(id).orElse(new ItemPurchase());
		Float amount=us.getAmountPurchased()*-1;
		Integer itemId=us.getItemId();
		addCurretAmount(itemId,amount);
		
		itemPurchaseRepo.delete(us);
		return "redirect:/itemPurchases";
		}
	
	
	@GetMapping("/allItemPurchase")
	public String GetAllItemRequest(Model model) {
		
					
		List<ItemPurchase> itemsPurchaseList = itemPurchaseRepo.findAll();
		model.addAttribute("itemPurchaselist",itemsPurchaseList);
		
		
		model.addAttribute("purNum", itemPurchaseRepo.count());
				
		return "reports/ItemPurchaseReport";
	}
	@GetMapping("/itemPurchaseFilter")
	public ModelAndView filterDisposal(@DateTimeFormat(pattern="yyyy-MM-dd") LocalDate startDate, 
			@DateTimeFormat(pattern="yyyy-MM-dd")LocalDate endDate) {
			
		ModelAndView mv=new ModelAndView("reports/ItemPurchaseReport");	
		List<ItemPurchase> allItemsPurchaseList = itemPurchaseRepo.findAll();
		
		  
		
		
		List<ItemPurchase> itemsPurchaseList = allItemsPurchaseList.stream().filter(e->e.getDateOfPurchase().isAfter(startDate)&&e.getDateOfPurchase().isBefore(endDate)).collect(Collectors.toList());
		mv.addObject("itemPurchaselist",itemsPurchaseList);
		
		Long l=itemsPurchaseList.stream().count();
		mv.addObject("purNum",l);		
					
	  return mv;
	}
	
	void addCurretAmount(Integer id, Float amount) {
		Item m= itemRepo.findById(id).orElse(new Item());
		m.setCurrentAmount(m.getCurrentAmount()+amount);
		itemRepo.save(m);
	}
}
