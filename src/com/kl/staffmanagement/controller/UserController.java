package com.kl.staffmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("users")
public class UserController {

    @GetMapping("user-list")
    public String userManagement() {
        return "/user/user-list";
    }

}
