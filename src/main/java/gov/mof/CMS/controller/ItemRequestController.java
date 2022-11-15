package gov.mof.CMS.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
import gov.mof.CMS.model.BatchItemRequest;
import gov.mof.CMS.model.Item;
import gov.mof.CMS.model.ItemRequest;
import gov.mof.CMS.repository.BacthItemRequestRepo;
import gov.mof.CMS.repository.ItemRepo;
import gov.mof.CMS.repository.ItemRequestRepo;
import gov.mof.CMS.validation.ItemRequestValidation;


@Controller
public class ItemRequestController {
	@Autowired
	ItemRequestRepo itemRequestRepo;

	@Autowired
	ItemRepo itemRepo;

	@Autowired
	BacthItemRequestRepo batchItemRequestRepo;
	
	Integer bid;

	@Autowired
	private ItemRequestValidation validator;
	
	@InitBinder 
	private void initBinder(WebDataBinder binder) {
	 binder.setValidator(validator); 
	 }
	
	@GetMapping("/itemRequests")
	public ModelAndView GetItemRequest(Integer batchId) {
		ModelAndView mv=new ModelAndView("itemRequest");
		bid=batchId;
		//new code
		BatchItemRequest batch=batchItemRequestRepo.findById(bid).orElse(new BatchItemRequest());
		String active="disabled";
		String hi="hidden";
		if(batch.getStatus().startsWith("On"))
		{
			active="active";
			hi="";
		}
		//System.out.println(active);
		mv.addObject("isactive", active);
		mv.addObject("ishidden", hi);
			
		List<ItemRequest> itemsRequestList = itemRequestRepo.findAll();
		
		List<ItemRequest> itemsRequestListFinal =itemsRequestList.stream().filter(e->e.getBatchId().equals(batchId)).collect(Collectors.toList());
		mv.addObject("itemRequestlist", itemsRequestListFinal);
		
		Long l=itemsRequestListFinal.stream().count();
		mv.addObject("reqNum", l+1);
		
		List<Item> itemsList = itemRepo.findAll();
		mv.addObject("itemlist", itemsList);
		
		
		mv.addObject("bid", batchId);
		return mv;
	}
	


	@RequestMapping("itemRequest/findById")
	@ResponseBody
	public Optional<ItemRequest> findBy(Integer id) {
		return itemRequestRepo.findById(id);
	}

	@RequestMapping("itemRequestaddNew")
	public String addItemRequest(@Validated @ModelAttribute("itemRequest") ItemRequest itemRequest, BindingResult bindingResult, Model mv) {
			
		if(bindingResult.hasErrors()) {
						
			List<ItemRequest> itemsRequestList = itemRequestRepo.findAll();
			
			List<ItemRequest> itemsRequestListFinal =itemsRequestList.stream().filter(e->e.getBatchId().equals(bid)).collect(Collectors.toList());
			mv.addAttribute("itemRequestlist", itemsRequestListFinal);
			
			Long l=itemsRequestListFinal.stream().count();
			mv.addAttribute("reqNum", l+1);
			
			List<Item> itemsList = itemRepo.findAll();
			mv.addAttribute("itemlist", itemsList);
			
			mv.addAttribute("bid", bid);
			return "itemRequest";
		
		}
		
		else {
		itemRequest.setDateOfRequest(LocalDate.now()); 
		itemRequestRepo.save(itemRequest);
		return "redirect:/itemRequests?batchId="+bid;
		}		
		
	}

	@RequestMapping("itemRequest/update")
	public String updateItemRequest(ItemRequest itemRequest) {
		itemRequestRepo.save(itemRequest);
		return "redirect:/itemRequests?batchId="+itemRequest.getBatchId();
	}

	@RequestMapping("itemRequest/delete")
	public String deleteItemRequest(Integer id) { // not as PathParam
		ItemRequest us = itemRequestRepo.findById(id).orElse(new ItemRequest());
		Integer bid=us.getBatchId();
		itemRequestRepo.delete(us);
		return "redirect:/itemRequests?batchId="+bid;
	}

	@RequestMapping("itemRequest/done")
	public String callBatchRequest() {
		return "redirect:/itemBatchRequests";
	}
	
	
	@GetMapping("/allItemRequests")
	public String GetAllItemRequest(Model model) {
		
					
		List<ItemRequest> itemsRequestList = itemRequestRepo.findAll();
		model.addAttribute("itemRequestlist", itemsRequestList);
		
		Long l=itemsRequestList.stream().count();
		model.addAttribute("reqNum", l);
				
		return "reports/AllitemRequest";
	}
	@GetMapping("/itemRequestFilter")
	public ModelAndView filterDisposal(@DateTimeFormat(pattern="yyyy-MM-dd") LocalDate startDate, 
			@DateTimeFormat(pattern="yyyy-MM-dd")LocalDate endDate) {
		ModelAndView mv=new ModelAndView("reports/AllitemRequest");	
		
		List<ItemRequest> allitemsRequestList = itemRequestRepo.findAll();
		List<ItemRequest> itemsRequestList = allitemsRequestList.stream().filter(e->e.getDateOfRequest().isAfter(startDate)&&e.getDateOfRequest().isBefore(endDate)).collect(Collectors.toList());
		
		mv.addObject("itemRequestlist", itemsRequestList);
		Long l=itemsRequestList.stream().count();
		mv.addObject("reqNum",l);		
					
	  return mv;
	}
	
	@GetMapping("/itemRequests/approve")
	public String ApproveItemRequest() {
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username ="";
		 if (principal instanceof UserDetails) {
		   username = ((UserDetails)principal).getUsername();
		 } else {
		   username = principal.toString();
		 }
		ModelAndView mv= new ModelAndView();
		mv.addObject("bid", bid);
		System.out.print(bid);
		BatchItemRequest batchItemsRequest= batchItemRequestRepo.findById(bid).orElse(new BatchItemRequest());
		batchItemsRequest.setStatus("Approved");
		batchItemsRequest.setApprovedBy(username);
		batchItemsRequest.setDateOfApproval(LocalDate.now());
		batchItemRequestRepo.save(batchItemsRequest);
		return "redirect:/batchItemRequests";
	}
	
	@GetMapping("/itemRequests/reject")
	public String rejectItemRequest() {
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username ="";
		 if (principal instanceof UserDetails) {
		   username = ((UserDetails)principal).getUsername();
		 } else {
		   username = principal.toString();
		 }
		ModelAndView mv= new ModelAndView();
		mv.addObject("bid", bid);
		System.out.print(bid);
		BatchItemRequest batchItemsRequest= batchItemRequestRepo.findById(bid).orElse(new BatchItemRequest());
		batchItemsRequest.setStatus("Rejected");
		batchItemsRequest.setApprovedBy(username);
		batchItemsRequest.setDateOfApproval(LocalDate.now());
		batchItemRequestRepo.save(batchItemsRequest);
		return "redirect:/batchItemRequests";
	}
	
	public String getItemName(Integer id) {
		Item i=itemRepo.findById(id).get();
		return i.getItemName();
	}
	
	
}
