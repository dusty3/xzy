package com.lpf.djb.dao;


import com.lpf.djb.pojo.Customer;
import com.lpf.djb.pojo.LmUser;

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
}