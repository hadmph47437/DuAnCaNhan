package com.example.asmjava5.controller;

import com.example.asmjava5.model.*;
import com.example.asmjava5.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/ban-hang")
public class BanHangController {

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private SPChiTietRepository spChiTietRepository;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private MauSacRepository mauSacRepository;

    @Autowired
    private KichThuocRepository kichThuocRepository ;

    @Autowired
    private NhanVienRepository nhanVienRepository ;


    @GetMapping
    public String viewBanHang(Model model) {
        List<HoaDon> hoaDonList = hoaDonRepository.findAll();
        List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietRepository.findAll();

        // Thêm các thông tin bổ sung
        model.addAttribute("hoaDonChiTietList", hoaDonChiTietList);
        model.addAttribute("nhanVienList", nhanVienRepository.findAll());
        model.addAttribute("khachHangList", khachHangRepository.findAll());
        model.addAttribute("spChiTietList", spChiTietRepository.findAll());

        model.addAttribute("hoaDonList", hoaDonList);

        return "BanHang/hien-thi";
    }

    @GetMapping("/search")
    public String searchHoaDonById(@RequestParam(value = "hoaDonId", required = false) Integer hoaDonId, Model model) {
        List<HoaDon> hoaDonList;

        if (hoaDonId != null) {
            // Tìm kiếm theo ID hóa đơn
            HoaDon hoaDon = hoaDonRepository.findById(hoaDonId).orElse(null);
            if (hoaDon != null) {
                hoaDonList = List.of(hoaDon);  // Chuyển thành danh sách để hiển thị
            } else {
                hoaDonList = List.of();  // Nếu không tìm thấy, trả về danh sách rỗng
            }
        } else {
            // Nếu không nhập ID, hiển thị tất cả
            hoaDonList = hoaDonRepository.findAll();
        }

        List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietRepository.findAll();
        model.addAttribute("hoaDonList", hoaDonList);
        model.addAttribute("hoaDonChiTietList", hoaDonChiTietList);

        return "BanHang/hien-thi";
    }


    @GetMapping("/add")
    public String viewAddHoaDon(Model model) {
        List<KhachHang> khachHangList = khachHangRepository.findAll();
        List<SPChiTiet> spChiTietList = spChiTietRepository.findAll();

        List<MauSac> mauSacList = mauSacRepository.findAll();
        List<KichThuoc> kichThuocList = kichThuocRepository.findAll();

        List<NhanVien> nhanVienList = nhanVienRepository.findAll();
        model.addAttribute("nhanVienList", nhanVienList);
        model.addAttribute("khachHangList", khachHangList);
        model.addAttribute("spChiTietList", spChiTietList);
        model.addAttribute("mauSacList", mauSacList);
        model.addAttribute("kichThuocList", kichThuocList);

        return "BanHang/view-add";
    }

    @PostMapping("/add")
    public String addHoaDon(@RequestParam("idKhachHang") Integer idKhachHang,
                            @RequestParam("idNhanVien") Integer idNhanVien,
                            @RequestParam("idSPChiTiet") List<Integer> idSPChiTietList,
                            @RequestParam("soLuong") List<Integer> soLuongList,
                            @RequestParam("donGia") List<Double> donGiaList,
                            @RequestParam("trangThai") Integer trangThai) {

        KhachHang khachHang = khachHangRepository.findById(idKhachHang).orElse(null);
        NhanVien nhanVien = nhanVienRepository.findById(idNhanVien).orElse(null);

        // Tạo hóa đơn mới
        HoaDon hoaDon = new HoaDon();
        hoaDon.setKhachHang(khachHang);
        hoaDon.setNhanVien(nhanVien);
        hoaDon.setNgayMuaHang(LocalDate.now());
        hoaDon.setTrangThai(trangThai);
        hoaDonRepository.save(hoaDon);

        // Thêm từng chi tiết sản phẩm
        for (int i = 0; i < idSPChiTietList.size(); i++) {
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            SPChiTiet spChiTiet = spChiTietRepository.findById(idSPChiTietList.get(i)).orElse(null);
            if (spChiTiet != null) {
                hoaDonChiTiet.setSpChiTiet(spChiTiet);
                hoaDonChiTiet.setHoaDon(hoaDon);
                hoaDonChiTiet.setSoLuong(soLuongList.get(i));
                hoaDonChiTiet.setDonGia(donGiaList.get(i));
                hoaDonChiTiet.setTrangThai(1);
                hoaDonChiTietRepository.save(hoaDonChiTiet);

                // Cập nhật số lượng sản phẩm trong kho
                spChiTiet.setSoLuong(spChiTiet.getSoLuong() - soLuongList.get(i));
                spChiTietRepository.save(spChiTiet);
            }
        }

        return "redirect:/ban-hang";
    }





    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable("id") Integer id, Model model) {
        HoaDon hoaDon = hoaDonRepository.findById(id).orElse(null);
        if (hoaDon != null) {
            model.addAttribute("hoaDon", hoaDon);
            model.addAttribute("hoaDonChiTietList", hoaDonChiTietRepository.findByHoaDon_Id(id));
            model.addAttribute("spChiTietList", spChiTietRepository.findAll());
            model.addAttribute("mauSacList", mauSacRepository.findAll());
            model.addAttribute("kichThuocList", kichThuocRepository.findAll());
            model.addAttribute("nhanVienList", nhanVienRepository.findAll());
            model.addAttribute("khachHangList", khachHangRepository.findAll());
        }
        return "BanHang/view-update";
    }



//    @PostMapping("/update/{id}")
//    public String updateHoaDon(@PathVariable("id") Integer id,
//                               @RequestParam("trangThai") Integer trangThai,
//                               @RequestParam List<Integer> idSPChiTiet,
//                               @RequestParam List<Integer> soLuong) {
//        HoaDon hoaDon = hoaDonRepository.findById(id).orElse(null);
//        if (hoaDon != null) {
//            // Lưu trạng thái hóa đơn
//            if (trangThai == 1) { // Nếu trạng thái là đã thanh toán
//                if (hoaDon.getTrangThai() == 0) {
//                    hoaDon.setTrangThai(trangThai);
//                    hoaDonRepository.save(hoaDon);
//                    return "redirect:/ban-hang"; // Chỉ cập nhật trạng thái
//                }
//            }
//
//            // Lấy danh sách chi tiết sản phẩm hiện tại
//            List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietRepository.findByHoaDon_Id(id);
//
//            // Tạo một Set để kiểm tra các sản phẩm đã tồn tại
//            Set<Integer> existingProductIds = new HashSet<>();
//            for (HoaDonChiTiet chiTiet : hoaDonChiTietList) {
//                existingProductIds.add(chiTiet.getSpChiTiet().getId());
//            }
//
//            // Xóa các chi tiết sản phẩm không còn tồn tại nữa
//            for (int i = 0; i < hoaDonChiTietList.size(); i++) {
//                HoaDonChiTiet chiTiet = hoaDonChiTietList.get(i);
//                boolean found = false;
//
//                for (int j = 0; j < idSPChiTiet.size(); j++) {
//                    if (chiTiet.getSpChiTiet().getId().equals(idSPChiTiet.get(j))) {
//                        found = true;
//
//                        SPChiTiet spChiTiet = spChiTietRepository.findById(idSPChiTiet.get(j)).orElse(null);
//                        if (spChiTiet != null) {
//                            // Cập nhật số lượng
//                            int oldQuantity = chiTiet.getSoLuong();
//                            int newQuantity = soLuong.get(j);
//
//                            // Cập nhật trạng thái
//                            chiTiet.setSoLuong(newQuantity);
//                            chiTiet.setDonGia(spChiTiet.getDonGia());
//                            hoaDonChiTietRepository.save(chiTiet);
//
//                            // Cập nhật số lượng sản phẩm trong kho
//                            if (hoaDon.getTrangThai() == 0) { // Nếu hóa đơn chưa thanh toán
//                                if (newQuantity > oldQuantity) {
//                                    spChiTiet.setSoLuong(spChiTiet.getSoLuong() - (newQuantity - oldQuantity));
//                                } else if (newQuantity < oldQuantity) {
//                                    spChiTiet.setSoLuong(spChiTiet.getSoLuong() + (oldQuantity - newQuantity));
//                                }
//                                spChiTietRepository.save(spChiTiet);
//                            }
//                        }
//                        break; // Thoát khỏi vòng lặp sau khi tìm thấy
//                    }
//                }
//
//                // Nếu không tìm thấy sản phẩm trong danh sách đã gửi lên thì xóa chi tiết
//                if (!found) {
//                    // Cập nhật số lượng sản phẩm trong kho khi xóa
//                    SPChiTiet spChiTiet = chiTiet.getSpChiTiet();
//                    if (spChiTiet != null) {
//                        spChiTiet.setSoLuong(spChiTiet.getSoLuong() + chiTiet.getSoLuong());
//                        spChiTietRepository.save(spChiTiet);
//                    }
//                    hoaDonChiTietRepository.delete(chiTiet);
//                }
//            }
//
//            // Thêm sản phẩm mới vào hóa đơn
//            for (int i = 0; i < idSPChiTiet.size(); i++) {
//                if (!existingProductIds.contains(idSPChiTiet.get(i))) { // Nếu sản phẩm mới không tồn tại trong hóa đơn
//                    HoaDonChiTiet newChiTiet = new HoaDonChiTiet();
//                    SPChiTiet newSPChiTiet = spChiTietRepository.findById(idSPChiTiet.get(i)).orElse(null);
//                    if (newSPChiTiet != null) {
//                        newChiTiet.setSpChiTiet(newSPChiTiet);
//                        newChiTiet.setHoaDon(hoaDon);
//                        newChiTiet.setSoLuong(soLuong.get(i));
//                        newChiTiet.setDonGia(newSPChiTiet.getDonGia());
//                        newChiTiet.setTrangThai(1);
//                        hoaDonChiTietRepository.save(newChiTiet);
//
//                        // Cập nhật số lượng sản phẩm trong kho
//                        if (hoaDon.getTrangThai() == 0) { // Nếu hóa đơn chưa thanh toán
//                            newSPChiTiet.setSoLuong(newSPChiTiet.getSoLuong() - soLuong.get(i));
//                            spChiTietRepository.save(newSPChiTiet);
//                        }
//                    }
//                }
//            }
//
//            // Cập nhật lại trạng thái hóa đơn
//            hoaDon.setTrangThai(trangThai);
//            hoaDonRepository.save(hoaDon);
//        }
//        return "redirect:/ban-hang";
//    }

    @PostMapping("/update/{id}")
    public String updateHoaDon(@PathVariable("id") Integer id,
                               @RequestParam("trangThai") Integer trangThai,
                               @RequestParam List<Integer> idSPChiTiet,
                               @RequestParam List<Integer> soLuong) {
        HoaDon hoaDon = hoaDonRepository.findById(id).orElse(null);
        if (hoaDon != null) {
            // Lấy danh sách chi tiết sản phẩm hiện tại
            List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietRepository.findByHoaDon_Id(id);

            // Tạo một Set để kiểm tra các sản phẩm đã tồn tại
            Set<Integer> existingProductIds = new HashSet<>();
            for (HoaDonChiTiet chiTiet : hoaDonChiTietList) {
                existingProductIds.add(chiTiet.getSpChiTiet().getId());
            }

            // Xóa các chi tiết sản phẩm không còn tồn tại nữa
            for (int i = 0; i < hoaDonChiTietList.size(); i++) {
                HoaDonChiTiet chiTiet = hoaDonChiTietList.get(i);
                boolean found = false;

                for (int j = 0; j < idSPChiTiet.size(); j++) {
                    if (chiTiet.getSpChiTiet().getId().equals(idSPChiTiet.get(j))) {
                        found = true;

                        SPChiTiet spChiTiet = spChiTietRepository.findById(idSPChiTiet.get(j)).orElse(null);
                        if (spChiTiet != null) {
                            // Cập nhật số lượng
                            int oldQuantity = chiTiet.getSoLuong();
                            int newQuantity = soLuong.get(j);

                            // Cập nhật trạng thái
                            chiTiet.setSoLuong(newQuantity);
                            chiTiet.setDonGia(spChiTiet.getDonGia());
                            hoaDonChiTietRepository.save(chiTiet);

                            // Cập nhật số lượng sản phẩm trong kho
                            if (hoaDon.getTrangThai() == 0) { // Nếu hóa đơn chưa thanh toán
                                if (newQuantity > oldQuantity) {
                                    spChiTiet.setSoLuong(spChiTiet.getSoLuong() - (newQuantity - oldQuantity));
                                } else if (newQuantity < oldQuantity) {
                                    spChiTiet.setSoLuong(spChiTiet.getSoLuong() + (oldQuantity - newQuantity));
                                }
                                spChiTietRepository.save(spChiTiet);
                            }
                        }
                        break; // Thoát khỏi vòng lặp sau khi tìm thấy
                    }
                }

                // Nếu không tìm thấy sản phẩm trong danh sách đã gửi lên thì xóa chi tiết
                if (!found) {
                    // Cập nhật số lượng sản phẩm trong kho khi xóa
                    SPChiTiet spChiTiet = chiTiet.getSpChiTiet();
                    if (spChiTiet != null) {
                        spChiTiet.setSoLuong(spChiTiet.getSoLuong() + chiTiet.getSoLuong());
                        spChiTietRepository.save(spChiTiet);
                    }
                    hoaDonChiTietRepository.delete(chiTiet);
                }
            }

            // Thêm sản phẩm mới vào hóa đơn
            for (int i = 0; i < idSPChiTiet.size(); i++) {
                if (!existingProductIds.contains(idSPChiTiet.get(i))) { // Nếu sản phẩm mới không tồn tại trong hóa đơn
                    HoaDonChiTiet newChiTiet = new HoaDonChiTiet();
                    SPChiTiet newSPChiTiet = spChiTietRepository.findById(idSPChiTiet.get(i)).orElse(null);
                    if (newSPChiTiet != null) {
                        newChiTiet.setSpChiTiet(newSPChiTiet);
                        newChiTiet.setHoaDon(hoaDon);
                        newChiTiet.setSoLuong(soLuong.get(i));
                        newChiTiet.setDonGia(newSPChiTiet.getDonGia());
                        newChiTiet.setTrangThai(1);
                        hoaDonChiTietRepository.save(newChiTiet);

                        // Cập nhật số lượng sản phẩm trong kho
                        if (hoaDon.getTrangThai() == 0) { // Nếu hóa đơn chưa thanh toán
                            newSPChiTiet.setSoLuong(newSPChiTiet.getSoLuong() - soLuong.get(i));
                            spChiTietRepository.save(newSPChiTiet);
                        }
                    }
                }
            }

            // Cập nhật lại trạng thái hóa đơn sau khi đã cập nhật chi tiết
            hoaDon.setTrangThai(trangThai);
            hoaDonRepository.save(hoaDon);
        }
        return "redirect:/ban-hang";
    }





    @GetMapping("/detail/{id}")
    public String viewDetailHoaDon(@PathVariable("id") Integer id, Model model) {
        HoaDon hoaDon = hoaDonRepository.findById(id).orElse(null);
        if (hoaDon != null) {
            List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietRepository.findByHoaDon_Id(hoaDon.getId());
            model.addAttribute("hoaDon", hoaDon);
            model.addAttribute("hoaDonChiTietList", hoaDonChiTietList);
        }
        return "BanHang/detail";
    }
}
