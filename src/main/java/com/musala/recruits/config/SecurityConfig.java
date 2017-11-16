package com.musala.recruits.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	CustomSuccessHandler customSuccessHandler;
	
	@Override
	@Order(Ordered.HIGHEST_PRECEDENCE)
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.inMemoryAuthentication()
		.withUser("eval").password("eval123").roles("EVALUATOR")
		.and()
		.withUser("review").password("review123").authorities("EVALUATOR")
		.and()
		.withUser("hr").password("hr123").roles("HR")
		.and()
		.withUser("admin").password("admin123").authorities("HR");
		
	}	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
				.antMatchers("/evalutator-main").hasAuthority("EVALUATOR")			
				.antMatchers("/hr-main").hasAuthority("HR")
				.anyRequest().authenticated()
			.and()
			.formLogin()
				.loginPage("/login").successHandler(customSuccessHandler)
				.permitAll()
			.and()
			.exceptionHandling().accessDeniedPage("/secret");
	}
	
}
