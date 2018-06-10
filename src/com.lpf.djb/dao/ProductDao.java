package com.iotek.dao;

import com.iotek.po.Product;
import com.iotek.po.ProductDetail;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2017/6/2.
 */
public interface ProductDao {
    void saveProduct(Product product);

    boolean saveProductDetail(ProductDetail productDetail);

    List<Product> getProductByName(Product product);

    List<Product> getProductHashMapByName(HashMap hashMap);

    List<Product>  findAllProduct();
}
