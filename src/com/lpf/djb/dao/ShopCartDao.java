package lpf.jdb.dao;

import lpf.jdb.po.ShopCart;

import java.util.List;

/**
 * Created by Administrator on 2017/6/3.
 */
public interface ShopCartDao {
    List<ShopCart> findAllShopCart(int cId);
}
