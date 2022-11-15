package gov.mof.CMS.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import gov.mof.CMS.model.BatchItemRequest;
import gov.mof.CMS.model.Item;
import gov.mof.CMS.model.ItemRequest;
import gov.mof.CMS.repository.BacthItemRequestRepo;
import gov.mof.CMS.repository.ItemRepo;
import gov.mof.CMS.repository.ItemRequestRepo;

@Controller
public class WithdrawController {
	@Autowired
	ItemRequestRepo itemRequestRepo;

	@Autowired
	ItemRepo itemRepo;

	@Autowired
	BacthItemRequestRepo batchItemRequestRepo;
	
	Integer bid;
	List<ItemRequest> itemsRequestListFinal;
	
	@GetMapping("/approvedBatchItemRequest")
	public String GetBatchItemRequest(Model model) {
		
		List<BatchItemRequest> batchItemsRequestList = batchItemRequestRepo.findAll()
				.stream().filter(e->e.getStatus().equalsIgnoreCase("Approved")).collect(Collectors.toList());
		
		model.addAttribute("batchItemRequestlist",batchItemsRequestList);
			
		return "batchItemRequestWithdraw";
	}

	@GetMapping("/approvedItemRequests")
	public ModelAndView GetItemRequest(Integer batchId) {
		bid=batchId;
		ModelAndView mv=new ModelAndView("itemRequestWithdrawal");
		List<ItemRequest> itemsRequestList = itemRequestRepo.findAll();
		
		itemsRequestListFinal =itemsRequestList.stream().filter(e->e.getBatchId().equals(batchId)).collect(Collectors.toList());
		mv.addObject("itemRequestlist", itemsRequestListFinal);
		
		mv.addObject("bid", batchId);
		
		Long l=itemsRequestListFinal.stream().count();
		mv.addObject("reqNum", l+1);
		
		return mv;
	}
	
	@GetMapping("/itemRequests/withdraw")
	public String WithdrawItemRequest() {
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username ="";
		 if (principal instanceof UserDetails) {
		   username = ((UserDetails)principal).getUsername();
		 } else {
		   username = principal.toString();
		 }
		ModelAndView mv= new ModelAndView();
		mv.addObject("bid", bid);
		BatchItemRequest batchItemsRequest= batchItemRequestRepo.findById(bid).orElse(new BatchItemRequest());
		batchItemsRequest.setStatus("Complete");
		batchItemsRequest.setWithdrawBy(username); //to be fetched from login user
		batchItemsRequest.setDateOfWithdrawal(LocalDate.now());
		batchItemRequestRepo.save(batchItemsRequest);
		
		itemsRequestListFinal.stream().forEach(e-> {
		updateCurretAmount(e.getItemId(), e.getAmountRequested());
		});
		
		
		return "redirect:/approvedBatchItemRequest";
	}
	
	void updateCurretAmount(Integer id, Float amount) {
		Item m= itemRepo.findById(id).orElse(new Item());
		m.setCurrentAmount(m.getCurrentAmount()-amount);
		itemRepo.save(m);
	}
	
}
