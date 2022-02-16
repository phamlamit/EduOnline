package vn.aptech.backend.service;

import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;

public interface OrdersService {
    ResponseEntity<?> fillAll(Pageable pageable);

    ResponseEntity<?> findByOrderNumber(String orderNumber);
}
