package vn.aptech.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vn.aptech.backend.annotation.Admin;
import vn.aptech.backend.service.HomeService;

@RestController
@RequestMapping("/api")
public class HomeController implements BaseController{

    @Autowired
    private HomeService service;

    @Admin
    @GetMapping("/admin/dashboard")
    public ResponseEntity<?> getDashboardAdmin(){
        return service.getDashboardAdmin();
    }
}
