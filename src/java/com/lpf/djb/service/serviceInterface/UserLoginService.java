package com.lpf.djb.service.serviceInterface;



import com.lpf.djb.pojo.Customer;
import com.lpf.djb.pojo.LmUser;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dusty on 2018/6/18.
 */
public interface UserLoginService {
     LmUser  login(LmUser lmUser);
     List<Customer> loadingcustomer(LmUser lmUser);
}
