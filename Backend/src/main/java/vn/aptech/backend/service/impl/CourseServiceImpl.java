package vn.aptech.backend.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vn.aptech.backend.dto.CourseDto;
import vn.aptech.backend.dto.ResponseHandler;
import vn.aptech.backend.dto.request.course.CourseCreateRequest;
import vn.aptech.backend.dto.request.course.CourseUpdateRequest;
import vn.aptech.backend.entity.Course;
import vn.aptech.backend.entity.Lecture;
import vn.aptech.backend.entity.Lesson;
import vn.aptech.backend.entity.SubCatalog;
import vn.aptech.backend.repository.CourseRepository;
import vn.aptech.backend.repository.LectureRepository;
import vn.aptech.backend.repository.LessonRepository;
import vn.aptech.backend.repository.SubCatalogRepository;
import vn.aptech.backend.service.CourseService;
import vn.aptech.backend.utils.enums.LanguageEnum;
import vn.aptech.backend.utils.enums.StatusErrorEnums;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseRepository repository;

    @Autowired
    private LessonRepository lessonRepository;

    @Autowired
    private LectureRepository lectureRepository;

    @Autowired
    private SubCatalogRepository subCatalogRepository;

    @Autowired
    private ModelMapper mapper;

    @Transactional
    @Override
    public ResponseEntity<?> create(CourseCreateRequest request) {
        SubCatalog subCatalog = subCatalogRepository.findById(request.getSubCatalogId()).orElse(null);
        if(subCatalog == null){
            return new ResponseHandler<>().sendError(StatusErrorEnums.SUBCATALOG_NOT_FOUND);
        }
        Course course = this.convertSignupRequestToAppCourse(request);

        course.setSubCatalog(subCatalog);
        Course newCourse = repository.save(course);
        request.getLessons().forEach(lessonCreateRequest->{
            Lesson lesson = mapper.map(lessonCreateRequest,Lesson.class);
            lesson.setCourse(course);
            lesson.setCreatedDate(new Date());
            lessonRepository.save(lesson);
            lessonCreateRequest.getLectures().forEach(lectureCreateRequest -> {
                Lecture lecture = mapper.map(lectureCreateRequest, Lecture.class);
                lecture.setLesson(lesson);
                lecture.setCreatedDate(new Date());
                lectureRepository.save(lecture);
            });
        });
        return new ResponseHandler<>().sendSuccess(mapper.map(newCourse, CourseDto.class));
    }

    @Override
    public ResponseEntity<Page<CourseDto>> fillAll(Pageable pageable) {
        Page<Course> courses = repository.findCourseByDeletedDateIsNull(pageable);
        Page<CourseDto> courseDtoPage = courses.map(appCourse -> mapper.map(appCourse, CourseDto.class));
        return new ResponseHandler<Page<CourseDto>>().sendSuccess(courseDtoPage);
    }

    @Override
    public ResponseEntity<Page<CourseDto>> findByCourseTitle(String name, Pageable pageable) {
        Page<Course> course = repository.findCourseByTitleLikeAndDeletedDateIsNull("%" + name + "%", pageable);
        Page<CourseDto> courseDtoPage = course.map(appCourse -> mapper.map(course, CourseDto.class));
        return new ResponseHandler<Page<CourseDto>>().sendSuccess(courseDtoPage);
    }

    @Transactional
    @Override
    public ResponseEntity<?> update(CourseUpdateRequest request) {
        SubCatalog subCatalog = subCatalogRepository.findById(request.getSubCatalogId()).orElse(null);
        if(subCatalog == null){
            return new ResponseHandler<>().sendError(StatusErrorEnums.SUBCATALOG_NOT_FOUND);
        }
        Course course = repository.findByIdAndDeletedDateIsNull(request.getId()).orElse(null);
        if (course == null) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.COURSE_NOT_FOUND);
        }
        course.setTitle(request.getTitle());
        course.setSubCatalog(subCatalog);
        course.setDescription(request.getDescription());
        course.setRequirement(request.getRequirement());
        course.setWhoThisCourseIsFor(request.getWhoThisCourseIsFor());
        course.setWhatYouWillLearn(request.getWhatYouWillLearn());
        course.setActivate(request.isActivate());
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
        Course course = repository.findByIdAndDeletedDateIsNull(id).orElse(null);
        if (course == null) {
            return new ResponseHandler<CourseDto>().sendError(StatusErrorEnums.COURSE_NOT_FOUND);
        }
        return new ResponseHandler<CourseDto>().sendSuccess(mapper.map(course, CourseDto.class));

    }

    @Override
    public ResponseEntity<?> getLanguages() {
        Map<String, String> result = new LinkedHashMap<>();
        for (LanguageEnum languageEnum : LanguageEnum.values()) {
            result.put(languageEnum.name(), languageEnum.getValue());
        }
        return new ResponseHandler<>().sendSuccess(result);
    }

    @Transactional
    @Override
    public ResponseEntity<?> delete(Long id) {
        Course course = repository.findByIdAndDeletedDateIsNull(id).orElse(null);
        if (course == null) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.COURSE_NOT_FOUND);
        }
        course.setDeletedDate(new Date());
        course.getLessons().forEach(lesson -> {
            lesson.setDeletedDate(new Date());
            lesson.getLectures().forEach(lecture -> lecture.setDeletedDate(new Date()));

        });
        repository.save(course);
        return new ResponseHandler<>().sendSuccess("Deleted success");
    }


    public Course convertSignupRequestToAppCourse(CourseCreateRequest request) {
        Course result = mapper.map(request,Course.class);
        result.setActivate(false);
        result.setCreatedDate(new Date());
        return result;
    }
}
