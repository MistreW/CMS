package gov.mof.CMS.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import gov.mof.CMS.model.FoodItems;

public interface FoodItemsRepo extends JpaRepository<FoodItems, Integer>{
FoodItems findByFoodName(String foodname);
}
