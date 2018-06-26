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

    @Override
    public void delcutomer(Integer customerid) {
        customerMapper.delcutomer(customerid);
    }

    @Override
    public int querynewId() {
        return customerMapper.querynewid();
    }

    @Override
    public void insertCustomer(Customer customer) {
        customer.setCustomerDr(0);
        Date date=new Date();
        customer.setCustomerCreatetime(date);
 /*       customer.getCustomerMakingpartid(customer.getCustomerMakingpartname());*/
        customer.setCustomerSalesmanid(1);
        customerMapper.insertCustomer(customer);
    }


}
