package com.web.api;

<<<<<<< HEAD
import com.web.entity.CustomerSchedule;
import com.web.entity.VaccineSchedule;
=======
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.web.entity.CustomerSchedule;
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
import com.web.models.ApproveCustomerScheduleRequest;
import com.web.models.CreateScheduleGuestRequest;
import com.web.models.ListCustomerScheduleRequest;
import com.web.service.CustomerScheduleService;
<<<<<<< HEAD
import com.web.service.VaccineScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
=======
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)

@RestController
@RequestMapping("/api/customer-schedule")
@CrossOrigin
public class CustomerScheduleApi {

    @Autowired
    private CustomerScheduleService customerScheduleService;

    @PostMapping("/customer/create")
<<<<<<< HEAD
=======
    @PreAuthorize("hasAuthority('Customer')")
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
    public ResponseEntity<?> create(@RequestBody CustomerSchedule customerSchedule,
                                    @RequestParam String orderId, @RequestParam String requestId) {
        CustomerSchedule result = customerScheduleService.create(customerSchedule, orderId, requestId);
        return new ResponseEntity(result, HttpStatus.CREATED);
    }

    @GetMapping("/customer/my-schedule")
<<<<<<< HEAD
=======
    @PreAuthorize("hasAuthority('Customer')")
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
    public ResponseEntity<?> mySchedule() {
        List<CustomerSchedule> result = customerScheduleService.mySchedule();
        return new ResponseEntity(result, HttpStatus.OK);
    }


    @PostMapping("/customer/cancel")
<<<<<<< HEAD
=======
    @PreAuthorize("hasAuthority('Customer')")
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
    public ResponseEntity<?> cancel(@RequestParam Long id) {
        customerScheduleService.cancel(id);
        return new ResponseEntity(HttpStatus.OK);
    }
    @PostMapping("/customer/approve")
<<<<<<< HEAD
=======
    @PreAuthorize("hasAuthority('Customer')")
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
    public ResponseEntity<?> approve(@RequestBody ApproveCustomerScheduleRequest request) {
        return new ResponseEntity<>(customerScheduleService.approveCustomerSchedule(request),HttpStatus.OK);
    }
    @PostMapping("/customer/create-guest")
<<<<<<< HEAD
=======
    @PreAuthorize("hasAuthority('Customer')")
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
    public ResponseEntity<?> createGuest(@RequestBody CreateScheduleGuestRequest request) {
        return new ResponseEntity<>(customerScheduleService.createScheduleGuest(request),HttpStatus.OK);
    }
    @PostMapping("/customer/list")
<<<<<<< HEAD
=======
    @PreAuthorize("hasAuthority('Customer')")
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
    public ResponseEntity<?> list(@RequestBody ListCustomerScheduleRequest request) {
        return new ResponseEntity<>(customerScheduleService.listCustomerSchedule(request),HttpStatus.OK);
    }
}
