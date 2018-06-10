package com.iotek.service.impl;

import com.iotek.dao.CustomerDao;
import com.iotek.po.Customer;
import com.iotek.service.CustomerService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/6/2.
 */

@Service(value = "customerService")
public class CustomerServiceImpl implements CustomerService{
    @Resource
    private CustomerDao customerDao;


    @Override
    public boolean saveCustomer(Customer customer) {
        customerDao.saveCustomer(customer);
        if (customer.getId()!=0){
            return  true;
        }
        return false;

    }

    @Override
    public Customer findCustomertByName(Customer customer) {
        return customerDao.findCustomertByName(customer);
    }

    @Override
    public boolean isExistCustomerName(String customerName) {
        Customer existCustomerName = customerDao.isExistCustomerName(customerName);
        if (existCustomerName!=null){
            return true;
        }

        return false;
    }

}
