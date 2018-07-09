package com.lpf.djb.service.impl;

import com.lpf.djb.dao.ProductMapper;
import com.lpf.djb.pojo.Brand;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.pojo.Product;
import com.lpf.djb.service.serviceInterface.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by dusty on 2018/6/28.
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductMapper productMapper;

    @Override
    public List<Product> loadingProduct(LmUser lmUser) {
        return productMapper.loadingProduct(lmUser);
    }

    @Override
    public Product queryByid(Integer integer) {
        return productMapper.selectByPrimaryKey(integer);
    }

    @Override
    public void updateProduct(Product product) {
        product.setProductDr(0);
        product.setIsofficial(0);
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        product.setProductModifytime(format.format(new Date()));
        productMapper.updateProduct(product);
    }

    @Override
    public void delProduct(Integer integer) {
        productMapper.delProduct(integer);
    }

    @Override
    public int querynewId() {

        return productMapper.queryproductnewId();
    }

    @Override
    public void insertProduct(Product product) {
        product.setProductDr(0);
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        product.setProductCreatetime(format.format(new Date()));
        product.setIsofficial(0);
        productMapper.insertProduct(product);
    }

    @Override
    public List<Product> queryProduct(HashMap map) {


        return productMapper.queryProduct(map);
    }
}
