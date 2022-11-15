package gov.mof.CMS.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import gov.mof.CMS.model.Roles;


public interface RoleRepo extends JpaRepository<Roles, Integer>{

}
