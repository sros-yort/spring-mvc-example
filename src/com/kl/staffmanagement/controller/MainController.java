package com.kl.staffmanagement.controller;

import com.kl.staffmanagement.repos.WriteMockDataToDatabase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class MainController {

    @Autowired
    WriteMockDataToDatabase writeMockDataToDatabase;

    @GetMapping("/add")
    public String addUser() {
        writeMockDataToDatabase.addUser();
        return "index";
    }
}
