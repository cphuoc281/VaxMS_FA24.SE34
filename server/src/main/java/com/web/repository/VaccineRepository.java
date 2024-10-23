package com.web.repository;

import com.web.entity.Vaccine;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public interface VaccineRepository extends JpaRepository<Vaccine, Long> {

    @Query("SELECT v FROM Vaccine v WHERE "
            + "LOWER(v.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR "
            + "LOWER(v.vaccineType.typeName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR "
            + "LOWER(v.manufacturer.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR "
            + "LOWER(v.ageGroup.ageRange) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Vaccine> searchVaccines(@Param("keyword") String keyword);

    @Query("select v from Vaccine v where v.vaccineType.id = ?1")
    public List<Vaccine> findByType(Long typeId);

    Optional<Vaccine> findById(Long id);
    Optional<Vaccine> findByName(String name);

    Page<Vaccine> findAll( Specification<Vaccine> spec,Pageable pageable);
}
