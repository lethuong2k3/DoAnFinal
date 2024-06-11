package com.example.demo.service.impl;

import com.example.demo.entity.NguoiDung;
import com.example.demo.model.request.RegisterRequest;
import com.example.demo.repository.NguoiDungRepository;
import com.example.demo.service.NguoiDungService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class NguoiDungServiceImpl implements NguoiDungService {
    @Autowired
    private NguoiDungRepository repository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public NguoiDung findByTaiKhoan(String taiKhoan) {
        return repository.findByTaiKhoan(taiKhoan);
    }

    @Override
    public NguoiDung save(RegisterRequest request) {
        NguoiDung nguoiDung = new NguoiDung();
        nguoiDung.setTenKhachHang(request.getTenKhachHang());
        nguoiDung.setDiaChi(request.getDiaChi());
        nguoiDung.setTaiKhoan(request.getTaiKhoan());
        nguoiDung.setMatKhau(passwordEncoder.encode(request.getMatKhau()));
        nguoiDung.setSdt(request.getSdt());
        nguoiDung.setVaiTro("user");
        return repository.save(nguoiDung);
    }
}
