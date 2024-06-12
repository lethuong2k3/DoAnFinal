package com.example.demo.repository;

import com.example.demo.entity.SuKienTheThao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface SKTTRepository extends JpaRepository<SuKienTheThao, Long> {
    @Query(value = "SELECT sk FROM SuKienTheThao sk JOIN sk.banToChuc WHERE :event IS NULL OR sk.tenSuKien LIKE %:event% AND :location IS NULL OR sk.banToChuc.tinhThanh = :location AND :startDate IS NULL OR sk.ngBatDau >= :startDate AND :endDate IS NULL OR sk.ngKetThuc <= :endDate")
    List<SuKienTheThao> getAllSearchAndFilter(@Param("event") String event, @Param("location") String location, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
}
