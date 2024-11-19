package com.example.asmjava5.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "nhan_vien")
public class NhanVien {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String ten;

    @Column(name = "ma_nv")
    private String maNV;

    @Column(name = "ten_dang_nhap")
    private String tenDangNhap;

    private String matKhau;

    private int trangThai;
}

