package com.example.demo.controller.admin;

import com.example.demo.entity.NguoiDung;
import com.example.demo.model.request.RegisterRequest;
import com.example.demo.service.NguoiDungService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
public class LoginController {
    @Autowired
    private NguoiDungService service;

    @GetMapping("/login")
    public String viewLogin(Model model) {
        return "/admin/login";
    }

    @GetMapping("/register")
    public String viewRegister(Model model) {
        model.addAttribute("registerRequest", new RegisterRequest());
        return "/admin/register";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute RegisterRequest registerRequest, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("err");
            return "/admin/register";
        }
        NguoiDung exNguoiDung = service.findByTaiKhoan(registerRequest.getTaiKhoan());
        if (exNguoiDung != null) {
            model.addAttribute("accountExists", "Tài khoản đã tồn tại");
            return "/admin/register";
        }
        service.save(registerRequest);
        model.addAttribute("registerSuccess");
        return "redirect:/login";
    }

}
