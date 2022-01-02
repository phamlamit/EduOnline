package vn.aptech.backend.dto.request.lecture;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@NoArgsConstructor
@AllArgsConstructor
@NotBlank
@NotBlank
public class LectureUpdateRequest {
    private Long id;
    private Long lessonId;
    private String title;
    private Integer sort;
    private String videoUrl;
    private String videoDuration;
    private boolean preview;
}
