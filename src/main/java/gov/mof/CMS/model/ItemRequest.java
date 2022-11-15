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
@AllArgsConstructor
@NoArgsConstructor
@Data
//@IdClass(BatchCompositId.class)
public class ItemRequest{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer txId; 
	
	
	@ManyToOne
	@JoinColumn(name="batchId",insertable =false,updatable=false)
	private BatchItemRequest batch;
	private Integer batchId ;
	
	private Integer requestNumber ;

	@ManyToOne
	@JoinColumn(name="itemId",insertable =false,updatable=false)
	private Item item;
	private Integer itemId;
	
	private Float amountRequested;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate dateOfRequest;
	//private String requestedBy;

	public Integer getTxId() {
		return txId;
	}

	public void setTxId(Integer txId) {
		this.txId = txId;
	}

	public BatchItemRequest getBatch() {
		return batch;
	}

	public void setBatch(BatchItemRequest batch) {
		this.batch = batch;
	}

	public Integer getBatchId() {
		return batchId;
	}

	public void setBatchId(Integer batchId) {
		this.batchId = batchId;
	}

	public Integer getRequestNumber() {
		return requestNumber;
	}

	public void setRequestNumber(Integer requestNumber) {
		this.requestNumber = requestNumber;
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

	public Float getAmountRequested() {
		return amountRequested;
	}

	public void setAmountRequested(Float amountRequested) {
		this.amountRequested = amountRequested;
	}

	public LocalDate getDateOfRequest() {
		return dateOfRequest;
	}

	public void setDateOfRequest(LocalDate dateOfRequest) {
		this.dateOfRequest = dateOfRequest;
	}

	@Override
	public String toString() {
		return "ItemRequest [txId=" + txId + ", batch=" + batch + ", batchId=" + batchId + ", requestNumber="
				+ requestNumber + ", item=" + item + ", itemId=" + itemId + ", amountRequested=" + amountRequested
				+ ", dateOfRequest=" + dateOfRequest + "]";
	}
	
	
 
}
