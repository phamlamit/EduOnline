package vn.aptech.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vn.aptech.backend.annotation.AllRole;
import vn.aptech.backend.annotation.User;
import vn.aptech.backend.dto.PageDto;
import vn.aptech.backend.service.OrdersService;

@RestController
@RequestMapping("/api")
public class OrderController {

    @Autowired
    private OrdersService service;

    @AllRole
    @GetMapping("/oders")
    public ResponseEntity<?> getAllOrders(PageDto page) {
        page = page.builder(page);
        Pageable pageable = PageRequest.of(page.getPage(), page.getSize(), page.getSort()).withPage(page.getPageNumber());
        return service.fillAll(pageable);
    }

    @AllRole
    @GetMapping("/oder/{orderNumber}")
    public ResponseEntity<?> getOrderDetails(@PathVariable("orderNumber") String orderNumber){
        return service.findByOrderNumber(orderNumber);
    }

}
