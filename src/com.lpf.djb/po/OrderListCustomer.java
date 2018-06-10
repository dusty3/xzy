package com.iotek.po;

/**
 * Created by Administrator on 2017/6/2.
 */
public class OrderListCustomer  extends  OrderList{
    private String customerName;
    private String privince;
    private String city;
    private String country;
    private String road;

    public OrderListCustomer() {
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPrivince() {
        return privince;
    }

    public void setPrivince(String privince) {
        this.privince = privince;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getRoad() {
        return road;
    }

    public void setRoad(String road) {
        this.road = road;
    }

    @Override
    public String toString() {
        return "OrderListCustomer{" +
                "customerName='" + customerName + '\'' +
                ", privince='" + privince + '\'' +
                ", city='" + city + '\'' +
                ", country='" + country + '\'' +
                ", road='" + road + '\'' +
                '}';
    }
}
