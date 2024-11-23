package com.web.repository;

import com.web.entity.CustomerProfile;
<<<<<<< HEAD
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
=======
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
>>>>>>> feature-admin-code

public interface CustomerProfileRepository extends JpaRepository<CustomerProfile, Long> {

    @Query("select c from CustomerProfile c where c.user.id = ?1")
    public CustomerProfile findByUser(Long userId);
<<<<<<< HEAD
=======

    @Query("SELECT c FROM CustomerProfile c " +
                  "WHERE (:q IS NULL OR LOWER(c.fullName) LIKE LOWER(CONCAT('%', :q, '%')) " +
                  "OR LOWER(c.phone) LIKE LOWER(CONCAT('%', :q, '%')) " +
                  "OR LOWER(c.user.email) LIKE LOWER(CONCAT('%', :q, '%')))")
    public Page<CustomerProfile> getCustomerProfile(@Param("q") String q, Pageable pageable);
>>>>>>> feature-admin-code
}
