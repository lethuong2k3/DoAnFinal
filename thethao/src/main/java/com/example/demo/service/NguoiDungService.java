package com.example.demo.service;

import com.example.demo.entity.NguoiDung;

public interface NguoiDungService {
    NguoiDung findByTaiKhoan(String taiKhoan);
}
