package lpf.jdb.po;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2017/6/6.
 */
public class InnerStock implements Serializable {
    private int id;
    private Integer pId;
    private Integer adminId;
    private Integer innerStockNumber;
    private Timestamp innerTime;

    public InnerStock() {
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

    public Integer getInnerStockNumber() {
        return innerStockNumber;
    }

    public void setInnerStockNumber(Integer innerStockNumber) {
        this.innerStockNumber = innerStockNumber;
    }

    public Timestamp getInnerTime() {
        return innerTime;
    }

    public void setInnerTime(Timestamp innerTime) {
        this.innerTime = innerTime;
    }

    @Override
    public String toString() {
        return "InnerStock{" +
                "id=" + id +
                ", pId=" + pId +
                ", adminId=" + adminId +
                ", innerStockNumber=" + innerStockNumber +
                ", innerTime=" + innerTime +
                '}';
    }
}
