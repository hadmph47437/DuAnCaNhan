package com.example.asmjava5.controller;

import com.example.asmjava5.model.KichThuoc;
import com.example.asmjava5.repository.KichThuocRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/kich-thuoc")
public class KichThuocController {

    @Autowired
    private KichThuocRepository kichThuocRepository;

    @GetMapping("/hien-thi")
    public String hienThi(Model model) {
        List<KichThuoc> list = kichThuocRepository.findAll();
        model.addAttribute("list", list);
        return "KichThuoc/hien-thi";
    }

    @GetMapping("/search")
    public String search(@RequestParam(value = "id", required = false) Integer id, Model model) {
        List<KichThuoc> list;
        if (id != null) {
            KichThuoc khachHang = kichThuocRepository.findById(id).orElse(null);
            if (khachHang != null) {
                list = List.of(khachHang);
            } else {
                list = List.of();
            }
        } else {
            list = kichThuocRepository.findAll();
        }
        model.addAttribute("list", list);
        return "KichThuoc/hien-thi";
    }


    @GetMapping("/view-add")
    public String viewAdd() {
        return "KichThuoc/view-add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute KichThuoc kichThuoc) {
        kichThuocRepository.save(kichThuoc);
        return "redirect:/kich-thuoc/hien-thi";
    }

    @GetMapping("/view-update")
    public String viewUpdate(@RequestParam("id") Integer id, Model model) {
        KichThuoc kichThuoc = kichThuocRepository.findById(id).orElse(null);
        model.addAttribute("kichThuoc", kichThuoc);
        return "KichThuoc/view-update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute KichThuoc kichThuoc) {
        kichThuocRepository.save(kichThuoc);
        return "redirect:/kich-thuoc/hien-thi";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        kichThuocRepository.deleteById(id);
        return "redirect:/kich-thuoc/hien-thi";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Integer id, Model model) {
        KichThuoc kichThuoc = kichThuocRepository.findById(id).orElse(null);
        model.addAttribute("kichThuoc", kichThuoc);
        return "KichThuoc/detail";
    }
}
