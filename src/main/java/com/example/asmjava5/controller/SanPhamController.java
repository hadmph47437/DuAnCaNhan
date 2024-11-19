package com.example.asmjava5.controller;

import com.example.asmjava5.model.SanPham;
import com.example.asmjava5.repository.SanPhamRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/san-pham")
public class SanPhamController {

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @GetMapping("/hien-thi")
    public String hienThi(Model model) {
        List<SanPham> list = sanPhamRepository.findAll();
        model.addAttribute("list", list);
        return "SanPham/hien-thi";
    }

    @GetMapping("/search")
    public String search(@RequestParam(value = "id", required = false) Integer id, Model model) {
        List<SanPham> list;

        if (id != null) {
            SanPham khachHang = sanPhamRepository.findById(id).orElse(null);
            if (khachHang != null) {
                list = List.of(khachHang);
            } else {
                list = List.of();
            }
        } else {
            list = sanPhamRepository.findAll();
        }

        model.addAttribute("list", list);
        return "SanPham/hien-thi";
    }


    @GetMapping("/view-add")
    public String viewAdd(Model model) {
        SanPham sanPham = new SanPham();
        model.addAttribute("sanPham", sanPham);
        return "SanPham/view-add";
    }


    @PostMapping("/add")
    public String add(@Valid @ModelAttribute SanPham sanPham, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "SanPham/view-add";
        }
        sanPhamRepository.save(sanPham);
        return "redirect:/san-pham/hien-thi";
    }

    @GetMapping("/view-update")
    public String viewUpdate(@RequestParam("id") Integer id, Model model) {
        SanPham sanPham = sanPhamRepository.findById(id).orElse(null);
        model.addAttribute("sanPham", sanPham);
        return "SanPham/view-update";
    }

    @PostMapping("/update")
    public String update(@Valid @ModelAttribute SanPham sanPham, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "SanPham/view-update";
        }
        sanPhamRepository.save(sanPham);
        return "redirect:/san-pham/hien-thi";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        sanPhamRepository.deleteById(id);
        return "redirect:/san-pham/hien-thi";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Integer id, Model model) {
        SanPham sanPham = sanPhamRepository.findById(id).orElse(null);
        model.addAttribute("sanPham", sanPham);
        return "SanPham/detail";
    }
}
