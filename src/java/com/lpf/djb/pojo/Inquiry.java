package com.lpf.djb.pojo;


import java.io.Serializable;
import java.text.ParseException;


import java.util.Date;
import java.util.List;

public class Inquiry implements Serializable {
    private Integer inquiryId;

    private Integer brandId;

    private String brandName;

    private Integer supplierId;

    private String supplierName;

    private Integer customerId;

    private String customerName;

    private Integer inquiryStyle;

    private Integer inquirySend;

    private Integer inquiryReply;

    private String inquiryMark;

    private Integer userinfoId;

    private String userinfoName;

    private Integer inquiryMakingpartid;

    private String inquiryMakingpartname;


    private String inquiryCreatetime;

    private String inquiryModifytime;

    private String inquiryReplytime;

    private Integer inquiryDr;

    private  Integer inquiryLanguage;

    public List<Inquiryproduct> getInquiryproducts() {
        return inquiryproducts;
    }

    public void setInquiryproducts(List<Inquiryproduct> inquiryproducts) {
        this.inquiryproducts = inquiryproducts;
    }

    private List<Inquiryproduct> inquiryproducts;
    public Integer getInquiryLanguage() {
        return inquiryLanguage;
    }

    public void setInquiryLanguage(Integer inquiryLanguage) {
        this.inquiryLanguage = inquiryLanguage;
    }

    public Integer getInquiryId() {
        return inquiryId;
    }

    public void setInquiryId(Integer inquiryId) {
        this.inquiryId = inquiryId;
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

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName == null ? null : supplierName.trim();
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    public Integer getInquiryStyle() {
        return inquiryStyle;
    }

    public void setInquiryStyle(Integer inquiryStyle) {
        this.inquiryStyle = inquiryStyle;
    }

    public Integer getInquirySend() {
        return inquirySend;
    }

    public void setInquirySend(Integer inquirySend) {
        this.inquirySend = inquirySend;
    }

    public Integer getInquiryReply() {
        return inquiryReply;
    }

    public void setInquiryReply(Integer inquiryReply) {
        this.inquiryReply = inquiryReply;
    }

    public String getInquiryMark() {
        return inquiryMark;
    }

    public void setInquiryMark(String inquiryMark) {
        this.inquiryMark = inquiryMark == null ? null : inquiryMark.trim();
    }

    public Integer getUserinfoId() {
        return userinfoId;
    }

    public void setUserinfoId(Integer userinfoId) {
        this.userinfoId = userinfoId;
    }

    public String getUserinfoName() {
        return userinfoName;
    }

    public void setUserinfoName(String userinfoName) {
        this.userinfoName = userinfoName == null ? null : userinfoName.trim();
    }

    public Integer getInquiryMakingpartid() {
        return inquiryMakingpartid;
    }

    public void setInquiryMakingpartid(Integer inquiryMakingpartid) {
        this.inquiryMakingpartid = inquiryMakingpartid;
    }

    public String getInquiryMakingpartname() {
        return inquiryMakingpartname;
    }

    public void setInquiryMakingpartname(String inquiryMakingpartname) {
        this.inquiryMakingpartname = inquiryMakingpartname == null ? null : inquiryMakingpartname.trim();
    }

    public String getInquiryCreatetime() {

        return inquiryCreatetime;
    }

    public void setInquiryCreatetime(String inquiryCreatetime) {
        this.inquiryCreatetime = inquiryCreatetime;
    }

    public String getInquiryModifytime() {
        return inquiryModifytime;
    }

    public void setInquiryModifytime(String inquiryModifytime) {
        this.inquiryModifytime = inquiryModifytime;
    }

    public String getInquiryReplytime() {
        return inquiryReplytime;
    }

    public void setInquiryReplytime(String inquiryReplytime) {
        this.inquiryReplytime = inquiryReplytime;
    }

    public Integer getInquiryDr() {
        return inquiryDr;
    }

    public void setInquiryDr(Integer inquiryDr) {
        this.inquiryDr = inquiryDr;
    }
}