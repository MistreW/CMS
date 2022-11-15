package gov.mof.CMS.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import gov.mof.CMS.model.ItemRequest;

public interface ItemRequestRepo extends JpaRepository<ItemRequest, Integer>{

	//@Query("UPDATE item SET amount current_amount=current_amount+ ?1 where ItemId=?2")
	//void UpdateItemAmount(Integer itemID, Float amount);
	//List<ItemRequest> findAllBatchId(Integer batchId);
	
}
