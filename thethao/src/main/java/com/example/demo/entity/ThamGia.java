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
@Table(name = "ThamGia")
public class ThamGia {
    @Id
    @ManyToOne
    @JoinColumn(name = "mavdv", nullable = false)
    private VanDongVien vanDongVien;

    @Id
    @ManyToOne
    @JoinColumn(name = "mand", nullable = false)
    private NoiDungThiDau noiDungThiDau;

    @Id
    @ManyToOne
    @JoinColumn(name = "masukien", nullable = false)
    private SuKienTheThao suKienTheThao;

    @Column(name = "huychuong", nullable = false)
    private Integer huyChuong;
}
