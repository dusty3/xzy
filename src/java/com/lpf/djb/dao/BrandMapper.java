package com.lpf.djb.dao;


import com.lpf.djb.pojo.Brand;
import com.lpf.djb.pojo.LmUser;

import java.util.HashMap;
import java.util.List;

public interface BrandMapper {
    int deleteByPrimaryKey(Integer brandId);

    int insert(Brand record);

    int insertSelective(Brand record);

    Brand selectByPrimaryKey(Integer brandId);

    int updateByPrimaryKeySelective(Brand record);

    int updateByPrimaryKey(Brand record);

    List<Brand> loadingBrand(LmUser lmUser);


    void updateBrand(Brand brand);

    void delBrand(Integer brandid);

    int queryBrandnewId();

    List<Brand> queryBrand(HashMap map);

    void insertBrand(Brand supplier);

    Brand fillbrand(HashMap map);

    List<Brand> findbrandbyname(String brandName);

    Brand querybyname(String brandName);
}