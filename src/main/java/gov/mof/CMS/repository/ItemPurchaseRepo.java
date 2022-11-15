package gov.mof.CMS.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import gov.mof.CMS.dto.PurchaseDto;
import gov.mof.CMS.model.ItemPurchase;

public interface ItemPurchaseRepo extends JpaRepository<ItemPurchase, Integer>{

	@Query("SELECT " +
	           "    new gov.mof.CMS.dto.PurchaseDto(v.item.itemName, SUM(v.purchasePrice)) " +
	           "FROM " +
	           "    ItemPurchase v " +
	           "GROUP BY " +
	           "    v.item.itemName")
	    List<PurchaseDto> findPurchaseItemByCount();
	
}
