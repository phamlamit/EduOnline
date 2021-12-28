package vn.aptech.backend.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import vn.aptech.backend.dto.ResponseHandler;
import vn.aptech.backend.dto.UserDto;
import vn.aptech.backend.dto.request.SignupRequest;
import vn.aptech.backend.dto.request.user.UserAdminUpdateRequest;
import vn.aptech.backend.dto.request.user.UserChangePasswordRequest;
import vn.aptech.backend.dto.request.user.UserUpdateRequest;
import vn.aptech.backend.dto.response.user.UserInformationResponse;
import vn.aptech.backend.entity.AppRole;
import vn.aptech.backend.entity.AppUser;
import vn.aptech.backend.repository.RoleRepository;
import vn.aptech.backend.repository.UserRepository;
import vn.aptech.backend.service.UserService;
import vn.aptech.backend.utils.SecurityUtils;
import vn.aptech.backend.utils.enums.RoleEnums;
import vn.aptech.backend.utils.enums.StatusErrorEnums;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository repository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private PasswordEncoder encoder;
    @Autowired
    private ModelMapper mapper;


    @Override
    public boolean existsByUsername(String username) {
        return repository.existsByUsername(username);
    }

    @Override
    public boolean existsByEmail(String email) {
        return repository.existsByEmail(email);
    }

    @Transactional
    @Override
    public ResponseEntity<?> create(SignupRequest request) {
        if (request.getPassword().equals(request.getConfirmPassword())) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.USER_PASSWORD_DIFFERENT_NEW_PASSWORD);
        }
        if (repository.existsByUsername(request.getUsername())) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.USER_USERNAME_IS_ALREADY_TAKEN);
        }
        if (repository.existsByEmail(request.getEmail())) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.USER_EMAIL_IS_ALREADY_USE);
        }

        AppUser user = this.convertSignupRequesttoAppUser(request);

        if (SecurityUtils.getPrincipal().getRole().equals(RoleEnums.ROLE_ADMIN.name())) {
            if (StringUtils.isEmpty(request.getRole())) {
                AppRole role = roleRepository.findByName(request.getRole()).orElse(null);
                if (role == null) {
                    return new ResponseHandler<>().sendError(StatusErrorEnums.USER_ROLE_NOT_FOUND);
                } else {
                    user.setRole(role);
                }
            }
        } else {
            AppRole role = roleRepository.findByName(RoleEnums.ROLE_USER.name()).get();
            user.setRole(role);
        }
        user.setCreatedDate(new Date());

        UserDto newUser = mapper.map(repository.save(user), UserDto.class);
        return new ResponseHandler<>().sendSuccess(newUser);
    }

    @Override
    public ResponseEntity<UserInformationResponse> getUserInformation() {
        AppUser user = repository.findByUsername(SecurityUtils.getPrincipal().getUsername()).orElse(null);
        if (user == null) {
            return new ResponseHandler<UserInformationResponse>().sendError(StatusErrorEnums.USER_NOT_FOUND);
        }
        UserInformationResponse userInformationResponse = mapper.map(user, UserInformationResponse.class);
        return new ResponseHandler<UserInformationResponse>().sendSuccess(userInformationResponse);
    }

    @Transactional
    @Override
    public ResponseEntity<?> changePassword(UserChangePasswordRequest request) {
        ResponseHandler<List<UserDto>> response = new ResponseHandler<>();
        AppUser user = repository.findByUsername(SecurityUtils.getPrincipal().getUsername()).orElse(null);
        if (!encoder.matches(request.getOldPassword(), user.getPassword())) {
            return response.sendError(StatusErrorEnums.USER_OLD_PASSWORD_IS_WRONG);
        }
        if (!request.getNewPassword().equals(request.getConfirmPassword())) {
            return response.sendError(StatusErrorEnums.USER_CONFIRM_PASSWORD_DIFFERENT_NEW_PASSWORD);
        }
        user.setPassword(encoder.encode(request.getNewPassword()));
        user.setUpdatedDate(new Date());
        repository.save(user);
        return response.sendSuccess("Password change success");
    }

    @Override
    public ResponseEntity<Page<UserDto>> fillAll(Pageable pageable) {
        Page<AppUser> appUsers = repository.findAppUsersByDeletedDateIsNull(pageable);
        Page<UserDto> userDtoPage = appUsers.map(appUser -> mapper.map(appUser, UserDto.class));
        return new ResponseHandler<Page<UserDto>>().sendSuccess(userDtoPage);
    }

    @Override
    public ResponseEntity<Page<UserDto>> findByUsername(String username, Pageable pageable) {
        Page<AppUser> appUsers = repository.findAppUsersByUsernameLikeAndDeletedDateIsNull("%" + username + "%", pageable);
        Page<UserDto> userDtoPage = appUsers.map(appUser -> mapper.map(appUser, UserDto.class));
        return new ResponseHandler<Page<UserDto>>().sendSuccess(userDtoPage);
    }

    @Transactional
    @Override
    public ResponseEntity<?> update(UserUpdateRequest request) {
        AppUser appUser = repository.findByUsername(SecurityUtils.getPrincipal().getUsername()).orElse(null);
        if (appUser == null) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.USER_NOT_FOUND);
        }
        appUser.setFullname(request.getFullname());
        appUser.setAddress(request.getAddress());
        appUser.setPhone(request.getPhone());
        appUser.setEmail(request.getEmail());
        appUser.setAvatarImage(request.getAvatarImage());
        appUser.setUpdatedDate(new Date());
        return new ResponseHandler<>().sendSuccess(mapper.map(repository.save(appUser), UserDto.class));
    }

    @Override
    public ResponseEntity<?> update(UserAdminUpdateRequest request) {
        AppUser appUser = repository.findById(request.getId()).orElse(null);
        if (appUser == null) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.USER_NOT_FOUND);
        }
        if (repository.existsByEmail(request.getEmail())) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.USER_EMAIL_IS_ALREADY_USE);
        }
        AppRole role = roleRepository.findByName(request.getRole()).orElse(null);
        if (role == null) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.USER_ROLE_NOT_FOUND);
        }
        appUser.setRole(role);
        appUser.setPassword(encoder.encode(request.getPassword()));
        appUser.setEnabled(request.isEnabled());
        appUser.setFullname(request.getFullname());
        appUser.setAddress(request.getAddress());
        appUser.setPhone(request.getPhone());
        appUser.setEmail(request.getEmail());
        appUser.setAvatarImage(request.getAvatarImage());
        appUser.setUpdatedDate(new Date());
        return new ResponseHandler<>().sendSuccess(mapper.map(repository.save(appUser), UserDto.class));
    }

    @Override
    public ResponseEntity<UserDto> findById(Long id) {
        AppUser appUser = repository.findById(id).orElse(null);
        if (appUser == null) {
            return new ResponseHandler<UserDto>().sendError(StatusErrorEnums.USER_NOT_FOUND);
        }
        return new ResponseHandler<UserDto>().sendSuccess(mapper.map(appUser, UserDto.class));
    }

    @Override
    public ResponseEntity<?> delete(Long id) {
        AppUser appUser = repository.findById(id).orElse(null);
        if (appUser == null) {
            return new ResponseHandler<UserDto>().sendError(StatusErrorEnums.USER_NOT_FOUND);
        }
        appUser.setDeletedDate(new Date());
        repository.save(appUser);
        return new ResponseHandler<>().sendSuccess("Deleted");
    }

    public AppUser convertSignupRequesttoAppUser(SignupRequest request) {
        AppUser result = new AppUser();
        result.setUsername(request.getUsername());
        result.setPassword(encoder.encode(request.getPassword()));
        result.setAddress(request.getAddress());
        result.setPhone(request.getPhone());
        return result;
    }
}
