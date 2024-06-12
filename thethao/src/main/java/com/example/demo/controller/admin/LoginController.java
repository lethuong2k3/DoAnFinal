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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
public class LoginController {
    @Autowired
    private NguoiDungService service;

    @GetMapping("/login")
    public String viewLogin() {
        return "/user/login";
    }

    @GetMapping("/register")
    public String viewRegister(Model model) {
        model.addAttribute("registerRequest", new RegisterRequest());
        return "/user/register";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute RegisterRequest registerRequest,
                           BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("err");
            return "/user/register";
        }
        NguoiDung exNguoiDung = service.findByTaiKhoan(registerRequest.getTaiKhoan());
        if (exNguoiDung != null) {
            model.addAttribute("accountExists", "Tài khoản đã tồn tại");
            return "/user/register";
        }
        service.save(registerRequest);
        redirectAttributes.addFlashAttribute("registerSuccess", true);
        return "redirect:/login";
    }

}
