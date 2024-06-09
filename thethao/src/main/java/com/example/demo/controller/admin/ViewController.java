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
        model.addAttribute("activePage", "dashboard");
        return "/admin/index";
    }

    @GetMapping("/admin/khoa-hoc")
    public String course(Model model) {
        model.addAttribute("activePageDrop", "course");
        return "/admin/course";
    }
}
