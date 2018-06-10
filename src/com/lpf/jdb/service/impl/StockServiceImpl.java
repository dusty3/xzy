package lpf.jdb.service.impl;

import lpf.jdb.dao.StockDao;
import lpf.jdb.po.InnerStock;
import lpf.jdb.po.Stock;
import lpf.jdb.service.StockService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/6/6.
 */
@Service(value = "stockService")
public class StockServiceImpl implements StockService{
    @Resource
    private StockDao stockDao;

    @Override
    public void saveStock(InnerStock innerStock) {


        Stock stock = stockDao.findStockByPId(innerStock.getpId());
        System.out.println(stock + "111111");
        if (stock == null) {
            stock = new Stock();
            stock.setpId(innerStock.getpId());
            stock.setAdminId(innerStock.getAdminId());
            stock.setStockNumber(innerStock.getInnerStockNumber());
            stockDao.saveStock(stock);
        } else {
            stock.setStockNumber(innerStock.getInnerStockNumber() + stock.getStockNumber());
            System.out.println(stock + "22222");
            stockDao.updateStock(stock);

        }
    }








}
