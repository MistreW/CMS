package gov.mof.CMS.controller;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import gov.mof.CMS.dto.DisposedDto;
import gov.mof.CMS.dto.PurchaseDto;
import gov.mof.CMS.dto.SalesDto;
import gov.mof.CMS.repository.DisposalRepo;
import gov.mof.CMS.repository.FixedAssetRepo;
import gov.mof.CMS.repository.FoodItemsRepo;
import gov.mof.CMS.repository.ItemPurchaseRepo;
import gov.mof.CMS.repository.ItemRepo;
import gov.mof.CMS.repository.SalesRegistrationRepo;

@Controller
public class ChartController {
		
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
	
	
	@RequestMapping("/salesByItem")
	@ResponseBody
	public String getDataFromDB(){
		List<SalesDto> foodCount = salesRepo.findFoodByCount();
		Collections.sort(foodCount);
		//foodCount= foodCount.stream().limit(10).collect(Collectors.toList());
		JsonArray jsonArrayCoursename = new JsonArray();
		JsonArray jsonArraycourehour = new JsonArray();
	   
		JsonObject jsonObject = new JsonObject();
		
		foodCount.forEach(data->{
			jsonArrayCoursename.add(data.getFoodName());
			jsonArraycourehour.add(data.getFoodCount());
		});
		
		jsonObject.add("categories", jsonArrayCoursename);
		jsonObject.add("series",jsonArraycourehour);

		return jsonObject.toString();
	}
	
	@RequestMapping("/topTenPurchase")
	@ResponseBody
	public String getPurchase(){
		List<PurchaseDto> foodCount = itemPurchase.findPurchaseItemByCount();
		Collections.sort(foodCount);
		foodCount= foodCount.stream().limit(10).collect(Collectors.toList());
		JsonArray jsonArrayCoursename = new JsonArray();
		JsonArray jsonArraycourehour = new JsonArray();
	   
		JsonObject jsonObject = new JsonObject();
		
		
		foodCount.forEach(data->{
			jsonArrayCoursename.add(data.getItemName());
			jsonArraycourehour.add(data.getItemCount());
		});
	
		jsonObject.add("categories", jsonArrayCoursename);
		jsonObject.add("series",jsonArraycourehour);

		return jsonObject.toString();
	}
	
	@RequestMapping("/topTenDisposedItems")
	@ResponseBody
	public String getDisposedItem(){
		List<DisposedDto> foodCount = disposalRepo.findDisposedItems();
		Collections.sort(foodCount);
		foodCount= foodCount.stream().limit(10).collect(Collectors.toList());
		JsonArray jsonArrayCoursename = new JsonArray();
		JsonArray jsonArraycourehour = new JsonArray();
	   
		JsonObject jsonObject = new JsonObject();
		
		foodCount.forEach(data->{
			jsonArrayCoursename.add(data.getItemName());
			jsonArraycourehour.add(data.getItemCount());
		});
		
		jsonObject.add("categories", jsonArrayCoursename);
		jsonObject.add("series",jsonArraycourehour);
		
		
		return jsonObject.toString();
	}
	
}
