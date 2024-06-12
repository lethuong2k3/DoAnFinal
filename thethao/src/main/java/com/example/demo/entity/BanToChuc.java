package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Set;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "BanToChuc")
public class BanToChuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long maBTC;

    @Column(name = "tenbtc", length = 50, nullable = false)
    private String tenBTC;

    @Column(name = "tinhthanh", length = 255, nullable = false)
    private String tinhThanh;

    @OneToMany(mappedBy = "banToChuc")
    private Set<SuKienTheThao> suKienTheThao;
}
