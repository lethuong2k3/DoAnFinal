package com.example.demo.model.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CustomerUpdateRequest {
    private Long maKH;

    @NotBlank(message = "Tên khách hàng không được để trống")
    private String tenKhachHang;

    private String matKhau;

    @NotBlank(message = "Số điện thoại không được để trống")
    @Pattern(regexp = "^\\d{10}$", message = "Số điện thoại không hợp lệ")
    private String sdt;

    @NotBlank(message = "Địa chỉ không được để trống")
    private String diaChi;

    private String matKhauMoi;

    private String xacNhanMatKhau;

    private int gioiTinh;
}
