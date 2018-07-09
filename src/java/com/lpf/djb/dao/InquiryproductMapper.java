package com.lpf.djb.dao;


import com.lpf.djb.pojo.Inquiry;
import com.lpf.djb.pojo.Inquiryproduct;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.HashMap;
import java.util.List;

public interface InquiryproductMapper {

 /*   int deleteByPrimaryKey(Integer cpId);

    int insert(Inquiryproduct record);

    int insertSelective(Inquiryproduct record);

    Inquiryproduct selectByPrimaryKey(Integer cpId);

    int updateByPrimaryKeySelective(Inquiryproduct record);

    int updateByPrimaryKey(Inquiryproduct record);*/

     //根据询价主键查找询价产品集合
    List<Inquiryproduct> queryIPbyid(Integer inquiryId);

    void insertinquriyproduct(List<Inquiryproduct> realinquiryproducts);

    void updateinquriyproduct(Inquiryproduct inquiryproduct);

    void deleteinquriyproduct(HashMap map);
}