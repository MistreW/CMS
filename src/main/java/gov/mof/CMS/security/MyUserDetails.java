package gov.mof.CMS.security;

import java.util.Collection;
import java.util.Collections;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import gov.mof.CMS.model.Users;


public class MyUserDetails implements UserDetails {

	private static final long serialVersionUID = 1L;
	
	private Users user;
	
	
	public MyUserDetails(Users user) {
		super();
		this.user = user;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return Collections.singleton(new SimpleGrantedAuthority(user.getRole().getDescription()));
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String  getUsername() {
		return user.getUserName();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return user.getIsActive();
	}
	
	public Users getUser(){
		return user;
	}

}
