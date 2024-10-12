package com.web.repository;

import com.web.entity.CustomerSchedule;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CustomerScheduleRepository extends JpaRepository<CustomerSchedule, Long> {

    @Query("select c from CustomerSchedule c where c.user.id = ?1")
    List<CustomerSchedule> findByUser(Long userId);

    @Query(value = "select count(cs.id) from customer_schedule cs WHERE cs.vaccine_schedule_id = ?1 and cs.status != 'cancelled'", nativeQuery = true)
    Long countRegis(Long vaccineScheduleId);

    Page<CustomerSchedule> findAll(Specification<CustomerSchedule> spec, Pageable pageable);
}
