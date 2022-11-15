package gov.mof.CMS.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import gov.mof.CMS.dto.SalesDto;
import gov.mof.CMS.model.SalesRegistration;

public interface SalesRegistrationRepo extends JpaRepository<SalesRegistration, Integer>{
	
	@Query("SELECT " +
	           "    new gov.mof.CMS.dto.SalesDto(v.foodItems.foodName, SUM(v.amount)) " +
	           "FROM " +
	           "    SalesRegistration v " +
	           "GROUP BY " +
	           "    v.foodItems.foodName")
	    List<SalesDto> findFoodByCount();
}
