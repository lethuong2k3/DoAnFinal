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
@Table(name = "NoiDungThiDau")
public class NoiDungThiDau {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long maND;

    @Column(name = "tennd", length = 50, nullable = false)
    private String tenND;

    @Column(name = "thoigian", nullable = false)
    private java.time.LocalDateTime thoiGian;

    @Column(name = "diadiemthi", length = 255, nullable = false)
    private String diaDiemThi;

    @Column(name = "ghichu", length = 255)
    private String ghiChu;

    @ManyToOne
    @JoinColumn(name = "mamon", nullable = false)
    private MonTheThao monTheThao;
}
