package com.example.demo.controller.admin;

import com.example.demo.service.NguoiDungService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {
    @Autowired
    private NguoiDungService service;

    @GetMapping("/admin/tong-quan")
    public String viewLogin(Model model) {
        model.addAttribute("activeDashboard", true);
        return "/admin/index";
    }

    @GetMapping("/admin/ban-to-chuc")
    public String course(Model model) {
        model.addAttribute("activeBTC", true);
        return "/admin/course";
    }


    @GetMapping("/404")
    public String error() {
        return "/user/404";
    }
}
