package com.example.demo.service;

import com.example.demo.entity.NguoiDung;
import com.example.demo.model.request.RegisterRequest;

public interface NguoiDungService {
    NguoiDung findByTaiKhoan(String taiKhoan);
    NguoiDung save(RegisterRequest request);
}
