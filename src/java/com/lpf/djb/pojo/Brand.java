package com.lpf.djb.pojo;

import java.util.Date;

public class Brand {
    private Integer brandId;

    private String brandName;

    private Integer brandManufacturersid;

    private String brandManufacturers;

    private String brandWebsite;

    private String brandTele;

    private String brandEmail;

    private String brandDescription;

    private Date brandCreatetime;

    private Date brandModifytime;

    private Integer brandMakingpartid;

    private String brandMakingpartname;

    private Integer brandDr;

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName == null ? null : brandName.trim();
    }

    public Integer getBrandManufacturersid() {
        return brandManufacturersid;
    }

    public void setBrandManufacturersid(Integer brandManufacturersid) {
        this.brandManufacturersid = brandManufacturersid;
    }

    public String getBrandManufacturers() {
        return brandManufacturers;
    }

    public void setBrandManufacturers(String brandManufacturers) {
        this.brandManufacturers = brandManufacturers == null ? null : brandManufacturers.trim();
    }

    public String getBrandWebsite() {
        return brandWebsite;
    }

    public void setBrandWebsite(String brandWebsite) {
        this.brandWebsite = brandWebsite == null ? null : brandWebsite.trim();
    }

    public String getBrandTele() {
        return brandTele;
    }

    public void setBrandTele(String brandTele) {
        this.brandTele = brandTele == null ? null : brandTele.trim();
    }

    public String getBrandEmail() {
        return brandEmail;
    }

    public void setBrandEmail(String brandEmail) {
        this.brandEmail = brandEmail == null ? null : brandEmail.trim();
    }

    public String getBrandDescription() {
        return brandDescription;
    }

    public void setBrandDescription(String brandDescription) {
        this.brandDescription = brandDescription == null ? null : brandDescription.trim();
    }

    public Date getBrandCreatetime() {
        return brandCreatetime;
    }

    public void setBrandCreatetime(Date brandCreatetime) {
        this.brandCreatetime = brandCreatetime;
    }

    public Date getBrandModifytime() {
        return brandModifytime;
    }

    public void setBrandModifytime(Date brandModifytime) {
        this.brandModifytime = brandModifytime;
    }

    public Integer getBrandMakingpartid() {
        return brandMakingpartid;
    }

    public void setBrandMakingpartid(Integer brandMakingpartid) {
        this.brandMakingpartid = brandMakingpartid;
    }

    public String getBrandMakingpartname() {
        return brandMakingpartname;
    }

    public void setBrandMakingpartname(String brandMakingpartname) {
        this.brandMakingpartname = brandMakingpartname == null ? null : brandMakingpartname.trim();
    }

    public Integer getBrandDr() {
        return brandDr;
    }

    public void setBrandDr(Integer brandDr) {
        this.brandDr = brandDr;
    }
}