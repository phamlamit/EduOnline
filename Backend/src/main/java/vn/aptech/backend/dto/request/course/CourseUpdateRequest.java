package vn.aptech.backend.dto.request.course;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Data
@NoArgsConstructor
@AllArgsConstructor
@NotNull
@NotBlank
public class CourseUpdateRequest {
    private Long id;
    private String title;
    private String shortDescription;
    private String description;
    private String requirement;
    private String whoThisCourseIsFor;
    private String whatYouWillLearn;
    private int language;
    private int status;
    @Pattern(regexp = "[0-9]")
    private Float price;
    private String videoDuration;
    private String urlVideoDescription;
    private String imageVideoDescription;
}
