package com.example.asmjava5.repository;

import com.example.asmjava5.model.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, Integer> {
    List<HoaDonChiTiet> findByHoaDon_Id(Integer hoaDonId);
    void deleteByHoaDon_Id(Integer hoaDonId);
}
