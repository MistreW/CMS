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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import gov.mof.CMS.model.FoodItems;
import gov.mof.CMS.model.SalesRegistration;
import gov.mof.CMS.model.Users;
import gov.mof.CMS.repository.FoodItemsRepo;
import gov.mof.CMS.repository.SalesRegistrationRepo;
import gov.mof.CMS.repository.UserRepo;

@Controller
public class SalesController {
	@Autowired
	SalesRegistrationRepo salesRepo;

	@Autowired
	FoodItemsRepo foodRepo;
	@Autowired
	UserRepo userRepo;
	String userName;
	@GetMapping("/sales")
	public String GetSelles(Model model) {
		userName=SecurityContextHolder.getContext().getAuthentication().getName().toString();
		Users us=userRepo.findByUserName(userName);
		Integer userid=us.getUserId();
		List<SalesRegistration> saleslistfilter;
		List<SalesRegistration> salesList = salesRepo.findAll();
		if(us.getRoleId()==2)
			saleslistfilter= salesList.stream().filter(e->e.getDateOfSales().equals(LocalDate.now()))
			.collect(Collectors.toList());
		else
		saleslistfilter= salesList.stream().filter(e->e.getUserId().equals(userid) && e.getDateOfSales().equals(LocalDate.now()))
														.collect(Collectors.toList());
		model.addAttribute("saleslist",saleslistfilter);
		
		List<FoodItems> foodList = foodRepo.findAll();
		model.addAttribute("foodlist", foodList);
		Float today=0.0f;
		try {
				today=salesList.stream().filter(x->x.getDateOfSales().equals(LocalDate.now())).map(x -> x.getSalesPrice()*x.getAmount()).reduce(0.0f, Float::sum);
		}
		catch(NullPointerException e) {
			today=0.0f;
		}
				model.addAttribute("today", today);
			 
	  return "sales";
	}
	
	

	@RequestMapping("sales/findById")
	@ResponseBody
	public Optional<SalesRegistration> findBy(Integer id) {
		return salesRepo.findById(id);
	}

	@RequestMapping("sales/addNew")
	public String addSales(SalesRegistration sales) {
		FoodItems fi=foodRepo.getById(sales.getFoodId());
		Float price=fi.getCurrentPrice();
		sales.setSalesPrice(price);
		sales.setTotalSales(price*sales.getAmount());
		
		sales.setDateOfSales(LocalDate.now());
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName ="";
		 if (principal instanceof UserDetails) {
			 userName = ((UserDetails)principal).getUsername();
		 } else {
			 userName = principal.toString();
		 }
		Users us=userRepo.findByUserName(userName);		
		sales.setUserId(us.getUserId());
		
		salesRepo.save(sales);
		return "redirect:/sales";
	}

	@RequestMapping("sales/update")
	public String updateSales(SalesRegistration sales) {
		
		FoodItems fi=foodRepo.getById(sales.getFoodId());
		Float price=fi.getCurrentPrice();
		sales.setSalesPrice(price);
		sales.setTotalSales(price*sales.getAmount());
		salesRepo.save(sales);
		return "redirect:/sales";
	}

	@RequestMapping("sales/delete")
	public String deleteSales(Integer id) { // not as PathParam
		SalesRegistration us = salesRepo.findById(id).orElse(new SalesRegistration());
		salesRepo.delete(us);
		return "redirect:/sales";
	}
	
	@GetMapping("/allSales")
	public ModelAndView GetAllSelles(Model model) {
			
		List<SalesRegistration> salesList = salesRepo.findAll();
		model.addAttribute("saleslist",salesList);
		
		ModelAndView mv=new ModelAndView("reports/allSales");
		Float sum=0.0f;
		try {
				sum=salesList.stream().map(x -> x.getSalesPrice()*x.getAmount()).reduce(0.0f, Float::sum);
		}
		catch(NullPointerException e) {
			sum=0.0f;
		}
				mv.addObject("sales", sum);
				
				Float today=0.0f;
				try {
						today=salesList.stream().filter(x->x.getDateOfSales().equals(LocalDate.now())).map(x -> x.getSalesPrice()*x.getAmount()).reduce(0.0f, Float::sum);
				}
				catch(NullPointerException e) {
					today=0.0f;
				}
						mv.addObject("today", today);	
						
						
		String userName = SecurityContextHolder.getContext().getAuthentication().getName().toString();
		mv.addObject("userName", userName);
					 
	  return mv;
	}
	
	
	@GetMapping("/todaySales")
	public String GetTodaysSales(Model model) {
			
		List<SalesRegistration> salesList = salesRepo.findAll();
		List<SalesRegistration> todaySales=salesList.stream().filter(e->e.getDateOfSales().equals(LocalDate.now())).collect(Collectors.toList());
		model.addAttribute("saleslist",todaySales);
		
		Float today=0.0f;
		try {
				today=salesList.stream().filter(x->x.getDateOfSales().equals(LocalDate.now())).map(x -> x.getSalesPrice()*x.getAmount()).reduce(0.0f, Float::sum);
		}
		catch(NullPointerException e) {
			today=0.0f;
		}
		model.addAttribute("today", today);	
	///	
		Float inmof=0.0f;
		try {
				inmof=todaySales.stream().filter(e->e.getDateOfSales().equals(LocalDate.now()))
						.filter(e->e.getUsers().getRole().getName().equals("CASHERMOF"))
						.map(x -> x.getSalesPrice()*x.getAmount()).reduce(0.0f, Float::sum);
		}
		catch(NullPointerException e) {
			inmof=0.0f;
		}
		Float inppa=0.0f;
		try {
				inppa=todaySales.stream().filter(e->e.getDateOfSales().equals(LocalDate.now()))
						.filter(e->e.getUsers().getRole().getName().equals("CASHERPPA"))
						.map(x -> x.getSalesPrice()*x.getAmount()).reduce(0.0f, Float::sum);
		}
		catch(NullPointerException e) {
			inppa=0.0f;
		}
		
		model.addAttribute("inMOF",inmof);
		model.addAttribute("inPPA",inppa);
		///
				
		String userName = SecurityContextHolder.getContext().getAuthentication().getName().toString();
		model.addAttribute("userName", userName);		
					 
	  return "reports/todaySales";
	}
	
	
	@GetMapping("/salesFilter")
	public ModelAndView filterSelles(@DateTimeFormat(pattern="yyyy-MM-dd") LocalDate startDate, 
			@DateTimeFormat(pattern="yyyy-MM-dd")LocalDate endDate) {
		ModelAndView mv=new ModelAndView("reports/allSales");	
		
		List<SalesRegistration> allSalesList = salesRepo.findAll();
		List<SalesRegistration> salesList = allSalesList.stream().filter(e->e.getDateOfSales().isAfter(startDate)&&e.getDateOfSales().isBefore(endDate)).collect(Collectors.toList());
				
		
		Float sum=0.0f;
		try {
				sum=salesList.stream().map(x -> x.getSalesPrice()*x.getAmount()).reduce(0.0f, Float::sum);
		}
		catch(NullPointerException e) {
			sum=0.0f;
		}
		
		mv.addObject("saleslist", salesList);		
		mv.addObject("sales", sum);
			
					 
	  return mv;
	}
	
}
