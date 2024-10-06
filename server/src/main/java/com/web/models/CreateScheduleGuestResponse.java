package com.web.models;

import com.web.entity.User;
import com.web.entity.VaccineSchedule;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CreateScheduleGuestResponse {
    private Long id;
    private VaccineSchedule vaccineSchedule;
    private User user;
    private Boolean payStatus;
    private String status;
    private Timestamp createdDate;
    private String fullName;
}
