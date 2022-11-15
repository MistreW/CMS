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
public class Item {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String itemName;
	private String description;
	private Float currentAmount;
	private String measurement;
	private String category;
	private Float threshold;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Float getCurrentAmount() {
		return currentAmount;
	}
	public void setCurrentAmount(Float currentAmount) {
		this.currentAmount = currentAmount;
	}
	public String getMeasurement() {
		return measurement;
	}
	public void setMeasurement(String measurement) {
		this.measurement = measurement;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Float getThreshold() {
		return threshold;
	}
	public void setThreshold(Float threshold) {
		this.threshold = threshold;
	}
	@Override
	public String toString() {
		return "Item [id=" + id + ", itemName=" + itemName + ", description=" + description + ", currentAmount="
				+ currentAmount + ", measurement=" + measurement + ", category=" + category + ", threshold=" + threshold
				+ "]";
	} 	
	
	

}
