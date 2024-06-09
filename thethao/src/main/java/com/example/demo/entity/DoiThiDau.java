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
@Table(name = "DoiThiDau")
public class DoiThiDau {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long maDoi;

    @Column(name = "tendoi", length = 50, nullable = false)
    private String tenDoi;

    @Column(name = "email", length = 50, nullable = false, unique = true)
    private String email;

    @Column(name = "soluongvdv", nullable = false)
    private Integer soluongVDV;

    @Column(name = "soluonghuychuong", nullable = false)
    private Integer soluongHuyChuong;

    @ManyToOne
    @JoinColumn(name = "mahlv", nullable = false)
    private HuanLuyenVien huanLuyenVien;
}
