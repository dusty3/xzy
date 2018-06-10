package lpf.jdb.service.impl;

import lpf.jdb.dao.ShelfDao;
import lpf.jdb.dao.StockDao;
import lpf.jdb.po.Shelf;
import lpf.jdb.po.Stock;
import lpf.jdb.service.ShelfService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


/**
 * Created by Administrator on 2017/6/6.
 */
@Service(value = "shelfService")
public class ShelfServiceImpl implements ShelfService {
    @Resource
    private StockDao stockDao;
    @Resource
    private ShelfDao shelfDao;
    @Override
    public boolean saveOrupdateShelf(Shelf shelf) {


            Stock stockByPId = stockDao.findStockByPId(shelf.getpId());
            if (stockByPId==null||stockByPId.getStockNumber()<=0){
                return false;
            }
            Shelf shelfByPId = shelfDao.findShelfByPId(shelf.getpId());
            if (shelfByPId==null){
                shelfDao.saveShelf(shelf);
                return  true;
            }
            if ("not_shelf".equals(shelfByPId.getShelfState())){
                shelf.setShelfState("yes_shelf");
                shelfDao.updateShelf(shelf);

                return true;
            }

        return false;
    }
}
