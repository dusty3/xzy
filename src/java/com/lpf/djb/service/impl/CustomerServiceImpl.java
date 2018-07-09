package com.lpf.djb.service.impl;


import com.lpf.djb.dao.CustomerMapper;
import com.lpf.djb.pojo.Customer;
import com.lpf.djb.service.serviceInterface.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        customer.setCustomerModifytime(format.format(date));
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
        SimpleDateFormat  format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        customer.setCustomerCreatetime(format.format(date));
        customerMapper.insertCustomer(customer);
    }

    @Override
    public List<Customer> querycustomer(HashMap<String,Object> map) {
        return customerMapper.querycustomer(map);
    }

    @Override
    public Customer fillcutomer(HashMap map) {
        return customerMapper.fillcutomer(map);
    }

    @Override
    public Boolean customerisexist(String customerName) {
        List<Customer> findcustomerbyname = customerMapper.findcustomerbyname(customerName);
        if(findcustomerbyname==null||findcustomerbyname.size()==0){
            return  false;
        }else{
            return  true;
        }
    }


}
