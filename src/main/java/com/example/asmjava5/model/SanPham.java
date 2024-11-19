//package com.example.asmjava5.model;
//
//
//import jakarta.persistence.Column;
//import jakarta.persistence.Entity;
//import jakarta.persistence.GeneratedValue;
//import jakarta.persistence.GenerationType;
//import jakarta.persistence.Id;
//import jakarta.persistence.Table;
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//
//@AllArgsConstructor
//@NoArgsConstructor
//@Getter
//@Setter
//@Entity
//@Table(name = "san_pham")
//public class SanPham {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Integer id;
//
//    private String ma;
//
//    private String ten;
//
//    private int trangThai;
//}
//

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
@Table(name = "san_pham")
public class SanPham {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank(message = "Vui lòng nhập mã sản phẩm")
    private String ma;

    @NotBlank(message = "Vui lòng nhập tên sản phẩm")
    private String ten;

//    @NotNull(message = "Vui lòng chọn trạng thái")
//    private int trangThai;

    @NotNull(message = "Vui lòng chọn trạng thái sản phẩm")
    private Integer trangThai; // Đổi thành Integer để có thể sử dụng @NotNull
}

