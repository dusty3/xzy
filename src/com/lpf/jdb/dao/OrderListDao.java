package lpf.jdb.dao;

import lpf.jdb.po.OrderList;
import lpf.jdb.po.OrderListCustomer;

import java.util.List;

/**
 * Created by Administrator on 2017/6/2.
 */
public interface OrderListDao {
    List<OrderListCustomer> findOrderListCustomer();
    OrderList  findOrderListById(int id);
}
