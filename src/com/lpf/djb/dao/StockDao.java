package lpf.jdb.dao;

import lpf.jdb.po.InnerStock;
import lpf.jdb.po.Stock;

/**
 * Created by Administrator on 2017/6/6.
 */
public interface  StockDao {
    void  saveStock(Stock stock);
    void  saveInnerStock(InnerStock innerStock);
    Stock findStockByPId(Integer pId);
    void  updateStock(Stock stock);

}
