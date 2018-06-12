package lpf.jdb.dao;

import lpf.jdb.po.Customer;

/**
 * Created by Administrator on 2017/6/1.
 */
public interface CustomerDao {
    void saveCustomer(Customer customer);
    Customer findCustomertByName(Customer customer);
    Customer  isExistCustomerName(String customerName);

}
