package com.iotek.dao;

import com.iotek.po.InnerStock;
import com.iotek.po.Stock;

/**
 * Created by Administrator on 2017/6/6.
 */
public interface  StockDao {
    void  saveStock(Stock stock);
    void  saveInnerStock(InnerStock innerStock);
    Stock findStockByPId(Integer pId);
    void  updateStock(Stock stock);

}
