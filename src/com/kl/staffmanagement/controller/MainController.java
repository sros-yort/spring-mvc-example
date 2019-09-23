package com.kl.staffmanagement.controller;

import com.kl.staffmanagement.service.WriteMockDataToDatabase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class MainController {

    @Autowired
    WriteMockDataToDatabase writeMockDataToDatabase;

    @GetMapping({"", "/", "home", "index"})
    public String index(){
        return "index";
    }

    @GetMapping("login")
    public String Login(){
        return "login/login";
    }


    @GetMapping("/add")
    public String addUser(){

        writeMockDataToDatabase.addUser();
        return "Seccess";
    }
}
