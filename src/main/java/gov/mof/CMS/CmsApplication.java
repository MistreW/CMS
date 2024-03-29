package gov.mof.CMS;

import org.apache.catalina.connector.Connector;
import org.apache.catalina.Context;
import org.apache.tomcat.util.descriptor.web.SecurityCollection;
import org.apache.tomcat.util.descriptor.web.SecurityConstraint;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@SpringBootApplication
@EnableWebSecurity
public class CmsApplication extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(CmsApplication.class, args);
	
	}
	
	
	  @Override protected SpringApplicationBuilder
	  configure(SpringApplicationBuilder app) { // TODO Auto-generated method stub
	  return app.sources(CmsApplication.class); }
	 

	@Bean
    public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder(4);
    }
	 @Bean
   public ServletWebServerFactory servletContainer() {
       TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory() {
           @Override
           protected void postProcessContext(Context context) {
               SecurityConstraint securityConstraint = new SecurityConstraint();
               securityConstraint.setUserConstraint("CONFIDENTIAL");
               SecurityCollection collection = new SecurityCollection();
               collection.addPattern("/*");
               securityConstraint.addCollection(collection);
               context.addConstraint(securityConstraint);
           }
       };
       tomcat.addAdditionalTomcatConnectors(redirectConnector());
       return tomcat;
   }

   private Connector redirectConnector() {
       Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
       connector.setScheme("http");
       connector.setPort(8080);
       connector.setRedirectPort(8443);
       return connector;
   }	
}
