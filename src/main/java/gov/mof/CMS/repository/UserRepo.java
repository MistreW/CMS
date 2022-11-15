package gov.mof.CMS.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import gov.mof.CMS.model.Users;

public interface UserRepo extends JpaRepository<Users, Integer>{

//@Query("from user where firstname=?1 Order by firstname")
Users findByUserName(String name);
}
