package gov.mof.CMS.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration 
@EnableWebSecurity
public class AppSecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
	private BCryptPasswordEncoder pass;
	
	//for Authentication 
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(pass);
	}

	//for Authorization 
	@Override
	protected void configure(HttpSecurity http) throws Exception {
	String[] resources = new String[]{
            "/include/**","/css/**","/icons/**","/img/**","/js/**","/layer/**","/vendor/**","/fonts/**"
    };
		// http.csrf().disable();
		
		http.requiresChannel().anyRequest().requiresSecure() 
		.and()
		.authorizeRequests()
		.antMatchers(resources).permitAll()
		.antMatchers("/login","/loginLocked").permitAll()
		
		.antMatchers("/users").hasRole("ADMIN")	
						 
		.antMatchers("/foods","/items","/fixedassets","/itemPurchases","/disposal",
				  "/approvedDisposal",
				  "/approvedBatchItemRequest").hasAnyRole("MAIN","CMANAGER")
		
				  
		.antMatchers("/purchaseBatchItems","/batchItemRequests").hasAnyRole("MAIN","MINI","CMANAGER","ACCOUNTANT")
		
		.antMatchers("/sales").hasAnyRole("CASHERMOF","CASHERPPA","CMANAGER")
				 
		.antMatchers("/","/login","/logout","/allItemRequests","/allSales",
							 "/disposedItems","/changePassword","/loginLocked").permitAll()
		.anyRequest().authenticated()//.and().httpBasic()
		
		.and()
		
		.formLogin()
		.loginPage("/login").permitAll()
		.defaultSuccessUrl("/home")
		.failureHandler(new AuthenticationFailureHandler() {
 
                @Override
                public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                        AuthenticationException exception) throws IOException, ServletException {String error = exception.getMessage();
                    System.out.println("A failed login attempt with email: "
                                        + ". Reason: " + error);
 
                    String redirectUrl = request.getContextPath() + "/login?error";
                    response.sendRedirect(redirectUrl);
                }
                })
		
		.usernameParameter("userName")
        .passwordParameter("password")

		
        .and()
        //.exceptionHandling().accessDeniedPage("/403.jsp") .and()	
		.logout().invalidateHttpSession(true)
		.clearAuthentication(true)
		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
		.logoutSuccessUrl("/logout-success");//.permitAll();
		
		
	}
	
	

	
	
}
