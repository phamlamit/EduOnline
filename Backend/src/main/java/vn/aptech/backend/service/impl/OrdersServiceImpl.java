package vn.aptech.backend.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import vn.aptech.backend.dto.ResponseHandler;
import vn.aptech.backend.dto.response.orders.OrderAdminResponse;
import vn.aptech.backend.dto.response.orders.OrderUserResponse;
import vn.aptech.backend.entity.AppUser;
import vn.aptech.backend.entity.Orders;
import vn.aptech.backend.repository.OrdersRepository;
import vn.aptech.backend.repository.UserRepository;
import vn.aptech.backend.service.OrdersService;
import vn.aptech.backend.utils.SecurityUtils;
import vn.aptech.backend.utils.enums.RoleEnums;
import vn.aptech.backend.utils.enums.StatusErrorEnums;

@Service
public class OrdersServiceImpl implements OrdersService {

    private OrdersRepository repository;

    private UserRepository userRepository;

    private ModelMapper mapper;

    @Override
    public ResponseEntity<?> fillAll(Pageable pageable) {
        AppUser appUser = userRepository.findByUsername(SecurityUtils.getPrincipal().getUser().getUsername()).orElse(null);
        if (appUser == null) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.USER_NOT_FOUND);
        }
        if (RoleEnums.ROLE_ADMIN.name().equals(appUser.getRole().getName())) {
            Page<Orders> orders = repository.findAll(pageable);
            Page<OrderAdminResponse> orderAdminResponses = orders.map(order -> mapper.map(order, OrderAdminResponse.class));
            return new ResponseHandler<>().sendSuccess(orderAdminResponses);
        } else if (RoleEnums.ROLE_USER.name().equals(appUser.getRole().getName())) {
            Page<Orders> orders = repository.findAllByUserId(appUser.getId());
            Page<OrderUserResponse> orderUserResponses = orders.map(order -> mapper.map(order, OrderUserResponse.class));
            return new ResponseHandler<>().sendSuccess(orderUserResponses);
        }
        return new ResponseHandler<>().sendError("Error get all orders");
    }

    @Override
    public ResponseEntity<?> findByOrderNumber(String orderNumber) {
        AppUser appUser = userRepository.findByUsername(SecurityUtils.getPrincipal().getUser().getUsername()).orElse(null);
        if (appUser == null) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.USER_NOT_FOUND);
        }
        Orders order = new Orders();
        if (RoleEnums.ROLE_ADMIN.name().equals(appUser.getRole().getName())) {
            order = repository.findByOrderNumber(orderNumber).orElse(null);
        } else if (RoleEnums.ROLE_USER.name().equals(appUser.getRole().getName())) {
            order = repository.findByOrderNumber(orderNumber).orElse(null);
            if (order != null) {
                if (order.getUser().getId() != appUser.getId()) {
                    return new ResponseHandler<>().sendError(StatusErrorEnums.ORDER_CANNOT_TAKE_DATA);
                }
            }
        } else {
            order = null;
        }
        if (order == null) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.ORDER_NOT_EXISTS);
        }
        return null;
    }
}
