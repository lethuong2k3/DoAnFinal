package com.example.demo.repository;

import com.example.demo.entity.SuKienTheThao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SKTTRepository extends JpaRepository<SuKienTheThao, Long> {

}
