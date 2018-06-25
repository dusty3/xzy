package com.lpf.djb.service.serviceInterface;


import com.lpf.djb.pojo.Customer;

/**
 * Created by dusty on 2018/6/23.
 */
public interface CustomerService {
    public  void  update(Integer customerid);

    public Customer queyByid(Integer customerid);

    public  void  updateCustomer(Customer cmCustomer);
}
