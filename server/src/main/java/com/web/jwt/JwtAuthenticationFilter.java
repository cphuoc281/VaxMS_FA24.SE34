package com.web.jwt;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.stream.Collectors;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.GenericFilterBean;

import com.web.repository.UserRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class JwtAuthenticationFilter extends GenericFilterBean {

    private final JwtTokenProvider tokenProvider;

    private final UserRepository userRepository;

    public JwtAuthenticationFilter(JwtTokenProvider tokenProvider, UserRepository userRepository) {
        this.tokenProvider = tokenProvider;
        this.userRepository = userRepository;
    }


    private String getJwtFromRequest(HttpServletRequest request) {
        String bearerToken = request.getHeader("Authorization");
        // Kiểm tra xem header Authorization có chứa thông tin jwt không
        if (StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer ")) {
            return bearerToken.substring(7);
        }
        return null;
    }


    @Override
public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
    HttpServletRequest httpRequest = (HttpServletRequest) request;
    String requestURI = httpRequest.getRequestURI();

    // Kiểm tra nếu đường dẫn là public thì bỏ qua xác thực
    if (isPublicEndpoint(requestURI)) {
        filterChain.doFilter(request, response);
        return;
    }

    try {
        // Lấy jwt từ request
        String jwt = getJwtFromRequest(httpRequest);
        if (StringUtils.hasText(jwt) && tokenProvider.validateToken(jwt)) {
            Authentication authentication = tokenProvider.getAuthentication(jwt);
            SecurityContextHolder.getContext().setAuthentication(authentication);
        }
    } catch (Exception ex) {
        log.error("Failed to set user authentication", ex);
    }
    filterChain.doFilter(request, response);
}

private boolean isPublicEndpoint(String requestURI) {
    return requestURI.startsWith("/api/public/")
            || requestURI.contains("/public/")
            || requestURI.startsWith("/api/authority/")
            || requestURI.contains("/api/user/public/");
}
    public Authentication getAuthentication(String token, Long userId) {
        com.web.entity.User u = userRepository.findById(userId).get();

        String authol = u.getAuthorities().getName();
        System.out.println("role: "+authol);
        Collection<? extends GrantedAuthority> authorities = Arrays
                .stream(authol.split(","))
                .filter(auth -> !auth.trim().isEmpty())
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());

        User principal = new User(userId.toString(), "", authorities);
        return new UsernamePasswordAuthenticationToken(principal, token, authorities);
    }
}

