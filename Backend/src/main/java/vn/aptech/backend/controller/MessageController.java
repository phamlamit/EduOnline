package vn.aptech.backend.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vn.aptech.backend.service.MessageService;

@RestController
@RequestMapping("/api")
public class MessageController implements BaseController{

    private MessageService service;
}
