package com.lpf.djb.service.serviceInterface;

import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.pojo.Product;

import java.util.HashMap;
import java.util.List;

/**
 * Created by dusty on 2018/6/28.
 */
public interface ProductService {

    List<Product> loadingProduct(LmUser lmUser);

    Product queryByid(Integer integer);


    void updateProduct(Product product);

    void delProduct(Integer integer);

    int querynewId();

    void insertProduct(Product product);

    List<Product> queryProduct(HashMap map);
}
