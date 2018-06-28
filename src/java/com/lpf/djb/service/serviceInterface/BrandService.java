package com.lpf.djb.service.serviceInterface;

import com.lpf.djb.pojo.Brand;
import com.lpf.djb.pojo.LmUser;

import java.util.HashMap;
import java.util.List;

/**
 * Created by dusty on 2018/6/27.
 */
public interface BrandService {

    List<Brand> loadingBrand(LmUser lmUser);

    Brand queryByid(Integer integer);


    void updateBrand(Brand supplier);

    void delBrand(Integer integer);

    int querynewId();

    void insertBrand(Brand supplier);

    List<Brand> queryBrand(HashMap map);
}
