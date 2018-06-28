package com.lpf.djb.service.impl;

import com.lpf.djb.dao.BrandMapper;
import com.lpf.djb.pojo.Brand;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.service.serviceInterface.BrandService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by dusty on 2018/6/27.
 */
@Service
public class BrandServiceImpl implements BrandService {

    @Resource
    private BrandMapper brandMapper;
    @Override
    public List<Brand> loadingBrand(LmUser lmUser) {
        return brandMapper.loadingBrand(lmUser);
    }

    @Override
    public Brand queryByid(Integer integer) {
        return brandMapper.selectByPrimaryKey(integer);
    }

    @Override
    public void updateBrand(Brand supplier) {

        supplier.setBrandDr(0);
        brandMapper.updateBrand(supplier);
    }

    @Override
    public void delBrand(Integer integer) {
        brandMapper.delBrand(integer);
    }

    @Override
    public int querynewId() {
        return brandMapper.queryBrandnewId();
    }

    @Override
    public void insertBrand(Brand supplier) {
        Date date=new Date();
        supplier.setBrandCreatetime(date);
        supplier.setBrandDr(0);
        brandMapper.insertBrand(supplier);
    }

    @Override
    public List<Brand> queryBrand(HashMap map) {
        return brandMapper.queryBrand(map);
    }
}
