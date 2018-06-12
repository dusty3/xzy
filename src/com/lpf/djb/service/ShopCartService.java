package lpf.jdb.service;

import lpf.jdb.po.ShopCart;

import java.util.List;

/**
 * Created by Administrator on 2017/6/3.
 */
public interface ShopCartService {
    List<ShopCart> findAllShopCart(int cId);
}
