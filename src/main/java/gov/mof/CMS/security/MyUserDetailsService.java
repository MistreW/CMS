package gov.mof.CMS.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import gov.mof.CMS.model.Users;
import gov.mof.CMS.repository.UserRepo;
import  gov.mof.CMS.LoginAttempt;


@Service
public class MyUserDetailsService implements UserDetailsService {
	@Autowired 
	private LoginAttempt loginAttemptService;
	@Autowired
	private UserRepo userRepo;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	
	if(loginAttemptService.isBlocked(username)) { 
			throw new LockedException("User Account is Locked");}

		Users user= userRepo.findByUserName(username);
		return new MyUserDetails(user);
	}

}
