package com.example.demo.config;

import com.example.demo.service.CustomUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
       httpSecurity.csrf(csrf -> csrf.disable()).authorizeHttpRequests(auth -> auth
                .requestMatchers("/*").permitAll()
                .requestMatchers("/admin/**").hasAuthority("admin")
                .anyRequest().authenticated()).formLogin(login -> login.loginPage("/login").loginProcessingUrl("/login")
                .usernameParameter("taiKhoan").passwordParameter("matKhau")
                .successHandler(customAuthenticationSuccessHandler())).logout(logout -> logout.logoutUrl("/logout").logoutSuccessUrl("/login"))
                .logout(logout -> logout.logoutUrl("/logout").logoutSuccessUrl("/login")).exceptionHandling(handling -> handling.accessDeniedHandler(accessDeniedHandler()));
        return httpSecurity.build();
    }

    @Bean
    public AuthenticationSuccessHandler customAuthenticationSuccessHandler() {
        return (request, response, authentication) -> {
            String role = authentication.getAuthorities().iterator().next().getAuthority();
            if ("admin".equals(role)) {
                response.sendRedirect("/admin/tong-quan");
            } else {
                response.sendRedirect("/");
            }
        };
    }

    @Bean
    public AccessDeniedHandler accessDeniedHandler() {
        return (request, response, accessDeniedException) -> response.sendRedirect("/404");
    }

    @Bean
    WebSecurityCustomizer webSecurityCustomizer() {
        return web -> web.ignoring().requestMatchers("/user/**");
    }
}
