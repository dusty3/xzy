package com.iotek.dao;

import com.iotek.po.OrderList;
import com.iotek.po.OrderListCustomer;

import java.util.List;

/**
 * Created by Administrator on 2017/6/2.
 */
public interface OrderListDao {
    List<OrderListCustomer> findOrderListCustomer();
    OrderList  findOrderListById(int id);
}
