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
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
public class ItemPurchase implements Comparable<ItemPurchase>{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer purchaseId ;

	@ManyToOne
	@JoinColumn(name="itemId",insertable =false,updatable=false)
	private Item item;
	private Integer itemId;
	
	private Float amountPurchased;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate dateOfPurchase;
	private Float purchasePrice;
	
	
	public Integer getPurchaseId() {
		return purchaseId;
	}
	public void setPurchaseId(Integer purchaseId) {
		this.purchaseId = purchaseId;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public Float getAmountPurchased() {
		return amountPurchased;
	}
	public void setAmountPurchased(Float amountPurchased) {
		this.amountPurchased = amountPurchased;
	}
	public LocalDate getDateOfPurchase() {
		return dateOfPurchase;
	}
	public void setDateOfPurchase(LocalDate dateOfPurchase) {
		this.dateOfPurchase = dateOfPurchase;
	}
	public Float getPurchasePrice() {
		return purchasePrice;
	}
	public void setPurchasePrice(Float purchasePrice) {
		this.purchasePrice = purchasePrice;
	}
	
	
	@Override
	public String toString() {
		return "ItemPurchase [purchaseId=" + purchaseId + ", item=" + item + ", itemId=" + itemId + ", amountPurchased="
				+ amountPurchased + ", dateOfPurcahse=" + dateOfPurchase + ", purchasePrice=" + purchasePrice + "]";
	}
	
	public int compareTo(ItemPurchase d) {
		 return d.purchaseId.compareTo(purchaseId); // call String's compareTo
		 } 
 
}
