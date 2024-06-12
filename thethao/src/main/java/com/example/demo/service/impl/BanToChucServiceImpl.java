package com.example.demo.service.impl;

import com.example.demo.entity.BanToChuc;
import com.example.demo.repository.BanToChucRepository;
import com.example.demo.service.BanToChucService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BanToChucServiceImpl implements BanToChucService {
    @Autowired
    private BanToChucRepository repository;

    @Override
    public List<BanToChuc> findAll() {
        return repository.findAll();
    }
}
