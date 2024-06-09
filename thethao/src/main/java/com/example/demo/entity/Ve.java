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
@Table(name = "Ve")
public class Ve {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maVe;

    @Column(name = "loaive", length = 50, nullable = false)
    private String loaiVe;

    @Column(name = "giave", nullable = false)
    private Double giaVe;

    @Column(name = "ngaymua", nullable = false)
    private java.time.LocalDateTime ngayMua;

    @Column(name = "ghichu", length = 255)
    private String ghiChu;

    @ManyToOne
    @JoinColumn(name = "mabtc", nullable = false)
    private BanToChuc banToChuc;

    @ManyToOne
    @JoinColumn(name = "makh", nullable = false)
    private NguoiDung nguoiDung;

    @ManyToOne
    @JoinColumn(name = "masukien", nullable = false)
    private SuKienTheThao suKienTheThao;
}
