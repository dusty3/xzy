package com.iotek.service;

import com.iotek.po.Customer;

import java.util.List;

/**
 * Created by Administrator on 2017/6/2.
 */
public interface CustomerService {
    boolean saveCustomer(Customer customer);
     Customer findCustomertByName(Customer customer);
    /*�ж��û����Ƿ����*/
    boolean  isExistCustomerName(String customerName);

}
