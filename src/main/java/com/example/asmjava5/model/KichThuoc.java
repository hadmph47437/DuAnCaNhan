package com.example.asmjava5.model;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@AllArgsConstructor
@NoArgsConstructor
@Entity
@Getter
@Setter
@Table(name = "kich_thuoc")
public class KichThuoc {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String ma;

    private String ten;

    private int trangThai;
}
