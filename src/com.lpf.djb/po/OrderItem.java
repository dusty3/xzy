package com.iotek.po;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2017/6/2.
 */
public class OrderItem implements Serializable {
    private int id;
    private Integer orderListId;
    private Integer pId;
    private Integer productCount;
    private Timestamp orderItemCreateTime;
    private String orderItemState;

    public OrderItem() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getOrderListId() {
        return orderListId;
    }

    public void setOrderListId(Integer orderListId) {
        this.orderListId = orderListId;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public Integer getProductCount() {
        return productCount;
    }

    public void setProductCount(Integer productCount) {
        this.productCount = productCount;
    }

    public Timestamp getOrderItemCreateTime() {
        return orderItemCreateTime;
    }

    public void setOrderItemCreateTime(Timestamp orderItemCreateTime) {
        this.orderItemCreateTime = orderItemCreateTime;
    }

    public String getOrderItemState() {
        return orderItemState;
    }

    public void setOrderItemState(String orderItemState) {
        this.orderItemState = orderItemState;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "id=" + id +
                ", orderListId=" + orderListId +
                ", pId=" + pId +
                ", productCount=" + productCount +
                ", orderItemCreateTime=" + orderItemCreateTime +
                ", orderItemState='" + orderItemState + '\'' +
                '}';
    }
}
