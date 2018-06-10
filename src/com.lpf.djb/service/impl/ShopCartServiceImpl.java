package com.iotek.service.impl;

import com.iotek.dao.ShopCartDao;
import com.iotek.po.ShopCart;
import com.iotek.service.ShopCartService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/6/3.
 */
@Service(value = "shopCartService")
public class ShopCartServiceImpl implements ShopCartService {
    @Resource
    private ShopCartDao shopCartDao;


    @Override
    public List<ShopCart> findAllShopCart(int cId) {

        return  shopCartDao.findAllShopCart(cId);
    }
}
