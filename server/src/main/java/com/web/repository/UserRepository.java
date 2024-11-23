package com.web.repository;

import com.web.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.*;
<<<<<<< HEAD
=======
import org.springframework.data.repository.query.Param;
>>>>>>> feature-admin-code
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
<<<<<<< HEAD
public interface UserRepository extends JpaRepository<User,Long> {
=======
public interface UserRepository extends JpaRepository<User, Long> {
>>>>>>> feature-admin-code

    @Query(value = "select u from User u where u.email = ?1")
    Optional<User> findByUsername(String username);

    @Query(value = "select u from User u where u.email = ?1")
    Optional<User> findByEmail(String email);
<<<<<<< HEAD
=======

>>>>>>> feature-admin-code
    Optional<User> findByPhoneNumber(String phone);

    @Query(value = "select u.* from account u where u.account_id = ?1", nativeQuery = true)
    Optional<User> findById(Long id);

<<<<<<< HEAD

=======
>>>>>>> feature-admin-code
    @Query(value = "select u from User u where u.activationKey = ?1 and u.email = ?2")
    Optional<User> getUserByActivationKeyAndEmail(String key, String email);

    @Query("select u from User u where u.authorities.name = ?1")
    List<User> getUserByRole(String role);

<<<<<<< HEAD
=======
    @Query("SELECT u FROM User u WHERE u.authorities.id = :authorityId")
    List<User> findEmployeesByAuthority(@Param("authorityId") Long authorityId);

>>>>>>> feature-admin-code
}
