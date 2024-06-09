package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "HuanLuyenVien")
public class HuanLuyenVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maHLV;

    @Column(name = "tenhlv", length = 50, nullable = false)
    private String tenHLV;

    @Column(name = "sdt", length = 20, nullable = false)
    private String sdt;

    @Column(name = "diachi", length = 255, nullable = false)
    private String diaChi;

    @Column(name = "gioitinh", nullable = false)
    private Integer gioiTinh;
}
