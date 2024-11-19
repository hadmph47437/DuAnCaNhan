package com.example.asmjava5.controller;


import com.example.asmjava5.model.SPChiTiet;
import com.example.asmjava5.model.MauSac;
import com.example.asmjava5.model.KichThuoc;
import com.example.asmjava5.model.SanPham;
import com.example.asmjava5.repository.SPChiTietRepository;
import com.example.asmjava5.repository.MauSacRepository;
import com.example.asmjava5.repository.KichThuocRepository;
import com.example.asmjava5.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/sp-chi-tiet")
public class SPChiTietController {

    @Autowired
    private SPChiTietRepository spChiTietRepository;

    @Autowired
    private MauSacRepository mauSacRepository;

    @Autowired
    private KichThuocRepository kichThuocRepository;

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @GetMapping("/hien-thi")
    public String hienThi(Model model) {
        List<SPChiTiet> list = spChiTietRepository.findAll();
        model.addAttribute("list", list);
        return "SPChiTiet/hien-thi";
    }

    @GetMapping("/search")
    public String search(@RequestParam(value = "id", required = false) Integer id, Model model) {
        List<SPChiTiet> list;
        if (id != null) {
            SPChiTiet khachHang = spChiTietRepository.findById(id).orElse(null);
            if (khachHang != null) {
                list = List.of(khachHang);
            } else {
                list = List.of();
            }
        } else {
            list = spChiTietRepository.findAll();
        }
        model.addAttribute("list", list);
        return "SPChiTiet/hien-thi";
    }


    @GetMapping("/view-add")
    public String viewAdd(Model model) {
        model.addAttribute("mauSacs", mauSacRepository.findAll());
        model.addAttribute("kichThuocs", kichThuocRepository.findAll());
        model.addAttribute("sanPhams", sanPhamRepository.findAll());
        return "SPChiTiet/view-add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute SPChiTiet spChiTiet) {
        spChiTietRepository.save(spChiTiet);
        return "redirect:/sp-chi-tiet/hien-thi";
    }

    @GetMapping("/view-update")
    public String viewUpdate(@RequestParam("id") Integer id, Model model) {
        SPChiTiet spChiTiet = spChiTietRepository.findById(id).orElse(null);
        model.addAttribute("spChiTiet", spChiTiet);
        model.addAttribute("mauSacs", mauSacRepository.findAll());
        model.addAttribute("kichThuocs", kichThuocRepository.findAll());
        model.addAttribute("sanPhams", sanPhamRepository.findAll());
        return "SPChiTiet/view-update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute SPChiTiet spChiTiet) {
        spChiTietRepository.save(spChiTiet);
        return "redirect:/sp-chi-tiet/hien-thi";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        spChiTietRepository.deleteById(id);
        return "redirect:/sp-chi-tiet/hien-thi";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Integer id, Model model) {
        SPChiTiet spChiTiet = spChiTietRepository.findById(id).orElse(null);
        model.addAttribute("spChiTiet", spChiTiet);
        return "SPChiTiet/detail";
    }


}

