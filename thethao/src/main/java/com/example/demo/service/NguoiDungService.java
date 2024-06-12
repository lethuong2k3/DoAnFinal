package com.example.demo.service;

import com.example.demo.entity.NguoiDung;
import com.example.demo.model.request.CustomerUpdateRequest;
import com.example.demo.model.request.RegisterRequest;

import java.security.Principal;

public interface NguoiDungService {
    NguoiDung findByTaiKhoan(String taiKhoan);
    NguoiDung findById(Long id);
    NguoiDung save(RegisterRequest request);
    NguoiDung update(CustomerUpdateRequest request);
}
