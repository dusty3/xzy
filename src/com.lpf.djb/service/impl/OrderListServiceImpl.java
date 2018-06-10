package com.iotek.service.impl;

import com.iotek.dao.OrderListDao;
import com.iotek.po.OrderList;
import com.iotek.po.OrderListCustomer;
import com.iotek.service.OrderListService;
import org.springframework.stereotype.Service;


import java.util.List;

/**
 * Created by Administrator on 2017/6/3.
 */
@Service(value = "orderListService")
public class OrderListServiceImpl implements OrderListService {
    private OrderListDao orderListDao;

    @Override
    public List<OrderListCustomer> findOrderListCustomer() {



        return orderListDao.findOrderListCustomer();
    }

    @Override
    public OrderList findOrderListById(int id) {

        return orderListDao.findOrderListById(id);
    }
}
