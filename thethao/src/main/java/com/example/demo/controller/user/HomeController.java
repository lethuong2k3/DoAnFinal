package com.example.demo.controller.user;

import com.example.demo.service.BanToChucService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @Autowired
    private BanToChucService btcService;

    @GetMapping("/")
    public String view (Model model) {
        model.addAttribute("listBTC", btcService.findAll());
        return "user/index";
    }
}
