package gov.mof.CMS.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import gov.mof.CMS.dto.DisposedDto;
import gov.mof.CMS.model.DisposalRequest;

public interface DisposalRepo extends JpaRepository<DisposalRequest, Integer>{
	
	@Query("SELECT " +
	           "    new gov.mof.CMS.dto.DisposedDto(v.item.itemName, COUNT(v)) " +
	           "FROM " +
	           "    DisposalRequest v " +
	           "WHERE v.status='Disposed' "+
	           "GROUP BY " +
	           "    v.item.itemName")
	    List<DisposedDto> findDisposedItems();
	
		
}
