package com.lpf.djb.dao;

import com.lpf.djb.pojo.Inquiry;
import com.lpf.djb.pojo.LmUser;

import java.util.HashMap;
import java.util.List;

public interface InquiryMapper {
  /*  int deleteByPrimaryKey(Integer inquiryId);

    int insert(Inquiry record);

    int insertSelective(Inquiry record);



    int updateByPrimaryKeySelective(Inquiry record);

    int updateByPrimaryKey(Inquiry record);*/

    List<Inquiry> loadingInquiry(LmUser lmUser);


    Inquiry selectByPrimaryKey(Integer inquiryId);

    void issend(Integer inquiryId);

    void delinquiry(Integer integer);

    List<Inquiry> queryinquiry(HashMap map);


    int querynewinquiryId();

    int insert(Inquiry record);

    void updateinquiry(Inquiry inquiry);

    List<Inquiry> loadingAllInquiry();
}