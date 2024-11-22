package com.web.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum StatusCustomerSchedule {
    pending,      // Đã đăng ký
    confirmed,    // Hoãn
    cancelled,    // Hoàn thành tiêm
    injected,     // Đã tiêm
    not_injected; // Chưa tiêm

    public static StatusCustomerSchedule getStatusCustomerSchedule( String value ) {
        for (StatusCustomerSchedule status : StatusCustomerSchedule.values()) {
            if (status.name().equalsIgnoreCase(value)) {
                return status;
            }
        }
        return null;
    }
}
