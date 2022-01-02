package vn.aptech.backend.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import vn.aptech.backend.entity.Course;

import java.util.Optional;

public interface CourseRepository extends JpaRepository<Course, Long> {

    Optional<Course> findCourseByTitle(String name);

    Page<Course> findCourseByDeletedDateIsNull(Pageable pageable);

    Page<Course> findCourseByTitleLikeAndDeletedDateIsNull(String name, Pageable pageable);
}
