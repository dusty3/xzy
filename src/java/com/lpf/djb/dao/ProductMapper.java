package com.lpf.djb.dao;


import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.pojo.Product;

import java.util.HashMap;
import java.util.List;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer productId);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer productId);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    List<Product> loadingProduct(LmUser lmUser);

    void updateProduct(Product product);

    void delProduct(Integer productId);

    int queryproductnewId();

    void insertProduct(Product product);

    List<Product> queryProduct(HashMap map);
}