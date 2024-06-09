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
@Table(name = "MonTheThao")
public class MonTheThao {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long maMon;

    @Column(name = "tenmon", length = 50, nullable = false)
    private String tenMon;

    @Column(name = "mota", length = 255, nullable = false)
    private String moTa;
}
