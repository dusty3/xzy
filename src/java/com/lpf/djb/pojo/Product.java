package com.lpf.djb.pojo;

import java.util.Date;

public class Product {
    private Integer productId;

    private Integer brandId;

    private String brandName;

    private String productType;

    private String productDescription;

    private String productChinesename;

    private String productForeignname;

    private String productCustomsname;

    private String productCustomsduty;

    private String productChinesehs;

    private String productForeignhs;

    private String customsElement;

    private String customsParameter;

    private String origin;

    private Integer isofficial;

    private Integer productMakingpartid;

    private String productMakingpartname;

    private String productCreatetime;

    private String productModifytime;

    private Integer productDr;

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

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

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType == null ? null : productType.trim();
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription == null ? null : productDescription.trim();
    }

    public String getProductChinesename() {
        return productChinesename;
    }

    public void setProductChinesename(String productChinesename) {
        this.productChinesename = productChinesename == null ? null : productChinesename.trim();
    }

    public String getProductForeignname() {
        return productForeignname;
    }

    public void setProductForeignname(String productForeignname) {
        this.productForeignname = productForeignname == null ? null : productForeignname.trim();
    }

    public String getProductCustomsname() {
        return productCustomsname;
    }

    public void setProductCustomsname(String productCustomsname) {
        this.productCustomsname = productCustomsname == null ? null : productCustomsname.trim();
    }

    public String getProductCustomsduty() {
        return productCustomsduty;
    }

    public void setProductCustomsduty(String productCustomsduty) {
        this.productCustomsduty = productCustomsduty == null ? null : productCustomsduty.trim();
    }

    public String getProductChinesehs() {
        return productChinesehs;
    }

    public void setProductChinesehs(String productChinesehs) {
        this.productChinesehs = productChinesehs == null ? null : productChinesehs.trim();
    }

    public String getProductForeignhs() {
        return productForeignhs;
    }

    public void setProductForeignhs(String productForeignhs) {
        this.productForeignhs = productForeignhs == null ? null : productForeignhs.trim();
    }

    public String getCustomsElement() {
        return customsElement;
    }

    public void setCustomsElement(String customsElement) {
        this.customsElement = customsElement == null ? null : customsElement.trim();
    }

    public String getCustomsParameter() {
        return customsParameter;
    }

    public void setCustomsParameter(String customsParameter) {
        this.customsParameter = customsParameter == null ? null : customsParameter.trim();
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin == null ? null : origin.trim();
    }

    public Integer getIsofficial() {
        return isofficial;
    }

    public void setIsofficial(Integer isofficial) {
        this.isofficial = isofficial;
    }

    public Integer getProductMakingpartid() {
        return productMakingpartid;
    }

    public void setProductMakingpartid(Integer productMakingpartid) {
        this.productMakingpartid = productMakingpartid;
    }

    public String getProductMakingpartname() {
        return productMakingpartname;
    }

    public void setProductMakingpartname(String productMakingpartname) {
        this.productMakingpartname = productMakingpartname == null ? null : productMakingpartname.trim();
    }

    public String getProductCreatetime() {
        return productCreatetime;
    }

    public void setProductCreatetime(String productCreatetime) {
        this.productCreatetime = productCreatetime;
    }

    public String getProductModifytime() {
        return productModifytime;
    }

    public void setProductModifytime(String productModifytime) {
        this.productModifytime = productModifytime;
    }

    public Integer getProductDr() {
        return productDr;
    }

    public void setProductDr(Integer productDr) {
        this.productDr = productDr;
    }
}