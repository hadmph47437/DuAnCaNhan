package com.example.asmjava5.controller;

import com.example.asmjava5.model.MauSac;
import com.example.asmjava5.repository.MauSacRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/mau-sac")
public class MauSacController {

    @Autowired
    private MauSacRepository mauSacRepository;

    @GetMapping("/hien-thi")
    public String hienThi(Model model) {
        List<MauSac> list = mauSacRepository.findAll();
        model.addAttribute("list", list);
        return "MauSac/hien-thi";
    }

    @GetMapping("/search")
    public String search(@RequestParam(value = "id", required = false) Integer id, Model model) {
        List<MauSac> list;
        if (id != null) {
            MauSac khachHang = mauSacRepository.findById(id).orElse(null);
            if (khachHang != null) {
                list = List.of(khachHang);
            } else {
                list = List.of();
            }
        } else {
            list = mauSacRepository.findAll();
        }
        model.addAttribute("list", list);
        return "MauSac/hien-thi";
    }



    @GetMapping("/view-add")
    public String viewAdd() {
        return "MauSac/view-add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute MauSac mauSac) {
        mauSacRepository.save(mauSac);
        return "redirect:/mau-sac/hien-thi";
    }

    @GetMapping("/view-update")
    public String viewUpdate(@RequestParam("id") Integer id, Model model) {
        MauSac mauSac = mauSacRepository.findById(id).orElse(null);
        model.addAttribute("mauSac", mauSac);
        return "MauSac/view-update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MauSac mauSac) {
        mauSacRepository.save(mauSac);
        return "redirect:/mau-sac/hien-thi";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        mauSacRepository.deleteById(id);
        return "redirect:/mau-sac/hien-thi";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Integer id, Model model) {
        MauSac mauSac = mauSacRepository.findById(id).orElse(null);
        model.addAttribute("mauSac", mauSac);
        return "MauSac/detail";
    }
}

