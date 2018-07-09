package com.lpf.djb.pojo;

import java.util.Date;

public class LmUser {
    private Integer loginId;

    private String loginUsercode;

    private String loginPassword;

    private String createtime;

    private String modifytime;

    private Integer dr;

    public Integer getLoginId() {
        return loginId;
    }

    public void setLoginId(Integer loginId) {
        this.loginId = loginId;
    }

    public String getLoginUsercode() {
        return loginUsercode;
    }

    public void setLoginUsercode(String loginUsercode) {
        this.loginUsercode = loginUsercode == null ? null : loginUsercode.trim();
    }

    public String getLoginPassword() {
        return loginPassword;
    }

    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword == null ? null : loginPassword.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getModifytime() {
        return modifytime;
    }

    public void setModifytime(String modifytime) {
        this.modifytime = modifytime;
    }

    public Integer getDr() {
        return dr;
    }

    public void setDr(Integer dr) {
        this.dr = dr;
    }
}