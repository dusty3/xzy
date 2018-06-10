package com.iotek.po;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by Administrator on 2017/6/2.
 */
public class OrderList  implements Serializable{
    private  int id;
    private  Integer cId;
    private  Integer custAddressId;
    private Timestamp orderCreateTime;
    private Double totalMoney;
    private String orderState;
    private List<OrderItem> orderItems;


    public OrderList() {
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
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

    public Integer getCustAddressId() {
        return custAddressId;
    }

    public void setCustAddressId(Integer custAddressId) {
        this.custAddressId = custAddressId;
    }

    public Timestamp getOrderCreateTime() {
        return orderCreateTime;
    }

    public void setOrderCreateTime(Timestamp orderCreateTime) {
        this.orderCreateTime = orderCreateTime;
    }

    public Double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(Double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getOrderState() {
        return orderState;
    }

    public void setOrderState(String orderState) {
        this.orderState = orderState;
    }

    @Override
    public String toString() {
        return "OrderList{" +
                "id=" + id +
                ", cId=" + cId +
                ", custAddressId=" + custAddressId +
                ", orderCreateTime=" + orderCreateTime +
                ", totalMoney=" + totalMoney +
                ", orderState='" + orderState + '\'' +
                '}';
    }
}
