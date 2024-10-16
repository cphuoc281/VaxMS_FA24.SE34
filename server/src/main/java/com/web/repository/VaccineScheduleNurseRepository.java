package com.web.repository;

import com.web.entity.VaccineScheduleDoctor;
import com.web.entity.VaccineScheduleNurse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface VaccineScheduleNurseRepository extends JpaRepository<VaccineScheduleNurse, Long> {

    @Modifying
    @Transactional
    @Query("delete from VaccineScheduleNurse p where p.vaccineSchedule.id = ?1")
    int deleteByVaccineSchedule(Long vaccineScheduleId);

    @Query("select v from VaccineScheduleNurse v where v.vaccineSchedule.id = ?1")
    List<VaccineScheduleNurse> findBySchedule(Long vaccineScheduleId);
}
