package com.example.asmjava5.repository;

import com.example.asmjava5.model.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {
}

