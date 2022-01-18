package vn.aptech.backend.dto.request.lecture;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LectureCreateRequest {
    @NotNull
    @NotBlank
    private Long lessonId;
    @NotNull
    @NotBlank
    private String title;
    @NotNull
    @NotBlank
    private Integer sort;
    @NotNull
    @NotBlank
    private String videoUrl;
    @NotNull
    @NotBlank
    private String videoDuration;
    @NotNull
    @NotBlank
    private boolean preview;
}
