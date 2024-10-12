package com.web.entity;

<<<<<<< HEAD
import com.nimbusds.openid.connect.sdk.claims.Gender;
import com.web.enums.UserType;
=======
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.web.enums.UserType;

>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

<<<<<<< HEAD
import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;

=======
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
@Entity
@Table(name = "account")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class User{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "account_id")
    private Long id;

    private String email;

    private String password;

    private String googleId;

    private String phoneNumber;

    private Boolean actived;

    private Date createdDate;

    @Column(name = "login_type")
    @Enumerated(EnumType.STRING)
    private UserType userType;

    private String activationKey;

    private String rememberKey;

    @ManyToOne
    @JoinColumn(name = "authority_id")
    private Authority authorities;
}

