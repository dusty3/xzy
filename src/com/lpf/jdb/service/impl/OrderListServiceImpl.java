package lpf.jdb.service.impl;

import lpf.jdb.dao.OrderListDao;
import lpf.jdb.po.OrderList;
import lpf.jdb.po.OrderListCustomer;
import lpf.jdb.service.OrderListService;
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
