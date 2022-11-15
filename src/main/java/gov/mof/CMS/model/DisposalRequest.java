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
public class DisposalRequest{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer disposalId;
	
	@ManyToOne
	@JoinColumn(name="itemId",insertable =false,updatable=false)
	private Item item;
	private Integer itemId;
	
	private Float amountRequested;
	
	private String reason;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate dateOfRequest;
	private String requestedBy ;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate dateOfApproval;
	private String approvedBy ;
	
	
	private String status;


	public Integer getDisposalId() {
		return disposalId;
	}


	public void setDisposalId(Integer disposalId) {
		this.disposalId = disposalId;
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


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public LocalDate getDateOfRequest() {
		return dateOfRequest;
	}


	public void setDateOfRequest(LocalDate dateOfRequest) {
		this.dateOfRequest = dateOfRequest;
	}


	public String getRequestedBy() {
		return requestedBy;
	}


	public void setRequestedBy(String requestedBy) {
		this.requestedBy = requestedBy;
	}


	public LocalDate getDateOfApproval() {
		return dateOfApproval;
	}


	public void setDateOfApproval(LocalDate dateOfApproval) {
		this.dateOfApproval = dateOfApproval;
	}


	public String getApprovedBy() {
		return approvedBy;
	}


	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "DisposalRequest [disposalId=" + disposalId + ", item=" + item + ", itemId=" + itemId
				+ ", amountRequested=" + amountRequested + ", reason=" + reason + ", dateOfRequest=" + dateOfRequest
				+ ", requestedBy=" + requestedBy + ", dateOfApproval=" + dateOfApproval + ", approvedBy=" + approvedBy
				+ ", status=" + status + "]";
	}


	
	
 
}
