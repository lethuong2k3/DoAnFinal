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
@Table(name = "SuKienTheThao")
public class SuKienTheThao {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long maSuKien;

    @Column(name = "tensukien", length = 50, nullable = false, unique = true)
    private String tenSuKien;

    @Column(name = "ngbatdau", nullable = false)
    private java.time.LocalDateTime ngBatDau;

    @Column(name = "ngketthuc", nullable = false)
    private java.time.LocalDateTime ngKetThuc;

    @Column(name = "diadiem", length = 255, nullable = false)
    private String diaDiem;

    @ManyToOne
    @JoinColumn(name = "mabtc", nullable = false)
    private BanToChuc banToChuc;
}