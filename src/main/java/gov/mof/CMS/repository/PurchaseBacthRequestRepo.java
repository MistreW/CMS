package gov.mof.CMS.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import gov.mof.CMS.model.PurchaseBatchItem;

public interface PurchaseBacthRequestRepo extends JpaRepository<PurchaseBatchItem, Integer>{

}
