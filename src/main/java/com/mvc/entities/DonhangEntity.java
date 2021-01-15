package com.mvc.entities;

import javax.persistence.*;
import java.sql.Date;
import java.util.Objects;

@Entity
@Table(name = "DONHANG", schema = "dbo", catalog = "UNIFOOD_TMDT")
public class DonhangEntity {
    private int maDon;
    private Integer maGio;
    private String maDonViGiaoHang;
    private String ttDonHang;
    private Boolean ttThanhToan;
    private Integer tongGiaTri;
    private Date ngayDat;
    private Date ngayGiaoHang;
    private Date ngayThanhToan;
    private String diaChi;
    private String maNguoiVanChuyen;

    public DonhangEntity()
    {

    }

    public DonhangEntity(int maDon, Integer maGio, String maNguoiVanChuyen, String diaChi, String ttDonHang, Boolean ttThanhToan, Integer tongGiaTri, Date ngayDat, Date ngayGiaoHang, Date ngayThanhToan)
    {
        this.maDon = maDon;
        this.maGio = maGio;
        this.maNguoiVanChuyen= maNguoiVanChuyen;
        this.diaChi = diaChi;
        this.ttDonHang = ttDonHang;
        this.ttThanhToan = ttThanhToan;
        this.tongGiaTri = tongGiaTri;
        this.ngayDat = ngayDat;
        this.ngayGiaoHang = ngayGiaoHang;
        this.ngayThanhToan = ngayThanhToan;
    }

    @Id
    @Column(name = "MaDon", nullable = false)
    public int getMaDon() {
        return maDon;
    }

    public void setMaDon(int maDon) {
        this.maDon = maDon;
    }

    @Basic
    @Column(name = "MaGio", nullable = true)
    public Integer getMaGio() {
        return maGio;
    }

    public void setMaGio(Integer maGio) {
        this.maGio = maGio;
    }

    @Basic
    @Column(name = "TT_DonHang", nullable = true, length = 50)
    public String getTtDonHang() {
        return ttDonHang;
    }

    public void setTtDonHang(String ttDonHang) {
        this.ttDonHang = ttDonHang;
    }

    @Basic
    @Column(name = "TT_ThanhToan", nullable = true)
    public Boolean getTtThanhToan() {
        return ttThanhToan;
    }

    public void setTtThanhToan(Boolean ttThanhToan) {
        this.ttThanhToan = ttThanhToan;
    }

    @Basic
    @Column(name = "TongGiaTri", nullable = true)
    public Integer getTongGiaTri() {
        return tongGiaTri;
    }

    public void setTongGiaTri(Integer tongGiaTri) {
        this.tongGiaTri = tongGiaTri;
    }

    @Basic
    @Column(name = "NgayDat", nullable = true)
    public Date getNgayDat() {
        return ngayDat;
    }

    public void setNgayDat(Date ngayDat) {
        this.ngayDat = ngayDat;
    }

    @Basic
    @Column(name = "NgayGiaoHang", nullable = true)
    public Date getNgayGiaoHang() {
        return ngayGiaoHang;
    }

    public void setNgayGiaoHang(Date ngayGiaoHang) {
        this.ngayGiaoHang = ngayGiaoHang;
    }

    @Basic
    @Column(name = "NgayThanhToan", nullable = true)
    public Date getNgayThanhToan() {
        return ngayThanhToan;
    }

    public void setNgayThanhToan(Date ngayThanhToan) {
        this.ngayThanhToan = ngayThanhToan;
    }

    @Basic
    @Column(name = "DiaChi")
    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    @Basic
    @Column(name = "MaNguoiVanChuyen")
    public String getMaNguoiVanChuyen() {
        return maNguoiVanChuyen;
    }

    public void setMaNguoiVanChuyen(String maNguoiVanChuyen) {
        this.maNguoiVanChuyen = maNguoiVanChuyen;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DonhangEntity that = (DonhangEntity) o;

        if (maDon != that.maDon) return false;
        if (!Objects.equals(maGio, that.maGio)) return false;
        if (!Objects.equals(maDonViGiaoHang, that.maDonViGiaoHang)) return false;
        if (!Objects.equals(ttDonHang, that.ttDonHang)) return false;
        if (!Objects.equals(ttThanhToan, that.ttThanhToan)) return false;
        if (!Objects.equals(tongGiaTri, that.tongGiaTri)) return false;
        if (!Objects.equals(ngayDat, that.ngayDat)) return false;
        if (!Objects.equals(ngayGiaoHang, that.ngayGiaoHang)) return false;
        if (!Objects.equals(ngayThanhToan, that.ngayThanhToan)) return false;
        if (!Objects.equals(diaChi, that.diaChi)) return false;
        if (!Objects.equals(maNguoiVanChuyen, that.maNguoiVanChuyen)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = maDon;
        result = 31 * result + (maGio != null ? maGio.hashCode() : 0);
        result = 31 * result + (maDonViGiaoHang != null ? maDonViGiaoHang.hashCode() : 0);
        result = 31 * result + (ttDonHang != null ? ttDonHang.hashCode() : 0);
        result = 31 * result + (ttThanhToan != null ? ttThanhToan.hashCode() : 0);
        result = 31 * result + (tongGiaTri != null ? tongGiaTri.hashCode() : 0);
        result = 31 * result + (ngayDat != null ? ngayDat.hashCode() : 0);
        result = 31 * result + (ngayGiaoHang != null ? ngayGiaoHang.hashCode() : 0);
        result = 31 * result + (ngayThanhToan != null ? ngayThanhToan.hashCode() : 0);
        result = 31 * result + (diaChi != null ? diaChi.hashCode() : 0);
        result = 31 * result + (maNguoiVanChuyen != null ? maNguoiVanChuyen.hashCode() : 0);
        return result;
    }
}
