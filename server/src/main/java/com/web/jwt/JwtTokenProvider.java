package com.web.jwt;

<<<<<<< HEAD
import com.web.dto.CustomUserDetails;
import io.jsonwebtoken.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

=======
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.stream.Collectors;

<<<<<<< HEAD
@Component
@Slf4j
public class JwtTokenProvider {

=======
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.web.dto.CustomUserDetails;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.UnsupportedJwtException;

@Component

public class JwtTokenProvider {
    private static final Logger logger = LoggerFactory.getLogger(JwtTokenProvider.class);
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
    private final String JWT_SECRET = "abcdefgh";

    private static final String AUTHORITIES_KEY = "roles";

    private final long JWT_EXPIRATION = 604800000L;



    // Tạo ra jwt từ thông tin user
    public String generateToken(CustomUserDetails userDetails) {
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + JWT_EXPIRATION);
<<<<<<< HEAD
        // Tạo chuỗi json web token từ id của user.
=======
    
        String authorities = userDetails.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.joining(","));
    
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
        return Jwts.builder()
                .setSubject(Long.toString(userDetails.getUser().getId()))
                .setIssuedAt(now)
                .setExpiration(expiryDate)
<<<<<<< HEAD
                .signWith(SignatureAlgorithm.HS512, JWT_SECRET)
                .claim("roles",userDetails.getAuthorities().toString())
                .compact();
    }

=======
                .claim(AUTHORITIES_KEY, authorities)
                .signWith(SignatureAlgorithm.HS512, JWT_SECRET)
                .compact();
    }
    
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
    // Lấy thông tin user từ jwt
    public Long getUserIdFromJWT(String token) {
        Claims claims = Jwts.parser()
                .setSigningKey(JWT_SECRET)
                .parseClaimsJws(token)
                .getBody();
        Date date = claims.getExpiration();
        return Long.parseLong(claims.getSubject());
    }

    public boolean validateToken(String authToken) {
<<<<<<< HEAD
=======
        if (!StringUtils.hasText(authToken)) {
            // Token null hoặc rỗng, không cần xác thực
            return false;
        }
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
        try {
            Jwts.parser().setSigningKey(JWT_SECRET).parseClaimsJws(authToken);
            return true;
        } catch (MalformedJwtException ex) {
<<<<<<< HEAD
            log.error("Invalid JWT token");
        } catch (ExpiredJwtException ex) {
            log.error("Expired JWT token");
        } catch (UnsupportedJwtException ex) {
            log.error("Unsupported JWT token");
        } catch (IllegalArgumentException ex) {
            log.error("JWT claims string is empty.");
=======
            logger.error("Invalid JWT token");
        } catch (ExpiredJwtException ex) {
            logger.error("Expired JWT token");
        } catch (UnsupportedJwtException ex) {
            logger.error("Unsupported JWT token");
        } catch (IllegalArgumentException ex) {
            logger.error("JWT claims string is empty.");
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
        }
        return false;
    }

    public Authentication getAuthentication(String token) {
<<<<<<< HEAD
        Claims claims = null;
        try {
            claims = Jwts.parser()
                    .setSigningKey(JWT_SECRET)
                    .parseClaimsJws(token)
                    .getBody();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String authol = claims.get(AUTHORITIES_KEY).toString().substring(1,claims.get(AUTHORITIES_KEY).toString().length()-1);
        System.out.println("role: "+authol);
        Collection<? extends GrantedAuthority> authorities = Arrays
                .stream(authol.split(","))
                .filter(auth -> !auth.trim().isEmpty())
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());

        User principal = new User(claims.getSubject(), "", authorities);
        return new UsernamePasswordAuthenticationToken(principal, token, authorities);
    }
=======
        Claims claims = Jwts.parser()
                .setSigningKey(JWT_SECRET)
                .parseClaimsJws(token)
                .getBody();
    
        String authoritiesString = claims.get(AUTHORITIES_KEY).toString();
        Collection<? extends GrantedAuthority> authorities = Arrays
                .stream(authoritiesString.split(","))
                .filter(auth -> !auth.trim().isEmpty())
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());
    
        User principal = new User(claims.getSubject(), "", authorities);
        return new UsernamePasswordAuthenticationToken(principal, token, authorities);
    }
    
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
}

