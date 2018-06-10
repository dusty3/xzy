package lpf.jdb.po;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by Administrator on 2017/6/2.
 */
public class Product  implements Serializable{
    private int id;
    private String productName;
    private  String productType;
    private Double productPrice;
    private Timestamp prodcutCreateTime;
    /*һ����Ʒ����һ����Ʒ����  һ��һ�Ĺ�ϵ*/
    private ProductDetail productDetail;

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public Double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

    public Timestamp getProdcutCreateTime() {
        return prodcutCreateTime;
    }

    public void setProdcutCreateTime(Timestamp prodcutCreateTime) {
        this.prodcutCreateTime = prodcutCreateTime;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", productName='" + productName + '\'' +
                ", productType='" + productType + '\'' +
                ", productPrice=" + productPrice +
                ", prodcutCreateTime=" + prodcutCreateTime +
                ", productDetail=" + productDetail +
                '}';
    }
}
