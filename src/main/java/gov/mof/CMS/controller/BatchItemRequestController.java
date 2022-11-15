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
import gov.mof.CMS.model.BatchItemRequest;
import gov.mof.CMS.repository.BacthItemRequestRepo;
import gov.mof.CMS.repository.ItemRepo;
import gov.mof.CMS.repository.ItemRequestRepo;

@Controller
public class BatchItemRequestController {
	@Autowired
	BacthItemRequestRepo batchItemRequestRepo;
	
	@Autowired
	ItemRequestRepo itemRequestRepo;
	@Autowired
	ItemRepo itemRepo;

	@GetMapping("/batchItemRequests")
	public String GetBatchItemRequest(Model model) {
		
		List<BatchItemRequest> batchItemsRequestList = batchItemRequestRepo.findAll();
		model.addAttribute("batchItemRequestlist",batchItemsRequestList);
		
		Integer maxId=0;
		Comparator<BatchItemRequest> maxIdComparator = new Comparator<BatchItemRequest>() {
			 public int compare(BatchItemRequest d1, BatchItemRequest d2) {
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
		
		
		
		  return "batchItemRequest";
	}
	
	 @RequestMapping("batchItemRequest/findById")
		@ResponseBody
		public Optional<BatchItemRequest> findBy(Integer id) {
		 return batchItemRequestRepo.findById(id);
	 }
	 
	 @RequestMapping("batachItemRequest/addNew")
		public String addItemRequest(BatchItemRequest batchItemRequest) {
		 
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username ="";
		 if (principal instanceof UserDetails) {
		   username = ((UserDetails)principal).getUsername();
		 } else {
		   username = principal.toString();
		 }
		 
		 batchItemRequest.setRequestedBy(username);
		 batchItemRequest.setDateOfRequest(LocalDate.now());
		 batchItemRequest.setStatus("On-Progress");
		 
		 batchItemRequestRepo.save(batchItemRequest);
			
			  Integer bid=batchItemRequest.getBatchId(); 
			  			 
		 return "redirect:/itemRequests?batchId="+bid;
		}
}
