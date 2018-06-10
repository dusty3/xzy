package lpf.jdb.service.impl;

import lpf.jdb.dao.CustomerDao;
import lpf.jdb.po.Customer;
import lpf.jdb.service.CustomerService;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/6/2.
 */

@Service(value = "customerService")
public class CustomerServiceImpl implements CustomerService {
    @Resource
    private CustomerDao customerDao;


    @Override
    public boolean saveCustomer(Customer customer) {
        customerDao.saveCustomer(customer);
        return customer.getId() != 0;

    }

    @Override
    public Customer findCustomertByName(Customer customer) {
        return customerDao.findCustomertByName(customer);
    }

    @Override
    public boolean isExistCustomerName(String customerName) {
        Customer existCustomerName = customerDao.isExistCustomerName(customerName);
        return existCustomerName != null;

    }

}
