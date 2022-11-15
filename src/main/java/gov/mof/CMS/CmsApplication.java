package gov.mof.CMS;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
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
	 	
}
