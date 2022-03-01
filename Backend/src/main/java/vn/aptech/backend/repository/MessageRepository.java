package vn.aptech.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.aptech.backend.entity.Messages;

public interface MessageRepository extends JpaRepository<Messages,Long> {
}
