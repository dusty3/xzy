package lpf.jdb.service;

import lpf.jdb.po.OrderList;
import lpf.jdb.po.OrderListCustomer;

import java.util.List;

/**
 * Created by Administrator on 2017/6/3.
 */
public interface OrderListService {
    List<OrderListCustomer> findOrderListCustomer();
    OrderList findOrderListById(int id);
}
