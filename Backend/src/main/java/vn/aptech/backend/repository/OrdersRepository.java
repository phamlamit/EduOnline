package vn.aptech.backend.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import vn.aptech.backend.entity.Orders;

import java.util.List;
import java.util.Optional;

public interface OrdersRepository extends JpaRepository<Orders, Long> {
    @Query(value = "SELECT o FROM Orders o WHERE o.user.id = :id")
    Page<Orders> findAllByUserId(Long id, Pageable pageable);

    Optional<Orders> findByOrderNumber(String orderNumber);

    @Query(value = "SELECT o FROM Orders o WHERE o.user.id = :id")
    List<Orders> findAllByUserId(Long id);

    @Query(value = "SELECT DISTINCT o.order from OrderDetail o WHERE o.course.id = :courseId")
    List<Orders> findOrdersByCourseId(Long courseId);
}
