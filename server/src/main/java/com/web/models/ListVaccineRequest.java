package com.web.models;

<<<<<<< HEAD
import com.fasterxml.jackson.annotation.JsonFormat;
=======
>>>>>>> feature-admin-code
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

<<<<<<< HEAD
import java.sql.Timestamp;

=======
>>>>>>> feature-admin-code
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ListVaccineRequest {
    private String name;
    private Integer price;
    private String status;
    private int page;
    private int limit;
<<<<<<< HEAD

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp startDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp endDate;
=======
>>>>>>> feature-admin-code
}
