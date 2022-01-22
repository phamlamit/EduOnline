package vn.aptech.backend.dto.request.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserAdminUpdateRequest {
    private Long id;
    @NotNull
    @NotBlank
    private String password;
    @NotNull
    @NotBlank
    private String email;
    @NotNull
    @NotBlank
    private String fullname;
    private String avatarImage;
    private String phone;
    private String address;
    @NotNull
    @NotBlank
    private String role;
    @NotNull
    @NotBlank
    private boolean isEnabled;
}
