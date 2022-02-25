package vn.aptech.backend.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import vn.aptech.backend.dto.UserDto;
import vn.aptech.backend.entity.AppUser;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<AppUser, Long> {

    Optional<AppUser> findByUsernameAndDeletedDateIsNull(String username);

    Optional<AppUser> findByIdAndDeletedDateIsNull(Long id);

    boolean existsByUsername(String username);

    boolean existsByEmail(String email);

    boolean existsByEmailAndIdIsNot(String email, Long id);

    Page<AppUser> findAppUsersByDeletedDateIsNull(Pageable pageable);

    Page<AppUser> findAppUsersByUsernameLikeAndDeletedDateIsNull(String username, Pageable pageable);

    int countAllByDeletedDateIsNull();

    int countAllByCreatedDateAndDeletedDateIsNull(Date date);
}
