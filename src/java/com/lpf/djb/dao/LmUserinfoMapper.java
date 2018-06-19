package com.lpf.djb.dao;


import com.lpf.djb.pojo.LmUserinfo;

public interface LmUserinfoMapper {
    int deleteByPrimaryKey(Integer userinfoId);

    int insert(LmUserinfo record);

    int insertSelective(LmUserinfo record);

    LmUserinfo selectByPrimaryKey(Integer userinfoId);

    int updateByPrimaryKeySelective(LmUserinfo record);

    int updateByPrimaryKey(LmUserinfo record);
}