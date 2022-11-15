package gov.mof.CMS.model;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.Id;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
//@IdClass(BatchCompositId.class)
public class PurchaseBatchItem{

	@Id
	private Integer batchId; 
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate dateOfRequest;
	private String requestedBy ;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate dateOfApproval;
	private String approvedBy ;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate dateOfEstimation;
	private String estimatedBy ;
	
	private String status;

	public Integer getBatchId() {
		return batchId;
	}

	public void setBatchId(Integer batchId) {
		this.batchId = batchId;
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

	public LocalDate getDateOfEstimation() {
		return dateOfEstimation;
	}

	public void setDateOfEstimation(LocalDate dateOfEstimation) {
		this.dateOfEstimation = dateOfEstimation;
	}

	public String getEstimatedBy() {
		return estimatedBy;
	}

	public void setEstimatedBy(String estimatedBy) {
		this.estimatedBy = estimatedBy;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "PurchaseBatchItem [batchId=" + batchId + ", dateOfRequest=" + dateOfRequest + ", requestedBy="
				+ requestedBy + ", dateOfApproval=" + dateOfApproval + ", approvedBy=" + approvedBy
				+ ", dateOfEstimation=" + dateOfEstimation + ", estimatedBy=" + estimatedBy + ", status=" + status
				+ "]";
	}
	
	
	
	
	
 
}
