package gov.mof.CMS.controller;

import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import gov.mof.CMS.model.PurchaseBatchItem;
import gov.mof.CMS.repository.ItemRepo;
import gov.mof.CMS.repository.PurchaseBacthRequestRepo;
import gov.mof.CMS.repository.PurchaseItemRequestRepo;

@Controller
public class PurchaseBatchRequestController {
	@Autowired
	PurchaseBacthRequestRepo purchaseBatchRepo;
	
	@Autowired
	PurchaseItemRequestRepo purchaseRequestRepo;
	@Autowired
	ItemRepo itemRepo;

	@GetMapping("/purchaseBatchItems")
	public String GetPurchseBatchItemRequest(Model model) {
		
		List<PurchaseBatchItem> batchItemsRequestList = purchaseBatchRepo.findAll();
		model.addAttribute("batchItemRequestlist",batchItemsRequestList);
		
		Integer maxId=0;
		Comparator<PurchaseBatchItem> maxIdComparator = new Comparator<PurchaseBatchItem>() {
			 public int compare(PurchaseBatchItem d1, PurchaseBatchItem d2) {
			 return d1.getBatchId()-d2.getBatchId();
			 }
			 };
		
		try {
			maxId=batchItemsRequestList.stream().max(maxIdComparator).get().getBatchId()+1;
		}
		catch(Exception e) {
			maxId=1;
		}
			
		model.addAttribute("maximum",maxId);
		
		
		
		  return "purchaseBatchRequest";
	}
	
	 @RequestMapping("purchaseBatchItems/findById")
		@ResponseBody
		public Optional<PurchaseBatchItem> findBy(Integer id) {
		 return purchaseBatchRepo.findById(id);
	 }
	 
	 @RequestMapping("purchaseBatchItems/addNew")
		public String addPurchseItemRequest(PurchaseBatchItem purchseBatchItemRequest) {
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username ="";
		 if (principal instanceof UserDetails) {
		   username = ((UserDetails)principal).getUsername();
		 } else {
		   username = principal.toString();
		 }
		 purchseBatchItemRequest.setRequestedBy(username); //for system
		 purchseBatchItemRequest.setDateOfRequest(LocalDate.now());
		 purchaseBatchRepo.save(purchseBatchItemRequest);
			
			  Integer bid=purchseBatchItemRequest.getBatchId(); 
			  			 
		 return "redirect:/purchaseItemRequests?batchId="+bid;
		}
}
