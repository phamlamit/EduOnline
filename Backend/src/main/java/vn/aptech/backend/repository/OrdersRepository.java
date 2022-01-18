package vn.aptech.backend.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import vn.aptech.backend.entity.Orders;

import java.util.Optional;

public interface OrdersRepository extends JpaRepository<Orders, Long> {
    @Query(value = "SELECT o FROM Orders o WHERE o.user.id = :id")
    Page<Orders> findAllByUserId(Long id);

    Optional<Orders> findByOrderNumber(String orderNumber);
}
