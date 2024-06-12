package com.example.demo.controller.user;

import com.example.demo.entity.NguoiDung;
import com.example.demo.model.request.CustomerUpdateRequest;
import com.example.demo.service.NguoiDungService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
public class AccoutController {
    @Autowired
    private NguoiDungService service;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @GetMapping("/my-account")
    public String view (Principal principal, Model model, @ModelAttribute("customerRequest") CustomerUpdateRequest request) {
        if (principal != null) {
            NguoiDung nguoiDung = service.findByTaiKhoan(principal.getName());
            request.setTenKhachHang(nguoiDung.getTenKhachHang());
            request.setSdt(nguoiDung.getSdt());
            request.setDiaChi(nguoiDung.getDiaChi());
            request.setGioiTinh(nguoiDung.getGioiTinh());
            model.addAttribute("customer", request);
            model.addAttribute("accountActive", true);
            return "user/account";
        }
        return "user/login";
    }

    @PostMapping("/my-account")
    public String update (@Valid @ModelAttribute("customerRequest") CustomerUpdateRequest request,
                          BindingResult bindingResult,
                          @RequestParam(name = "matKhau") String matKhau,
                          @RequestParam(name = "matKhauMoi") String matKhauMoi,
                          @RequestParam(name = "xacNhanMatKhau") String xacNhanMatKhau,
                          Model model, Principal principal, RedirectAttributes redirectAttributes
                         ) {
        if (bindingResult.hasErrors()) {
            return "user/account";
        }
        NguoiDung nguoiDung = service.findByTaiKhoan(principal.getName());

        if (!passwordEncoder.matches(matKhau, nguoiDung.getMatKhau()) && !matKhau.trim().isEmpty()) {
            model.addAttribute("errPassword", "Mật khẩu hiện tại không đúng");
            return "user/account";
        }
        if (!matKhauMoi.equals(xacNhanMatKhau)) {
            model.addAttribute("errorNewPassword", "Mật khẩu mới và xác nhận mật khẩu không đúng");
            return "user/account";
        }
        if (passwordEncoder.matches(matKhauMoi, nguoiDung.getMatKhau())) {
            model.addAttribute("errorNewPassword", "Mật khẩu mới và mật khẩu hiện tại không được trùng nhau");
            return "user/account";
        }
        request.setMaKH(nguoiDung.getMaKh());
        service.update(request);
        redirectAttributes.addFlashAttribute("message", "Cập nhật thông tin thành công");
        return "redirect:/my-account";
    }
}
