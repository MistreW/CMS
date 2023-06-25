package gov.mof.CMS;

import java.io.IOException;
import java.util.Date;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import gov.mof.CMS.model.Users;
import gov.mof.CMS.security.MyUserDetails;

@Component
public class PasswordExpirationFilter {

    
    public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
         
        if (isUrlExcluded(httpRequest)) {
            chain.doFilter(request, response);
            return;
        }
         
        System.out.println("PasswordExpirationFilter");
 
    Users customer = getLoggedInCustomer();
         
        if (customer != null && customer.isPasswordExpired()) {
                showChangePasswordPage(response, httpRequest, customer);           
        } else {
            chain.doFilter(httpRequest, response);         
        }
         
    }
    private boolean isUrlExcluded(HttpServletRequest httpRequest)
        throws IOException, ServletException {
    String url = httpRequest.getRequestURL().toString();
     
    if (url.endsWith(".css") || url.endsWith(".png") || url.endsWith(".js")
            || url.endsWith("/change_password")) {
        return true;
    }
     
    return false;
}
private Users getLoggedInCustomer() {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    Object principal = null;
     
    if (authentication != null) {
        principal = authentication.getPrincipal();
    }
     
    if (principal != null && principal instanceof MyUserDetails) {
        MyUserDetails userDetails = (MyUserDetails) principal;
        return userDetails.getUser();
    }
     
    return null;
}
private void showChangePasswordPage(ServletResponse response,
        HttpServletRequest httpRequest, Users customer) throws IOException {
    System.out.println("Customer: " + customer.getFirstName() + " - Password Expired:");
    System.out.println("Last time password changed: " + customer.getPasswordChangedTime());
    System.out.println("Current time: " + new Date());
     
    HttpServletResponse httpResponse = (HttpServletResponse) response;
    String redirectURL = httpRequest.getContextPath() + "common/changePassword";
    httpResponse.sendRedirect(redirectURL);
}
    
}
