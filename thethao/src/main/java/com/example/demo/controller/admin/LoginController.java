package com.example.demo.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping("/login")
public class LoginController {
    @GetMapping
    public String view(Principal principal) {
        return principal != null ? "redirect:/admin/tong-quan" : "/admin/login";
    }
}
