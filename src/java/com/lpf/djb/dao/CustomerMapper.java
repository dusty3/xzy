package com.lpf.djb.dao;


import com.lpf.djb.pojo.Customer;
import com.lpf.djb.pojo.LmUser;

import java.util.HashMap;
import java.util.List;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer customerId);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer customerId);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

    List<Customer> loadingcustomer(LmUser lmUser);

    void updateCustomer(Customer Customer);

    void delcutomer(Integer customerid);

    int querynewid();



    void insertCustomer(Customer customer);

    List<Customer> querycustomer(HashMap<String,Object> map);

    Customer fillcutomer(HashMap map);

    List<Customer> findcustomerbyname(String customerName);
}