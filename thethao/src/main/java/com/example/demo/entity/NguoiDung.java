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
@Table(name = "NguoiDung")
public class NguoiDung {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long maKh;

    @Column(name = "tenkh")
    private String tenKhachHang;

    @Column(name = "taikhoan")
    private String taiKhoan;

    @Column(name = "matkhau")
    private String matKhau;

    @Column(name = "vaitro")
    private String vaiTro;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "diachi")
    private String diaChi;

    @Column(name = "gioitinh")
    private int gioiTinh;
}
