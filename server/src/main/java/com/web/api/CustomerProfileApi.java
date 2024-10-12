package com.web.api;

<<<<<<< HEAD
import com.web.entity.Center;
import com.web.entity.CustomerProfile;
import com.web.repository.CustomerProfileRepository;
import com.web.service.CenterService;
import com.web.service.CustomerProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
=======
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
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)

@RestController
@RequestMapping("/api/customer-profile")
@CrossOrigin
public class CustomerProfileApi {

    @Autowired
    private CustomerProfileService customerProfileService;

    @GetMapping("/customer/find-by-user")
<<<<<<< HEAD
=======
    @PreAuthorize("hasAuthority('Customer')")
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
    public ResponseEntity<?> findByUser(){
        CustomerProfile result = customerProfileService.findByUser();
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PostMapping("/customer/update-profile")
<<<<<<< HEAD
=======
    @PreAuthorize("hasAuthority('Customer')")
>>>>>>> 60ba9b0 (Initial commit after reconnecting with develop-duclv)
    public ResponseEntity<?> update(@RequestBody CustomerProfile customerProfile){
        CustomerProfile result = customerProfileService.update(customerProfile);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
