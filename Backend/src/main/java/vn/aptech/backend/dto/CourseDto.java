package vn.aptech.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CourseDto {
    private Long id;
    private String title;
    private String shortDescription;
    private String description;
    private String requirement;
    private String whoThisCourseIsFor;
    private String whatYouWillLearn;
    private int language;
    private boolean status;
    private Float price;
    private String videoDuration;
    private String urlVideoDescription;
    private String imageVideoDescription;
    List<LessonDto> lessons;
}
