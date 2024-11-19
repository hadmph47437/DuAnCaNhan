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
@Table(name = "hoa_don_chi_tiet")
public class HoaDonChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_spct",  referencedColumnName = "id")
    private SPChiTiet spChiTiet;

    @ManyToOne
    @JoinColumn(name = "id_hoa_don",  referencedColumnName = "id")
    private HoaDon hoaDon;

    private Integer soLuong;
    private Double donGia;
    private int trangThai;
}

