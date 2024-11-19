package com.example.asmjava5.controller;

import com.example.asmjava5.model.KhachHang;
import com.example.asmjava5.repository.KhachHangRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/khach-hang")
public class KhachHangController {

    @Autowired
    private KhachHangRepository khachHangRepository;

    @GetMapping("/search")
    public String search(@RequestParam(value = "id", required = false) Integer id, Model model) {
        List<KhachHang> list;
        if (id != null) {
            KhachHang khachHang = khachHangRepository.findById(id).orElse(null);
            if (khachHang != null) {
                list = List.of(khachHang);
            } else {
                list = List.of();
            }
        } else {
            list = khachHangRepository.findAll();
        }
        model.addAttribute("list", list);
        return "KhachHang/hien-thi";
    }



    @GetMapping("/hien-thi")
    public String hienThi(Model model) {
        List<KhachHang> list = khachHangRepository.findAll();
        model.addAttribute("list", list);
        return "KhachHang/hien-thi";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model) {
        model.addAttribute("khachHang", new KhachHang());
        return "KhachHang/view-add";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute KhachHang khachHang, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "KhachHang/view-add";
        }
        khachHangRepository.save(khachHang);
        return "redirect:/khach-hang/hien-thi";
    }

    @GetMapping("/view-update")
    public String viewUpdate(@RequestParam("id") Integer id, Model model) {
        KhachHang khachHang = khachHangRepository.findById(id).orElse(null);
        model.addAttribute("khachHang", khachHang);
        return "KhachHang/view-update";
    }

    @PostMapping("/update")
    public String update(@Valid @ModelAttribute KhachHang khachHang, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "KhachHang/view-update";
        }
        khachHangRepository.save(khachHang);
        return "redirect:/khach-hang/hien-thi";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        khachHangRepository.deleteById(id);
        return "redirect:/khach-hang/hien-thi";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Integer id, Model model) {
        KhachHang khachHang = khachHangRepository.findById(id).orElse(null);
        model.addAttribute("khachHang", khachHang);
        return "KhachHang/detail";
    }
}
