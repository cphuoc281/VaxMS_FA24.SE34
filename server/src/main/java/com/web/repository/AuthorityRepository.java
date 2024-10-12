package com.web.repository;

<<<<<<< HEAD
import com.web.entity.Authority;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AuthorityRepository extends JpaRepository<Authority,String> {
=======
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.entity.Authority;

public interface AuthorityRepository extends JpaRepository<Authority,Long> {
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)

    @Query("select a from Authority a where a.name = ?1")
    public Authority findByName(String name);
}
