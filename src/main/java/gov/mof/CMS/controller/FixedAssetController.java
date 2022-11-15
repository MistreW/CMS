package gov.mof.CMS.controller;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import gov.mof.CMS.model.FixedAsset;
import gov.mof.CMS.repository.FixedAssetRepo;

@Controller
public class FixedAssetController {
			
		@Autowired
		FixedAssetRepo fixedAssetRepo;

		@GetMapping("/fixedassets")
		public String GetFiexedAsset(Model model) {
			
			
			List<FixedAsset> fixedAssetListFirst = fixedAssetRepo.findAll();
			LocalDate ld=LocalDate.now();
			fixedAssetListFirst.stream().forEach((e)->{
				if(e.getLinearDepreciation()) {
					Float days=(float) ChronoUnit.DAYS.between(e.getDateOfPurchase(),ld);
					Float perDay=(e.getPurchaseCost()/e.getAssetLife())/365;
					Float value=e.getPurchaseCost()-(days*perDay);
					if(value<=9)
						value=10.0f;
					e.setResidualValue(value);
					updateFixedAsset(e);
				}
				
			});
			
			List<FixedAsset> fixedAssetList = fixedAssetRepo.findAll();
			
			  model.addAttribute("fixedassetlist",fixedAssetList);
			  
			  return "fixedasset";
		}
		
		 @RequestMapping("fixedAsset/findById")
			@ResponseBody
			public Optional<FixedAsset> findBy(Integer id) {
			 return fixedAssetRepo.findById(id);
		 }
		
		@RequestMapping("fixedAsset/addNew")
		public String addFixedAsset(FixedAsset fixedAsset) {
			fixedAssetRepo.save(fixedAsset);
			return "redirect:/fixedassets";
		}
		
		@RequestMapping("fixedAsset/update")
		public String updateFixedAsset(FixedAsset fixedAsset) {
			fixedAssetRepo.save(fixedAsset);
			return "redirect:/fixedassets";
		}
		
		@RequestMapping("fixedAsset/delete")
		public String deleteFixedAsset(Integer id) { //not as PathParam
			FixedAsset us=fixedAssetRepo.findById(id).orElse(new FixedAsset());
			fixedAssetRepo.delete(us);
			return "redirect:/fixedassets";
			}
			
		}
