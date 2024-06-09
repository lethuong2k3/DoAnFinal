package com.example.demo.service.impl;

import com.example.demo.entity.NguoiDung;
import com.example.demo.repository.NguoiDungRepository;
import com.example.demo.service.NguoiDungService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NguoiDungServiceImpl implements NguoiDungService {
    @Autowired
    private NguoiDungRepository repository;
    @Override
    public NguoiDung findByTaiKhoan(String taiKhoan) {
        return repository.findByTaiKhoan(taiKhoan);
    }
}
