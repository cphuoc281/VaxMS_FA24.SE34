package com.web.repository;

import com.web.entity.VaccineScheduleTime;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface VaccineScheduleTimeRepository extends JpaRepository<VaccineScheduleTime, Long> {

    @Query("select v from VaccineScheduleTime v where v.vaccineSchedule.id = ?1")
    public List<VaccineScheduleTime> findByVaccineSchedule(Long vaccineSchedule);

    @Query("select sum(v.limitPeople) from VaccineScheduleTime v where v.vaccineSchedule.id = ?1")
    public Long quantityBySchedule(Long scheduleId);
}
