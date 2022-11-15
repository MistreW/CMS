package gov.mof.CMS.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import gov.mof.CMS.model.Item;
import gov.mof.CMS.model.ItemPurchase;
import gov.mof.CMS.model.SalesRegistration;
import gov.mof.CMS.repository.DisposalRepo;
import gov.mof.CMS.repository.FixedAssetRepo;
import gov.mof.CMS.repository.FoodItemsRepo;
import gov.mof.CMS.repository.ItemPurchaseRepo;
import gov.mof.CMS.repository.ItemRepo;
import gov.mof.CMS.repository.SalesRegistrationRepo;

@Controller
public class homecont {
	@Autowired
	ItemRepo itemRepo;
	@Autowired
	SalesRegistrationRepo salesRepo;
	@Autowired
	FoodItemsRepo foodItemRepo;
	@Autowired
	FixedAssetRepo fixedAssetRepo;
	@Autowired
	DisposalRepo disposalRepo;
	@Autowired
	ItemPurchaseRepo itemPurchase;
	
	@RequestMapping("/")
	public String firsthome() {
		return "common/login";
	}
	@RequestMapping("/home")
	public ModelAndView home(Principal principal) {
		String s= principal.getName();
		ModelAndView mv=new ModelAndView("welcome");
		mv.addObject("userName", s);
		
		List<Item> itemsBelowThresholdList = itemRepo.findAll();
		Long ls=itemsBelowThresholdList.stream().filter(a->a.getCurrentAmount()<a.getThreshold()).count();
		mv.addObject("itemBelowlist",ls);
		
		List<SalesRegistration> salesList = salesRepo.findAll();
		mv.addObject("itemCount", itemRepo.count());
		Float today=0.0f;
		try {
				today=salesList.stream().filter(x->x.getDateOfSales().equals(LocalDate.now())).map(x -> x.getSalesPrice()*x.getAmount()).reduce(0.0f, Float::sum);
		}
		catch(NullPointerException e) {
			today=0.0f;
		}
		mv.addObject("today", today);
				
		Float sum=0.0f;
		try {
				sum=salesList.stream().map(x -> x.getSalesPrice()*x.getAmount()).reduce(0.0f, Float::sum);
		}
		catch(NullPointerException e) {
			sum=0.0f;
		}
				mv.addObject("allSales", sum);	
				
				Float inmof=0.0f;
				try {
						inmof=salesList.stream().filter(e->e.getDateOfSales().equals(LocalDate.now()))
								.filter(e->e.getUsers().getRole().getName().equals("CASHERMOF"))
								.map(x -> x.getSalesPrice()*x.getAmount()).reduce(0.0f, Float::sum);
				}
				catch(NullPointerException e) {
					inmof=0.0f;
				}
				Float inppa=0.0f;
				try {
						inppa=salesList.stream().filter(e->e.getDateOfSales().equals(LocalDate.now()))
								.filter(e->e.getUsers().getRole().getName().equals("CASHERPPA"))
								.map(x -> x.getSalesPrice()*x.getAmount()).reduce(0.0f, Float::sum);
				}
				catch(NullPointerException e) {
					inppa=0.0f;
				}
				
				mv.addObject("inMOF",inmof);
				mv.addObject("inPPA",inppa);		
				
				Float thisMonthSales=0.0f;
				try {
					thisMonthSales=salesList.stream()
							.filter(e->e.getDateOfSales().getMonth().equals(LocalDate.now().getMonth()))
							.map(x -> x.getSalesPrice()*x.getAmount()).reduce(0.0f, Float::sum);
				}
				catch(NullPointerException e) {
					thisMonthSales=0.0f;
				}
						mv.addObject("thisMonthSales", thisMonthSales);	
						
				
						List<ItemPurchase> purchseList = itemPurchase.findAll();			
			Float thisMonthPurchase=0.0f;
				try {
					thisMonthPurchase=purchseList.stream()
							.filter(e->e.getDateOfPurchase().getMonth().equals(LocalDate.now().getMonth()))
							.map(x -> x.getPurchasePrice()).reduce(0.0f, Float::sum);
				}
				catch(NullPointerException e) {
					thisMonthPurchase=0.0f;
				}
						mv.addObject("thisMonthPurchase", thisMonthPurchase);			
						
						
				mv.addObject("food", foodItemRepo.count());
				mv.addObject("asset",fixedAssetRepo.count());
				mv.addObject("disposed",disposalRepo.count());
				
				Integer activeAssets= fixedAssetRepo.findAll().stream().filter(e->e.getActive()).collect(Collectors.toList()).size();
						mv.addObject("activeAsset",activeAssets);
						
						mv.addObject("month", LocalDate.now().getMonth());
						
				
		
		return mv;
	}
	
	@RequestMapping("/topTensales")
	public String purchsevsSales() {
		return "dashboard/salesChart";
	}
	@RequestMapping("/topPurchase")
	public String toptenpage() {
		return "dashboard/topTenPurchase";
	}
	
	@RequestMapping("/topDisposed")
	public String toptenDisposed() {
		return "dashboard/topTenDisposed";
	}
	
	@RequestMapping("/login")
	public String loginpage() {
		return "common/login";
	}
	
	
	
	@RequestMapping("/logout-success")
	public String logoutpage(HttpServletRequest request) {
		SecurityContextHolder.getContext().setAuthentication(null);
        SecurityContextHolder.clearContext();
        HttpSession hs = request.getSession();
        hs.invalidate();
		return "common/logout";
	}
	
	
	/*
	 * @RequestMapping("/linechartdata")
	 * 
	 * @ResponseBody public String getDataFromDB(){ List<SalesDto> foodCount =
	 * salesRepo.findFoodByCount();
	 * 
	 * JsonArray jsonArrayCoursename = new JsonArray(); JsonArray jsonArraycourehour
	 * = new JsonArray();
	 * 
	 * JsonObject jsonObject = new JsonObject();
	 * 
	 * foodCount.forEach(data->{ jsonArrayCoursename.add(data.getFoodName());
	 * jsonArraycourehour.add(data.getFoodCount()); });
	 * 
	 * 
	 * jsonObject.add("categories", jsonArrayCoursename);
	 * jsonObject.add("series",jsonArraycourehour);
	 * 
	 * return jsonObject.toString(); }
	 */
}

/* TESTING
 * 
 * @Autowired UserRepo userrepo;
 * 
 * @RequestMapping("/") public String homer() { return "welcome"; }
 * 
 * @RequestMapping("/adduser") public String addUser(Users user) {
 * userrepo.save(user); return "home"; }
 * 
 * @RequestMapping("/updateuser") public String updateUser(Users user) {
 * userrepo.save(user); return "home"; }
 * 
 * @RequestMapping("/getuser") //@ResponseBody public ModelAndView
 * getUser(Integer id) { //Optional <User> u= userrepo.findById(id);
 * ModelAndView mv=new ModelAndView("showuser"); Users u=
 * userrepo.findById(id).orElse(new Users()); mv.addObject(u); return mv;
 * 
 * }
 * 
 * @RequestMapping("/getone/{aid}")
 * 
 * @ResponseBody public String getOneUser(@PathVariable("aid") Integer id) {
 * //not as PathParam return userrepo.findById(id).toString(); }
 * 
 * 
 * @RequestMapping("/deletone") public String deleteOneUser(Integer id) { //not
 * as PathParam Users us=userrepo.findById(id).orElse(new Users());
 * userrepo.delete(us); return "home"; }
 * 
 * 
 * 
 * @ResponseBody public String getAllUser() { //return as List return
 * userrepo.findAll().toString(); }
 * 
 * 
 * @RequestMapping("/getall")
 * 
 * @ResponseBody public List<Users> getAllUser() { //as Jason return
 * userrepo.findAll(); }
 * 
 * }
 */
