package com.example.demo.service.impl;

import com.example.demo.entity.NguoiDung;
import com.example.demo.model.request.CustomerUpdateRequest;
import com.example.demo.model.request.RegisterRequest;
import com.example.demo.repository.NguoiDungRepository;
import com.example.demo.service.NguoiDungService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.Optional;

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
    public NguoiDung findById(Long id) {
        return repository.findById(id).orElse(null);
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

    @Override
    public NguoiDung update(CustomerUpdateRequest request) {
        Optional<NguoiDung> nguoiDungOptional = repository.findById(request.getMaKH());
        if (nguoiDungOptional.isPresent()) {
            NguoiDung nguoiDung = nguoiDungOptional.get();
            nguoiDung.setTenKhachHang(request.getTenKhachHang());
            nguoiDung.setSdt(request.getSdt());
            nguoiDung.setDiaChi(request.getDiaChi());
            if (!request.getMatKhauMoi().equals("")) {
                nguoiDung.setMatKhau(passwordEncoder.encode(request.getMatKhauMoi()));
            }
            return repository.save(nguoiDung);
        }
        return null;
    }
}
