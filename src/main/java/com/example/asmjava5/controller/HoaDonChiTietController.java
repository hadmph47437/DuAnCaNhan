package com.example.asmjava5.controller;


import com.example.asmjava5.model.HoaDonChiTiet;
import com.example.asmjava5.model.KhachHang;
import com.example.asmjava5.repository.HoaDonChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/hoa-don-chi-tiet")
public class HoaDonChiTietController {

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @GetMapping("/hien-thi")
    public String hienThi(Model model) {
        List<HoaDonChiTiet> list = hoaDonChiTietRepository.findAll();
        model.addAttribute("list", list);
        return "HoaDonChiTiet/hien-thi";
    }

    @GetMapping("/search")
    public String search(@RequestParam(value = "id", required = false) Integer id, Model model) {
        List<HoaDonChiTiet> list;
        if (id != null) {
            HoaDonChiTiet khachHang = hoaDonChiTietRepository.findById(id).orElse(null);
            if (khachHang != null) {
                list = List.of(khachHang);
            } else {
                list = List.of();
            }
        } else {
            list = hoaDonChiTietRepository.findAll();
        }
        model.addAttribute("list", list);
        return "HoaDonChiTiet/hien-thi";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model) {
        model.addAttribute("hoaDonChiTiet", new HoaDonChiTiet());
        return "HoaDonChiTiet/view-add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute HoaDonChiTiet hoaDonChiTiet) {
        hoaDonChiTietRepository.save(hoaDonChiTiet);
        return "redirect:/hoa-don-chi-tiet/hien-thi";
    }

    @GetMapping("/view-update")
    public String viewUpdate(@RequestParam("id") Integer id, Model model) {
        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietRepository.findById(id).orElse(null);
        model.addAttribute("hoaDonChiTiet", hoaDonChiTiet);
        return "HoaDonChiTiet/view-update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute HoaDonChiTiet hoaDonChiTiet) {
        hoaDonChiTietRepository.save(hoaDonChiTiet);
        return "redirect:/hoa-don-chi-tiet/hien-thi";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        hoaDonChiTietRepository.deleteById(id);
        return "redirect:/hoa-don-chi-tiet/hien-thi";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Integer id, Model model) {
        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietRepository.findById(id).orElse(null);
        model.addAttribute("hoaDonChiTiet", hoaDonChiTiet);
        return "HoaDonChiTiet/detail";
    }
}

