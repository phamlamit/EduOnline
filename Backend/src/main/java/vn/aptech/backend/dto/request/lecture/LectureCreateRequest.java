package vn.aptech.backend.dto.request.lecture;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
@NotNull
@NotBlank
public class LectureCreateRequest {
    private Long lessonId;
    private String title;
    private Integer sort;
    private String videoUrl;
    private String videoDuration;
    private boolean preview;
}
