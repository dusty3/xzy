package lpf.jdb.po;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2017/6/6.
 */
public class Stock implements Serializable {
    private int id;
    private Integer pId;
    private Integer adminId;
    private Integer stockNumber;
    private Timestamp stockUpdateTime;

    public Stock() {
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

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Integer getStockNumber() {
        return stockNumber;
    }

    public void setStockNumber(Integer stockNumber) {
        this.stockNumber = stockNumber;
    }

    public Timestamp getStockUpdateTime() {
        return stockUpdateTime;
    }

    public void setStockUpdateTime(Timestamp stockUpdateTime) {
        this.stockUpdateTime = stockUpdateTime;
    }

    @Override
    public String toString() {
        return "Stock{" +
                "id=" + id +
                ", pId=" + pId +
                ", adminId=" + adminId +
                ", stockNumber=" + stockNumber +
                ", stockUpdateTime=" + stockUpdateTime +
                '}';
    }
}
