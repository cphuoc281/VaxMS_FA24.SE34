package com.web.api;

import com.web.dto.PaymentDto;
import com.web.dto.ResponsePayment;
import com.web.entity.VaccineSchedule;
import com.web.exception.MessageException;
import com.web.repository.CustomerScheduleRepository;
import com.web.repository.VaccineScheduleRepository;
import com.web.vnpay.VNPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/vnpay")
@CrossOrigin
public class VnpayApi {

    @Autowired
    private VNPayService vnPayService;

    @Autowired
    private VaccineScheduleRepository vaccineScheduleRepository;

    @Autowired
    private CustomerScheduleRepository customerScheduleRepository;


    @PostMapping("/urlpayment")
    public ResponsePayment getUrlPayment(@RequestBody PaymentDto paymentDto){
        VaccineSchedule vaccineSchedule = vaccineScheduleRepository.findById(paymentDto.getIdSchedule()).get();
        if(customerScheduleRepository.countRegis(paymentDto.getIdSchedule()) >= vaccineSchedule.getLimitPeople()){
            throw new MessageException("Lịch tiêm vaccine đã hết lượt đăng ký");
        }
        Long td = Long.valueOf(vaccineSchedule.getVaccine().getPrice());

        String orderId = String.valueOf(System.currentTimeMillis());
        String vnpayUrl = vnPayService.createOrder(td.intValue(), orderId, paymentDto.getReturnUrl());
        ResponsePayment responsePayment = new ResponsePayment(vnpayUrl,orderId,null);
        return responsePayment;
    }
}
