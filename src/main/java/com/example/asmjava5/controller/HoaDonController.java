package com.example.asmjava5.controller;


import com.example.asmjava5.model.HoaDon;
import com.example.asmjava5.repository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/hoa-don")
public class HoaDonController {

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @GetMapping("/hien-thi")
    public String hienThi(Model model) {
        List<HoaDon> list = hoaDonRepository.findAll();
        model.addAttribute("list", list);
        return "HoaDon/hien-thi";
    }

    @GetMapping("/search")
    public String search(@RequestParam(value = "id", required = false) Integer id, Model model) {
        List<HoaDon> list;
        if (id != null) {
            HoaDon khachHang = hoaDonRepository.findById(id).orElse(null);
            if (khachHang != null) {
                list = List.of(khachHang);
            } else {
                list = List.of();
            }
        } else {
            list = hoaDonRepository.findAll();
        }
        model.addAttribute("list", list);
        return "HoaDon/hien-thi";
    }


    @GetMapping("/detail")
    public String detail(@RequestParam("id") Integer id, Model model) {
        HoaDon hoaDon = hoaDonRepository.findById(id).orElse(null);
        model.addAttribute("hoaDon", hoaDon);
        return "HoaDon/detail";
    }


    @GetMapping("/view-add")
    public String viewAdd() {
        return "HoaDon/view-add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute HoaDon hoaDon) {
        hoaDonRepository.save(hoaDon);
        return "redirect:/hoa-don/hien-thi";
    }

    @GetMapping("/view-update")
    public String viewUpdate(@RequestParam("id") Integer id, Model model) {
        HoaDon hoaDon = hoaDonRepository.findById(id).orElse(null);
        model.addAttribute("hoaDon", hoaDon);
        return "HoaDon/view-update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute HoaDon hoaDon) {
        hoaDonRepository.save(hoaDon);
        return "redirect:/hoa-don/hien-thi";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        hoaDonRepository.deleteById(id);
        return "redirect:/hoa-don/hien-thi";
    }

}

