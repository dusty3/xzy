package com.iotek.service;

import com.iotek.po.InnerStock;

/**
 * Created by Administrator on 2017/6/6.
 */
public interface StockService {
    /*插入入库信息 和库存信息*/
     void saveStock(InnerStock innerStock);
}
