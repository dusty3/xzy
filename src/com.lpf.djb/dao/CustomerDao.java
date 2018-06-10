package com.iotek.dao;

import com.iotek.po.Customer;

import java.util.List;

/**
 * Created by Administrator on 2017/6/1.
 */
public interface CustomerDao {
    void saveCustomer(Customer customer);
    Customer findCustomertByName(Customer customer);
    Customer  isExistCustomerName(String customerName);

}
