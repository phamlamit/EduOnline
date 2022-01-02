package vn.aptech.backend.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import vn.aptech.backend.dto.CourseDto;
import vn.aptech.backend.dto.ResponseHandler;
import vn.aptech.backend.dto.request.course.CourseUpdateRequest;
import vn.aptech.backend.dto.request.course.CourseCreateRequest;
import vn.aptech.backend.entity.Course;
import vn.aptech.backend.repository.CourseRepository;
import vn.aptech.backend.repository.LessonRepository;
import vn.aptech.backend.service.CourseService;
import vn.aptech.backend.service.LectureService;
import vn.aptech.backend.utils.enums.StatusErrorEnums;

import java.util.Date;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseRepository repository;

    @Autowired
    private LessonRepository lessonRepository;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private ModelMapper mapper;

    @Override
    public ResponseEntity<?> create(CourseCreateRequest request) {
        Course course = this.convertSignupRequesttoAppCourse(request);
        CourseDto newCourse = mapper.map(repository.save(course), CourseDto.class);
        return new ResponseHandler<>().sendSuccess(newCourse);
    }

    @Override
    public ResponseEntity<Page<CourseDto>> fillAll(Pageable pageable) {
        Page<Course> course = repository.findCourseByDeletedDateIsNull(pageable);
        Page<CourseDto> courseDtoPage = course.map(appCourse -> mapper.map(course, CourseDto.class));
        return new ResponseHandler<Page<CourseDto>>().sendSuccess(courseDtoPage);
    }

    @Override
    public ResponseEntity<Page<CourseDto>> findByCourseTitle(String name, Pageable pageable) {
        Page<Course> course = repository.findCourseByTitleLikeAndDeletedDateIsNull("%" + name + "%", pageable);
        Page<CourseDto> courseDtoPage = course.map(appCourse -> mapper.map(course, CourseDto.class));
        return new ResponseHandler<Page<CourseDto>>().sendSuccess(courseDtoPage);
    }

    @Override
    public ResponseEntity<?> update(CourseUpdateRequest request) {
        Course course = repository.findById(request.getId()).orElse(null);
        if (course == null) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.COURSE_NOT_FOUND);
        }
        course.setTitle(request.getTitle());
        course.setDescription(request.getDescription());
        course.setRequirement(request.getRequirement());
        course.setWhoThisCourseIsFor(request.getWhoThisCourseIsFor());
        course.setWhatYouWillLearn(request.getWhatYouWillLearn());
        course.setStatus(request.getStatus());
        course.setLanguage(request.getLanguage());
        course.setPrice(request.getPrice());
        course.setVideoDuration(request.getVideoDuration());
        course.setUrlVideoDescription(request.getUrlVideoDescription());
        course.setImageVideoDescription(request.getImageVideoDescription());
        course.setUpdatedDate(new Date());
        return new ResponseHandler<>().sendSuccess(mapper.map(repository.save(course), CourseDto.class));
    }

    @Override
    public ResponseEntity<CourseDto> findById(Long id) {
        Course course = repository.findById(id).orElse(null);
        if (course == null) {
            return new ResponseHandler<CourseDto>().sendError(StatusErrorEnums.USER_NOT_FOUND);
        }
        return new ResponseHandler<CourseDto>().sendSuccess(mapper.map(course, CourseDto.class));

    }

    public Course convertSignupRequesttoAppCourse(CourseCreateRequest request) {
        Course result = new Course();
        result.setTitle(request.getTitle());
        result.setDescription(request.getDescription());
        result.setRequirement(request.getRequirement());
        result.setWhoThisCourseIsFor(request.getWhoThisCourseIsFor());
        result.setWhatYouWillLearn(result.getWhatYouWillLearn());
        result.setStatus(request.getStatus());
        result.setPrice(request.getPrice());
        result.setVideoDuration(request.getVideoDuration());
        result.setLanguage(request.getLanguage());
        result.setUrlVideoDescription(request.getUrlVideoDescription());
        result.setImageVideoDescription(request.getImageVideoDescription());
        return result;
    }
}
