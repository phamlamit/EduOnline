package vn.aptech.backend.service.impl;


import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vn.aptech.backend.dto.OrdersDto;
import vn.aptech.backend.dto.ResponseHandler;
import vn.aptech.backend.dto.request.order.PaymentCreateRequest;
import vn.aptech.backend.dto.response.orders.OrderAdminResponse;
import vn.aptech.backend.dto.response.orders.OrderUserResponse;
import vn.aptech.backend.entity.*;
import vn.aptech.backend.repository.CourseRepository;
import vn.aptech.backend.repository.OrdersRepository;
import vn.aptech.backend.service.OrdersService;
import vn.aptech.backend.utils.SecurityUtils;
import vn.aptech.backend.utils.enums.RoleEnums;
import vn.aptech.backend.utils.enums.StatusErrorEnums;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class OrdersServiceImpl implements OrdersService {

    private final static String ORDER_CODE = "ABC000";

    @Autowired
    private OrdersRepository repository;

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private ModelMapper mapper;

    @Autowired
    private SecurityUtils securityUtils;

    @Override
    public ResponseEntity<?> fillAll(Pageable pageable) {
        AppUser appUser = securityUtils.getPrincipal();
        if (appUser == null) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.USER_NOT_FOUND);
        }
        if (RoleEnums.ROLE_ADMIN.name().equals(appUser.getRole().getName())) {
            Page<Orders> orders = repository.findAll(pageable);
            Page<OrderAdminResponse> orderAdminResponses = orders.map(order -> mapper.map(order, OrderAdminResponse.class));
            return new ResponseHandler<>().sendSuccess(orderAdminResponses);
        } else if (RoleEnums.ROLE_USER.name().equals(appUser.getRole().getName())) {
            Page<Orders> orders = repository.findAllByUserId(appUser.getId(),pageable);
            Page<OrderUserResponse> orderUserResponses = orders.map(order -> mapper.map(order, OrderUserResponse.class));
            return new ResponseHandler<>().sendSuccess(orderUserResponses);
        }
        return new ResponseHandler<>().sendError("Error get all orders");
    }

    @Override
    public ResponseEntity<?> findByOrderNumber(String orderNumber) {
        AppUser appUser = securityUtils.getPrincipal();
        if (appUser == null) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.USER_NOT_FOUND);
        }
        Orders order = null;
        if (RoleEnums.ROLE_ADMIN.name().equals(appUser.getRole().getName())) {
            order = repository.findByOrderNumber(orderNumber).orElse(null);
        } else if (RoleEnums.ROLE_USER.name().equals(appUser.getRole().getName())) {
            order = repository.findByOrderNumber(orderNumber).orElse(null);
            if (order != null) {
                if (!order.getUser().getId().equals(appUser.getId())) {
                    return new ResponseHandler<>().sendError(StatusErrorEnums.ORDER_CANNOT_TAKE_DATA);
                }else {
                    return new ResponseHandler<>().sendSuccess(mapper.map(order,OrdersDto.class));
                }
            }
        }
        if (order == null) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.ORDER_NOT_EXISTS);
        }
        return new ResponseHandler<>().sendSuccess(mapper.map(order,OrdersDto.class));
    }

    @Override
    @Transactional
    public ResponseEntity<?> createPayment(PaymentCreateRequest request) {
        AppUser appUser = securityUtils.getPrincipal();
        if (appUser == null) {
            return new ResponseHandler<>().sendError(StatusErrorEnums.USER_NOT_FOUND);
        }
        synchronized(this){
            Orders order = new Orders();
            List<OrderDetail> orderDetails = new ArrayList<>();
            double totalAmount = 0;
            for(Long id : request.getCourseIds()){
                Course course = courseRepository.findByIdAndDeletedDateIsNull(id).orElse(null);
                if(course == null){
                    return new ResponseHandler<>().sendError(StatusErrorEnums.COURSE_NOT_FOUND);
                }else {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setCourse(course);
                    orderDetails.add(orderDetail);
                    orderDetail.setOrder(order);
                    totalAmount += course.getPrice();
                }
            }
            Random random = new Random();
            order.setTotalAmount(totalAmount);
            String code =ORDER_CODE + (random.nextInt(899) + 100) + (random.nextInt(899) + 100);
            order.setOrderNumber(code);
            order.setOrderDetails(orderDetails);
            order.setUser(appUser);
            order.setStatusOrder(true);
            order.setDateOrder(new Date());
            order.setAddress(request.getBillingAddress());
            Payment payment = mapper.map(request,Payment.class);
            payment.setDatePayment(new Date());
            payment.setUser(appUser);
            payment.setStatus(true);
            payment.setAmount(totalAmount);
            order.setPayment(payment);
            Orders newOrder = repository.save(order);
            payment.setOrder(newOrder);

            return new ResponseHandler<>().sendSuccess(mapper.map(newOrder, OrdersDto.class));
        }
    }
}
