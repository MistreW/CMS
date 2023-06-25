package gov.mof.CMS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import  gov.mof.CMS.LoginAttempt;


@Component 
public class AuthenticationSuccessEventListener implements ApplicationListener<AuthenticationSuccessEvent> { 
 
 @Autowired 
 private LoginAttempt loginAttemptService; 
 @Override 
 public void onApplicationEvent(AuthenticationSuccessEvent authenticationSuccessEvent) { 
 User user = (User) authenticationSuccessEvent.getAuthentication().getPrincipal(); 
 loginAttemptService.loginSuccess(user.getUsername()); 
 } 
} 
