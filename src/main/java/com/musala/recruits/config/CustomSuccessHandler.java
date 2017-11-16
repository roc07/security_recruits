package com.musala.recruits.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

		//checks if response is already commited
		if (response.isCommitted()) {
            System.out.println("Can't redirect");
            return;
		}
		
		redirectStrategy.sendRedirect(request, response, targetUrl(authentication));
	}

	protected String targetUrl(Authentication auth) {
		
        List<String> roles = new ArrayList<String>();
        
        for (GrantedAuthority a : auth.getAuthorities()) {
            roles.add(a.getAuthority());
            System.out.println(a.getAuthority());
        }
		
        if (isHr(roles)) {
        	System.out.println("HR ROLE");
        	return "/hr-main";
        } else if (isEvaluator(roles)) {
        	System.out.println("EVAL ROLE");
        	return "/evaluator-main";
        } else {
        	System.out.println("OTHER ROLE");
        	return "/home";
        }       	
	}
	
	private boolean isHr(List<String> roles) {
		if (roles.contains("ROLE_HR") || roles.contains("HR")) {
			return true;
		} else {
			return false;
		}
	}
	
	private boolean isEvaluator(List<String> roles) {
		if (roles.contains("ROLE_EVALUATOR") || roles.contains("EVALUATOR")) {
			return true;
		} else {
			return false;
		}
	}	
	
}













