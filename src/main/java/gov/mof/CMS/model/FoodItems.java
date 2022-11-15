package gov.mof.CMS.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FoodItems {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer foodId;

	//@NotNull (message = "Please enter your Food Name.")
	private String foodName;
	
	
	private String category;
	
	//@NotNull
	//@Min(message = "Please Enter valid price", value =1)
	private Float currentPrice;

	public Integer getFoodId() {
		return foodId;
	}

	public void setFoodId(Integer foodId) {
		this.foodId = foodId;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Float getCurrentPrice() {
		return currentPrice;
	}

	public void setCurrentPrice(Float currentPrice) {
		this.currentPrice = currentPrice;
	}

	@Override
	public String toString() {
		return "FoodItems [foodId=" + foodId + ", foodName=" + foodName + ", category=" + category + ", currentPrice="
				+ currentPrice + "]";
	}
	

}
