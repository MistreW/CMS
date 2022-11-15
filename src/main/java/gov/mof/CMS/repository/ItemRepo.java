package gov.mof.CMS.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import gov.mof.CMS.model.Item;


public interface ItemRepo extends JpaRepository<Item, Integer>{
	/*
	 * @Modifying
	 * 
	 * @Query("update Item u set u.currentAmount = currentAmount+ : amount where u.id = :id"
	 * ) public void updateCurretAmmount(@Param(value = "id") Integer
	 * id, @Param(value = "amount") Float amount);
	 */
	Item findByItemName(String itemName);
}
