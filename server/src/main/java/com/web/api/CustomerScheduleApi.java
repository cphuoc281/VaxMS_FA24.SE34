package com.web.api;

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
import com.web.models.ApproveCustomerScheduleRequest;
import com.web.models.CreateScheduleGuestRequest;
import com.web.models.ListCustomerScheduleRequest;
import com.web.service.CustomerScheduleService;

@RestController
@RequestMapping("/api/customer-schedule")
@CrossOrigin
public class CustomerScheduleApi {

    @Autowired
    private CustomerScheduleService customerScheduleService;

    @PostMapping("/customer/create")
    @PreAuthorize("hasAuthority('Customer')")
    public ResponseEntity<?> create(@RequestBody CustomerSchedule customerSchedule,
                                    @RequestParam String orderId, @RequestParam String requestId) {
        CustomerSchedule result = customerScheduleService.create(customerSchedule, orderId, requestId);
        return new ResponseEntity(result, HttpStatus.CREATED);
    }

    @GetMapping("/customer/my-schedule")
    @PreAuthorize("hasAuthority('Customer')")
    public ResponseEntity<?> mySchedule() {
        List<CustomerSchedule> result = customerScheduleService.mySchedule();
        return new ResponseEntity(result, HttpStatus.OK);
    }


    @PostMapping("/customer/cancel")
    @PreAuthorize("hasAuthority('Customer')")
    public ResponseEntity<?> cancel(@RequestParam Long id) {
        customerScheduleService.cancel(id);
        return new ResponseEntity(HttpStatus.OK);
    }
    @PostMapping("/customer/approve")
    @PreAuthorize("hasAuthority('Customer')")
    public ResponseEntity<?> approve(@RequestBody ApproveCustomerScheduleRequest request) {
        return new ResponseEntity<>(customerScheduleService.approveCustomerSchedule(request),HttpStatus.OK);
    }
    @PostMapping("/customer/create-guest")
    @PreAuthorize("hasAuthority('Customer')")
    public ResponseEntity<?> createGuest(@RequestBody CreateScheduleGuestRequest request) {
        return new ResponseEntity<>(customerScheduleService.createScheduleGuest(request),HttpStatus.OK);
    }
    @PostMapping("/customer/list")
    @PreAuthorize("hasAuthority('Customer')")
    public ResponseEntity<?> list(@RequestBody ListCustomerScheduleRequest request) {
        return new ResponseEntity<>(customerScheduleService.listCustomerSchedule(request),HttpStatus.OK);
    }
}
