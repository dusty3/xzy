package com.lpf.djb.dao;


import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.pojo.Supplier;

import java.util.HashMap;
import java.util.List;

public interface SupplierMapper {
    int deleteByPrimaryKey(Integer supplierId);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(Integer supplierId);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);

    List<Supplier> loadingsupplier(LmUser lmUser);


    void updateSupplier(Supplier supplier);

    void delsupplier(Integer supplierId);

    int querySuppliernewid();

    void insertsupplier(Supplier supplier);

    List<Supplier> querysupplier(HashMap map);
}