package com.web.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.entity.CustomerProfile;
import com.web.service.CustomerProfileService;

@RestController
@RequestMapping("/api/customer-profile")
@CrossOrigin
public class CustomerProfileApi {

    @Autowired
    private CustomerProfileService customerProfileService;

    @GetMapping("/customer/find-by-user")
    @PreAuthorize("hasAuthority('Customer')")
    public ResponseEntity<?> findByUser(){
        CustomerProfile result = customerProfileService.findByUser();
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PostMapping("/customer/update-profile")
    @PreAuthorize("hasAuthority('Customer')")
    public ResponseEntity<?> update(@RequestBody CustomerProfile customerProfile){
        CustomerProfile result = customerProfileService.update(customerProfile);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
