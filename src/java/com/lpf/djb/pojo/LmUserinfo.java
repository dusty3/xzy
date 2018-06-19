package com.lpf.djb.pojo;

import java.util.Date;

public class LmUserinfo {
    private Integer userinfoId;

    private Integer loginId;

    private String userinfoName;

    private String userinfoEmail;

    private String userinfoPhone;

    private String userinfoTele;

    private String userinfoFax;

    private Date createtime;

    private Integer dr;

    public Integer getUserinfoId() {
        return userinfoId;
    }

    public void setUserinfoId(Integer userinfoId) {
        this.userinfoId = userinfoId;
    }

    public Integer getLoginId() {
        return loginId;
    }

    public void setLoginId(Integer loginId) {
        this.loginId = loginId;
    }

    public String getUserinfoName() {
        return userinfoName;
    }

    public void setUserinfoName(String userinfoName) {
        this.userinfoName = userinfoName == null ? null : userinfoName.trim();
    }

    public String getUserinfoEmail() {
        return userinfoEmail;
    }

    public void setUserinfoEmail(String userinfoEmail) {
        this.userinfoEmail = userinfoEmail == null ? null : userinfoEmail.trim();
    }

    public String getUserinfoPhone() {
        return userinfoPhone;
    }

    public void setUserinfoPhone(String userinfoPhone) {
        this.userinfoPhone = userinfoPhone == null ? null : userinfoPhone.trim();
    }

    public String getUserinfoTele() {
        return userinfoTele;
    }

    public void setUserinfoTele(String userinfoTele) {
        this.userinfoTele = userinfoTele == null ? null : userinfoTele.trim();
    }

    public String getUserinfoFax() {
        return userinfoFax;
    }

    public void setUserinfoFax(String userinfoFax) {
        this.userinfoFax = userinfoFax == null ? null : userinfoFax.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getDr() {
        return dr;
    }

    public void setDr(Integer dr) {
        this.dr = dr;
    }
}