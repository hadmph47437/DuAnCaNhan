//
//package com.example.asmjava5.model;
//
//import jakarta.persistence.*;
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//
//import java.time.LocalDate;
//
//@AllArgsConstructor
//@NoArgsConstructor
//@Getter
//@Setter
//@Entity
//@Table(name = "hoa_don")
//public class HoaDon {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Integer id;
//
//    @ManyToOne
//    @JoinColumn(name = "id_khach_hang", referencedColumnName = "id", nullable = false)
//    private KhachHang khachHang;
//
//    @ManyToOne
//    @JoinColumn(name = "id_nhan_vien", referencedColumnName = "id", nullable = false)
//    private NhanVien nhanVien;
//
//    @Column(name = "ngay_mua_hang")
//    private LocalDate ngayMuaHang;
//
//    private int trangThai;
//}
//

package com.example.asmjava5.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "hoa_don")
public class HoaDon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull(message = "Khách hàng không được để trống")
    @ManyToOne
    @JoinColumn(name = "id_khach_hang", referencedColumnName = "id", nullable = false)
    private KhachHang khachHang;

    @NotNull(message = "Nhân viên không được để trống")
    @ManyToOne
    @JoinColumn(name = "id_nhan_vien", referencedColumnName = "id", nullable = false)
    private NhanVien nhanVien;

    @Column(name = "ngay_mua_hang")
    private LocalDate ngayMuaHang;


    @Column(name = "trang_thai")
    private int trangThai;

}

