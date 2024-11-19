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
@Table(name = "sp_chi_tiet")
public class SPChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ma_spct")
    private String maSPCT;

    @ManyToOne
    @JoinColumn(name = "id_mau_sac")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "id_kich_thuoc")
    private KichThuoc kichThuoc;

    @ManyToOne
    @JoinColumn(name = "id_san_pham")
    private SanPham sanPham;

    private int soLuong;

    @Column(name = "don_gia")
    private double donGia;

    @Column(name = "trang_thai")
    private int trangThai;
}

