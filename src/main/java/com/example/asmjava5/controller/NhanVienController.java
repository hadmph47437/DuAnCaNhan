package com.example.asmjava5.controller;


import com.example.asmjava5.model.NhanVien;
import com.example.asmjava5.repository.NhanVienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/nhan-vien")
public class NhanVienController {

    @Autowired
    private NhanVienRepository nhanVienRepository;

    @GetMapping("/hien-thi")
    public String hienThi(Model model) {
        List<NhanVien> list = nhanVienRepository.findAll();
        model.addAttribute("list", list);
        return "NhanVien/hien-thi";
    }

    @GetMapping("/search")
    public String search(@RequestParam(value = "id", required = false) Integer id, Model model) {
        List<NhanVien> list;
        if (id != null) {
            NhanVien khachHang = nhanVienRepository.findById(id).orElse(null);
            if (khachHang != null) {
                list = List.of(khachHang);
            } else {
                list = List.of();
            }
        } else {
            list = nhanVienRepository.findAll();
        }
        model.addAttribute("list", list);
        return "NhanVien/hien-thi";
    }



    @GetMapping("/view-add")
    public String viewAdd() {
        return "NhanVien/view-add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute NhanVien nhanVien) {
        nhanVienRepository.save(nhanVien);
        return "redirect:/nhan-vien/hien-thi";
    }

    @GetMapping("/view-update")
    public String viewUpdate(@RequestParam("id") Integer id, Model model) {
        NhanVien nhanVien = nhanVienRepository.findById(id).orElse(null);
        model.addAttribute("nhanVien", nhanVien);
        return "NhanVien/view-update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute NhanVien nhanVien) {
        nhanVienRepository.save(nhanVien);
        return "redirect:/nhan-vien/hien-thi";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        nhanVienRepository.deleteById(id);
        return "redirect:/nhan-vien/hien-thi";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Integer id, Model model) {
        NhanVien nhanVien = nhanVienRepository.findById(id).orElse(null);
        model.addAttribute("nhanVien", nhanVien);
        return "NhanVien/detail";
    }
}

