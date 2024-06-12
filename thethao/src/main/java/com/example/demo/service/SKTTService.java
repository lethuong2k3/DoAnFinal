package com.example.demo.service;

import com.example.demo.entity.SuKienTheThao;

import java.util.Date;
import java.util.List;

public interface SKTTService {
    List<SuKienTheThao> getAllSearchAndFilter(String name, String location, Date startDate, Date endDate);
}
