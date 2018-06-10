package com.iotek.po;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by Administrator on 2017/6/1.
 */
public class Customer implements Serializable {
    private  int id;
    private  String  customerName;
    private  String  customerPassword;
    private  String  customerEmail;
    private  String  customerPhone;
    private  Double customerMoney;
    private Timestamp createTime;
    private  CustAddress custAddress;


    public Customer() {
    }

    public CustAddress getCustAddress() {
        return custAddress;
    }

    public void setCustAddress(CustAddress custAddress) {
        this.custAddress = custAddress;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public Double getCustomerMoney() {
        return customerMoney;
    }

    public void setCustomerMoney(Double customerMoney) {
        this.customerMoney = customerMoney;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", customerName='" + customerName + '\'' +
                ", customerPassword='" + customerPassword + '\'' +
                ", customerEmail='" + customerEmail + '\'' +
                ", customerPhone='" + customerPhone + '\'' +
                ", customerMoney=" + customerMoney +
                ", createTime=" + createTime +
                '}';
    }
}
