package lpf.jdb.po;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2017/6/6.
 */
public class Shelf implements Serializable {
    private int id;
    private Integer pId;
    private Integer adminId;
    private Timestamp shelfUpdateTime;
    private  String  shelfState;

    public Shelf() {
    }

    public Timestamp getShelfUpdateTime() {
        return shelfUpdateTime;
    }

    public void setShelfUpdateTime(Timestamp shelfUpdateTime) {
        this.shelfUpdateTime = shelfUpdateTime;
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

    public String getShelfState() {
        return shelfState;
    }

    public void setShelfState(String shelfState) {
        this.shelfState = shelfState;
    }

    @Override
    public String toString() {
        return "Shelf{" +
                "id=" + id +
                ", pId=" + pId +
                ", adminId=" + adminId +
                ", shelfUpdateTime=" + shelfUpdateTime +
                ", shelfState='" + shelfState + '\'' +
                '}';
    }
}
