package com.lpf.djb.service.impl;

import com.lpf.djb.dao.LmUserMapper;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.service.serviceInterface.UserLoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by dusty on 2018/6/18.
 */
@Service(value = "userLoginService")
public class UserLoginServiceServiceImpl implements UserLoginService {
    @Resource
    private LmUserMapper lmUserMapper;
    @Override
    public LmUser login(LmUser lmUser) {

        return lmUserMapper.userlogin(lmUser);
    }
}
