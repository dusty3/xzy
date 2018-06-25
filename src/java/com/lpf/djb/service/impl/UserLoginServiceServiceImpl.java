package com.lpf.djb.service.impl;



import com.lpf.djb.dao.CustomerMapper;
import com.lpf.djb.pojo.Customer;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.service.serviceInterface.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dusty on 2018/6/18.
 */
@Service(value = "userLoginService")
public class UserLoginServiceServiceImpl implements UserLoginService {
    @Autowired
    private com.lpf.djb.dao.LMUserMapper LMUserMapper;

    @Autowired
    private CustomerMapper customerMapper;
    
    @Override
    public LmUser login(LmUser lmUser) {

        return LMUserMapper.userlogin(lmUser);
    }

    @Override
    public List<Customer> loadingcustomer(LmUser lmUser) {
        return customerMapper.loadingcustomer(lmUser);
    }
}
