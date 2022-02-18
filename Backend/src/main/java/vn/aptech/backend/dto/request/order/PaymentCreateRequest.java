package vn.aptech.backend.dto.request.order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.aptech.backend.dto.CourseDto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CheckoutRequest {
    @NotNull
    private List<CourseDto> course;
    @NotNull
    @NotBlank
    private String billingAddress;
    @NotNull
    @NotBlank
    private String nameCard;
    @NotNull
    @NotBlank
    private String CardNumber;
    @NotNull
    private Date date;
    @NotNull
    @NotBlank
    private String securityCode;
    @NotNull
    @NotBlank
    private String zipcode;
}
