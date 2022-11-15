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
import gov.mof.CMS.model.DisposalRequest;
import gov.mof.CMS.model.Item;
import gov.mof.CMS.repository.DisposalRepo;
import gov.mof.CMS.repository.ItemRepo;
import gov.mof.CMS.validation.DisposalValidation;

@Controller
public class DisposalController {
	@Autowired
	DisposalRepo disposalRepo;

	@Autowired
	ItemRepo itemRepo;
	@Autowired
	private DisposalValidation validator;
	
	@InitBinder 
	private void initBinder(WebDataBinder binder) {
	 binder.setValidator(validator); 
	 }
	
	@GetMapping("/disposal")
	public String GetDisposalItems(Model model) {
		
			List<DisposalRequest> disposal= disposalRepo.findAll();
			List<DisposalRequest> disposalList=disposal.stream().filter(e->e.getStatus().equals("On-Progress")).collect(Collectors.toList());
			model.addAttribute("disposalList",disposalList);
		  
			List<Item> itemsList = itemRepo.findAll();
			model.addAttribute("itemlist",itemsList);

		  return "disposal";
	}
	
	 @RequestMapping("disposal/findById")
		@ResponseBody
		public Optional<DisposalRequest> findBy(Integer id) {
		 return disposalRepo.findById(id);
	 }
	 @RequestMapping("disposalAddNew")
		public String addItemDisposal(Model model) {
		 	List<Item> itemsList = itemRepo.findAll();
			model.addAttribute("itemlist",itemsList);
			return "registration/disposalRegistration";
	 }
		 
	 
	@RequestMapping("disposalSave")
	public String saveItemDisposal(@Validated @ModelAttribute("dispose") DisposalRequest disposalreq, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			List<Item> itemsList = itemRepo.findAll();
			model.addAttribute("itemlist",itemsList);
		return "registration/disposalRegistration";
		}
		else {
		disposalreq.setStatus("On-Progress");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username ="";
		 if (principal instanceof UserDetails) {
		   username = ((UserDetails)principal).getUsername();
		 } else {
		   username = principal.toString();
		 }
		disposalreq.setRequestedBy(username); //to be fetched from the system
		disposalreq.setDateOfRequest(LocalDate.now());
		disposalRepo.save(disposalreq);
		return "redirect:/disposal";
	}
	}
	
	@RequestMapping("disposal/update")
	public String updateDisposal(DisposalRequest disposalReq) {
		disposalRepo.save(disposalReq);
		return "redirect:/disposal";
	}
	
	@RequestMapping("disposal/delete")
	public String deleteDisposalRequest(Integer id) { //not as PathParam
		DisposalRequest us=disposalRepo.findById(id).orElse(new DisposalRequest());
		disposalRepo.delete(us);
		return "redirect:/disposal";
		}
	
	@RequestMapping("disposal/approve")
	public String approveDisposeItem(Integer id) {
		DisposalRequest disposalreq=disposalRepo.findById(id).orElse(new DisposalRequest());
		disposalreq.setStatus("Approved");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username ="";
		 if (principal instanceof UserDetails) {
		   username = ((UserDetails)principal).getUsername();
		 } else {
		   username = principal.toString();
		 }
		disposalreq.setApprovedBy(username); //to be fetched from the system
		disposalreq.setDateOfApproval(LocalDate.now());
		disposalRepo.save(disposalreq);
		return "redirect:/disposal";
	}
	
	@RequestMapping("disposal/reject")
	public String rejectDisposeItem(Integer id) {
		DisposalRequest disposalreq=disposalRepo.findById(id).orElse(new DisposalRequest());
		disposalreq.setStatus("Rejected");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username ="";
		 if (principal instanceof UserDetails) {
		   username = ((UserDetails)principal).getUsername();
		 } else {
		   username = principal.toString();
		 }
		disposalreq.setApprovedBy(username); //to be fetched from the system
		disposalreq.setDateOfApproval(LocalDate.now());
		disposalRepo.save(disposalreq);
		return "redirect:/disposal";
	}
	
	@RequestMapping("disposaldispose")
	public String disposeItem(Integer id) {
		DisposalRequest disposalreq=disposalRepo.findById(id).orElse(new DisposalRequest());
		Integer itemId=disposalreq.getItemId();
		Float amount= disposalreq.getAmountRequested();
		Item i=itemRepo.findById(itemId).orElse(new Item());
		Float currentAmount=i.getCurrentAmount();
		if (amount>currentAmount)
			return"errorNotEnoughItem";
		else
		{
		addCurretAmount(itemId,amount);
		disposalreq.setStatus("Disposed");		
		disposalRepo.save(disposalreq);
		return "redirect:/approvedDisposal";
		}
	}
	
	void addCurretAmount(Integer id, Float amount) {
		Item m= itemRepo.findById(id).orElse(new Item());
		m.setCurrentAmount(m.getCurrentAmount()-amount);
		itemRepo.save(m);
	}
	
	@GetMapping("/approvedDisposal")
	public String disposeItem(Model model) {
		
			List<DisposalRequest> disposalList = disposalRepo.findAll();
			List<DisposalRequest> approvedDisposalList =  disposalList.stream().filter(e->e.getStatus().equals("Approved")).collect(Collectors.toList());
			model.addAttribute("disposalList",approvedDisposalList);
		  
			List<Item> itemsList = itemRepo.findAll();
			model.addAttribute("itemlist",itemsList);

		  return "disposalApproved";
	}
	
	@GetMapping("/disposedItems")
	public String GetDisposedItem(Model model) {
		
			List<DisposalRequest> disposalList = disposalRepo.findAll();
			List<DisposalRequest> disposedList =disposalList.stream().filter(x->x.getStatus().equals("Disposed")).collect(Collectors.toList());
			model.addAttribute("disposedList",disposedList);
			
			Long l=disposedList.stream().count();
			model.addAttribute("total", l);
		  
		  return "reports/disposedItems";
	}
	
	@GetMapping("/disposalFilter")
	public ModelAndView filterDisposal(@DateTimeFormat(pattern="yyyy-MM-dd") LocalDate startDate, 
			@DateTimeFormat(pattern="yyyy-MM-dd")LocalDate endDate) {
		ModelAndView mv=new ModelAndView("reports/disposedItems");	
		
		List<DisposalRequest> allDisposalList = disposalRepo.findAll();
		List<DisposalRequest> approvedDisposalList =  allDisposalList.stream().filter(x->x.getStatus().equals("Disposed")).collect(Collectors.toList());
		List<DisposalRequest> disposalList = approvedDisposalList.stream().filter(e->e.getDateOfRequest().isAfter(startDate)&&e.getDateOfRequest().isBefore(endDate)).collect(Collectors.toList());
		
		mv.addObject("disposedList",disposalList);
		Long l=disposalList.stream().count();
		mv.addObject("total",l);		
					
	  return mv;
	}
	
	
	
}
