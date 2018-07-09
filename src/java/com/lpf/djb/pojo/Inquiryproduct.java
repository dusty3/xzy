package com.lpf.djb.pojo;

public class Inquiryproduct {
    private Integer cpId;

    private String inquiryId;

    private Integer productId;

    private String productType;

    private String productDescription;

    private Integer inquiryNumber;
    private Integer  ipDr;

    public Integer getIpDr() {
        return ipDr;
    }

    public void setIpDr(Integer ipDr) {
        this.ipDr = ipDr;
    }

    public Integer getCpId() {
        return cpId;
    }

    public void setCpId(Integer cpId) {
        this.cpId = cpId;
    }

    public String getInquiryId() {
        return inquiryId;
    }

    public void setInquiryId(String inquiryId) {
        this.inquiryId = inquiryId == null ? null : inquiryId.trim();
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
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

    public Integer getInquiryNumber() {
        return inquiryNumber;
    }

    public void setInquiryNumber(Integer inquiryNumber) {
        this.inquiryNumber = inquiryNumber;
    }
}