package com.lpf.djb.dao;


import com.lpf.djb.pojo.LmUser;

import javax.annotation.Resource;

public interface LMUserMapper {
    int deleteByPrimaryKey(Integer loginId);

    int insert(LmUser record);

    int insertSelective(LmUser record);

    LmUser selectByPrimaryKey(Integer loginId);

    int updateByPrimaryKeySelective(LmUser record);

    int updateByPrimaryKey(LmUser record);

    /**用戶登陸
     * @param lmUser
     */
    LmUser userlogin(LmUser lmUser);
}