package com.iotek.service.impl;

import com.iotek.dao.ProductDao;
import com.iotek.po.Product;
import com.iotek.po.ProductDetail;
import com.iotek.service.ProductService;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2017/6/2.
 */
@Service(value = "productService")
public class ProductServiceImpl implements ProductService{
    @Resource
    private ProductDao productDao;


    @Override
    public boolean saveProduct(Product product) {
        productDao.saveProduct(product);
        System.out.println(product);
        int id = product.getId();
        ProductDetail productDetail = product.getProductDetail();
        productDetail.setpId(id);
        boolean b = productDao.saveProductDetail(productDetail);
        System.out.println(productDetail);

        return  b;


    }

    @Override
    public List<Product> getProductByName(Product product) {
        return productDao.getProductByName(product);
    }

    @Override
    public List<Product> getProductHashMapByName(HashMap hashMap) {


        return null;
    }

    @Override
    public List<Product> findAllProduct() {
      return  productDao.findAllProduct();
    }
}
