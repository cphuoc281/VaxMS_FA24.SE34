package com.web.repository;

import com.web.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {

    @Query("select u from User u join fetch u.authorities where u.email = ?1")
    Optional<User> findByUsername(String username);

    @Query("select u from User u join fetch u.authorities where u.email = ?1")
    Optional<User> findByEmail(String email);
    Optional<User> findByPhoneNumber(String phone);

    @Query("select u from User u join fetch u.authorities where u.id = ?1")
    Optional<User> findById(Long id);


    @Query("select u from User u join fetch u.authorities where u.activationKey = ?1 and u.email = ?2")
    Optional<User> getUserByActivationKeyAndEmail(String key, String email);

    @Query("select u from User u join fetch u.authorities where u.authorities.name = ?1")
    List<User> getUserByRole(String role);

}
