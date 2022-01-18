package vn.aptech.backend.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@Entity
@Table(name = "Course")
public class Course extends BaseEntity {
    private String title;
    @Column(name = "short_description")
    private String shortDescription;
    private String description;
    private String requirement;
    @Column(name = "who_this_course_is_for")
    private String whoThisCourseIsFor;
    @Column(name = "what_you_will_learn")
    private String whatYouWillLearn;
    private int status;
    private Float price;
    @Column(name = "video_duration")
    private String videoDuration;
    private int language;
    @Column(name = "url_video_description")
    private String urlVideoDescription;
    @Column(name = "image_video_description")
    private String imageVideoDescription;
    @Column(name = "subcatalog_id")
    private Integer subcatalog_id;

    @OneToMany(mappedBy = "course")
    private List<Lesson> lessons;
}
