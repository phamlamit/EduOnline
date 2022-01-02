package vn.aptech.backend.dto.request.lesson;

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
public class LessonUpdateRequest {
    private Long id;
    private Long courseId;
    private String title;
}
