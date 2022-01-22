package vn.aptech.backend.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import vn.aptech.backend.dto.CustomUserDetails;
import vn.aptech.backend.entity.AppUser;
import vn.aptech.backend.repository.UserRepository;

@Component
public class SecurityUtils {
    @Autowired
    private UserRepository repository;

    public AppUser getPrincipal() {
        CustomUserDetails customUserDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (customUserDetails != null) {
            AppUser appUser = repository.findByUsernameAndDeletedDateIsNull(customUserDetails.getUsername()).orElse(null);
            return appUser;
        }
        return null;
    }
}
