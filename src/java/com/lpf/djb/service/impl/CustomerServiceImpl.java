package com.lpf.djb.service.impl;


import com.lpf.djb.dao.CustomerMapper;
import com.lpf.djb.pojo.Customer;
import com.lpf.djb.service.serviceInterface.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by dusty on 2018/6/23.
 */
@Service(value = "customerservice")
public class CustomerServiceImpl  implements CustomerService{
    @Autowired
    private CustomerMapper customerMapper;
    @Override
    public void update(Integer customerid) {

    }

    @Override
    public Customer queyByid(Integer customerid) {
        return customerMapper.selectByPrimaryKey(customerid);
    }

    @Override
    public void updateCustomer(Customer customer) {
        Date date=new Date();
        customer.setCustomerModifytime(date);
        customer.setCustomerDr(0);
        customerMapper.updateCustomer(customer);
    }
}
