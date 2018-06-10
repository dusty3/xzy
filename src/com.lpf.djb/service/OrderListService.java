package com.iotek.service;

import com.iotek.po.OrderList;
import com.iotek.po.OrderListCustomer;

import java.util.List;

/**
 * Created by Administrator on 2017/6/3.
 */
public interface OrderListService {
    List<OrderListCustomer> findOrderListCustomer();
    OrderList findOrderListById(int id);
}
