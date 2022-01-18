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
public class CourseCreateRequest {
    @NotNull
    @NotBlank
    private String title;
    @NotNull
    @NotBlank
    private String shortDescription;
    @NotNull
    @NotBlank
    private String description;
    @NotNull
    @NotBlank
    private String requirement;
    @NotNull
    @NotBlank
    private String whoThisCourseIsFor;
    @NotNull
    @NotBlank
    private String whatYouWillLearn;
    @NotNull
    @NotBlank
    private int language;
    @NotNull
    @NotBlank
    private int status;
    @Pattern(regexp = "[0-9]")
    @NotNull
    @NotBlank
    private Float price;
    @NotNull
    @NotBlank
    private String videoDuration;
    @NotNull
    @NotBlank
    private String urlVideoDescription;
    @NotNull
    @NotBlank
    private String imageVideoDescription;
}
