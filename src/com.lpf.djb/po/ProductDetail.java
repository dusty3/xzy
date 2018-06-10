package com.iotek.po;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/6/2.
 */
public class ProductDetail implements Serializable {
    private int id;
    private Integer pId;
    private String image1;
    private String image2;
    private String productCaption;

    public ProductDetail() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getProductCaption() {
        return productCaption;
    }

    public void setProductCaption(String productCaption) {
        this.productCaption = productCaption;
    }

    @Override
    public String toString() {
        return "ProductDetail{" +
                "id=" + id +
                ", pId=" + pId +
                ", image1='" + image1 + '\'' +
                ", image2='" + image2 + '\'' +
                ", productCaption='" + productCaption + '\'' +
                '}';
    }
}
