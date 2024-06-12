package com.example.demo.service.impl;

import com.example.demo.entity.SuKienTheThao;
import com.example.demo.repository.SKTTRepository;
import com.example.demo.service.SKTTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SKTTServiceImpl implements SKTTService {
    @Autowired
    private SKTTRepository repository;

    @Override
    public List<SuKienTheThao> getAllSearchAndFilter(String name, String location, Date startDate, Date endDate) {
        return repository.getAllSearchAndFilter(name, location, startDate, endDate);
    }
}
