package lpf.jdb.po;

import java.sql.Timestamp;

/**
 * Created by Administrator on 2017/6/3.
 */
public class ShopCart {
    private int id;
    private Integer cId;
    private Product product;
    private Integer cartproductCount;
    private Timestamp  createCartTime;


    public ShopCart() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getCartproductCount() {
        return cartproductCount;
    }

    public void setCartproductCount(Integer cartproductCount) {
        this.cartproductCount = cartproductCount;
    }

    public Timestamp getCreateCartTime() {
        return createCartTime;
    }

    public void setCreateCartTime(Timestamp createCartTime) {
        this.createCartTime = createCartTime;
    }

    @Override
    public String toString() {
        return "ShopCart{" +
                "id=" + id +
                ", cId=" + cId +
                ", product=" + product +
                ", cartproductCount=" + cartproductCount +
                ", createCartTime=" + createCartTime +
                '}';
    }
}
