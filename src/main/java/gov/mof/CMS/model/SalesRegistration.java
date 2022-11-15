package gov.mof.CMS.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SalesRegistration {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer salesId;

	@ManyToOne
	@JoinColumn(name="foodId",insertable =false,updatable=false)
	private FoodItems foodItems;
	private Integer foodId;
	
	private Float amount;
		
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate dateOfSales;
	
	private Float salesPrice;
	
	@ManyToOne
	@JoinColumn(name="userId",insertable =false,updatable=false)
	private Users users;
	private Integer userId;
	
	private Float totalSales;
	
	
	public Integer getSalesId() {
		return salesId;
	}
	public void setSalesId(Integer salesId) {
		this.salesId = salesId;
	}
	public FoodItems getFoodItems() {
		return foodItems;
	}
	public void setFoodItems(FoodItems foodItems) {
		this.foodItems = foodItems;
	}
	public Integer getFoodId() {
		return foodId;
	}
	public void setFoodId(Integer foodId) {
		this.foodId = foodId;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public LocalDate getDateOfSales() {
		return dateOfSales;
	}
	public void setDateOfSales(LocalDate dateOfSales) {
		this.dateOfSales = dateOfSales;
	}
	public Float getSalesPrice() {
		return salesPrice;
	}
	public void setSalesPrice(Float salesPrice) {
		this.salesPrice = salesPrice;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public Float getTotalSales() {
		return totalSales;
	}
	public void setTotalSales(Float totalSales) {
		this.totalSales = totalSales;
	}
	@Override
	public String toString() {
		return "SalesRegistration [salesId=" + salesId + ", foodItems=" + foodItems + ", foodId=" + foodId + ", amount="
				+ amount + ", dateOfSales=" + dateOfSales + ", salesPrice=" + salesPrice + ", users=" + users
				+ ", userId=" + userId + ", totalSales=" + totalSales + "]";
	}
	
	
}
