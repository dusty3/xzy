package com.iotek.po;

/**
 * Created by Administrator on 2017/6/2.
 */
public class CustAddress {
    private  int id;
    private  Integer cId;
    private  String privince;
    private  String city;
    private  String country;
    private  String  road;
    private  String addressCreateTime;

    public CustAddress() {
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

    public String getAddressCreateTime() {
        return addressCreateTime;
    }

    public void setAddressCreateTime(String addressCreateTime) {
        this.addressCreateTime = addressCreateTime;
    }

    @Override
    public String toString() {
        return "CustAddress{" +
                "id=" + id +
                ", cId=" + cId +
                ", privince='" + privince + '\'' +
                ", city='" + city + '\'' +
                ", country='" + country + '\'' +
                ", road='" + road + '\'' +
                ", addressCreateTime='" + addressCreateTime + '\'' +
                '}';
    }
}
