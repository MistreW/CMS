package gov.mof.CMS;

import org.springframework.context.ApplicationListener;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.stereotype.Service;

import  gov.mof.CMS.LoginAttempt;


@Service 
public class AuthenticationFailureEventListener implements ApplicationListener<AuthenticationFailureBadCredentialsEvent> { 
 @Autowired 
 private LoginAttempt loginAttemptService; 
 
 
 @Override 
 public void onApplicationEvent(AuthenticationFailureBadCredentialsEvent 
authenticationFailureBadCredentialsEvent) { 

 String username = (String) authenticationFailureBadCredentialsEvent.getAuthentication().getPrincipal(); 
 loginAttemptService.loginFailed(username); 
 
 }}
