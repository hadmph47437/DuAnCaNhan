package com.example.asmjava5.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "khach_hang")
public class KhachHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank(message = "Tên không được để trống")
    private String ten;

    @NotBlank(message = "Số điện thoại không được để trống")
    private String sdt;

    @NotBlank(message = "Mã KH không được để trống")
    @Column(name = "ma_kh")
    private String maKH;

    @NotNull(message = "Trạng thái không được để trống")
    private Integer trangThai;
}
