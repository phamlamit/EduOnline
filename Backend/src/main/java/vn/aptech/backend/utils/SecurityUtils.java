package vn.aptech.backend.utils;

import org.springframework.security.core.context.SecurityContextHolder;
import vn.aptech.backend.dto.CustomUserDetails;

public class SecurityUtils {
    public static CustomUserDetails getPrincipal() {
        return (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
