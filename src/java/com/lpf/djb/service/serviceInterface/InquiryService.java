package com.lpf.djb.service.serviceInterface;


import com.lpf.djb.pojo.*;

import java.util.HashMap;
import java.util.List;

/**
 * Created by dusty on 2018/7/1.
 */
public interface InquiryService {

    List<Inquiry> loadingInquiry(LmUser lmUser);

    Inquiry queryByid(Integer integer);

    //根据询价主键查找询价产品集合
    List<Inquiryproduct> queryIPbyid(Integer inquiryId);

    void sendmail(Inquiry inquiry, Supplier supplier, Brand brand, List<Inquiryproduct> inquiryproducts);

    void issend(Integer inquiryId);

    void delinquiry(Integer integer);

    List<Inquiry> queryinquiry(HashMap map);

    int querynewId();

    void  insert(Inquiry inquiry);

    void insertinquriyproduct(List<Inquiryproduct> realinquiryproducts);

    void updateinquiry(Inquiry inquiry);

    void updateinquriyproduct(List<Inquiryproduct> realinquiryproducts);

    void deleteinquriyproduct(HashMap map);

    List<Inquiry> loadingAllInquiry();
}
