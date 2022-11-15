package gov.mof.CMS.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
import org.springframework.web.servlet.ModelAndView;
import gov.mof.CMS.model.Item;
import gov.mof.CMS.model.PurchaseBatchItem;
import gov.mof.CMS.model.PurchaseItemRequest;
import gov.mof.CMS.repository.ItemRepo;
import gov.mof.CMS.repository.PurchaseBacthRequestRepo;
import gov.mof.CMS.repository.PurchaseItemRequestRepo;
import gov.mof.CMS.validation.PurchaseRequestValidation;

@Controller
public class PurchaseItemRequestController {
	@Autowired
	PurchaseBacthRequestRepo purchaseBatchRequestRepo;

	@Autowired
	ItemRepo itemRepo;

	@Autowired
	PurchaseItemRequestRepo purchaseItemRequestRepo;
	
	@Autowired
	private PurchaseRequestValidation validator;
	
	@InitBinder 
	private void initBinder(WebDataBinder binder) {
	 binder.setValidator(validator); 
	 }
	
	Integer bid;

	@GetMapping("/purchaseItemRequests")
	public ModelAndView GetItemRequest(Integer batchId) {
		bid=batchId;
		ModelAndView mv=new ModelAndView("purchaseItemRequest");
			
		List<PurchaseItemRequest> itemsRequestList = purchaseItemRequestRepo.findAll();
		
		List<PurchaseItemRequest> itemsRequestListFinal =itemsRequestList.stream().filter(e->e.getBatchId().equals(batchId)).collect(Collectors.toList());
		mv.addObject("itemRequestlist", itemsRequestListFinal);
		
		Long l=itemsRequestListFinal.stream().count();
		mv.addObject("reqNum", l+1);
		
		Float sum=0.0f;
		try {
				sum=itemsRequestListFinal.stream().map(x -> x.getEstimatedPrice()).reduce(0.0f, Float::sum);
		}
		catch(NullPointerException e) {
			sum=0.0f;
		}
				mv.addObject("price", sum);
		
		List<Item> itemsList = itemRepo.findAll();
		mv.addObject("itemlist", itemsList);
		
		mv.addObject("bid", batchId);
		return mv;
	}
	

	@RequestMapping("purchaseItemRequests/findById")
	@ResponseBody
	public Optional<PurchaseItemRequest> findBy(Integer id) {
		return purchaseItemRequestRepo.findById(id);
	}

	@RequestMapping("purchaseItemRequestsaddNew")
	public String addItemRequest(@Validated @ModelAttribute("purchaseRequest") PurchaseItemRequest purchaseItemRequest,
			 BindingResult bindingResult, Model mv) {
		if(bindingResult.hasErrors()) {
			List<PurchaseItemRequest> itemsRequestList = purchaseItemRequestRepo.findAll();
			
			List<PurchaseItemRequest> itemsRequestListFinal =itemsRequestList.stream().filter(e->e.getBatchId().equals(bid)).collect(Collectors.toList());
			mv.addAttribute("itemRequestlist", itemsRequestListFinal);
			
			Long l=itemsRequestListFinal.stream().count();
			mv.addAttribute("reqNum", l+1);
			
			Float sum=0.0f;
			try {
					sum=itemsRequestListFinal.stream().map(x -> x.getEstimatedPrice()).reduce(0.0f, Float::sum);
			}
			catch(NullPointerException e) {
				sum=0.0f;
			}
					mv.addAttribute("price", sum);
			
			List<Item> itemsList = itemRepo.findAll();
			mv.addAttribute("itemlist", itemsList);
			
			mv.addAttribute("bid", bid);
			return "purchaseItemRequest";
		}
		
	else {
		purchaseItemRequest.setDateOfRequest(LocalDate.now());
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username ="";
		 if (principal instanceof UserDetails) {
		   username = ((UserDetails)principal).getUsername();
		 } else {
		   username = principal.toString();
		 }
		purchaseItemRequest.setRequestedBy(username); //to be feteched from system
		
		purchaseItemRequestRepo.save(purchaseItemRequest);
		
		return "redirect:/purchaseItemRequests?batchId="+purchaseItemRequest.getBatchId();
	}
	}

	@RequestMapping("purchaseItemRequests/update")
	public String updateItemRequest(PurchaseItemRequest itemRequest) {
		itemRequest.setDateOfRequest(LocalDate.now());
		purchaseItemRequestRepo.save(itemRequest);
		return "redirect:/purchaseItemRequests?batchId="+itemRequest.getBatchId();
	}

	@RequestMapping("purchaseItemRequests/delete")
	public String deleteItemRequest(Integer id) { // not as PathParam
		PurchaseItemRequest us = purchaseItemRequestRepo.findById(id).orElse(new PurchaseItemRequest());
		Integer bid=us.getBatchId();
		purchaseItemRequestRepo.delete(us);
		return "redirect:/purchaseItemRequests?batchId="+bid;
	}

	@RequestMapping("purchseItemRequests/done")
	public String callBatchRequest() {
		return "redirect:/purchaseBatchItems";
	}
	
	
	@GetMapping("/allPurchaseItemRequests")
	public String GetAllItemRequest(Model model) {
		
					
		List<PurchaseItemRequest> itemsRequestList = purchaseItemRequestRepo.findAll();
		model.addAttribute("itemRequestlist", itemsRequestList);
		
		Long l=itemsRequestList.stream().count();
		model.addAttribute("reqNum", l+1);
		
		List<Item> itemsList = itemRepo.findAll();
		model.addAttribute("itemlist", itemsList);
		
		return "purchaseItemRequest";
	}
	
	@GetMapping("/purchaseItemRequests/approve")
	public String ApproveItemRequest() {
		ModelAndView mv= new ModelAndView();
		mv.addObject("bid", bid);
		PurchaseBatchItem purchseBatchItemsRequest= purchaseBatchRequestRepo.findById(bid).orElse(new PurchaseBatchItem());
		purchseBatchItemsRequest.setStatus("Approved");
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username ="";
		 if (principal instanceof UserDetails) {
		   username = ((UserDetails)principal).getUsername();
		 } else {
		   username = principal.toString();
		 }
		purchseBatchItemsRequest.setApprovedBy(username); //to fetched from system
		purchseBatchItemsRequest.setDateOfApproval(LocalDate.now());
		purchaseBatchRequestRepo.save(purchseBatchItemsRequest);
		return "redirect:/purchaseBatchItems";
	}
	@GetMapping("/purchaseItemRequests/reject")
	public String rejectPurchseItemRequest() {
		ModelAndView mv= new ModelAndView();
		mv.addObject("bid", bid);
		PurchaseBatchItem purchseBatchItemsRequest= purchaseBatchRequestRepo.findById(bid).orElse(new PurchaseBatchItem());
		purchseBatchItemsRequest.setStatus("Rejected");
		purchseBatchItemsRequest.setApprovedBy("Mamo"); //to fetched from system
		purchseBatchItemsRequest.setDateOfApproval(LocalDate.now());
		purchaseBatchRequestRepo.save(purchseBatchItemsRequest);
		return "redirect:/purchaseBatchItems";
	}
	
	@GetMapping("/purchaseItemRequests/estimate")
	public String estimatePurchseItemRequest() {
		ModelAndView mv= new ModelAndView();
		mv.addObject("bid", bid);
		PurchaseBatchItem purchseBatchItemsRequest= purchaseBatchRequestRepo.findById(bid).orElse(new PurchaseBatchItem());
		purchseBatchItemsRequest.setStatus("Estimated");
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username ="";
		 if (principal instanceof UserDetails) {
		   username = ((UserDetails)principal).getUsername();
		 } else {
		   username = principal.toString();
		 }
		purchseBatchItemsRequest.setEstimatedBy(username); //to fetched from system
		purchseBatchItemsRequest.setDateOfEstimation(LocalDate.now());
		purchaseBatchRequestRepo.save(purchseBatchItemsRequest);
		return "redirect:/purchaseBatchItems";
	}
	
}
