package lpf.jdb.service.impl;

import lpf.jdb.dao.ShopCartDao;
import lpf.jdb.po.ShopCart;
import lpf.jdb.service.ShopCartService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/6/3.
 */
@Service(value = "shopCartService")
public class ShopCartServiceImpl implements ShopCartService {
    @Resource
    private ShopCartDao shopCartDao;


    @Override
    public List<ShopCart> findAllShopCart(int cId) {

        return  shopCartDao.findAllShopCart(cId);
    }
}
