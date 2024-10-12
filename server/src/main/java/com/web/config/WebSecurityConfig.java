package com.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.web.jwt.JWTConfigurer;
import com.web.jwt.JwtTokenProvider;
import com.web.repository.UserRepository;
import com.web.utils.Contains;

@EnableWebSecurity
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    private final JwtTokenProvider tokenProvider;

    private final UserRepository userRepository;
    private final CorsFilter corsFilter;


    public WebSecurityConfig(JwtTokenProvider tokenProvider, UserRepository userRepository, CorsFilter corsFilter) {
        this.tokenProvider = tokenProvider;
        this.userRepository = userRepository;
        this.corsFilter = corsFilter;
    }

    @Bean(BeanIds.AUTHENTICATION_MANAGER)
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        // Get AuthenticationManager bean
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

    }

    @Override
protected void configure(HttpSecurity http) throws Exception {
    http
        .csrf().disable()
        .addFilterBefore(corsFilter, UsernamePasswordAuthenticationFilter.class)
        .exceptionHandling()
        .and()
        .headers()
        .and()
        .authorizeRequests()
        .antMatchers("/api/public/**").permitAll()
        .antMatchers("/api/**/public/**").permitAll()
        .antMatchers("/api/authority/**").permitAll()
        .antMatchers("/api/user/login/email").permitAll() // Thêm dòng này để cho phép công khai endpoint login bằng email
        .antMatchers("/api/admin/**").hasAuthority(Contains.ROLE_ADMIN)
        .antMatchers("/api/doctor/**").hasAuthority(Contains.ROLE_DOCTOR)
        .antMatchers("/api/nurse/**").hasAuthority(Contains.ROLE_NURSE)
        .antMatchers("/api/customer/**").hasAuthority(Contains.ROLE_CUSTOMER)
        .antMatchers("/api/staff/**").hasAuthority(Contains.ROLE_STAFF)
        .antMatchers("/api/all/**").hasAnyAuthority(Contains.ROLE_ADMIN, Contains.ROLE_DOCTOR,
                Contains.ROLE_NURSE, Contains.ROLE_CUSTOMER, Contains.ROLE_STAFF)
        .anyRequest().authenticated()
        .and()
        .apply(securityConfigurerAdapter());
}



@Override
public void configure(WebSecurity web) throws Exception {
    web.ignoring().antMatchers(
            "/api/public/**",
            "/api/**/public/**",
            "/api/authority/**"
    );
}
    private JWTConfigurer securityConfigurerAdapter() {
        return new JWTConfigurer(tokenProvider, userRepository);
    }

}
