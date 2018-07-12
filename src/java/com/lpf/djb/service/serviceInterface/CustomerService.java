package com.lpf.djb.service.serviceInterface;


import com.lpf.djb.pojo.Customer;

import java.util.HashMap;
import java.util.List;

/**
 * Created by dusty on 2018/6/23.
 */
public interface CustomerService {
    public  void  update(Integer customerid);

    public Customer queyByid(Integer customerid);

    Customer findcutomerbyname(String customerName);

    public  void  updateCustomer(Customer cmCustomer);

    public  void    delcutomer(Integer   customerid);


    public  int     querynewId();


    public  void   insertCustomer(Customer customer);


    /** 客户管理  查询
     * @param corpname
     * @return
     */
    public List<Customer>   querycustomer(HashMap<String,Object> map);

    Customer fillcutomer(HashMap map);

    Boolean customerisexist(String customerName);
}
