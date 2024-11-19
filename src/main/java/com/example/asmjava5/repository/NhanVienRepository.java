package com.example.asmjava5.repository;


import com.example.asmjava5.model.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NhanVienRepository extends JpaRepository<NhanVien, Integer> {
    NhanVien findByTenDangNhap(String tenDangNhap);
}

