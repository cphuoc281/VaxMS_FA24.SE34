package com.web.api;

import com.web.dto.ScheduleTimeDto;
import com.web.entity.VaccineSchedule;
import com.web.entity.VaccineScheduleTime;
import com.web.service.VaccineScheduleService;
import com.web.service.VaccineScheduleTimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/vaccine-schedule-time")
@CrossOrigin
public class VaccineScheduleTimeApi {

    @Autowired
    private VaccineScheduleTimeService vaccineScheduleTimeService;

    @PostMapping("/admin/create-multiple")
    public ResponseEntity<?> createByAdmin(@RequestBody ScheduleTimeDto scheduleTimeDto) {
        List<VaccineScheduleTime> result = vaccineScheduleTimeService.createMulti(scheduleTimeDto);
        return new ResponseEntity(result, HttpStatus.CREATED);
    }

    @PostMapping("/admin/create")
    public ResponseEntity<?> create(@RequestBody VaccineScheduleTime vaccineScheduleTime) {
        VaccineScheduleTime result = vaccineScheduleTimeService.save(vaccineScheduleTime);
        return new ResponseEntity(result, HttpStatus.CREATED);
    }

    @PostMapping("/admin/update")
    public ResponseEntity<?> update(@RequestBody VaccineScheduleTime vaccineScheduleTime) {
        VaccineScheduleTime result = vaccineScheduleTimeService.update(vaccineScheduleTime);
        return new ResponseEntity(result, HttpStatus.CREATED);
    }

    @GetMapping("/all/find-by-schedule")
    public ResponseEntity<?> findByVacxin(@RequestParam Long idSchedule){
        List<VaccineScheduleTime> result = vaccineScheduleTimeService.findBySchedule(idSchedule);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @DeleteMapping("/admin/delete")
    public void delete(@RequestParam("id") Long id){
        vaccineScheduleTimeService.delete(id);
    }
}
